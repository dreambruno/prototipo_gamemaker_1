/// @description Dano

event_inherited();

if (vida != vidaMax) {
	draw_sprite_ext(spr_inimigo_hud_vida, 0, x-5, y-8, 1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_inimigo_barra_vida, 0, x-5, y-8, (vida/vidaMax), 1, 0, c_white, 1);
}

if (alarm[2] > 0 && estado == slimePerseguindo) {
	draw_set_font(ft_dano);
	draw_text_outline(x, y-15, "!", 2, c_black, 8, 100, 100);
} else if (alarm[2] > 40 && estado == slimeDesistiu) {
	draw_set_font(ft_dano);
	draw_text_outline(x-8, y-15, "???", 2, c_black, 8, 100, 100);
} else if (alarm[2] > 20 && estado == slimeDesistiu) {
	draw_set_font(ft_dano);
	draw_text_outline(x-4, y-15, "??", 2, c_black, 8, 100, 100);
} else if (alarm[2] > 0 && estado == slimeDesistiu) {
	draw_set_font(ft_dano);
	draw_text_outline(x, y-15, "?", 2, c_black, 8, 100, 100);
}
