/// @description Setup surface
if !(surface_exists(surf_wbar)) {
	surf_wbar = surface_create(WINDOW_W, WINDOWS_BAR_YOFF);
}

x = 0;
y = 0;

// Clear and add buttons
button_clear_all(BUTTONS);
BUTTONS = [button_add(4, WINDOW_W - 80, y + 8, window_toggle_minimize, font_bold, col_fg_primary, col_misc_0),
		   button_add(3, WINDOW_W - 48, y + 8, window_toggle_maximize, font_bold, col_fg_primary, col_misc_0),
		   button_add(2, WINDOW_W - 16, y + 8, game_end, font_bold, col_fg_primary, col_misc_0, col_misc_6),
		  ];

// Draw surface stuff
surface_set_target(surf_wbar);
draw_clear(col_misc_0);

draw_set_color(col_fg_primary);
draw_set_font(font_regular);
draw_set_valign(fa_center);
draw_set_halign(fa_left);

draw_text(x + 8, y + 9, "GameMaker Mockup Tool v0.5 - " + project_name);

for (var i = 0; i < array_length(BUTTONS); i++) {
	button_draw(BUTTONS[i], 0, 0, false);
}

surface_reset_target();