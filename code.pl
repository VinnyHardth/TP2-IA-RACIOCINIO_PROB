% Definindo probabilidades marginais
0.6::str(dry).
0.3::str(wet).
0.1::str(snow_covered).

0.2::flw(true).   % Probabilidade de o volante do dínamo estar desgastado
0.8::flw(false).

0.95::b(true).    % Probabilidade da lâmpada estar ok
0.05::b(false).

0.98::k(true).    % Probabilidade do cabo estar ok
0.02::k(false).

% Probabilidades condicionais para R dado Str e Flw
0.7::r(true) :- str(dry), flw(true).
0.1::r(true) :- str(dry), flw(false).
0.8::r(true) :- str(wet), flw(true).
0.4::r(true) :- str(wet), flw(false).
0.95::r(true) :- str(snow_covered), flw(true).
0.6::r(true) :- str(snow_covered), flw(false).

% Caso contrário, r é falso
0.3::r(false) :- str(dry), flw(true).
0.9::r(false) :- str(dry), flw(false).
0.2::r(false) :- str(wet), flw(true).
0.6::r(false) :- str(wet), flw(false).
0.05::r(false) :- str(snow_covered), flw(true).
0.4::r(false) :- str(snow_covered), flw(false).

% Probabilidades condicionais para V dado R
0.9::v(true) :- r(true).
0.2::v(true) :- r(false).
0.1::v(false) :- r(true).
0.8::v(false) :- r(false).

% Probabilidades condicionais para Li dado V, B, e K
0.99::li(true) :- v(true), b(true), k(true).
0.01::li(true) :- v(true), b(true), k(false).
0.01::li(true) :- v(true), b(false), k(true).
0.001::li(true) :- v(true), b(false), k(false).
0.3::li(true) :- v(false), b(true), k(true).
0.005::li(true) :- v(false), b(true), k(false).
0.005::li(true) :- v(false), b(false), k(true).
0.0::li(true) :- v(false), b(false), k(false).

% Caso contrário, Li é falso
0.01::li(false) :- v(true), b(true), k(true).
0.99::li(false) :- v(true), b(true), k(false).
0.99::li(false) :- v(true), b(false), k(true).
0.999::li(false) :- v(true), b(false), k(false).
0.7::li(false) :- v(false), b(true), k(true).
0.995::li(false) :- v(false), b(true), k(false).
0.995::li(false) :- v(false), b(false), k(true).
1.0::li(false) :- v(false), b(false), k(false).

% Consultas
query(v(true) | str(snow_covered)).  % Probabilidade de V = true dado que Str = snow_covered
