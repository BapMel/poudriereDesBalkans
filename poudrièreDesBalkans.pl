                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                     % LA POUDRIÈRE DES BALKANS %
                     %            ***           %
                     %    Cours et exercices    %
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Ce programme en Prolog représente, à la façon d'un cours d'histoire,
% l'engrenage de l'entrée dans la Première Guerre mondiale.

% Quoique écrit dans un ordre historique, il illustre le relatif
% aveuglement de la programmation logique à la temporalité.
% À l'exécution, le jeu des alliances et des déclarations de guerre y
% est en effet vu comme éternel, au lieu d'être vu comme un processus se
% déroulant dans le temps.

% Ce programme illustre également le caractère monotone de la logique
% de Prolog : une vérité y est acquise pour toujours et ne peut être
% révisée. Le comportement de l'Italie, qui en 1915 quitte l'Alliance
% pour l'Entente, y serait donc vu comme un bug.

% Baptiste Mélès, 8 mars 2015.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % I - Les lois éternelles de la guerre %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% A) Les alliances

% 1. Toute alliance est symétrique.
alliance_sym(X, Y) :- alliance_x(X, Y); alliance_x(Y, X).

% 2. Toute alliance est transitive.
alliance(L1, L2) :- alliance_trans(L1, L2, [L1]).

alliance_trans(L1, L2, NoeudsIntermediaires) :-
    alliance_sym(L1, L2),
    \+ member(L2, NoeudsIntermediaires). 

alliance_trans(L1, L2, NoeudsIntermediaires) :- 
    alliance_sym(L1, L3),
    \+ member(L3, NoeudsIntermediaires),
    alliance_trans(L3, L2, [L3 | NoeudsIntermediaires]).


% B) La guerre

% 1. La guerre est une relation symétrique.
guerre_sym(X, Y) :- guerre_x(X, Y); guerre_x(Y, X).

% 2. La guerre est une relation compatible avec l'alliance.
guerre(X, Y) :-
    (X = U; alliance(X, U)), guerre_sym(U, V), (V = Y; alliance(V, Y)).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % II - La poudrière des Balkans (1882-1914) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% A) L'Alliance (sans l'Italie, qui change de camp en 1915)
alliance_x(allemagne, autrichehongrie).   % Triplice, 20 mai 1882


% B) L'Entente
alliance_x(russie, serbie).               % Quelle date ? Immémoriale ?
alliance_x(france, russie).               % 17 août 1892 puis 27 décembre 1893
alliance_x(france, royaumeuni).           % Entente cordiale, 8 avril 1904


% EXERCICE 1 : Pour connaître tout le système des alliances, tapez la
% commande :
%
% alliance(X, Y).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % III - L'étincelle (été 1914) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% La déclaration de guerre du 28 juillet 1914
guerre_x(autrichehongrie, serbie).     


% EXERCICE 2 : Pour savoir ce qui s'ensuivit, tapez la commande :
%
% guerre(X,Y).
