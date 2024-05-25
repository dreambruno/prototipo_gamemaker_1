/// @description Esbarrão

var _dir = point_direction(x, y, other.x, other.y);
	
other.empurrado_dir = _dir;
other.empurrado_veloc = 2;
empurrado_veloc = lerp(empurrado_veloc, 0, 0.05);
vHorz = lengthdir_x(empurrado_veloc, empurrado_dir);
vVert = lengthdir_y(empurrado_veloc, empurrado_dir);
	
colisaoMovimento();