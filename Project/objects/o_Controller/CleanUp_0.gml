/// @description Clear up memory
sprite_delete(spr_cursor);
sprite_delete(spr_colors);
sprite_delete(spr_markers);
sprite_delete(spr_tools);
sprite_delete(spr_combobox);

sprite_delete(CURRENT_ASSETS.SPRITES.FONT_REGULAR);
sprite_delete(CURRENT_ASSETS.SPRITES.FONT_BOLD);

font_delete(font_regular);
font_delete(font_bold);