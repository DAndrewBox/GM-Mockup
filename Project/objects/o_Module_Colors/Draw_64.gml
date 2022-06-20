/// @description Draw module
if (!surface_exists(surf_colors) || update_module) {
	event_user(0);
	update_module = false;
}

draw_surface(surf_colors, x, y);