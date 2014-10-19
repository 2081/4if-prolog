:- dynamic screen_w/1 .
:- dynamic screen_h/1 .

%width_board(5).
%height_board(5).

create_Display(Width,Height):-
	assert(screen_w(Width)),
	assert(screen_h(Height)),
	new(@p, picture('Dots and Boxes - H4104')),
	send(@p,size, size(Width,Height)),
	send(@p, open).

create_display(Size):-
	width_board(W),
	height_board(H),
	W>H,
	Ratio is H/W,
	Height is Size*Ratio,
	create_Display(Size,Height).
	
create_display(Size):-
	width_board(W),
	height_board(H),
	W<H,
	Ratio is W/H,
	Width is Size*Ratio,
	create_Display(Width,Size).
	
create_display(Size):-
	width_board(W),
	height_board(H),
	W==H,
	create_Display(Size,Size).
	
screen_line([X,Y],FX,FY,LX,LY):-
	horizontal([X,Y]),
	FX is X+0.5,
	FY is Y+1.0,
	LX is X+1.5,
	LY is Y+1.0.

screen_line([X,Y],FX,FY,LX,LY):-
	vertical([X,Y]),
	FX is X+1.0 ,
	FY is Y+0.5 ,
	LX is X+1.0,
	LY is Y+1.5.

draw_line(Pos):-
	screen_line(Pos,FirstX,FirstY,SecondX,SecondY),
	width_board(W),
	height_board(H),
	screen_w(WW),
	screen_h(HH),
	FactorX is WW/W,
	FactorY is HH/H,
	send(@p,display,new(Li,line(FirstX*FactorX,FirstY*FactorY,SecondX*FactorX,SecondY*FactorY,none))),
	send(Li,flush).
	
fill_square([X,Y],Player):-
	write('\n square : '), write([X,Y]),write('\n'),
	NewX is X+0.5,
	NewY is Y+0.5,
	width_board(W),
	height_board(H),
	screen_w(WW),
	screen_h(HH),
	FactorX is WW/W,
	FactorY is HH/H,
	send(@p,display,new(Sq,box(FactorX,FactorY)),point(NewX*FactorX,NewY*FactorY)),
	square_color(C,Player),
	send(Sq,fill_pattern,colour(C)).
	
square_color(red,ai).
square_color(blue,user).