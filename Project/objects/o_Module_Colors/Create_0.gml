/// @description Setup
event_inherited();

CURRENT_PALETTE = o_Controller.PALETTES[? "PICO8"].COLORS;
CURRENT_PALETTE_NAME = o_Controller.PALETTES[? "PICO8"].NAME;

COMBOBOX = combobox_add(CURRENT_PALETTE_NAME, 7, 22, 116, print);


MB_COLORS = [CURRENT_PALETTE[0], CURRENT_PALETTE[8]];

update_module = false;
surf_colors = -1;

depth = -15;