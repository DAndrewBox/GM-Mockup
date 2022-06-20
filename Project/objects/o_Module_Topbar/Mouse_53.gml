/// @description MB-1 on buttons
if !(ACTIVE) { exit; }

var _mouse_x = mouse_ui_x;
var _mouse_y = mouse_ui_y;

if (mouse_ui_y <= y + 16) {
	var _size = array_length(BUTTONS);
	for (var i = 0; i < _size; i++) {
		var _btn = BUTTONS[i];
		var _x = _btn.x;
		var _y = _btn.y;
		var _w = _btn.width;
		var _h = _btn.height;
		var _is_hover = ((_mouse_x >= _x - _w/2 && _mouse_x <= _x + _w/2) && (_mouse_y >= _y - _h/2 && _mouse_y <= _y + _h/2));
		
		if (_is_hover) {
			_btn.func();
		}
	}
}