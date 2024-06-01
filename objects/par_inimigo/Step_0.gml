

script_execute(estado);

if (distance_to_object(obj_jogador) <= dist_aggro && 
			( estado != slimePerseguindo || estado != slimeTomaDano )) {
	estado = slimePerseguindo;
	alarm[2] = 20;
}
