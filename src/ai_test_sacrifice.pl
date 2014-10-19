:-
	dynamic ai_play/1.

:- dynamic max/1.
:- dynamic potential_lost_chain/1.
:- dynamic potential_gained_list/1.

ai_play(Line,Score) :-
	free_lines(Lines),
	element(Line,Lines,_),
	close_count(Line,Score).
	
ai_play(Line) :-
	ai_play(Line,1),!. /*améliorer avec sacrifice si plus de 2 */
ai_play(Line) :-
	ai_play(Line,0),
	not(critical(Line)), !.	
ai_play(Line) :-
	ai_play(Line,0),!. /* recherche du meilleur sacrifice*/


	
ai_play(Line) :-
	whatever.
	
	
consult('main_file.pl').