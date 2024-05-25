/// @description

var _escala = 3;
var _guiA = display_get_gui_height();
var _guiL = display_get_gui_width();
var _spra = sprite_get_height(spr_hud_barra_vida) * _escala;

var _vida = obj_jogador.vida;
var _max_vida = obj_jogador.max_vida;
var _stamina = obj_jogador.stamina;
var _max_stamina = obj_jogador.max_stamina;

draw_sprite_ext(spr_hud_barra_vida, 0, 33, 40, ((_vida/_max_vida) * _escala), _escala, 0, c_white, 1);
draw_sprite_ext(spr_hud_barra_estamina, 0, 33, 64, ((_stamina/_max_stamina) * _escala), _escala, 0, c_white, 1);
draw_sprite_ext(spr_hud_vida, 0, 30, 40, _escala, _escala, 0, c_white, 1);
