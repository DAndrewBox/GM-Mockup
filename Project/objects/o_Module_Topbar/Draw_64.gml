/// @description Draw Module
timer = ( timer > 3 ? 0 : ++timer );
update_module = (timer == 3);

if (update_module || !(surface_exists(surf_topbar))) {
	event_user(0);
	update_module = false;
}

draw_set_alpha(1);
draw_surface(surf_topbar, 0, y);