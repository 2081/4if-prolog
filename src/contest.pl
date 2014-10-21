:- dynamic ai_play/1 .
			
				
:-	consult('random_ai.pl'),consult('simple_ai.pl').
:-	retractall(p1_play(_)),
	assert(p1_play(L):- simple_ai(L)),
	retractall(p2_play(_)),
	assert(p2_play(L):- random_ai(L)).

