:- dynamic ai_play/1 .

simple_ai(Line,Score) :-
	free_lines(Lines),
	element(Line,Lines,_),
	close_count(Line,Score).
	
simple_ai(Line) :-
	simple_ai(Line,2),!.
simple_ai(Line) :-
	simple_ai(Line,1),!.
simple_ai(Line) :-
	simple_ai(Line,0),
	not(critical(Line)), !.	
simple_ai(Line) :-
	simple_ai(Line,0),!.
	
ai_play(L):- simple_ai(L).
	
:- consult('main_file.pl').