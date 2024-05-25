
function escolherEstado() {
	prox_estado = choose(slimeAndando, slimeParado);
	
	if (prox_estado == slimeAndando) {
		estado = slimeAndando;
		dest_x = irandom_range(0, room_width);
		dest_y = irandom_range(0, room_height);
	} else if (prox_estado == slimeParado) estado = slimeParado;
}

function slimeAndando() {
	image_speed = 1;
	
	if(distance_to_point(dest_x, dest_y)) {
		var _dir = point_direction(x, y, obj_slime.dest_x, obj_slime.dest_y);
		vHorz = lengthdir_x(obj_slime.veloc, _dir);
		vVert = lengthdir_y(obj_slime.veloc, _dir);
	
		colisaoMovimento();
	} else {
		x = dest_x;
		y = dest_y;
	}
}

function slimeParado() {
	image_speed = 0.5;
}

function slimePerseguindo() {
	image_speed = 1.5;
	
	dest_x = obj_jogador.x;
	dest_y = obj_jogador.y;

	if (mp_grid_path(obj_controle.grid, caminho, x, y, dest_x, dest_y, true)) {
		path_start(caminho, velocPers, path_action_stop, false);
	}
	/*
	var _dir = point_direction(x, y, dest_x, dest_y);
	vHorz = lengthdir_x(velocPers, _dir);
	vVert = lengthdir_y(velocPers, _dir);
	*/
	colisaoMovimento();
	
	if(distance_to_object(obj_jogador) > dist_desaggro) {
		estado = slimeDesistiu;
	}
}

function slimeDesistiu() {
	alarm[2] = 60;
	alarm[0] = irandom_range(60, 120);
}
	
function slimeTomaDano() {
	empurrado_veloc = lerp(empurrado_veloc, 0, 0.05);
	
	vHorz = lengthdir_x(empurrado_veloc, empurrado_dir);
	vVert = lengthdir_y(empurrado_veloc, empurrado_dir);
	
	colisaoMovimento();
	
	estado = slimePerseguindo;
}