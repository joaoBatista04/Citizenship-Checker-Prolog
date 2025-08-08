genitor_(joana,joao).
genitor_(joao,jose).
genitor_(joao,maria).
genitor_(jose,ana).
genitor_(jose,paulo).
genitor_(maria,pedro).

irm_(X,Y) :- dif(X,Y), genitor_(Z,X), genitor_(Z,Y).
prim_(X,Y) :- dif(X,Y), genitor_(Z,X), genitor_(W,Y), irm_(Z,W).
net_(X,Y) :- dif(X,Y), genitor_(P,X), genitor_(Y,P).
descendente(X,Y) :- genitor_(P1,X), (descendente(P1,Y);==(P1,Y)).
