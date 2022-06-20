/// @description Press MB-1
if !(ACTIVE) { exit; }

var _local_x = mouse_ui_x - x;
var _local_y = mouse_ui_y - y;

// Select Layer
var _layers_total = layers_get_last();
var _count = 0;
if (_local_x > 8 && _local_x < sprite_width - 16) {
	for (var i = _layers_total - 1; i >= -1; i--) {
		var _yoff = (24 * _count);
		if (i > -1) {
			// Select a layer
			if (LAYERS[| i] != undefined) {
				if (_local_y >= 28 + _yoff && _local_y <= 48 + _yoff) {
					layer_selected = LAYERS[| i].id;
					update_module = true;
					break;
				}
				_count++;
			}
		} else {
			if (_local_y >= 28 + _yoff && _local_y <= 48 + _yoff) {
				// Add Layer
				layers_add(LAYER_TYPE_BACKGROUND);
				layer_selected = LAYERS[| layers_get_last() - 1].id;
				update_module = true;
			}
		}
	}
}