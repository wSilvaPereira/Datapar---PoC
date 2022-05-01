unit View.SimuladorRuntimeDesigner;

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
  System.Generics.Collections;

type
  TfrmSimuladorRuntimeDesigner = class(TfrmSimuladorBase)
    ScrollBox1: TScrollBox;
    pnlFundo: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    fListaComponentes: TObjectList<TComponent>;

    Procedure LimparComponentes;
    Procedure AddLinha(
      pN, pJuros, pAmortizacao, pPagamento, pSaldoDevedor: String;
      pNegrito:                                            Boolean = False);

    Procedure fAfterCalcular;
  public
    { Public declarations }
  end;

var
  frmSimuladorRuntimeDesigner: TfrmSimuladorRuntimeDesigner;

implementation

{$R *.dfm}

Procedure TfrmSimuladorRuntimeDesigner.AddLinha(
  pN, pJuros, pAmortizacao, pPagamento, pSaldoDevedor: String;
  pNegrito:                                            Boolean = False);
var
  vPainelLinha:        TPanel;
  vPainelN:            TPanel;
  vPainelJuros:        TPanel;
  vPainelAmortizacao:  TPanel;
  vPainelPagamento:    TPanel;
  vPainelSaldoDevedor: TPanel;

  Function GetPainel(pParent: TWinControl): TPanel;
  begin
    Result            := TPanel.Create(pParent);
    Result.Parent     := pParent;
    Result.ParentFont := False;
    if pNegrito then
      Result.Font.Style := [fsBold];
    fListaComponentes.Add(Result);
  end;

begin
  vPainelLinha            := GetPainel(pnlFundo);
  vPainelLinha.Align      := alBottom;
  vPainelLinha.Align      := alTop;
  vPainelLinha.Height     := 30;
  vPainelLinha.BevelOuter := bvNone;

  vPainelN         := GetPainel(vPainelLinha);
  vPainelN.Align   := alRight;
  vPainelN.Align   := alLeft;
  vPainelN.Width   := 90;
  vPainelN.Caption := pN;

  vPainelJuros         := GetPainel(vPainelLinha);
  vPainelJuros.Align   := alRight;
  vPainelJuros.Align   := alLeft;
  vPainelJuros.Width   := 110;
  vPainelJuros.Caption := pJuros;

  vPainelSaldoDevedor         := GetPainel(vPainelLinha);
  vPainelSaldoDevedor.Align   := alLeft;
  vPainelSaldoDevedor.Align   := alRight;
  vPainelSaldoDevedor.Width   := 130;
  vPainelSaldoDevedor.Caption := pSaldoDevedor;

  vPainelPagamento         := GetPainel(vPainelLinha);
  vPainelPagamento.Align   := alLeft;
  vPainelPagamento.Align   := alRight;
  vPainelPagamento.Width   := 130;
  vPainelPagamento.Caption := pPagamento;

  vPainelAmortizacao         := GetPainel(vPainelLinha);
  vPainelAmortizacao.Align   := alClient;
  vPainelAmortizacao.Caption := pAmortizacao;
end;

procedure TfrmSimuladorRuntimeDesigner.fAfterCalcular;
var
  vPanelTitulo: TPanel;
  vLabelTitulo: TLabel;
  I:            Integer;

  Function GetFormatedFloat(pValor: Currency): String;
  begin
    Result := FormatFloat(
      'R$ #,##0.00',
      pValor);
  end;

begin
  LimparComponentes;

  pnlFundo.Align := alClient;
  pnlFundo.Align := alTop;

  pnlFundo.AutoSize := False;
  pnlFundo.Height   := (fUtilsPagamentoUnico.GetDados.Count + 1) * 50;

  vPanelTitulo            := TPanel.Create(pnlFundo);
  vPanelTitulo.Parent     := pnlFundo;
  vPanelTitulo.Align      := alTop;
  vPanelTitulo.Height     := 30;
  vPanelTitulo.ParentFont := False;
  vPanelTitulo.Font.Style := [fsBold];
  fListaComponentes.Add(vPanelTitulo);

  vLabelTitulo           := TLabel.Create(vPanelTitulo);
  vLabelTitulo.Parent    := vPanelTitulo;
  vLabelTitulo.Align     := alClient;
  vLabelTitulo.Alignment := taCenter;
  vLabelTitulo.Layout    := tlCenter;
  vLabelTitulo.Caption   := 'Sistema de Pagamento Único';
  fListaComponentes.Add(vLabelTitulo);

  AddLinha(
    'N',
    'Juros',
    'Amortização Saldo Devedor',
    'Pagamento',
    'Saldo Devedor',
    True);

  for I := 0 to fUtilsPagamentoUnico.GetDados.Count - 1 do
  begin
    AddLinha(
      fUtilsPagamentoUnico.GetDados[I].N,
      GetFormatedFloat(fUtilsPagamentoUnico.GetDados[I].Juros),
      GetFormatedFloat(fUtilsPagamentoUnico.GetDados[I].Amortizacao),
      GetFormatedFloat(fUtilsPagamentoUnico.GetDados[I].Pagamento),
      GetFormatedFloat(fUtilsPagamentoUnico.GetDados[I].SaldoDevedor),
      I = fUtilsPagamentoUnico.GetDados.Count - 1);
  end;
  pnlFundo.AutoSize := True;
end;

procedure TfrmSimuladorRuntimeDesigner.FormCreate(Sender: TObject);
begin
  inherited;
  AfterCalcular     := fAfterCalcular;
  fListaComponentes := TObjectList<TComponent>.Create(False);
end;

procedure TfrmSimuladorRuntimeDesigner.FormDestroy(Sender: TObject);
begin
  LimparComponentes;
  fListaComponentes.Free;
  inherited;
end;

procedure TfrmSimuladorRuntimeDesigner.LimparComponentes;
var
  I: Integer;
begin
  for I := fListaComponentes.Count - 1 downto 0 do
  begin
    TComponent(fListaComponentes[I]).Free;
    fListaComponentes.Delete(I)
  end;
end;

end.
