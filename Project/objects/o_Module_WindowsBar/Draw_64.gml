/// @description Draw Module
timer = ( timer > 3 ? 0 : ++timer );
update_module = (timer == 3);

if (update_module || !(surface_exists(surf_wbar))) {
	event_user(0);
	update_module = false;
}

draw_set_alpha(1);
draw_surface(surf_wbar, 0, 0);

draw_set_colour(col_misc_0);
draw_rectangle(.5, .5, WINDOW_W - 1.5, WINDOW_H - 1.5, true);

// Draw when Window Risize
if (WINDOW_RESIZE) {
	draw_clear(col_misc_0);
	
	draw_set_colour(col_fg_primary);
	draw_set_font(font_bold);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	draw_text(WINDOW_W/2, WINDOW_H/2, "Resizing Window...\nWindow size: (" +
				str(WINDOW_W) + ", " + str(WINDOW_H - WINDOWS_BAR_YOFF) + ")");
}