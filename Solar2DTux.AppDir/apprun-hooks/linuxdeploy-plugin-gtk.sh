#! /bin/bash

gsettings get org.gnome.desktop.interface gtk-theme 2> /dev/null | grep -qi "dark" && GTK_THEME_VARIANT="dark" || GTK_THEME_VARIANT="light"
APPIMAGE_GTK_THEME="${APPIMAGE_GTK_THEME:-"Adwaita:$GTK_THEME_VARIANT"}" # Allow user to override theme (discouraged)
CACHEDIR="$(mktemp --tmpdir --directory .AppRun.XXXXXXXX)"

export APPDIR="${APPDIR:-"$(dirname "$(realpath "$0")")"}" # Workaround to run extracted AppImage
export GTK_DATA_PREFIX="$APPDIR"
export GTK_THEME="$APPIMAGE_GTK_THEME" # Custom themes are broken
export GDK_BACKEND=x11 # Crash with Wayland backend on Wayland
export XDG_DATA_DIRS="$APPDIR/usr/share:/usr/share:$XDG_DATA_DIRS" # g_get_system_data_dirs() from GLib
export GSETTINGS_SCHEMA_DIR="$APPDIR//usr/share/glib-2.0/schemas"
export GTK_EXE_PREFIX="$APPDIR//usr"
export GTK_PATH="$APPDIR//usr/lib/x86_64-linux-gnu/gtk-3.0"
export GTK_IM_MODULE_DIR="$APPDIR//usr/lib/x86_64-linux-gnu/gtk-3.0/3.0.0/immodules"
export GTK_IM_MODULE_FILE="$CACHEDIR/immodules.cache"
sed "s|/usr/lib/x86_64-linux-gnu/gtk-3.0|$APPDIR//usr/lib/x86_64-linux-gnu/gtk-3.0|g" "$APPDIR//usr/lib/x86_64-linux-gnu/gtk-3.0/3.0.0/immodules.cache" > "$GTK_IM_MODULE_FILE"
export GDK_PIXBUF_MODULEDIR="$APPDIR//usr/lib/x86_64-linux-gnu/gdk-pixbuf-2.0/2.10.0/loaders"
export GDK_PIXBUF_MODULE_FILE="$CACHEDIR/loaders.cache"
sed "s|/usr/lib/x86_64-linux-gnu/gdk-pixbuf-2.0/2.10.0/loaders|$APPDIR//usr/lib/x86_64-linux-gnu/gdk-pixbuf-2.0/2.10.0/loaders|g" "$APPDIR//usr/lib/x86_64-linux-gnu/gdk-pixbuf-2.0/2.10.0/loaders.cache" > "$GDK_PIXBUF_MODULE_FILE"
