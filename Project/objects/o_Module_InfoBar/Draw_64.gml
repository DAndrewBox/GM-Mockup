/// @description Draw bar
timer++;
if (timer >= 3 || !(surface_exists(surf_infobar))) {
	event_user(0);
	timer = 0;
}

draw_set_alpha(1);
draw_surface(surf_infobar, x, WINDOW_H - 16);