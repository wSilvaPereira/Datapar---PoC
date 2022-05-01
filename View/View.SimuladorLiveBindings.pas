unit View.SimuladorLiveBindings;

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
  TfrmSimuladorLiveBindings = class(TfrmSimuladorBase)
    PrototypeBindSource: TPrototypeBindSource;
    BindingsList1: TBindingsList;
    grdDados: TStringGrid;
    LinkGridToDataSourcePrototypeBindSource1: TLinkGridToDataSource;
    procedure FormCreate(Sender: TObject);
    procedure PrototypeBindSourceCreateAdapter(
      Sender:                 TObject;
      var ABindSourceAdapter: TBindSourceAdapter);
  private
    { Private declarations }
    Procedure fAfterCalcular;

    // fListaParcela: Tlist<TDadosParcela>;
  public
    { Public declarations }
    Constructor Create(AOwner: TComponent); Override;
  end;

var
  frmSimuladorLiveBindings: TfrmSimuladorLiveBindings;

implementation

{$R *.dfm}

constructor TfrmSimuladorLiveBindings.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TfrmSimuladorLiveBindings.fAfterCalcular;
begin
  PrototypeBindSource.Refresh;
end;

procedure TfrmSimuladorLiveBindings.FormCreate(Sender: TObject);
begin
  AfterCalcular := fAfterCalcular;
  grdDados.ColWidths[0] := 70;
  grdDados.ColWidths[1] := 90;
  grdDados.ColWidths[2] := 150;
  grdDados.ColWidths[3] := 150;
  grdDados.ColWidths[4] := 150;
end;

procedure TfrmSimuladorLiveBindings.PrototypeBindSourceCreateAdapter(
  Sender:                 TObject;
  var ABindSourceAdapter: TBindSourceAdapter);
begin
  ABindSourceAdapter := TListBindSourceAdapter<TDadosParcela>.Create(
    self,
    fUtilsPagamentoUnico.GetDados,
    False);
end;

end.
