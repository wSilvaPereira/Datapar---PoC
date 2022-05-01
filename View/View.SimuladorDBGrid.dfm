inherited frmSimuladorDBGrid: TfrmSimuladorDBGrid
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'PoC - Simulador - DB Grid'
  ClientHeight = 371
  ClientWidth = 654
  OnCreate = FormCreate
  ExplicitWidth = 660
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDados: TPanel
    Width = 648
    ExplicitWidth = 638
  end
  object grdParcelas: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 56
    Width = 648
    Height = 312
    Align = alClient
    DataSource = dtsParcelas
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'N'
        Title.Alignment = taCenter
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Juros'
        Title.Alignment = taRightJustify
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Amortizacao'
        Title.Alignment = taRightJustify
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pagamento'
        Title.Alignment = taRightJustify
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SaldoDevedor'
        Title.Alignment = taRightJustify
        Width = 150
        Visible = True
      end>
  end
  object dtsParcelas: TDataSource
    DataSet = cdsParcelas
    Left = 24
    Top = 304
  end
  object cdsParcelas: TClientDataSet
    PersistDataPacket.Data = {
      C90000009619E0BD010000001800000005000000000003000000C900014E0100
      490000000100055749445448020002001400054A75726F730800040000000100
      07535542545950450200490006004D6F6E6579000B416D6F7274697A6163616F
      080004000000010007535542545950450200490006004D6F6E65790009506167
      616D656E746F080004000000010007535542545950450200490006004D6F6E65
      79000C53616C646F44657665646F720800040000000100075355425459504502
      00490006004D6F6E6579000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'N'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Juros'
        DataType = ftCurrency
      end
      item
        Name = 'Amortizacao'
        DataType = ftCurrency
      end
      item
        Name = 'Pagamento'
        DataType = ftCurrency
      end
      item
        Name = 'SaldoDevedor'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 104
    Top = 304
    object cdsParcelasN: TStringField
      FieldName = 'N'
    end
    object cdsParcelasJuros: TCurrencyField
      FieldName = 'Juros'
    end
    object cdsParcelasAmortizacao: TCurrencyField
      DisplayLabel = 'Amortiza'#231#227'o'
      FieldName = 'Amortizacao'
    end
    object cdsParcelasPagamento: TCurrencyField
      FieldName = 'Pagamento'
    end
    object cdsParcelasSaldoDevedor: TCurrencyField
      FieldName = 'SaldoDevedor'
    end
  end
end
