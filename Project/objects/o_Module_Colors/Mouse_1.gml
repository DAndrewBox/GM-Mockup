/// @description Press MB-2
if !(ACTIVE) { exit; }

var _local_x = mouse_ui_x - x;
var _local_y = mouse_ui_y - y;
var _color_count = array_length(CURRENT_PALETTE);

for (var i = 0; i < 16; i++) {
	var _col_y = 40 + (16 * i);
	for (var j = 0; j < 8; j++) {
		var _col_x = 7 + (16 * j);
		
		if (_local_x >= _col_x && _local_x < _col_x + 16) && (_local_y >= _col_y && _local_y < _col_y + 16) {
			var _index = (i * 8) + j;
			
			if (_index < _color_count) {
				MB_COLORS[1] = CURRENT_PALETTE[_index];
				update_module = true;
			} else if (_index == _color_count) {
				if !(array_find_value(CURRENT_PALETTE, MB_COLORS[1])) {
					array_push(CURRENT_PALETTE, MB_COLORS[1])
					update_module = true;
				}
			}
			exit;
		}
	}
}