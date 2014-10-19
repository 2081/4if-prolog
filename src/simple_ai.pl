:- dynamic ai_play/1 .

ai_play(Line,Score) :-
	free_lines(Lines),
	element(Line,Lines,_),
	close_count(Line,Score).
	
ai_play(Line) :-
	ai_play(Line,2),!.
ai_play(Line) :-
	ai_play(Line,1),!.
ai_play(Line) :-
	ai_play(Line,0),
	not(critical(Line)), !.	
ai_play(Line) :-
	ai_play(Line,0),!.
	
:- consult('main_file.pl').