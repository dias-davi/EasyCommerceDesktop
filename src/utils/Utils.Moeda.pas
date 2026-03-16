unit Utils.Moeda;

// Utilitários para formatação e parsing de moeda no padrão BRL
// Separador decimal: vírgula  (ex: 1.299,90)
// Separador de milhar: ponto

interface

function MoedaParaCurrency(const S: string): Currency;
function CurrencyParaMoeda(const V: Currency): string;

implementation

uses
  System.SysUtils;

function MoedaParaCurrency(const S: string): Currency;
var
  Limpo: string;
begin
  // Remove pontos de milhar e troca vírgula por ponto para StrToCurr
  Limpo := StringReplace(S, '.', '', [rfReplaceAll]);
  Limpo := StringReplace(Limpo, ',', '.', [rfReplaceAll]);
  Result := StrToCurrDef(Limpo, 0);
end;

function CurrencyParaMoeda(const V: Currency): string;
begin
  Result := FormatFloat('#,##0.00', V);
  // FormatFloat usa as configurações de locale do sistema.
  // Em sistemas com locale pt-BR já sai correto (vírgula decimal).
  // Caso o sistema esteja em en-US, forçamos a troca:
  Result := StringReplace(Result, '.', '@', [rfReplaceAll]);
  Result := StringReplace(Result, ',', '.', [rfReplaceAll]);
  Result := StringReplace(Result, '@', ',', [rfReplaceAll]);
end;

end.
