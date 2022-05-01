unit View.Principal;

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
  System.ImageList,
  Vcl.ImgList,
  System.Generics.Collections,
  View.SimuladorLiveBindings,
  View.SimuladorDBGrid,
  View.SimuladorBase,
  View.SimuladorRuntimeDesigner;

type
  TfrmPrincipal = class(TForm)
    pnlMenuPrincipal: TPanel;
    btnSimuladorLiveBindings: TButton;
    ImgList: TImageList;
    btnSimuladorDBGrid: TButton;
    btnSimuladorRuntime: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSimuladorLiveBindingsClick(Sender: TObject);
    procedure btnSimuladorDBGridClick(Sender: TObject);
    procedure btnSimuladorRuntimeClick(Sender: TObject);
  private
    { Private declarations }
    fSimuladorForms: TObjectList<TfrmSimuladorBase>;

    Procedure AddShowSimulador(oSimulador : TfrmSimuladorBase);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.AddShowSimulador(oSimulador: TfrmSimuladorBase);
begin
  fSimuladorForms.Add(oSimulador);
  oSimulador.Show;
end;

procedure TfrmPrincipal.btnSimuladorDBGridClick(Sender: TObject);
begin
  AddShowSimulador(TfrmSimuladorDBGrid.Create(Self));
end;

procedure TfrmPrincipal.btnSimuladorLiveBindingsClick(Sender: TObject);
begin
  AddShowSimulador(TfrmSimuladorLiveBindings.Create(Self));
end;

procedure TfrmPrincipal.btnSimuladorRuntimeClick(Sender: TObject);
begin
  AddShowSimulador(TfrmSimuladorRuntimeDesigner.Create(Self));
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  fSimuladorForms := TObjectList<TfrmSimuladorBase>.Create(False);
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fSimuladorForms);
end;

end.
