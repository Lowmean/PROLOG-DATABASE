DOMAINS 
p_name,p_surname, pos  = string 
id,frwd_goals,glkp_goals = integer
period1,period2,period3,period4= real
file = datafile
strings=string*
reals = real*
integers = integer*
DATABASE
dplayer(id,p_name,p_surname,pos,period1,period2,period3,period4,frwd_goals,glkp_goals)
PREDICATES
print_all_dp
start
showDb
repeat
do_mbase
menu
process(integer)
clear_database
error

GOAL
start,!,
do_mbase.
CLAUSES
repeat.
repeat:-repeat.
            

start:-
makewindow(1,7,16," BAZA IGROKOV FC ZENIT 1981-2021 ",0,0,25,80),
write("Vvedite nazvanie faila"),nl,
write(">"),readln(Filename),nl,
consult(Filename).
    
clear_database:-
retract(dplayer(_,_,_,_,_,_,_,_,_,_)),
fail.
clear_database:-!.


do_mbase :-
makewindow(1,7,16," BAZA IGROKOV FC ZENIT 1981-2021 ",0,0,25,80),
menu,
clear_database.

menu :-
repeat, clearwindow,
nl,
write(" **************************************************************************** "),nl,
write(" * 1. Dobavlenie novogo igroka v BD                                         * "),nl,
write(" * 2. Izmenenie igroka v BD                                                 * "),nl,
write(" * 3. Udalenie igroka iz BD                                                 * "),nl,
write(" * 4. Prosmotr informacii po igroku                                         * "),nl,
write(" * 5. Prosmotr BD                                                           * "),nl,
write(" * 6. Sohranit' BD(CSV)                                                     * "),nl,
write(" * 7. Sohranit' BD(TXT)                                                     * "),nl,
write(" * 8. Vihod                                                                 * "),nl, 
write(" **************************************************************************** "),nl,
write(" Pozhaluista, vyberite 1,2,3,4,5,6,7 ili 8 : "),
readint(Case),nl,process(Case),Case = 8,!.
		
	
process(1) :-
makewindow(3,7,16,"Dobavlenie novogo igroka",0,0,25,80),shiftwindow(3),
write("Pozhaluista vvedite:"),nl,
write("ID igroka: "),readint(Id),
write("Imya igroka: "), readln(P_name), 
write("Familia igroka: "),readln(P_surname),
write("Poziciya igroka: "),readln(Pos),
write("God nachala vystuplenij: "),readreal(Period1),
write("God konca vystuplenij(0 esli net): "),readreal(Period2),
write("God nachala vystuplenij posle vozvrasheniya(0 esli net): "),readreal(Period3),
write("God konca  vystuplenij posle vozvrasheniya(0 esli net): "),readreal(Period4),
write("Kollichestvo zabityh golov: "),readint(Frwd_goals),
write("Kollichestvo propushennih golov: "),readint(Glkp_goals),
assertz(dplayer(Id,P_name, P_surname,Pos,Period1,Period2,Period3,Period4,Frwd_goals,Glkp_goals)), 
write("Igrok ",Id, " uspeshno dobavlen v BD"), nl,!,
write("Nazhmite probel dlya prodolzheniya"), readchar(_), 
removewindow, shiftwindow(1).

process(2) :-
makewindow(4,7,16,"Izmenenie igroka",0,0,25,80),shiftwindow(4),
write(" Vvedite ID igroka kotorogo nado izmenit' "),nl,
write("ID: "),readint(Id),
retract(dplayer(Id,_,_,_,_,_,_,_,_,_)),
write(" Imya igroka "),readln(P_name),
write(" Familia igroka "),readln(P_surname),
write(" Poziciya igroka: "),readln(Pos),
write(" God nachala vystuplenij: "),readreal(Period1),
write(" God konca vystuplenij(0 esli net): "),readreal(Period2),
write(" God nachala vystuplenij posle vozvrasheniya(0 esli net): "),readreal(Period3),
write(" God konca  vystuplenij posle vozvrasheniya(0 esli net): "),readreal(Period4),
write(" Kollichestvo zabityh golov: "),readint(Frwd_goals),
write(" Kollichestvo propushennih golov: "),readint(Glkp_goals),
assertz(dplayer(Id,P_name, P_surname,Pos,Period1,Period2,Period3,Period4,Frwd_goals,Glkp_goals)),
write(" Igrok ", ID," uspeshno izmenen"),nl,!,
write(" Nazhmite probel dlya prodolzheniya "),readchar(_),
removewindow,shiftwindow(1).
           
process(3) :-
makewindow(5,7,16,"Udalenie igroka iz BD",0,0,25,80),shiftwindow(5),
write(" Vvedite ID igroka kotorogo sleduet udalit' "),nl,
write(" ID: "),readint(Id),
retract(dplayer(Id,_,_,_,_,_,_,_,_,_)), 
write(" Igrok ", Id ," udalen iz BD "), nl, !,
write(" Nazhmite probel dlya prodolzheniya"), readchar(_), 
removewindow,shiftwindow(1).
             
process(4) :-
makewindow(6,7,16," Prosmotr informacii po igroku ", 0,0,25,80),  shiftwindow(6),
write("Vvedite ID igroka dlya prosmotra informacii: "),nl,
write("ID:  "),readint(Id),
dplayer(Id,P_name,P_surname,Pos,Period1,Period2,Period3,Period4,Frwd_goals,Glkp_goals),nl, 
write(" Imya igroka:                                  ",P_name),nl,
write(" Familia igroka:                               ",P_surname),nl,
write(" Poziciya:                                     ",Pos),nl, 
write(" God nachala vystuplenij:                      ",Period1),nl,
write(" God konca vystuplenij:                        ",Period2),nl,
write(" God nachala vystuplenij posle vozvrasheniya:  ",Period3),nl,
write(" God konca  vystuplenij posle vozvrasheniya:   ",Period4),nl,
write(" Kollichestvo golov:                           ",Frwd_goals),nl,
write(" Kollichestvo propushennih golov:              ",Glkp_goals),nl,!,
write(" Nazhmite probel dlya prodolzheniya"), readchar(_),				
removewindow, shiftwindow(1).
process(4) :-
makewindow(6,7,16," Oshibka! ",0,0,25,80), shiftwindow(6),
write(" Informaciya ne naidena!"),nl,
write(" Poprobuite drugogo igroka"),nl,!,
write(" Nazhmite probel dlya prodolzheniya"),readchar(_),
removewindow,shiftwindow(1).

process(5):-
makewindow(7,7,16," Prosmotr informacii ", 0,0,25,80),  shiftwindow(7),
write("ID| Name | Surname | Pos | DebutYear | EndYear | DY2 | EY2 | SGoals | PGoals "),nl,
showDb,fail;
write(" Nazhmite probel dlya prodolzheniya"), readchar(_),				
removewindow, shiftwindow(1).


process(6) :-
makewindow(8,7,16," Sohranenie BD v CSV ", 0,0,25,80),  shiftwindow(8),
write("Vvedite imya faila"),nl,
write(">"),readln(Filename),
openwrite(datafile,Filename),
writedevice(datafile),
print_all_dp,fail;
closefile(datafile),!,
write("Baza uspeshno sohranena!"),readchar(_),
removewindow,shiftwindow(1).

process(7) :-
makewindow(9,7,16," Sohranenie BD v TXT ", 0,0,25,80),  shiftwindow(9),
write("Vvedite imya faila"),nl,
write(">"),readln(Filename),
openwrite(datafile,Filename),
writedevice(datafile),
write("ID| Name | Surname | Pos | DebutYear | EndYear | DY2 | EY2 | SGoals | PGoals "),nl,
write("****************************************************************************"),nl,
showDb,fail;
closefile(datafile),!,
write("Baza uspeshno sohranena!"),readchar(_),
removewindow,shiftwindow(1).

process(8) :-
exit.
            
process(Case):-
Case<1, error; Case>8, error.

error:- 
        write("Oshibka! Vyberite chislo ot 1 do 8 "),
        write("Nazhmite probel dlya prodolzheniya"),readchar(_).
		
showDb:-dplayer(Id,P_name,P_surname,Pos,Period1,Period2,Period3,Period4,Frwd_goals,Glkp_goals),
write(Id),write(" | "),
write(P_name),write(" | "),
write(P_surname),write(" | "),
write(Pos),write(" | "),
write(Period1),write(" | "),
write(Period2),write(" | "),
write(Period3),write(" | "),
write(Period4),write(" | "),
write(Frwd_goals),write(" | "),
write(Glkp_goals),nl,
write("****************************************************************************"),
nl,fail.

print_all_dp:-
write("ID;"),
write("Name;"),
write("Surname;"),
write("Pos;"),
write("DebutYear;"),
write("EndYear;"),
write("DY2;"),
write("EY2;"),
write("SGoals;"),
write("PGoals;"),nl,
dplayer(Id,P_name,P_surname,Pos,Period1,Period2,Period3,Period4,Frwd_goals,Glkp_goals),
write(Id),write(";"),
write(P_name),write(";"),
write(P_surname),write(";"),
write(Pos),write(";"),
write(Period1),write(";"),
write(Period2),write(";"),
write(Period3),write(";"),
write(Period4),write(";"),
write(Frwd_goals),write(";"),
write(Glkp_goals),write(";"),nl.

