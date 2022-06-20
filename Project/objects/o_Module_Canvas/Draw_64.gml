/// @description Draw Canvas
// Chess BG
if !(surface_exists(surf_bg)) {
	event_user(0);
}

draw_surface(surf_bg, 0, 0);

update_timer++;

// Canvas
if (CANVAS_W + CANVAS_H < 2) {
	exit;
}

if (!surface_exists(surf_canvas) || (update_timer > 2)) {
	event_user(1);
	update_timer = 0;
}

draw_sprite_stretched(s_window_shadow, 0, CANVAS_X + 8, CANVAS_Y,
						(CANVAS_W * CANVAS_ZOOM), (CANVAS_H * CANVAS_ZOOM) + 8);
draw_surface_ext(surf_canvas, CANVAS_X, CANVAS_Y, CANVAS_ZOOM, CANVAS_ZOOM, 0, -1, 1.0);
/*
draw_line_color(CANVAS_X, CANVAS_Y + (CANVAS_H * CANVAS_ZOOM),
				CANVAS_X + (CANVAS_W * CANVAS_ZOOM), CANVAS_Y + (CANVAS_H * CANVAS_ZOOM),
				col_misc_0, col_misc_0);