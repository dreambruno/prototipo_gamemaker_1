

script_execute(estado);

if (estado == observar) {
	controleDirecaoPrimario();
	
	if (vHorz == 0 && vVert == 0) veloc = 0;
	else veloc = 1;
	
	vHorz = lengthdir_x(veloc, vDir);
	vVert = lengthdir_y(veloc, vDir);
	
	if (abs(obj_jogador.x - obj_camera.x) >= 140) 
		if (obj_jogador.x > obj_camera.x) vHorz = 2; else vHorz = -2;
	
	if (abs(obj_jogador.y - obj_camera.y) >= 70) 
		if (obj_jogador.y > obj_camera.y) vVert = 2; else vVert = -2;
	
	x += vHorz;
	y += vVert;
} else {
	x = lerp(x, obj_jogador.x, 0.05);
	y = lerp(y, obj_jogador.y, 0.05);
}