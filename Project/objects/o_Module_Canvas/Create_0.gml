/// @description Setup
event_inherited();

depth = 100;
surf_bg = -1;
surf_canvas = -1;

CANVAS_W = 384;
CANVAS_H = 216;

CANVAS_X = 640 - (CANVAS_W / 2);
CANVAS_Y = 32 + WINDOWS_BAR_YOFF;

CANVAS_X_TO = CANVAS_X;
CANVAS_Y_TO = CANVAS_Y;

CANVAS_GRID = true;

CANVAS_GRID_W = 16;
CANVAS_GRID_H = 16

CANVAS_GRID_COL = col_misc_6;
CANVAS_GRID_ALPHA = .50;

CANVAS_ZOOM = 1.0;
CANVAS_ZOOM_TO = 1.0;

CANVAS_MOVE = false;
update_timer = 0;

alarm[0] = 1;