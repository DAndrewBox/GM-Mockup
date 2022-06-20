/// @description Setup Surface
if !(surface_exists(surf_tools)) {
	surf_tools = surface_create(sprite_width, WINDOW_H - 177);
}

x = WINDOW_W - 44;
y = 16 + WINDOWS_BAR_YOFF;

surface_set_target(surf_tools);
draw_clear(col_bg_primary);

draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_color(col_bg_secondary);
draw_text_scaled(4, 14, "Tools", font_regular, 8);

for (var i = 0; i < 32; i++) {
	var _odd = (i mod 2 != 0);
	var _x = 3 + (_odd * 19);
	var _y = 16 + (floor(i / 2) * 20);
	
	if (TOOL_CURRENT == i) {
		draw_set_color(col_fg_secondary);
		draw_rectangle(_x, _y, _x + 15, _y + 15, false);
		draw_marker_icon(_x, _y, 3, col_fg_primary);
	} else {
		draw_set_color(col_bg_secondary);
		if (i < 15) {
			draw_rectangle(_x, _y, _x + 15, _y + 15, false);
		}
		
		if (i == 15) {
			draw_set_valign(fa_center);
			draw_set_halign(fa_center);
			draw_set_color(col_fg_secondary);
			
			draw_text_scaled(_x + 7, _y + 9, "+", font_regular, 16);
		}
		draw_marker_icon(_x, _y, 2, col_misc_0);
	}
	
	draw_tool_icon(_x, _y, i, col_misc_0);
}

surface_reset_target();