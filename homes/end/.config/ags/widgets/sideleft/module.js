import Widget from 'resource:///com/github/Aylur/ags/widget.js';
const { Box, Button, Icon, Label, Revealer } = Widget;

export const SidebarModule = ({
    name,
    child
}) => {
    const header = Button({
        child: Box({
            children: [
                Label({
                    className: 'txt-norm txt',
                    label: `${name}`,
                }),
                Box({
                    hexpand: true,
                }),
                Label({
                    className: 'sidebar-module-btn-arrow',
                })
            ]
        }),
        onClicked: () => content.revealChild = !content.revealChild,
    });
    const content = Revealer({
        revealChild: true,
        transition: 'slide_down',
        transitionDuration: 200,
        child: child,
    });
    return Box({
        className: 'sidebar-module',
        vertical: true,
        children: [
            header,
            content,
        ]
    });
}