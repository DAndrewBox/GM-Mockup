/// @description Setup
event_inherited();

LAYERS = ds_list_create();
layers_add(LAYER_TYPE_BACKGROUND, 0, "LAYER LONG NAME TEST 1234567890");
layers_add(LAYER_TYPE_FIGURE, 1, "Layer short test");
layers_add(LAYER_TYPE_SPRITE, 2, "Test name for layer three");
layers_add(LAYER_TYPE_TEXT, 3);

FOLDERS = ds_list_create();

layer_selected = layers_get_last() - 1;

update_module = false;
surf_layers = -1;

depth = -14;