object frmProdutoView: TfrmProdutoView
  Left = 0
  Top = 0
  Caption = 'Pesquisa de Produto...'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object pnlPesquisa: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 81
    Align = alTop
    TabOrder = 0
    DesignSize = (
      628
      81)
    object lblLegenda: TLabel
      Left = 24
      Top = 55
      Width = 325
      Height = 12
      Caption = 
        '* A pesquisa '#233' feita automaticamente ap'#243's a digta'#231#227'o do segundo ' +
        'caractere'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdtPesquisar: TLabeledEdit
      Left = 24
      Top = 26
      Width = 583
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 152
      EditLabel.Height = 15
      EditLabel.Caption = 'Informe o nome do Produto:'
      TabOrder = 0
      Text = ''
      OnKeyDown = EdtPesquisarKeyDown
      OnKeyPress = EdtPesquisarKeyPress
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 376
    Width = 628
    Height = 66
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      628
      66)
    object btnConfirmar: TBitBtn
      Left = 504
      Top = 22
      Width = 103
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '&Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ModalResult = 2
      ParentFont = False
      TabOrder = 0
      OnClick = btnConfirmarClick
    end
    object btnCancelar: TBitBtn
      Left = 24
      Top = 22
      Width = 75
      Height = 25
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object grdProduto: TDBGrid
    Left = 0
    Top = 81
    Width = 628
    Height = 295
    Align = alClient
    DataSource = dssProduto
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnKeyDown = grdProdutoKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'idProduto'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Width = 326
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PrecoVenda'
        Width = 190
        Visible = True
      end>
  end
  object dssProduto: TDataSource
    DataSet = fdmProduto
    Left = 520
    Top = 192
  end
  object fdmProduto: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 520
    Top = 128
    object fdmProdutoidProduto: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'idProduto'
    end
    object fdmProdutoDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Size = 100
    end
    object fdmProdutoPrecoVenda: TFloatField
      DisplayLabel = 'Pre'#231'o de Venda'
      FieldName = 'PrecoVenda'
      DisplayFormat = '##,###0.00'
    end
  end
end