/// @description Setting up chess surfaces
if !(surface_exists(surf_bg)) {
	surf_bg = surface_create(WINDOW_W, WINDOW_H);
}

surface_set_target(surf_bg);
draw_clear(col_chess_primary);

draw_set_color(col_chess_secondary);
var _size = chess_size;
var _offset = false;

for (var xx = 0; xx < WINDOW_W; xx += _size) {
	var _yoff = _offset * _size;
	for (var yy = 0; yy < WINDOW_H; yy += _size * 2) {
		draw_rectangle(xx, yy + _yoff, xx + _size, yy + _yoff + _size, false);
	}
	_offset = !_offset;
}

surface_reset_target();