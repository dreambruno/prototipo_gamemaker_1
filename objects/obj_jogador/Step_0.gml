/// @description 

depth = -y;
script_execute(estado);

if (mouse_check_button_pressed(mb_right) && stamina >= 10  && estado == movimentacao) {
	alarm[0] = 8;
	alarm[2] = 180;
	stamina -= 10;
	estado = dash;
	mudarSprite();
}

if (mouse_check_button_pressed(mb_left) && !atacar && estado == movimentacao && stamina > 5) {
	stamina -= 5;
	alarm[0] = vel_atk;
	estado = ataque;
	mudarSprite();
}

if (keyboard_check_pressed(ord("V")) && alarm[1] <= 0) {
	obj_jogador.estado = observar;
	obj_camera.estado = observar;
}

stamina = clamp(stamina, 0, max_stamina);