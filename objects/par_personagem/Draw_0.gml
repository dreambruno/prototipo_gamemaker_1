/// @description 

if (alarm[11] > 0) {
	
	if (empurrado_dir >= 90 && empurrado_dir <= 270) display_dano_x -= 0.25;
	else display_dano_x += 0.25;
	
	display_dano_y -= 0.35;
	
	draw_set_font(ft_dano);
	draw_text_outline(display_dano_x, display_dano_y, display_dano, 2, c_black, 8, 100, 100);
}

draw_self();
