/// @description Sombra
event_inherited();


draw_sprite(spr_personagem_sombra, 0, x, y+4);
draw_self();

if (invulveravel) {
	if image_alpha >= 1	
		tomou_dano_alfa = -0.05;
	else if (image_alpha <= 0)
		tomou_dano_alfa = 0.05;
	
	image_alpha += tomou_dano_alfa;
} else {
	image_alpha = 1;
}