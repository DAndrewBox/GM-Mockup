/// @description Press MB-2
if !(ACTIVE) { exit; }

var _local_x = mouse_ui_x - x;
var _local_y = mouse_ui_y - y;

// Rename and select Layer
var _layers_total = layers_get_last();
var _count = 0;
if (_local_x > 8 && _local_x < sprite_width - 16) {
	for (var i = _layers_total - 1; i >= 0; i--) {
		var _yoff = (24 * _count);
		if (LAYERS[| i] != undefined) {
			if (_local_y >= 28 + _yoff && _local_y <= 48 + _yoff) {
				layer_selected = LAYERS[| i].id;
				var _new_name = get_string("Rename Layer", LAYERS[| i].name);
				LAYERS[| i].name = ( _new_name != "" ? _new_name : LAYERS[| i].name );
				update_module = true;
				break;
			}
			_count++;
		}
	}
}