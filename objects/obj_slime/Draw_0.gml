/// @description Slime e Sombra
event_inherited();

if (tomou_hit) {
	gpu_set_fog(true, c_white, 0, 0);
	draw_sprite(spr_slime_sombra, 0, x, y+1);
	draw_self();
	gpu_set_fog(false, c_white, 0, 0);
} else {
	draw_sprite(spr_slime_sombra, 0, x, y+1);
	draw_self();
}

gpu_set_fog(false, c_white, 0, 0);
	
if (alarm[2] > 0 && estado == slimePerseguindo) {
	draw_set_font(ft_dano);
	draw_text_outline(x, y-15, "!", 2, c_black, 8, 100, 100);
} else if (alarm[2] > 40 && estado == slimeDesistiu) {
	draw_set_font(ft_dano);
	draw_text_outline(x-8, y-15, "???ç", 2, c_black, 8, 100, 100);
} else if (alarm[2] > 20 && estado == slimeDesistiu) {
	draw_set_font(ft_dano);
	draw_text_outline(x-4, y-15, "??", 2, c_black, 8, 100, 100);
} else if (alarm[2] > 0 && estado == slimeDesistiu) {
	draw_set_font(ft_dano);
	draw_text_outline(x, y-15, "?", 2, c_black, 8, 100, 100);
}
	
if(dest_x < x) 
	image_xscale = -1
else image_xscale = 1;
