/// @description 
if (!surface_exists(surf_window) || update_module) {
	event_user(0);
	update_module = false;
}

draw_set_alpha(1 - (.33 * drag));
draw_sprite_stretched(s_window_shadow, 0, WINDOW.x + 3, WINDOW.y, WINDOW.width, WINDOW.height + 20);
draw_surface(surf_window, WINDOW.x, WINDOW.y);
draw_set_alpha(1);