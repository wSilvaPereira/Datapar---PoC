unit View.SimuladorDBGrid;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  View.SimuladorBase,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Datasnap.DBClient;

type
  TfrmSimuladorDBGrid = class(TfrmSimuladorBase)
    grdParcelas: TDBGrid;
    dtsParcelas: TDataSource;
    cdsParcelas: TClientDataSet;
    cdsParcelasN: TStringField;
    cdsParcelasJuros: TCurrencyField;
    cdsParcelasAmortizacao: TCurrencyField;
    cdsParcelasPagamento: TCurrencyField;
    cdsParcelasSaldoDevedor: TCurrencyField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure fAfterCalcular;
  public
    { Public declarations }
  end;

var
  frmSimuladorDBGrid: TfrmSimuladorDBGrid;

implementation

{$R *.dfm}

procedure TfrmSimuladorDBGrid.fAfterCalcular;
var
  I: Integer;
begin
  cdsParcelas.DisableControls;
  try

    cdsParcelas.EmptyDataSet;

    for I := 0 to fUtilsPagamentoUnico.GetDados.Count - 1 do
    begin
      cdsParcelas.Append;

      cdsParcelasN.AsString := fUtilsPagamentoUnico.GetDados[I].N;
      cdsParcelasJuros.AsCurrency := fUtilsPagamentoUnico.GetDados[I].Juros;
      cdsParcelasAmortizacao.AsCurrency := fUtilsPagamentoUnico.GetDados[I].Amortizacao;
      cdsParcelasPagamento.AsCurrency := fUtilsPagamentoUnico.GetDados[I].Pagamento;
      cdsParcelasSaldoDevedor.AsCurrency := fUtilsPagamentoUnico.GetDados[I].SaldoDevedor;

      cdsParcelas.Post;
    end;
  finally
    cdsParcelas.First;
    cdsParcelas.EnableControls;
  end;
end;

procedure TfrmSimuladorDBGrid.FormCreate(Sender: TObject);
begin
  inherited;
  AfterCalcular := fAfterCalcular;
end;

end.
