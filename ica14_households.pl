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
