/// @description Setup surface
if !(surface_exists(surf_colors)) {
	surf_colors = surface_create(sprite_width, sprite_height);
}

x = 0;
y = 16 + WINDOWS_BAR_YOFF;

surface_set_target(surf_colors);
draw_clear(col_bg_primary);

// Draw palette selector
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_color(col_bg_secondary);
draw_text_scaled(9, 18, "Palette", font_regular, 8);


// Draw color selector
for (var i = 0; i < 16; i++) {
	var _y = 40 + (16 * i);
	for (var j = 0; j < 8; j++) {
		var _x = 7 + (16 * j);
		var _index = (i * 8) + j;
		var _is_palette_color = (_index < array_length(CURRENT_PALETTE));
		var _color = (_is_palette_color ? CURRENT_PALETTE[_index] : col_misc_0 );
		
		draw_set_color(_color);
		draw_rectangle(_x, _y, _x + 16, _y + 16, false);
		
		draw_set_color(col_bg_secondary);
		draw_rectangle(_x + 1, _y + 1, _x + 15, _y + 15, true);
		
		if (MB_COLORS[0] == _color && _is_palette_color) {
			draw_marker_icon(_x, _y, 0, col_fg_primary);
		}
		
		if (MB_COLORS[1] == _color && _is_palette_color) {
			draw_marker_icon(_x, _y, 1, col_fg_primary);
		}
		
		if (_index == array_length(CURRENT_PALETTE)) {
			draw_set_valign(fa_center);
			draw_set_halign(fa_center);
			draw_set_color(col_fg_secondary);
			
			draw_text_scaled(_x + 8, _y + 9, "+", font_regular, 16);
		}
	}
}

// Draw combobox for palettes
combobox_draw(COMBOBOX, 0, 0, COMBOBOX.open);


// Draw colors in button
for (var i = 0; i < 2; i++) {
	var _x = 7 + (65 * i);
	draw_set_color(MB_COLORS[i]);
	draw_rectangle(_x, 305, _x + 62, 319, false);
}

draw_mbcolor_icon(6, 304, 1, col_bg_secondary);
draw_mbcolor_icon(6, 304, 0, col_misc_0);

draw_set_color(col_bg_secondary);
draw_line(8, 0, sprite_width - 8, 0);
draw_line(8, sprite_height - 1, sprite_width - 8, sprite_height - 1);

surface_reset_target();