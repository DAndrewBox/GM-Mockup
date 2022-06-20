//gml_pragma("global", "game_init()");
show_debug_overlay(true);
window_set_min_width(WINDOWS_MIN_W);
window_set_min_height(WINDOWS_MIN_H);

global.__WINDOW_IS_MAXIMIZED = false;

global.__WINDOW_LAST_SIZE = [WINDOW_W, WINDOW_H];
global.__WINDOW_LAST_POS = [WINDOW_X, WINDOW_Y];

#region // Function macros

#macro	print	show_debug_message
#macro	str		string
#macro	rgb		make_color_rgb

#macro	extension_themes	".tm"
#macro	extension_project	".proj"
#macro	extension_palettes	".plt"

#endregion

#region // Color macros

#macro	col_bg_primary		o_Controller.CURRENT_THEME.BG.PRIMARY
#macro	col_bg_secondary	o_Controller.CURRENT_THEME.BG.SECONDARY

#macro	col_fg_primary		o_Controller.CURRENT_THEME.FG.PRIMARY
#macro	col_fg_secondary	o_Controller.CURRENT_THEME.FG.SECONDARY

#macro	col_chess_primary	o_Controller.CURRENT_THEME.CHESS.PRIMARY
#macro	col_chess_secondary	o_Controller.CURRENT_THEME.CHESS.SECONDARY

#macro	col_misc_0			o_Controller.CURRENT_THEME.MISC.COL_0
#macro	col_misc_1			o_Controller.CURRENT_THEME.MISC.COL_1
#macro	col_misc_2			o_Controller.CURRENT_THEME.MISC.COL_2
#macro	col_misc_3			o_Controller.CURRENT_THEME.MISC.COL_3
#macro	col_misc_4			o_Controller.CURRENT_THEME.MISC.COL_4
#macro	col_misc_5			o_Controller.CURRENT_THEME.MISC.COL_5
#macro	col_misc_6			o_Controller.CURRENT_THEME.MISC.COL_6
#macro	col_misc_7			o_Controller.CURRENT_THEME.MISC.COL_7

#endregion

#region // Other macros

#macro	chess_size			o_Controller.CHESS_SIZE
#macro	loadscreen_text		o_Controller.LOADING_TEXT

#macro	project_name		o_Controller.PROJ_NAME
#macro	project_path		o_Controller.PROJ_PATH

#macro	palette_name		o_Module_Colors.CURRENT_PALETTE_NAME

#macro	spr_cursor			o_Controller.CURRENT_ASSETS.SPRITES.CURSOR
#macro	spr_colors			o_Controller.CURRENT_ASSETS.SPRITES.COLORS
#macro	spr_markers			o_Controller.CURRENT_ASSETS.SPRITES.MARKERS
#macro	spr_tools			o_Controller.CURRENT_ASSETS.SPRITES.TOOLS
#macro	spr_combobox		o_Controller.CURRENT_ASSETS.SPRITES.COMBOBOX

#macro	font_size			o_Controller.CURRENT_ASSETS.FONTS.SIZE;
#macro	font_mapstring		"0123456789ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyzÁáÉéÍíÓóÚúÄäËëÏïÖöÜü!'#$%&/()=?¡¿<>.:,;-_|°*[]{}^~+ "
#macro	font_regular		o_Controller.CURRENT_ASSETS.FONTS.REGULAR
#macro	font_bold			o_Controller.CURRENT_ASSETS.FONTS.BOLD


#macro	WINDOW_X			window_get_x()
#macro	WINDOW_Y			window_get_y()
#macro	WINDOW_W			window_get_width()
#macro	WINDOW_H			window_get_height()

#macro	mouse_ui_x			window_mouse_get_x()
#macro	mouse_ui_y			window_mouse_get_y()

#endregion

#region // Constants
#macro	WINDOWS_BAR_YOFF		16
#macro	WINDOWS_MIN_W			1280
#macro	WINDOWS_MIN_H			720 + WINDOWS_BAR_YOFF

// Layer constants
#macro	LAYER_TYPE_UNDEFINED	-1
#macro	LAYER_TYPE_BACKGROUND	0
#macro	LAYER_TYPE_FIGURE		1
#macro	LAYER_TYPE_TEXT			2
#macro	LAYER_TYPE_SPRITE		3
#endregion