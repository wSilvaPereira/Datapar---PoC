object frmSimuladorBase: TfrmSimuladorBase
  Left = 0
  Top = 0
  Caption = 'PoC - Simulador'
  ClientHeight = 361
  ClientWidth = 625
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Visible = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDados: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 619
    Height = 47
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 0
    ExplicitWidth = 639
    object edtCapital: TLabeledEdit
      Left = 8
      Top = 21
      Width = 121
      Height = 21
      EditLabel.Width = 37
      EditLabel.Height = 13
      EditLabel.Caption = 'Capital:'
      TabOrder = 0
    end
    object edtPeriodo: TLabeledEdit
      Left = 151
      Top = 21
      Width = 50
      Height = 21
      EditLabel.Width = 40
      EditLabel.Height = 13
      EditLabel.Caption = 'Per'#237'odo:'
      NumbersOnly = True
      TabOrder = 1
    end
    object edtTaxas: TLabeledEdit
      Left = 216
      Top = 21
      Width = 121
      Height = 21
      EditLabel.Width = 47
      EditLabel.Height = 13
      EditLabel.Caption = '% Taxas:'
      TabOrder = 2
    end
    object btnCalcular: TButton
      Left = 360
      Top = 17
      Width = 75
      Height = 25
      Caption = 'Calcular'
      TabOrder = 3
      OnClick = btnCalcularClick
    end
  end
end
