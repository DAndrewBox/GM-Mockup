/// @description Press MB-1
if !(ACTIVE) { exit; }

var _local_x = mouse_ui_x - x;
var _local_y = mouse_ui_y - y;
var _color_count = array_length(CURRENT_PALETTE);

// New colour on mouse buttons
if (_local_y > 304 && _local_y < 320) {
	if (_local_x > 7 && _local_x < 64) {
		MB_COLORS[0] = get_color_ext(MB_COLORS[0], "Choose a new color...");
		update_module = true;
	} else if (_local_x > 65 && _local_x < 128)  {
		MB_COLORS[1] = get_color_ext(MB_COLORS[1], "Choose a new color...");
		update_module = true;
	}
	
	exit;
}

// Change palette Ccombobox
var _x = COMBOBOX.x;
var _y = COMBOBOX.y;
var _w = COMBOBOX.width;
var _h = 12;

if ((_local_x >= _x + _w && _local_x <= _x + _w + _h) && (_local_y >= _y && _local_y <= _y + _h)) {
	if !(COMBOBOX.open) {
		COMBOBOX.open = true;
		event_user(0);
		//COMBOBOX.func();
		var _obj = instance_create_depth(0, 0, -50, o_Module_Window);
		_obj.WINDOW = window_set("Choose a palette...", WINDOW_W/2 - 160, WINDOW_H/4 - 120, 320, 240, combobox_update_all);
		module_set_active_all(false);
	}
	exit;
}

// Change & add colour to a palette colour
for (var i = 0; i < 16; i++) {
	var _col_y = 40 + (16 * i);
	for (var j = 0; j < 8; j++) {
		var _col_x = 7 + (16 * j);
		
		if (_local_x >= _col_x && _local_x < _col_x + 16) && (_local_y >= _col_y && _local_y < _col_y + 16) {
			var _index = (i * 8) + j;
			
			if (_index < _color_count) {
				MB_COLORS[0] = CURRENT_PALETTE[_index];
				update_module = true;
			} else if (_index == _color_count) {
				if !(array_find_value(CURRENT_PALETTE, MB_COLORS[0])) {
					array_push(CURRENT_PALETTE, MB_COLORS[0])
					update_module = true;
				}
			}
			exit;
		}
	}
}