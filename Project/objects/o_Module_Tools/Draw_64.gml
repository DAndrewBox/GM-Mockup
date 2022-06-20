/// @description Draw Module
if (!surface_exists(surf_tools) || update_module) {
	event_user(0);
	update_module = false;
}

draw_surface(surf_tools, WINDOW_W - 44, y);