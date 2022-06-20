/// @description Draw surface
if !(surface_exists(surf_infobar)) {
	surf_infobar = surface_create(WINDOW_W, sprite_height);
}

surface_set_target(surf_infobar);
draw_clear(col_bg_primary);

draw_set_alpha(1);
draw_set_color(col_bg_secondary);
draw_set_halign(fa_left);
draw_set_valign(fa_center);

var _info = "";

_info += " x: " + str(gui_to_canvas_x(mouse_ui_x));
_info += " y: " + str(gui_to_canvas_y(mouse_ui_y)) + " |";
_info += " Size: " + str(o_Module_Canvas.CANVAS_W);
_info += " x " + str(o_Module_Canvas.CANVAS_H) + " |";
_info += " Zoom: " + string_format(o_Module_Canvas.CANVAS_ZOOM * 100, 3, 0) + "% |";
_info += " Export to: GMS 2.3.2+ |";
_info += " FPS: " + str(fps_real) + " |";

draw_text_scaled(8, 9, _info, font_regular, 8);

draw_set_halign(fa_right);
draw_text_scaled(WINDOW_W - 8, 9, "GM-MockUp v0.5 by D'Andrëw Box", font_bold, 8);

surface_reset_target();