/// @description Canvas setup
#region // Canvas setup window
var _window = window_new();
	_window.WINDOW	= window_set("New Canvas...", WINDOW_W / 2 - 80, WINDOW_H / 4 - 80, 160, 160, print);
	//_window.ENTRY	= [entry_add(), entry_add()];
	_window.BUTTON	= [button_add("Create", 80, 136, print)];
	
module_set_active_all(false);
#endregion