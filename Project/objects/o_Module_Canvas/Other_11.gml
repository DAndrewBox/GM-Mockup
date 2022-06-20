/// @description Setting up canvas surfaces
if (CANVAS_W + CANVAS_H < 2) {
	exit;
}

if !(surface_exists(surf_canvas)) {
	surf_canvas = surface_create(CANVAS_W, CANVAS_H);
}

surface_set_target(surf_canvas);
draw_clear(c_white);
draw_set_alpha(1);

// TODO: Draw instances

if (CANVAS_GRID) {
	draw_set_color(CANVAS_GRID_COL);
	draw_set_alpha(CANVAS_GRID_ALPHA);
	
	for (var i = 0; i < CANVAS_W; i += CANVAS_GRID_W) {
		draw_line(i, -.5, i, CANVAS_H);
	}
	
	for (var j = 0; j < CANVAS_H; j += CANVAS_GRID_H) {
		draw_line(0, j, CANVAS_W, j);
	}
	draw_set_alpha(1);
}

surface_reset_target();