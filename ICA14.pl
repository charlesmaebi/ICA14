% ======================================
% ICA 14 — Households
% ======================================

% ---------- Cats ----------
cat(tigger).
cat(mittens).
cat(whiskers).

% ---------- Dogs ----------
dog(fido).
dog(spot).

% ---------- Fish ----------
fish(nemo).

% ---------- Wild animals ----------
lion(simba).

% ---------- Humans ----------
human(tom).
human(jane).
human(amy).
human(lee).
human(kai).
human(maria).
human(sam).

% ---------- Household relationships ----------
% livesWith(X,Y) means X shares a household connection with Y

% Household 1 (transitive chain)
livesWith(tom, jane).
livesWith(jane, amy).
livesWith(tom, tigger).
livesWith(tom, fido).
livesWith(jane, mittens).
livesWith(amy, nemo).

% Household 2 (human-only)
livesWith(lee, kai).

% Household 3
livesWith(maria, whiskers).
livesWith(maria, spot).

% Household 4
livesWith(sam, simba).

% ---------- Category rules ----------
pet(X) :- cat(X).
pet(X) :- dog(X).
pet(X) :- fish(X).

animal(X) :- pet(X).
animal(X) :- lion(X).

% humans are residents
resident(X) :- human(X).

% pets are residents
resident(X) :- pet(X).

% TODO B: connected/2 should be true if X livesWith Y OR Y livesWith X
connected(X,Y) :- livesWith(X,Y).
connected(X,Y) :- livesWith(Y,X).

% TODO C0: public wrapper (calls the helper)
sameHousehold(X,Y) :-
    sameHousehold(X,Y,[X]).

% TODO C1: helper with visited list to avoid cycles
sameHousehold(X,Y,_) :-
    connected(X,Y).

sameHousehold(X,Y,Visited) :-
    connected(X,Z),
    Z \== Y,
    \+ member(Z, Visited),
    sameHousehold(Z,Y,[Z|Visited]).

% TODO D: list household members (residents only), remove duplicates
householdMembers(H, Members) :-
    findall(M,
        ( sameHousehold(H, M),
          resident(M)
        ),
        L0),
    sort(L0, Members).

% TODO E: count pets in a household
petCount(H, Count) :-
    findall(P,
        ( sameHousehold(H, P),
          pet(P)
        ),
        L0),
    sort(L0, L),
    length(L, Count).

% TODO F: extra fee if more than 2 pets
extraFee(H) :-
    petCount(H, Count),
    Count > 2.

% TODO G: list all unique households (as member lists)
uniqueHouseholds(U) :-
    findall(Members,
        ( human(H),
          householdMembers(H, Members)
        ),
        L),
    sort(L, U).
