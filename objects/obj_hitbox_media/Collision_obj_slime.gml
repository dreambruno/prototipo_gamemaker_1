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


draw_set_font(ft_dano);
draw_text_color(other.x+3, other.y-15, "1234567890", c_red, c_red, 8, 100, 100);