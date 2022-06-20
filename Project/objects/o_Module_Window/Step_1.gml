/// @description 
var _mouse_x = mouse_ui_x;
var _mouse_y = mouse_ui_y;

if (drag) {
	WINDOW.x = _mouse_x - drag_xoff;
	WINDOW.y = _mouse_y;
}

update_timer--;

if (update_timer <= 0) {
	var _in_window = (_mouse_x >= WINDOW.x && _mouse_x <= WINDOW.x + WINDOW.width) &&
					 (_mouse_y >= WINDOW.y + 14 && _mouse_y <= WINDOW.y + WINDOW.height);

	update_module = _in_window;
	update_timer = 2;
}