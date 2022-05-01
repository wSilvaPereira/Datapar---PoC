inherited frmSimuladorRuntimeDesigner: TfrmSimuladorRuntimeDesigner
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'PoC - Simulador - Runtime Designer'
  ClientHeight = 371
  ClientWidth = 810
  OnCreate = FormCreate
  ExplicitWidth = 816
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDados: TPanel
    Width = 804
    ExplicitWidth = 619
  end
  object ScrollBox1: TScrollBox
    AlignWithMargins = True
    Left = 3
    Top = 56
    Width = 804
    Height = 312
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 619
    ExplicitHeight = 302
    object pnlFundo: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 794
      Height = 41
      Align = alTop
      AutoSize = True
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 784
    end
  end
end
