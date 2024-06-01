/// @description Dano

other.vida -= obj_jogador.dano;

other.empurrado_dir = point_direction(obj_jogador.x, obj_jogador.y, other.x, other.y);
other.empurrado_veloc = 10;

other.alarm[1] = 5;
other.alarm[11] = 20;

other.display_dano_y = other.y-15;
other.display_dano_x = other.x;
other.display_dano = obj_jogador.dano;

other.tomou_hit = true;
other.estado = slimeTomaDano;
