:- dynamic ai_play/1 .
:- dynamic free_lines/1 .

:- use_module(library(random)).

random_ai(Line):-
	free_lines(X),
	length(X,N),
	random(1,N,R),
	nth1(R,X,Line).
	
ai_play(Line):- random_ai(Line).
	
:- consult('main_file.pl').