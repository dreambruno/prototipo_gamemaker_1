/// @description Dano

if ( !other.invulveravel ) {
	other.invulveravel = true;
	other.vida -= dano;
	
	other.display_dano_y = other.y-20;
	other.display_dano_x = other.x;
	other.display_dano = dano;
	
	other.empurrado_dir = point_direction(x, y, other.x, other.y);
	other.empurrado_veloc = 10;
	
	other.alarm[3] = 5; // alarme do empurrão
	other.alarm[11] = 20; // alarme do dano na tela
	other.tomou_hit = true;
	other.estado = personagemTomaDano;
}
