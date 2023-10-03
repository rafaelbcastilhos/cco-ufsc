
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Construção de Sistema Especialista para sugerir músicas de acordo com instrumentos e técnicas.                %%
%%  O sistema leva em consideração um conjunto de músicas conhecidas, juntamente com o gênero e compositor.       %%
%%  É definido uma dificuldade de aprendizado para cada de acordo com a complexidade.                             %%
%%  Com a entrada do usuário, informando o instrumento e a técnica, é possível recomendar um conjunto de músicas. %%
%%                                                                                                                %%
%%  Aluno: Rafael Begnini de Castilhos (20205642).                                                                %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

nome(used_to_love_her, "Used to love her").
nome(sweet_child_o_mine, "Sweet child o mine").
nome(patience, "Patience").
nome(november_rain, "November rain").
nome(have_you_have_seen_the_rain, "Have you have seen the rain").
nome(bad_moon_rising, "Bad moon rising").
nome(fortunate_son, "Fortunate son").
nome(cotton_fields, "Cotton fields").
nome(wish_you_were_here, "Wish you were here").
nome(mother, "Mother").
nome(another_brick_in_the_wall, "Another brick in the wall").
nome(photograph, "Photograph").
nome(shape_of_you, "Shape of you").
nome(thinking_out_loud, "Thinking out loud").
nome(shivers, "Shivers").
nome(bad_habits, "Bad habits").
nome(love_me_do, "Love me do").
nome(lucy_in_the_sky_with_diamonds, "Lucy in the sky with diamonds").
nome(yesterday, "Yesterday").
nome(dont_let_me_down, "Dont let me down").
nome(come_together, "Come together").
nome(uptown_funk, "Uptown funk").
nome(just_the_way_you_are, "Just the way you are").
nome(talking_to_the_moon, "Talking to the moon").
nome(rock_in_the_free_world, "Rock in the free world").
nome(heart_of_gold, "Heart of gold").
nome(cinnamon_girl, "Cinnamon girl").
nome(down_by_the_river, "Down by the river").

%definição de gêneros de músicas
genero(rock).
genero(pop).
genero(country).

%definição de compositores e bandas
compositor(guns_n_roses).
compositor(creedence_clearwater_revival).
compositor(pink_floyd).
compositor(ed_sheeran).
compositor(the_beatles).
compositor(bruno_mars).
compositor(neil_young).

%definição de dificuldades
dificuldade(facil).
dificuldade(medio).
dificuldade(dificil).

atributos_musica(used_to_love_her, Genero, Compositor, Dificuldade):- (Genero = rock), (Compositor = guns_n_roses), (Dificuldade = facil).
atributos_musica(sweet_child_o_mine, Genero, Compositor, Dificuldade):- (Genero = rock), (Compositor = guns_n_roses), (Dificuldade = medio).
atributos_musica(patience, Genero, Compositor, Dificuldade):- (Genero = rock), (Compositor = guns_n_roses), (Dificuldade = medio).
atributos_musica(november_rain, Genero, Compositor, Dificuldade):- (Genero = rock), (Compositor = guns_n_roses), (Dificuldade = dificil).

atributos_musica(have_you_have_seen_the_rain, Genero, Compositor, Dificuldade):- (Genero = country), (Compositor = creedence_clearwater_revival), (Dificuldade = facil).
atributos_musica(bad_moon_rising, Genero, Compositor, Dificuldade):- (Genero = country), (Compositor = creedence_clearwater_revival), (Dificuldade = facil).
atributos_musica(fortunate_son, Genero, Compositor, Dificuldade):- (Genero = country), (Compositor = creedence_clearwater_revival), (Dificuldade = medio).
atributos_musica(cotton_fields, Genero, Compositor, Dificuldade):- (Genero = country), (Compositor = creedence_clearwater_revival), (Dificuldade = dificil).

atributos_musica(wish_you_were_here, Genero, Compositor, Dificuldade):- (Genero = rock), (Compositor = pink_floyd), (Dificuldade = facil).
atributos_musica(mother, Genero, Compositor, Dificuldade):- (Genero = rock), (Compositor = pink_floyd), (Dificuldade = facil).
atributos_musica(another_brick_in_the_wall, Genero, Compositor, Dificuldade):- (Genero = rock), (Compositor = pink_floyd), (Dificuldade = dificil).

atributos_musica(photograph, Genero, Compositor, Dificuldade):- (Genero = pop), (Compositor = ed_sheeran), (Dificuldade = facil).
atributos_musica(shape_of_you, Genero, Compositor, Dificuldade):- (Genero = pop), (Compositor = ed_sheeran), (Dificuldade = facil).
atributos_musica(thinking_out_loud, Genero, Compositor, Dificuldade):- (Genero = pop), (Compositor = ed_sheeran), (Dificuldade = medio).
atributos_musica(shivers, Genero, Compositor, Dificuldade):- (Genero = pop), (Compositor = ed_sheeran), (Dificuldade = dificil).
atributos_musica(bad_habits, Genero, Compositor, Dificuldade):- (Genero = pop), (Compositor = ed_sheeran), (Dificuldade = dificil).

atributos_musica(love_me_do, Genero, Compositor, Dificuldade):- (Genero = rock), (Compositor = the_beatles), (Dificuldade = facil).
atributos_musica(lucy_in_the_sky_with_diamonds, Genero, Compositor, Dificuldade):- (Genero = rock), (Compositor = the_beatles), (Dificuldade = medio).
atributos_musica(yesterday, Genero, Compositor, Dificuldade):- (Genero = rock), (Compositor = the_beatles), (Dificuldade = medio).
atributos_musica(dont_let_me_down, Genero, Compositor, Dificuldade):- (Genero = rock), (Compositor = the_beatles), (Dificuldade = dificil).
atributos_musica(come_together, Genero, Compositor, Dificuldade):- (Genero = rock), (Compositor = the_beatles), (Dificuldade = dificil).

atributos_musica(uptown_funk, Genero, Compositor, Dificuldade):- (Genero = pop), (Compositor = bruno_mars), (Dificuldade = facil).
atributos_musica(just_the_way_you_are, Genero, Compositor, Dificuldade):- (Genero = pop), (Compositor = bruno_mars), (Dificuldade = facil).
atributos_musica(talking_to_the_moon, Genero, Compositor, Dificuldade):- (Genero = pop), (Compositor = bruno_mars), (Dificuldade = medio).

atributos_musica(rock_in_the_free_world, Genero, Compositor, Dificuldade):- (Genero = country), (Compositor = neil_young), (Dificuldade = facil).
atributos_musica(heart_of_gold, Genero, Compositor, Dificuldade):- (Genero = country), (Compositor = neil_young), (Dificuldade = facil).
atributos_musica(cinnamon_girl, Genero, Compositor, Dificuldade):- (Genero = country), (Compositor = neil_young), (Dificuldade = medio).
atributos_musica(down_by_the_river, Genero, Compositor, Dificuldade):- (Genero = country), (Compositor = neil_young), (Dificuldade = dificil).

instrumento(violao).
instrumento(guitarra).
instrumento(bateria).
instrumento(ukulele).
instrumento(piano).

%violao e guitarra
tecnica(tapping).
tecnica(slapping).
tecnica(strums).
tecnica(harmonics).
tecnica(hammer_on).
tecnica(pull_of).
tecnica(palm_mute).
tecnica(accent).

%bateria
tecnica(double_pedal).
tecnica(single_stroke).
tecnica(double_stroke).
tecnica(roll).

%ukulele
tecnica(rasgueados).
tecnica(tremulo).
tecnica(campanella).
tecnica(pedalling).
tecnica(trills).

%piano
tecnica(arpejo).
tecnica(staccato).
tecnica(pedal).

%   Regra 1
%     SE tecnica = tapping
%     E instrumento = violao
%     ENTÃO genero = qualquer um
%           compositor = The Beatles ou Pink Floyd
%           dificuldade = facil
sugestao_musica(Musica, tapping, violao) :- atributos_musica(Musica_cod, _, the_beatles, facil), nome(Musica_cod, Musica).
sugestao_musica(Musica, tapping, violao) :- atributos_musica(Musica_cod, _, pink_floyd, facil), nome(Musica_cod, Musica).

%   Regra 2
%     SE tecnica = slapping
%     E instrumento = violao
%     ENTÃO genero = qualquer um
%           compositor = Pink Floyd
%           dificuldade = medio ou dificil
sugestao_musica(Musica, slapping, violao) :- atributos_musica(Musica_cod, _, pink_floyd, medio), nome(Musica_cod, Musica).
sugestao_musica(Musica, slapping, violao) :- atributos_musica(Musica_cod, _, pink_floyd, dificil), nome(Musica_cod, Musica).

%   Regra 3
%     SE tecnica = strums
%     E instrumento = violao ou guitarra
%     ENTÃO genero = qualquer um
%           compositor = todos
%           dificuldade = dificil
sugestao_musica(Musica, strums, violao) :- atributos_musica(Musica_cod, _, _, dificil), nome(Musica_cod, Musica).
sugestao_musica(Musica, strums, guitarra) :- atributos_musica(Musica_cod, _, _, dificil), nome(Musica_cod, Musica).

%   Regra 4
%     SE tecnica = harmonics
%     E instrumento = violao ou guitarra
%     ENTÃO genero = rock e pop
%           compositor = ed sheeran, the beatles, pink floyd
%           dificuldade = qualquer um
sugestao_musica(Musica, harmonics, violao) :- atributos_musica(Musica_cod, pop, ed_sheeran, _), nome(Musica_cod, Musica).
sugestao_musica(Musica, harmonics, violao) :- atributos_musica(Musica_cod, rock, the_beatles, _), nome(Musica_cod, Musica).
sugestao_musica(Musica, harmonics, violao) :- atributos_musica(Musica_cod, rock, pink_floyd, _), nome(Musica_cod, Musica).
sugestao_musica(Musica, harmonics, guitarra) :- atributos_musica(Musica_cod, pop, ed_sheeran, _), nome(Musica_cod, Musica).
sugestao_musica(Musica, harmonics, guitarra) :- atributos_musica(Musica_cod, rock, the_beatles, _), nome(Musica_cod, Musica).
sugestao_musica(Musica, harmonics, guitarra) :- atributos_musica(Musica_cod, rock, pink_floyd, _), nome(Musica_cod, Musica).

%   Regra 5
%     SE tecnica = hammer_on
%     E instrumento = violao
%     ENTÃO genero = todos
%           compositor = ed sheeran, bruno mars, guns n roses, pink floyd e creedence clearwater revival
%           dificuldade = qualquer um
sugestao_musica(Musica, hammer_on, violao) :- atributos_musica(Musica_cod, _, ed_sheeran, _), nome(Musica_cod, Musica).
sugestao_musica(Musica, hammer_on, violao) :- atributos_musica(Musica_cod, _, bruno_mars, _), nome(Musica_cod, Musica).
sugestao_musica(Musica, hammer_on, violao) :- atributos_musica(Musica_cod, _, guns_n_roses, _), nome(Musica_cod, Musica).
sugestao_musica(Musica, hammer_on, violao) :- atributos_musica(Musica_cod, _, pink_floyd, _), nome(Musica_cod, Musica).
sugestao_musica(Musica, hammer_on, violao) :- atributos_musica(Musica_cod, _, creedence_clearwater_revival, _), nome(Musica_cod, Musica).

%   Regra 6
%     SE tecnica = pull_of
%     E instrumento = violao
%     ENTÃO genero = todos
%           compositor = ed sheeran, bruno mars, the beatles, pink floyd e neil young
%           dificuldade = dificil
sugestao_musica(Musica, hammer_on, violao) :- atributos_musica(Musica_cod, _, ed_sheeran, dificil), nome(Musica_cod, Musica).
sugestao_musica(Musica, hammer_on, violao) :- atributos_musica(Musica_cod, _, bruno_mars, dificil), nome(Musica_cod, Musica).
sugestao_musica(Musica, hammer_on, violao) :- atributos_musica(Musica_cod, _, the_beatles, dificil), nome(Musica_cod, Musica).
sugestao_musica(Musica, hammer_on, violao) :- atributos_musica(Musica_cod, _, pink_floyd, dificil), nome(Musica_cod, Musica).
sugestao_musica(Musica, hammer_on, violao) :- atributos_musica(Musica_cod, _, neil_young, dificil), nome(Musica_cod, Musica).

%   Regra 7
%     SE tecnica = palm_mute
%     E instrumento = violao ou guitarra
%     ENTÃO genero = country
%           compositor = neil young
%           dificuldade = qualquer um
sugestao_musica(Musica, palm_mute, violao) :- atributos_musica(Musica_cod, country, neil_young, _), nome(Musica_cod, Musica).
sugestao_musica(Musica, palm_mute, guitarra) :- atributos_musica(Musica_cod, country, neil_young, _), nome(Musica_cod, Musica).

%   Regra 8
%     SE tecnica = accent
%     E instrumento = violao
%     ENTÃO genero = country e rock
%           compositor = neil young, guns n roses e the beatles
%           dificuldade = medio e dificil
sugestao_musica(Musica, accent, violao) :- atributos_musica(Musica_cod, country, neil_young, medio), nome(Musica_cod, Musica).
sugestao_musica(Musica, accent, violao) :- atributos_musica(Musica_cod, country, neil_young, dificil), nome(Musica_cod, Musica).
sugestao_musica(Musica, accent, violao) :- atributos_musica(Musica_cod, rock, guns_n_roses, medio), nome(Musica_cod, Musica).
sugestao_musica(Musica, accent, violao) :- atributos_musica(Musica_cod, rock, guns_n_roses, dificil), nome(Musica_cod, Musica).
sugestao_musica(Musica, accent, violao) :- atributos_musica(Musica_cod, rock, the_beatles, medio), nome(Musica_cod, Musica).
sugestao_musica(Musica, accent, violao) :- atributos_musica(Musica_cod, rock, the_beatles, dificil), nome(Musica_cod, Musica).

%   Regra 9
%     SE tecnica = double_pedal
%     E instrumento = bateria
%     ENTÃO genero = rock
%           compositor = guns n roses e pink floyd
%           dificuldade = facil
sugestao_musica(Musica, double_pedal, bateria) :- atributos_musica(Musica_cod, rock, guns_n_roses, facil), nome(Musica_cod, Musica).
sugestao_musica(Musica, double_pedal, bateria) :- atributos_musica(Musica_cod, rock, pink_floyd, facil), nome(Musica_cod, Musica).

%   Regra 10
%     SE tecnica = single_stroke
%     E instrumento = bateria
%     ENTÃO genero = pop
%           compositor = ed_sheeran
%           dificuldade = facil e medio
sugestao_musica(Musica, single_stroke, bateria) :- atributos_musica(Musica_cod, pop, ed_sheeran, facil), nome(Musica_cod, Musica).
sugestao_musica(Musica, single_stroke, bateria) :- atributos_musica(Musica_cod, pop, ed_sheeran, medio), nome(Musica_cod, Musica).

%   Regra 11
%     SE tecnica = double_stroke
%     E instrumento = bateria
%     ENTÃO genero = rock e country
%           compositor = creedence clearwater revival, guns n roses, pink floyd
%           dificuldade = facil e medio
sugestao_musica(Musica, double_stroke, bateria) :- atributos_musica(Musica_cod, rock, guns_n_roses, facil), nome(Musica_cod, Musica).
sugestao_musica(Musica, double_stroke, bateria) :- atributos_musica(Musica_cod, rock, guns_n_roses, medio), nome(Musica_cod, Musica).
sugestao_musica(Musica, double_stroke, bateria) :- atributos_musica(Musica_cod, rock, pink_floyd, facil), nome(Musica_cod, Musica).
sugestao_musica(Musica, double_stroke, bateria) :- atributos_musica(Musica_cod, rock, pink_floyd, medio), nome(Musica_cod, Musica).
sugestao_musica(Musica, double_stroke, bateria) :- atributos_musica(Musica_cod, country, creedence_clearwater_revival, facil), nome(Musica_cod, Musica).
sugestao_musica(Musica, double_stroke, bateria) :- atributos_musica(Musica_cod, country, creedence_clearwater_revival, medio), nome(Musica_cod, Musica).

%   Regra 12
%     SE tecnica = roll
%     E instrumento = bateria
%     ENTÃO genero = rock
%           compositor = guns n roses e pink floyd
%           dificuldade = dificil
sugestao_musica(Musica, roll, bateria) :- atributos_musica(Musica_cod, rock, guns_n_roses, dificil), nome(Musica_cod, Musica).
sugestao_musica(Musica, roll, bateria) :- atributos_musica(Musica_cod, rock, pink_floyd, dificil), nome(Musica_cod, Musica).

%   Regra 13
%     SE tecnica = rasgueados
%     E instrumento = ukulele
%     ENTÃO genero = country
%           compositor = neil young
%           dificuldade = todos
sugestao_musica(Musica, rasgueados, ukulele) :- atributos_musica(Musica_cod, country, neil_young, _), nome(Musica_cod, Musica).

%   Regra 14
%     SE tecnica = tremulo
%     E instrumento = ukulele
%     ENTÃO genero = country
%           compositor = neil young e creedence clearwater revival
%           dificuldade = facil e medio
sugestao_musica(Musica, tremulo, ukulele) :- atributos_musica(Musica_cod, country, neil_young, facil), nome(Musica_cod, Musica).
sugestao_musica(Musica, tremulo, ukulele) :- atributos_musica(Musica_cod, country, neil_young, medio), nome(Musica_cod, Musica).
sugestao_musica(Musica, tremulo, ukulele) :- atributos_musica(Musica_cod, country, creedence_clearwater_revival, facil), nome(Musica_cod, Musica).
sugestao_musica(Musica, tremulo, ukulele) :- atributos_musica(Musica_cod, country, creedence_clearwater_revival, medio), nome(Musica_cod, Musica).

%   Regra 15
%     SE tecnica = campanella
%     E instrumento = ukulele
%     ENTÃO genero = country e rock
%           compositor = creedence clearwater revival e pink floyd
%           dificuldade = medio
sugestao_musica(Musica, campanella, ukulele) :- atributos_musica(Musica_cod, rock, pink_floyd, medio), nome(Musica_cod, Musica).
sugestao_musica(Musica, campanella, ukulele) :- atributos_musica(Musica_cod, country, creedence_clearwater_revival, medio), nome(Musica_cod, Musica).

%   Regra 16
%     SE tecnica = pedalling
%     E instrumento = ukulele
%     ENTÃO genero = country e pop
%           compositor = creedence clearwater revival e bruno mars
%           dificuldade = dificil
sugestao_musica(Musica, pedalling, ukulele) :- atributos_musica(Musica_cod, pop, bruno_mars, dificil), nome(Musica_cod, Musica).
sugestao_musica(Musica, pedalling, ukulele) :- atributos_musica(Musica_cod, country, creedence_clearwater_revival, dificil), nome(Musica_cod, Musica).

%   Regra 17
%     SE tecnica = trills
%     E instrumento = ukulele
%     ENTÃO genero = rock e pop
%           compositor = pink floyd e ed sheeran
%           dificuldade = medio e dificil
sugestao_musica(Musica, trills, ukulele) :- atributos_musica(Musica_cod, pop, ed_sheeran, medio), nome(Musica_cod, Musica).
sugestao_musica(Musica, trills, ukulele) :- atributos_musica(Musica_cod, pop, ed_sheeran, dificil), nome(Musica_cod, Musica).
sugestao_musica(Musica, trills, ukulele) :- atributos_musica(Musica_cod, rock, pink_floyd, medio), nome(Musica_cod, Musica).
sugestao_musica(Musica, trills, ukulele) :- atributos_musica(Musica_cod, rock, pink_floyd, dificil), nome(Musica_cod, Musica).

%   Regra 18
%     SE tecnica = arpejo
%     E instrumento = piano
%     ENTÃO genero = pop
%           compositor = qualquer um
%           dificuldade = facil
sugestao_musica(Musica, arpejo, piano) :- atributos_musica(Musica_cod, pop, _, facil), nome(Musica_cod, Musica).

%   Regra 19
%     SE tecnica = staccato
%     E instrumento = piano
%     ENTÃO genero = pop e rock
%           compositor = qualquer um
%           dificuldade = medio e dificil
sugestao_musica(Musica, staccato, piano) :- atributos_musica(Musica_cod, pop, _, medio), nome(Musica_cod, Musica).
sugestao_musica(Musica, staccato, piano) :- atributos_musica(Musica_cod, pop, _, dificil), nome(Musica_cod, Musica).
sugestao_musica(Musica, staccato, piano) :- atributos_musica(Musica_cod, rock, _, medio), nome(Musica_cod, Musica).
sugestao_musica(Musica, staccato, piano) :- atributos_musica(Musica_cod, rock, _, dificil), nome(Musica_cod, Musica).

%   Regra 20
%     SE tecnica = pedal
%     E instrumento = piano
%     ENTÃO genero = todos
%           compositor = ed sheeran, guns n roses e creedence clearwater revival
%           dificuldade = dificil
sugestao_musica(Musica, pedal, piano) :- atributos_musica(Musica_cod, pop, ed_sheeran, dificil), nome(Musica_cod, Musica).
sugestao_musica(Musica, pedal, piano) :- atributos_musica(Musica_cod, pop, guns_n_roses, dificil), nome(Musica_cod, Musica).
sugestao_musica(Musica, pedal, piano) :- atributos_musica(Musica_cod, rock, creedence_clearwater_revival, dificil), nome(Musica_cod, Musica).

% PARA EXECUTAR:
% NO TERMINAL DO SWISH, DIGITE: sugestao_musica(Musica, tecnica, instrumento).
% Na qual a tecnica tem que ser uma das que foram definidas nas regras, exemplo: tapping, double_pedal, rasgueado, arpejo, ...
% E o instrumento tem que ser um dos que foram definidos nas regras, exemplo: violao, guitarra, bateria, ukulele e piano.
% EXEMPLO: sugestao_musica(Musica, tapping, violao).