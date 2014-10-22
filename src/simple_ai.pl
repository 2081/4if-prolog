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
	findall(L,(simple_ai(L,0),not(critical(L))),Lines),
	length(Lines,N),
	random(1,N,R),
	nth1(R,Lines,Line),!.
simple_ai(Line) :-
	simple_ai(Line,0),!.

:-assert(p1_play(L):-simple_ai(L)).
:-assert(p2_play(L):-simple_ai(L)).
	
:- dynamic start/0 .
start :- consult('main_file.pl'), play.