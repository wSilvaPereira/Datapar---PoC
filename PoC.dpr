program PoC;

uses
  Vcl.Forms,
  View.Principal in 'View\View.Principal.pas' {frmPrincipal},
  View.SimuladorLiveBindings in 'View\View.SimuladorLiveBindings.pas' {frmSimuladorLiveBindings},
  Utils.Financeiro in 'Utils\Utils.Financeiro.pas',
  View.SimuladorBase in 'View\View.SimuladorBase.pas' {frmSimuladorBase},
  View.SimuladorDBGrid in 'View\View.SimuladorDBGrid.pas' {frmSimuladorDBGrid},
  View.SimuladorRuntimeDesigner in 'View\View.SimuladorRuntimeDesigner.pas' {frmSimuladorRuntimeDesigner};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
