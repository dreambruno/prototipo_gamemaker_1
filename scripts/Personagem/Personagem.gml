
function mudarSprite() {
	if (gamepad_is_connected(global.controle)) {
		if (gamepad_axis_value(global.controle, gp_axisrh) != 0 && gamepad_axis_value(global.controle, gp_axisrv) != 0) {
			dirOlhar = floor((point_direction(x, y, 
				x + gamepad_axis_value(global.controle, gp_axisrh), 
				y + gamepad_axis_value(global.controle, gp_axisrv)
			) +45) /90);
		}
	} else {
		dirOlhar = floor((point_direction(x, y, mouse_x, mouse_y) +45) /90);
	}
	
	if (estado == ataque) {
		image_index = 0;
		switch dirOlhar {
		case 1:
			sprite_index = spr_personagem_atacando_cima;
		break;
		case 2:
			sprite_index = spr_personagem_atacando_esquerda;
		break;
		case 3:
			sprite_index = spr_personagem_atacando_baixo;
		break;
		default: 
			sprite_index = spr_personagem_atacando_direita;
		}
	} else if (vHorz == 0 && vVert == 0) {
		switch dirOlhar {
			case 1:
				sprite_index = spr_personagem_parado_cima;
			break;
			case 2:
				sprite_index = spr_personagem_parado_esquerda;
			break;
			case 3:
				sprite_index = spr_personagem_parado_baixo;
			break;
			default:
				sprite_index = spr_personagem_parado_direita;
		}
	} else {
		switch dirOlhar {
			case 1:
				sprite_index = spr_personagem_correndo_cima;
			break;
			case 2:
				sprite_index = spr_personagem_correndo_esquerda;
			break;
			case 3:
				sprite_index = spr_personagem_correndo_baixo;
			break;
			default:
				sprite_index = spr_personagem_correndo_direita;
		}
	}
}

function estadoFisico() {
	switch cardio {
		case Status.CALMO:
			sprite_set_speed(sprite_index, 4, spritespeed_framespersecond);
			break;
		case Status.AGITADO:
			sprite_set_speed(sprite_index, 9, spritespeed_framespersecond);
			break;
		case Status.FRENETICO:
			sprite_set_speed(sprite_index, 18, spritespeed_framespersecond);
			break;
	}
}

function ataque() {
	if ( !atacar ) {
		atacar = true;
		switch dirOlhar {
			case 1:
				instance_create_layer(x, y -10, "Instances", obj_hitbox_media);
			break;
			case 2:
				instance_create_layer(x -10, y, "Instances", obj_hitbox_media);
			break;
			case 3:
				instance_create_layer(x, y +10, "Instances", obj_hitbox_media);
			break;
			default: 
				//if(image_index >= 1) // não está funcionando
				instance_create_layer(x +10, y, "Instances", obj_hitbox_media);
		}
	}
}

function personagemTomaDano() {
	
		//obj_jogador.alarm[1] = 10;
		obj_camera.estado = seguir;
		obj_jogador.estado = movimentacao;
	if (alarm[4] <= 0) {
		alarm[4] = 180;
		empurrado_veloc = lerp(empurrado_veloc, 0, 0.05);
	
		vHorz = lengthdir_x(empurrado_veloc, empurrado_dir);
		vVert = lengthdir_y(empurrado_veloc, empurrado_dir);
	
		colisaoMovimento();
	}
	
	movimentacao();
}