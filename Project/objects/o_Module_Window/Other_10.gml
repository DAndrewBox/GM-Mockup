/// @description Setup surface
if !(surface_exists(surf_window)) {
	surf_window = surface_create(WINDOW.width, WINDOW.height + 14);
}

WINDOW.x = clamp(WINDOW.x, 0, WINDOW_W - WINDOW.width);
WINDOW.y = clamp(WINDOW.y, 0, WINDOW_H - WINDOW.height);

image_xscale = WINDOW.width / 16;
image_yscale = WINDOW.height / 16;

surface_set_target(surf_window);

draw_clear_alpha(c_red, 0.0);

if (WINDOW != -1) {
	window_draw(WINDOW, 0, 14);
}

/*
if (ENTRY != -1) {
	var _size = array_length(ENTRY);
	for (var i = 0; i < _size; i++) {
		entry_draw(ENTRY[i], 0, 14, true);
	}
}
*/

if (BUTTON != -1) {
	var _size = array_length(BUTTON);
	for (var i = 0; i < _size; i++) {
		BUTTON[i].window = WINDOW;
		button_draw(BUTTON[i], 0, 14, true);
	}
}

surface_reset_target();