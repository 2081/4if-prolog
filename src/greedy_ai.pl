:- dynamic ai_play/1 .
:- dynamic free_lines/1 .

:- use_module(library(random)).

greedy_ai(Line,Score) :-
	free_lines(Lines),
	element(Line,Lines,_),
	close_count(Line,Score).
	
greedy_ai(Line) :-
	greedy_ai(Line,2),!.
greedy_ai(Line) :-
	greedy_ai(Line,1),!.

greedy_ai(Line):-
	free_lines(X),
	length(X,N),
	random(1,N,R),
	nth1(R,X,Line).
	

:-assert(p1_play(L):-greedy_ai(L)).
:-assert(p2_play(L):-greedy_ai(L)).
	
:- dynamic start/0 .
start :- consult('main_file.pl'), play.