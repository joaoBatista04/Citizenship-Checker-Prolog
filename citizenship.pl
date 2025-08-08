% Verifica se X é neto de Y.
neto(X, Y) :- (pai(Z, X); mae(Z, X)), (pai(Y, Z); mae(Y, Z)).

% Verifica se X é ascendente direto de Y.
ascendente(X, Y) :- (pai(X, Y); mae(X, Y)); (pai(X, Z); mae(X, Z)), ascendente(Z, Y).

% Verifica se X possui direito à cidadania italiana (sem limite de gerações).
tem_direito(X, italia) :- ascendente(Y, X), cidadania(Y, italiana).

% Verifica se X possui direito à cidadania portuguesa (transmitida até netos de portugueses).
tem_direito(X, portugal) :- (pai(Z, X); mae(Z, X); neto(X, Z)), cidadania(Z, portuguesa).

% Verifica se X possui direito à cidadania britânica (transmitida por pais britânicos).
tem_direito(X, reino_unido) :- (pai(Z, X); mae(Z, X)), cidadania(Z, britanica).

% Verifica se X possui direito à cidadania alemã (transmitida até netos de alemães).
tem_direito(X, alemanha) :- (pai(Z, X); mae(Z, X); neto(X, Z)), cidadania(Z, alema).