const { Gtk } = imports.gi;
import App from 'resource:///com/github/Aylur/ags/app.js';
import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import * as Utils from 'resource:///com/github/Aylur/ags/utils.js';
const { execAsync, exec } = Utils;
const { Box, Button, EventBox, Icon, Label, Scrollable } = Widget;
import { SidebarModule } from './module.js';

Gtk.IconTheme.get_default().append_search_path(`${App.configDir}/assets`);
const distroName = exec(`bash -c 'cat /etc/os-release | grep "^NAME=" | cut -d "=" -f 2'`).trim();

const scripts = [
    {
        icon: 'nixos-symbolic',
        name: 'Trim system generations to 5',
        command: `sudo ${App.configDir}/scripts/quickscripts/nixos-trim-generations.sh 5 0 system`,
        enabled: distroName == 'NixOS',
    },
    {
        icon: 'nixos-symbolic',
        name: 'Trim home manager generations to 5',
        command: `${App.configDir}/scripts/quickscripts/nixos-trim-generations.sh 5 0 home-manager`,
        enabled: distroName == 'NixOS',
    },
];

export const QuickScripts = () => SidebarModule({
    icon: 'nixos-symbolic',
    name: 'Quick scripts',
    child: Box({
        vertical: true,
        className: 'spacing-v-5',
        children: scripts.map((script) => script.enabled ? Button({
            child: Box({
                className: 'spacing-h-5',
                children: [
                    Icon({
                        className: 'sidebar-module-btn-icon txt txt-large',
                        icon: script.icon,
                    }),
                    Label({
                        className: 'txt txt-small',
                        hpack: 'start',
                        label: script.name,
                        tooltipText: script.command,
                    }),
                ],
            }),
            onClicked: () => {
                execAsync([`bash`, `-c`, `foot fish -C "${script.command}"`, `&`]).catch(print);
            }
        }) : null)
    })
});