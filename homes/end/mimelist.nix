let
  browser = "firefox.desktop";
  editor = "code.desktop";
  file-manager = "org.gnome.Nautilus.desktop";
  image-viewer = "org.gnome.Loupe.desktop";
  image-editor = "org.kde.kolourpaint";
  torrent = "transmission-gtk.desktop";
in {
  xdg.mimeApps = rec {
    enable = true;
    associations.added = defaultApplications;
    defaultApplications = {
      "inode/directory" = file-manager;

      "x-scheme-handler/http" = browser;
      "x-scheme-handler/https" = browser;
      "application/xhtml+xml" = browser;
      "text/html" = browser;

      "x-scheme-handler/magnet" = torrent;
      "application/pdf" = browser;
      "application/x-shellscript" = editor;

      "image/jpeg" = image-editor;
      "image/bmp" = image-viewer;
      "image/gif" = image-viewer;
      "image/jpg" = image-viewer;
      "image/pjpeg" = image-viewer;
      "image/png" = image-editor;
      "image/tiff" = image-viewer;
      "image/webp" = image-editor;
      "image/x-bmp" = image-viewer;
      "image/x-gray" = image-viewer;
      "image/x-icb" = image-viewer;
      "image/x-ico" = image-editor;
      "image/x-png" = image-editor;
      "image/x-portable-anymap" = image-viewer;
      "image/x-portable-bitmap" = image-viewer;
      "image/x-portable-graymap" = image-viewer;
      "image/x-portable-pixmap" = image-viewer;
      "image/x-xbitmap" = image-viewer;
      "image/x-xpixmap" = image-viewer;
      "image/x-pcx" = image-viewer;
      "image/svg+xml" = image-viewer;
      "image/svg+xml-compressed" = image-viewer;
      "image/vnd.wap.wbmp" = image-viewer;
      "image/x-icns" = image-viewer;
    };
  };
}
