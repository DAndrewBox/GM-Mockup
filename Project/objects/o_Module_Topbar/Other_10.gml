/// @description Setup surface
if !(surface_exists(surf_topbar)) {
	surf_topbar = surface_create(WINDOW_W, 16);
}

x = 0;
y = WINDOWS_BAR_YOFF;

// Clear and add buttons
button_clear_all(BUTTONS);
BUTTONS = [button_add("New File", x + 50, y + 8, print),
		   button_add("Load File", x + 150, y + 8, print),
		   button_add("Save File", x + 250, y + 8, print),
		   button_add("Export", x + 350, y + 8, print),
		   button_add("About", x + 450, y + 8, print)
		  ];

// Draw surface stuff
surface_set_target(surf_topbar);
draw_clear(col_bg_primary);

draw_set_color(col_bg_secondary);
draw_line(0, 0, WINDOW_W, 0);

draw_set_halign(fa_center);
draw_set_valign(fa_center);

for (var i = 1; i < 6; i++) {
	draw_text_scaled(100 * i, 8, "|", font_regular, 8);
}

for (var i = 0; i < array_length(BUTTONS); i++) {
	button_draw(BUTTONS[i], 0, [0, -WINDOWS_BAR_YOFF], false);
}


surface_reset_target();