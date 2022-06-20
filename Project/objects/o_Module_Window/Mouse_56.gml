/// @description Release drag
drag = false;

// Fix window position
WINDOW.x = clamp(WINDOW.x, 0, WINDOW_W - WINDOW.width);
WINDOW.y = clamp(WINDOW.y, WINDOWS_BAR_YOFF, WINDOW_H - WINDOW.height);