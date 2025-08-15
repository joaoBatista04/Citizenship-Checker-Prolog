% Verifica se X é neto de Y.
neto(X, Y) :- (pai(Z, X); mae(Z, X)), (pai(Y, Z); mae(Y, Z)).

% Verifica se X é ascendente direto de Y.
ascendente(X, Y) :- (pai(X, Y); mae(X, Y)); (pai(X, Z); mae(X, Z)), ascendente(Z, Y).

% Verifica se X possui direito à cidadania italiana (sem limite de gerações).
tem_direito(X, italiana) :- (ascendente(Y, X), cidadania(Y, italiana)), \+ cidadania(X, italiana).

% Verifica se X possui direito à cidadania portuguesa (transmitida até netos de portugueses).
tem_direito(X, portuguesa) :- ((pai(Z, X); mae(Z, X); neto(X, Z)), cidadania(Z, portuguesa)), \+ cidadania(X, portuguesa).

% Verifica se X possui direito à cidadania britânica (transmitida por pais britânicos).
tem_direito(X, britanica) :- ((pai(Z, X); mae(Z, X)), cidadania(Z, britanica)), \+ cidadania(X, britanica).

% Verifica se X possui direito à cidadania alemã (transmitida até netos de alemães).
tem_direito(X, alema) :- ((pai(Z, X); mae(Z, X); neto(X, Z)), cidadania(Z, alema)), \+ cidadania(X, alema).