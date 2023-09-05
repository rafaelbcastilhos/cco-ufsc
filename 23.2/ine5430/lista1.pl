nome(used_to_love_her).
nome(sweet_child_o_mine).
nome(patience).
nome(november_rain).
nome(have_you_have_seen_the_rain).
nome(bad_moon_rising).
nome(fortunate_son).
nome(cotton_fields).
nome(wish_you_were_here).
nome(mother).
nome(another_brick_in_the_wall).
nome(photograph).
nome(shape_of_you).
nome(thinking_out_loud).
nome(shivers).
nome(bad_habits).
nome(love_me_do).
nome(lucy_in_the_sky_with_diamonds).
nome(yesterday).
nome(dont_let_me_down).
nome(come_together).
nome(uptown_funk).
nome(just_the_way_you_are).
nome(talking_to_the_moon).
nome(rock_in_the_free_world).
nome(heart_of_gold).
nome(cinnamon_girl).
nome(down_by_the_river).

rock(used_to_love_her).
rock(sweet_child_o_mine).
rock(patience).
rock(november_rain).
rock(wish_you_were_here).
rock(mother).
rock(another_brick_in_the_wall).
rock(love_me_do).
rock(lucy_in_the_sky_with_diamonds).
rock(yesterday).
rock(dont_let_me_down).
rock(come_together).
country(have_you_have_seen_the_rain).
country(bad_moon_rising).
country(fortunate_son).
country(cotton_fields).
country(rock_in_the_free_world).
country(heart_of_gold).
country(cinnamon_girl).
country(down_by_the_river).
pop(photograph).
pop(shape_of_you).
pop(thinking_out_loud).
pop(shivers).
pop(bad_habits).
pop(uptown_funk).
pop(just_the_way_you_are).
pop(talking_to_the_moon).

facil(used_to_love_her).
facil(have_you_have_seen_the_rain).
facil(bad_moon_rising).
facil(wish_you_were_here).
facil(mother).
facil(photograph).
facil(shape_of_you).
facil(love_me_do).
facil(uptown_funk).
facil(just_the_way_you_are).
facil(rock_in_the_free_world).
facil(heart_of_gold).
medio(sweet_child_o_mine).
medio(patience).
medio(fortunate_son).
medio(thinking_out_loud).
medio(lucy_in_the_sky_with_diamonds).
medio(yesterday).
medio(talking_to_the_moon).
medio(cinnamon_girl).
dificil(cotton_fields).
dificil(november_rain).
dificil(another_brick_in_the_wall).
dificil(shivers).
dificil(bad_habits).
dificil(dont_let_me_down).
dificil(come_together).
dificil(down_by_the_river).

guns_n_roses(used_to_love_her).
guns_n_roses(sweet_child_o_mine).
guns_n_roses(patience).
guns_n_roses(november_rain).
creedence_clearwater_revival(have_you_have_seen_the_rain).
creedence_clearwater_revival(bad_moon_rising).
creedence_clearwater_revival(fortunate_son).
creedence_clearwater_revival(cotton_fields).
pink_floyd(wish_you_were_here).
pink_floyd(mother).
pink_floyd(another_brick_in_the_wall).
ed_sheeran(photograph).
ed_sheeran(shape_of_you).
ed_sheeran(thinking_out_loud).
ed_sheeran(shivers).
ed_sheeran(bad_habits).
the_beatles(love_me_do).
the_beatles(lucy_in_the_sky_with_diamonds).
the_beatles(yesterday).
the_beatles(dont_let_me_down).
the_beatles(come_together).
bruno_mars(uptown_funk).
bruno_mars(just_the_way_you_are).
bruno_mars(talking_to_the_moon).
neil_young(rock_in_the_free_world).
neil_young(heart_of_gold).
neil_young(cinnamon_girl).
neil_young(down_by_the_river).

listaDeOpcoes() :- atomics_to_string(
	[
      "F = Fácil\n",
      "M = Médio\n",
      "D = Difícil\n",
      "T = Trilha\n"
      ], '\n', String), writeln(String).

listaDeSugestoes() :- atomics_to_string(
	[
    "R = Rock\n",
      "C = Country\n",
      "P = Pop\n",
      "T = Todos",
      "GR = Trilha Guns n Roses\n",
      "CR = Trilha Creedence Clearwater Revival\n",
      "PF = Trilha Pink Floyd\n",
      "ES = Trilha Ed Sheeran\n",
      "TB = Trilha The Beatles\n",
      "BM = Trilha Bruno Mars\n",
      "NY = Trilha Neil Young\n"
      ], '\n', String), writeln(String).

suggest(X) :- listaDeOpcoes(), write("Digite uma opção: "), nl, read_line_to_string(user_input, P), listaDeSugestoes(), write("Digite uma opção: "), nl, read_line_to_string(user_input, Q), retornaMusicas(P, Q, X).

retornaMusicas("F", "R", X) :- facil(X), rock(X).
retornaMusicas("F", "C", X) :- facil(X), country(X).
retornaMusicas("F", "P", X) :- facil(X), pop(X).
retornaMusicas("F", "T", X) :- facil(X).
retornaMusicas("M", "R", X) :- medio(X), rock(X).
retornaMusicas("M", "C", X) :- medio(X), country(X).
retornaMusicas("M", "P", X) :- medio(X), pop(X).
retornaMusicas("M", "T", X) :- medio(X).
retornaMusicas("D", "R", X) :- dificil(X), rock(X).
retornaMusicas("D", "C", X) :- dificil(X), country(X).
retornaMusicas("D", "P", X) :- dificil(X), pop(X).
retornaMusicas("D", "T", X) :- dificil(X).
retornaMusicas("T", "GR", X) :- guns_n_roses(X).
retornaMusicas("T", "CR", X) :- creedence_clearwater_revival(X).
retornaMusicas("T", "PF", X) :- pink_floyd(X).
retornaMusicas("T", "ES", X) :- ed_sheeran(X).
retornaMusicas("T", "TB", X) :- the_beatles(X).
retornaMusicas("T", "BM", X) :- bruno_mars(X).
retornaMusicas("T", "NY", X) :- neil_young(X).