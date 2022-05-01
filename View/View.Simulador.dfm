inherited frmSimulador: TfrmSimulador
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'PoC - Simulador'
  ClientHeight = 439
  ClientWidth = 645
  FormStyle = fsMDIChild
  Position = poOwnerFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 651
  ExplicitHeight = 468
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDados: TPanel
    Width = 639
  end
  object grdDados: TStringGrid
    Tag = 5
    AlignWithMargins = True
    Left = 3
    Top = 56
    Width = 639
    Height = 380
    Align = alClient
    DefaultColWidth = 100
    FixedCols = 0
    RowCount = 201
    TabOrder = 1
    ColWidths = (
      64
      64
      64
      64
      64)
    ColAligments = (
      0
      1
      1
      1
      1)
  end
  object PrototypeBindSource: TPrototypeBindSource
    AutoActivate = True
    AutoPost = False
    FieldDefs = <
      item
        Name = 'N'
        Generator = 'BitmapNames'
        ReadOnly = False
      end
      item
        Name = 'Juros'
        FieldType = ftCurrency
        Generator = 'Currency'
        ReadOnly = False
      end
      item
        Name = 'Amortiza'#231#227'o'
        FieldType = ftCurrency
        Generator = 'Currency'
        ReadOnly = False
      end
      item
        Name = 'Pagamento'
        FieldType = ftCurrency
        Generator = 'Currency'
        ReadOnly = False
      end
      item
        Name = 'Saldo Devedor'
        FieldType = ftCurrency
        Generator = 'Currency'
        ReadOnly = False
      end>
    ScopeMappings = <>
    OnCreateAdapter = PrototypeBindSourceCreateAdapter
    Left = 560
    Top = 360
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 548
    Top = 269
    object LinkGridToDataSourcePrototypeBindSource1: TLinkGridToDataSource
      DataSource = PrototypeBindSource
      GridControl = grdDados
      Columns = <>
    end
  end
end
