unit Utils.Financeiro;

interface

uses
  System.Generics.Collections,
  System.Math;

Type

  TDadosParcela = Class
  Private
    fSaldoDevedor: Currency;
    fJuros:        Currency;
    fNumero:       Integer;
    fPagamento:    Currency;
    fAmortizacao:  Currency;
    function GetN: String;
    function GetAmortizacao: Currency;
    function GetJuros: Currency;
    function GetPagamento: Currency;
    function GetSaldoDevedor: Currency;

//    Property Numero: Integer read fNumero;
  Public
    Property N:            String   Read GetN;
    Property Juros:        Currency read GetJuros;
    Property Amortizacao:  Currency read GetAmortizacao;
    Property Pagamento:    Currency read GetPagamento;
    Property SaldoDevedor: Currency read GetSaldoDevedor;

    Constructor Create(
      pNumero:                                         Integer;
      pJuros, pAmortizacao, pPagamento, pSaldoDevedor: Currency);
  End;

  TUtilsPagamentoUnico = Class
  Private
    fDadosParcelaLista: TObjectList<TDadosParcela>;
  Public
    Constructor Create;
    Destructor Destroy; Override;

    Procedure Calcular(
      pCapital: Currency;
      pPeriodo: Integer;
      pTaxas:   Double);

    Function GetDados: TObjectList<TDadosParcela>;
  End;

implementation

uses
  System.StrUtils,
  System.SysUtils;

{ TDadosParcela }

constructor TDadosParcela.Create(
  pNumero:                                         Integer;
  pJuros, pAmortizacao, pPagamento, pSaldoDevedor: Currency);
begin
  fSaldoDevedor := pSaldoDevedor;
  fJuros := pJuros;
  fNumero := pNumero;
  fPagamento := pPagamento;
  fAmortizacao := pAmortizacao;
end;

function TDadosParcela.GetAmortizacao: Currency;
begin
  Result := SimpleRoundTo(fAmortizacao);
end;

function TDadosParcela.GetJuros: Currency;
begin
  Result := SimpleRoundTo(fJuros);
end;

function TDadosParcela.GetN: String;
begin
  Result := ifThen(
    fNumero = -1,
    'Totais',
    IntToStr(fNumero));
end;

function TDadosParcela.GetPagamento: Currency;
begin
  Result := SimpleRoundTo(fPagamento);
end;

function TDadosParcela.GetSaldoDevedor: Currency;
begin
  Result := SimpleRoundTo(fSaldoDevedor);
end;

{ TUtilsPagamentoUnico }

procedure TUtilsPagamentoUnico.Calcular(
  pCapital: Currency;
  pPeriodo: Integer;
  pTaxas:   Double);
var
  I:             Integer;
  vJuros:        Currency;
  vSaldoDevedor: Currency;

  vPagamento:   Currency;
  vAmortizacao: Currency;
begin
  fDadosParcelaLista.Clear;
  fDadosParcelaLista.Add(TDadosParcela.Create(0, 0, 0, 0, pCapital));

  vSaldoDevedor := pCapital;

  vPagamento := 0;
  vAmortizacao := 0;

  for I := 1 to pPeriodo do
  begin
    vJuros := vSaldoDevedor * pTaxas / 100;
    vSaldoDevedor := vSaldoDevedor + vJuros;

    if I = pPeriodo then
    begin
      vAmortizacao := pCapital;
      vPagamento := vSaldoDevedor;
      vSaldoDevedor := 0;
    end;

    fDadosParcelaLista.Add(TDadosParcela.Create(I, vJuros, vAmortizacao,
      vPagamento, vSaldoDevedor));
  end;

  fDadosParcelaLista.Add(TDadosParcela.Create(-1, vPagamento - pCapital,
    vAmortizacao, vPagamento, 0));

end;

constructor TUtilsPagamentoUnico.Create;
begin
  fDadosParcelaLista := TObjectList<TDadosParcela>.Create(True);
end;

destructor TUtilsPagamentoUnico.Destroy;
begin
  fDadosParcelaLista.Clear;
  fDadosParcelaLista.Free;
  inherited;
end;

function TUtilsPagamentoUnico.GetDados: TObjectList<TDadosParcela>;
begin
  Result := fDadosParcelaLista;
end;

end.
