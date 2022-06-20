/// @description Move canvas
if !(ACTIVE) { CANVAS_MOVE = false; exit; }

if (CANVAS_MOVE) {
	CANVAS_X_TO = mouse_start_pos[0] - (mouse_ui_x);
	CANVAS_Y_TO = mouse_start_pos[1] - (mouse_ui_y);
}

CANVAS_X = lerp(CANVAS_X, CANVAS_X_TO, 0.25);
CANVAS_Y = lerp(CANVAS_Y, CANVAS_Y_TO, 0.15);

CANVAS_ZOOM = lerp(CANVAS_ZOOM, CANVAS_ZOOM_TO, .33);