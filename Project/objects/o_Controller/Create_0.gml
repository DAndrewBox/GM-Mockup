/// @description Setup
widget_set_owner(hwnd_main);

#region // Color setup
THEMES = themes_load();
PALETTES = palettes_load();
CURRENT_THEME_NAME = "DRACULA";

CURRENT_THEME = THEMES[? CURRENT_THEME_NAME];	// Default Theme
CURRENT_ASSETS = themes_get_assets();
#endregion

LOADING_TEXT = "";
CHESS_SIZE = 32;	// smallest: 8px | small: 16px | big: 32px | biggest: 64px

PROJ_NAME = "unnamed" + extension_project;
PROJ_PATH = working_directory;

// Window scalable setup
depth = -100;
camera_set_view_size(view_current, WINDOW_W, WINDOW_H);

view_wport[0] = WINDOW_W;
view_hport[0] = WINDOW_H;

display_set_gui_maximise();
window_set_cursor(cr_none);
cursor_sprite = spr_cursor;

/*
x_ini = window_get_x();
y_ini = window_get_y();
*/