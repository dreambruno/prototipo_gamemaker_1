/// @description 

var x2 = (mouse_x div 16) * 16 + 8;
var y2 = (mouse_y div 16) * 16 + 8;

if (mp_grid_path(obj_controle.grid, caminho, x, y, x2, y2, true)) {
	path_start(caminho, 1, path_action_stop, false);
}