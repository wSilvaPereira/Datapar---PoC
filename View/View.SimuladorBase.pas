unit View.SimuladorBase;

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
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Utils.Financeiro;

type

  TAfterCalcular = Procedure of Object;

  TfrmSimuladorBase = class(TForm)
    pnlDados: TPanel;
    edtCapital: TLabeledEdit;
    edtPeriodo: TLabeledEdit;
    edtTaxas: TLabeledEdit;
    btnCalcular: TButton;
    procedure btnCalcularClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(
      Sender:     TObject;
      var Action: TCloseAction);
  private
    { Private declarations }
    FAfterCalcular:       TAfterCalcular;
    procedure SetAfterCalcular(const Value: TAfterCalcular);
  Protected
    fUtilsPagamentoUnico: TUtilsPagamentoUnico;
  public
    { Public declarations }
    Constructor Create(AOwner: TComponent); Override;

    Property AfterCalcular: TAfterCalcular read FAfterCalcular
      write SetAfterCalcular;
  end;

var
  frmSimuladorBase: TfrmSimuladorBase;

implementation

{$R *.dfm}

procedure TfrmSimuladorBase.btnCalcularClick(Sender: TObject);
var
  vErros: TStringList;

  vCapital: Currency;
  vPeriodo: Integer;
  vTaxas:   Double;
begin
  vErros := TStringList.Create;
  try
    if not TryStrToCurr(edtCapital.Text, vCapital) then
      vErros.Add('O valor informado no capital não é válido.');

    if not TryStrToInt(edtPeriodo.Text, vPeriodo) then
      vErros.Add('O valor informado no período não é válido.');

    if not TryStrToFloat(edtTaxas.Text, vTaxas) then
      vErros.Add('O valor informado nas taxas não é válido.');

    if vErros.Count = 0 then
    begin
      fUtilsPagamentoUnico.Calcular(
        vCapital,
        vPeriodo,
        vTaxas);

      if Assigned(FAfterCalcular) then
        FAfterCalcular;
    end
    else
      ShowMessage(vErros.Text);
  finally
    vErros.Free;
  end;
end;

constructor TfrmSimuladorBase.Create(AOwner: TComponent);
begin
  fUtilsPagamentoUnico := TUtilsPagamentoUnico.Create;
  inherited;
end;

procedure TfrmSimuladorBase.FormClose(
  Sender:     TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSimuladorBase.FormDestroy(Sender: TObject);
begin
  fUtilsPagamentoUnico.Free;
end;

procedure TfrmSimuladorBase.SetAfterCalcular(const Value: TAfterCalcular);
begin
  FAfterCalcular := Value;
end;

end.
