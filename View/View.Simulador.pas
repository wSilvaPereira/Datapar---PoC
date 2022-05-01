unit View.Simulador;

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
  Data.DB,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Utils.Financeiro,
  Data.Bind.Components,
  Data.Bind.ObjectScope,
  Data.Bind.EngExt,
  Vcl.Bind.DBEngExt,
  Vcl.Bind.Grid,
  System.Rtti,
  System.Bindings.Outputs,
  Vcl.Bind.Editors,
  Data.Bind.Grid,
  Vcl.Bind.GenData,
  Data.Bind.GenData,
  System.Generics.Collections,
  View.SimuladorBase;

type
  TfrmSimulador = class(TfrmSimuladorBase)
    PrototypeBindSource: TPrototypeBindSource;
    BindingsList1: TBindingsList;
    grdDados: TStringGrid;
    LinkGridToDataSourcePrototypeBindSource1: TLinkGridToDataSource;
    procedure btnCalcularClick(Sender: TObject);
    procedure FormClose(
      Sender:     TObject;
      var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PrototypeBindSourceCreateAdapter(
      Sender:                 TObject;
      var ABindSourceAdapter: TBindSourceAdapter);
  private
    { Private declarations }
    fUtilsPagamentoUnico: TUtilsPagamentoUnico;

    // fListaParcela: Tlist<TDadosParcela>;
  public
    { Public declarations }
    Constructor Create(AOwner: TComponent); Override;
  end;

var
  frmSimulador: TfrmSimulador;

implementation

{$R *.dfm}

procedure TfrmSimulador.btnCalcularClick(Sender: TObject);
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
      PrototypeBindSource.Refresh;
    end
    else
      ShowMessage(vErros.Text);
  finally
    vErros.Free;
  end;
end;

constructor TfrmSimulador.Create(AOwner: TComponent);
begin
  fUtilsPagamentoUnico := TUtilsPagamentoUnico.Create;
  inherited;
end;

procedure TfrmSimulador.FormClose(
  Sender:     TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSimulador.FormCreate(Sender: TObject);
begin
  grdDados.ColWidths[0] := 70;
  grdDados.ColWidths[1] := 90;
  grdDados.ColWidths[2] := 150;
  grdDados.ColWidths[3] := 150;
  grdDados.ColWidths[4] := 150;
end;

procedure TfrmSimulador.FormDestroy(Sender: TObject);
begin
  fUtilsPagamentoUnico.Free;
end;

procedure TfrmSimulador.PrototypeBindSourceCreateAdapter(
  Sender:                 TObject;
  var ABindSourceAdapter: TBindSourceAdapter);
begin
  ABindSourceAdapter := TListBindSourceAdapter<TDadosParcela>.Create(
    self,
    fUtilsPagamentoUnico.GetDados,
    False);
end;

end.
