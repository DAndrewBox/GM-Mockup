/// @description MB-1 Press
if !(ACTIVE) { exit; }

var _local_x = mouse_ui_x - x;
var _local_y = mouse_ui_y - y;

for (var i = 0; i <= TOOL_COUNT; i++) {
	var _odd = (i mod 2 != 0);
	var _x = 3 + (_odd * 19);
	var _y = 16 + (floor(i / 2) * 20);
	
	if (_local_x >= _x && _local_x < _x + 16) && (_local_y >= _y && _local_y < _y + 16) {
		if (i < TOOL_COUNT) {
			TOOL_CURRENT = i;
			update_module = true;
			break;
		}
		
		show_message("Adding tools is not avaliable on this demo.\nSorry! :(");
	}
}