function controleDirecaoPrimario() {
	gamepad_set_axis_deadzone(global.controle, 0.25)
	direita = keyboard_check(ord("D")) || gamepad_axis_value(global.controle, gp_axislh) > 0.25;
	cima = keyboard_check(ord("W")) || gamepad_axis_value(global.controle, gp_axislv) < -0.25;
	esquerda = keyboard_check(ord("A")) || gamepad_axis_value(global.controle, gp_axislh) < -0.25;
	baixo = keyboard_check(ord("S")) || gamepad_axis_value(global.controle, gp_axislv) > 0.25;

	vHorz = (direita - esquerda);
	vVert = (baixo - cima);
	vDir = point_direction(x, y, x +vHorz, y +vVert);
}

function observar() {
	if (keyboard_check_pressed(ord("V")) || gamepad_button_check_pressed(global.controle, gp_stickr)) {
		obj_jogador.alarm[1] = 10;
		obj_camera.estado = seguir;
		obj_jogador.estado = movimentacao;
	}
}

function seguir() {}

function movimentacao() {
	mudarSprite();
	estadoFisico();
	controleDirecaoPrimario();
	
	if ((keyboard_check(vk_control) || gamepad_button_check(global.controle, gp_face2)) && (vHorz != 0 || vVert != 0)) {
		correndo();
	} else if (vHorz != 0 || vVert != 0) {
		andando();
	} else {
		parado();
	}
	
	if (
		(dirOlhar == ESQUERDA && direita > 0) or (dirOlhar == DIREITA && esquerda > 0) or 
		(dirOlhar == CIMA && baixo > 0) or (dirOlhar == BAIXO && cima > 0) 
	) veloc = veloc -1;
	
	vHorz = lengthdir_x(veloc, vDir);
	vVert = lengthdir_y(veloc, vDir);
	
	colisaoMovimento();
}

function colisaoMovimento() {
	if place_meeting(x + vHorz, y, obj_parede) {
		while !place_meeting(x + sign(vHorz), y, obj_parede) {
			x += sign(vHorz);
		}
		vHorz = 0;
	}
	
	if place_meeting(x, y + vVert, obj_parede) {
		while !place_meeting(x, y + sign(vVert), obj_parede) {
			y += sign(vVert);
		}
		vVert = 0;
	}
	
	x += vHorz;
	y += vVert;
}

function parado() {
	veloc = 0;
	
	if (alarm[1] > 120) cardio = Status.FRENETICO;
	else if (alarm[1] < 120 && alarm[1] > 0) cardio = Status.AGITADO;
	else cardio = Status.CALMO;
	
	if (alarm[2] <= 0 && cardio == Status.CALMO) stamina += 0.50;
	if (alarm[2] <= 0 && cardio == Status.AGITADO) stamina += 0.25;
}

function andando() {
	if (alarm[1] < 150) alarm[1] = 150;
	
	veloc = velocBase;
	cardio = Status.AGITADO;
	
	if (alarm[2] <= 0 && cardio == Status.AGITADO) stamina += 0.25;
}

function correndo() {
	alarm[1] = 300;
	veloc = velocBase +1;
	cardio = Status.FRENETICO;
}

function dash() {
	invulveravel = true;
	
	var _direc;
	if (gamepad_is_connected(global.controle)) {
		_direc = point_direction(x, y, 
			x + gamepad_axis_value(global.controle, gp_axislh), 
			y + gamepad_axis_value(global.controle, gp_axislv));
	} else {
		_direc = point_direction(x, y, mouse_x, mouse_y);
	}
	
	vHorz = lengthdir_x(dashVeloc, _direc);
	vVert = lengthdir_y(dashVeloc, _direc);
	
	colisaoMovimento();
	
	var instDash = instance_create_layer(x, y, "Instances", obj_dash);
	instDash.sprite_index = sprite_index;
}
