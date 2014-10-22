:- dynamic ai_play/1 .

click_line(P, Position) :-
	get(Position, x, X),
	get(Position, y, Y),
	send(P, display, new(C, circle(25)), Position),
	free_lines([L|_]),
	tell(out),
	write(L),write('.'),
	told,
	assert(played(True)).

simple_ai(Line,Score) :-
	free_lines(Lines),
	element(Line,Lines,_),
	close_count(Line,Score).

/*
player_ai(L) :- sleep(1), 
	(						%if-then-else statement
		played() ->
		getLine(L), retract(played(True))
		;player_ai(L)
	).
*/

player_ai(L):-
	see(out),
	read(L),
	write('read : '),write(L),write('\n'),
	seen,
	tell(out),
	write('0.'),
	told,
	L \= 0.
player_ai(L):-
	sleep(0.5),
	player_ai(L).

player_clicked([0.0,0.0]).

:-assert(p1_play(L):-player_ai(L)).
:-assert(p2_play(L):-player_ai(L)).
	
:- dynamic start/0 .
start :- consult('main_file.pl'),
send(@p, recogniser, click_gesture(left, '', single, 
	message(@prolog, click_line, @p, @event?position))), 
play.