/// @description Draw stuff
/*
draw_set_color(col_fg_secondary);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(font_bold);
draw_text(700, 8, font_mapstring); // str(mouse_x) + ", " + str(mouse_y));
draw_text_scaled(640, 14, str(mouse_ui_x) + ", " + str(mouse_ui_y), font_bold, 8);

// Move screen side by side
var _size = (display_get_width() - window_get_width()) / 2;
var _xoff = _size * dsin(current_time / 10);
window_set_position(x_ini + _xoff, y_ini);