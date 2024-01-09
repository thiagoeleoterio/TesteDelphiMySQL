object frmVendasView: TfrmVendasView
  Left = 0
  Top = 0
  Caption = 'Pedido de Vendas - MySQL'
  ClientHeight = 650
  ClientWidth = 600
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
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 600
    Height = 49
    Align = alTop
    Caption = 'Pedido de Vendas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 596
  end
  object pnlAcoes: TPanel
    Left = 0
    Top = 177
    Width = 600
    Height = 112
    Align = alTop
    TabOrder = 2
    ExplicitTop = 107
    DesignSize = (
      600
      112)
    object lblDescricaoProduto: TLabel
      Left = 158
      Top = 31
      Width = 62
      Height = 17
      Caption = 'Produto...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCodigo: TLabeledEdit
      Left = 16
      Top = 27
      Width = 121
      Height = 23
      EditLabel.Width = 102
      EditLabel.Height = 15
      EditLabel.Caption = 'C'#243'digo do Produto'
      TabOrder = 0
      Text = ''
      OnExit = edtCodigoExit
      OnKeyDown = edtCodigoKeyDown
      OnKeyPress = edtCodigoKeyPress
    end
    object edtQuantidade: TLabeledEdit
      Left = 16
      Top = 75
      Width = 121
      Height = 23
      EditLabel.Width = 62
      EditLabel.Height = 15
      EditLabel.Caption = 'Quantidade'
      TabOrder = 1
      Text = ''
      OnExit = edtQuantidadeExit
      OnKeyDown = edtQuantidadeKeyDown
      OnKeyPress = edtQuantidadeKeyPress
    end
    object edtValorUnitario: TLabeledEdit
      Left = 158
      Top = 75
      Width = 121
      Height = 23
      EditLabel.Width = 71
      EditLabel.Height = 15
      EditLabel.Caption = 'Valor Unit'#225'rio'
      TabOrder = 2
      Text = ''
      OnExit = edtValorUnitarioExit
      OnKeyDown = edtValorUnitarioKeyDown
      OnKeyPress = edtValorUnitarioKeyPress
    end
    object btnInserir: TBitBtn
      Left = 464
      Top = 72
      Width = 120
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Inserir Produto'
      ModalResult = 6
      NumGlyphs = 2
      TabOrder = 3
      OnClick = btnInserirClick
    end
  end
  object pnlDados: TPanel
    Left = 0
    Top = 49
    Width = 600
    Height = 64
    Align = alTop
    TabOrder = 1
    object lblNomeCliente: TLabel
      Left = 158
      Top = 31
      Width = 55
      Height = 17
      Caption = 'Cliente...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCodCliente: TLabeledEdit
      Left = 16
      Top = 27
      Width = 121
      Height = 23
      EditLabel.Width = 79
      EditLabel.Height = 15
      EditLabel.Caption = 'C'#243'digo Cliente'
      ImeName = 'dt'
      TabOrder = 0
      Text = ''
      OnExit = edtCodClienteExit
      OnKeyDown = edtCodClienteKeyDown
      OnKeyPress = edtCodClienteKeyPress
    end
  end
  object grdProdutos: TDBGrid
    Left = 0
    Top = 289
    Width = 600
    Height = 233
    Align = alClient
    DataSource = dssPedidoProduto
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnKeyDown = grdProdutosKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'idProduto'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Width = 253
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtd'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorUnitario'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorTotal'
        Width = 104
        Visible = True
      end>
  end
  object pnlFinalizar: TPanel
    Left = 0
    Top = 586
    Width = 600
    Height = 64
    Align = alBottom
    TabOrder = 4
    ExplicitTop = 585
    ExplicitWidth = 596
    DesignSize = (
      600
      64)
    object btnGravar: TBitBtn
      Left = 464
      Top = 23
      Width = 120
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Gravar Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ModalResult = 1
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = btnGravarClick
      ExplicitLeft = 460
    end
    object btnFechar: TBitBtn
      Left = 16
      Top = 23
      Width = 75
      Height = 25
      Caption = '&Fechar'
      DisabledImageName = 'btnFechar'
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnFecharClick
    end
  end
  object pnlTotalPedido: TPanel
    Left = 0
    Top = 522
    Width = 600
    Height = 64
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    ExplicitTop = 521
    ExplicitWidth = 596
  end
  object pnlOperacoes: TPanel
    Left = 0
    Top = 113
    Width = 600
    Height = 64
    Align = alTop
    TabOrder = 6
    DesignSize = (
      600
      64)
    object lblPedido: TLabel
      Left = 16
      Top = 23
      Width = 4
      Height = 17
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnCarregarPedido: TBitBtn
      Left = 464
      Top = 20
      Width = 120
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Carregar Pedido'
      ModalResult = 6
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnCarregarPedidoClick
    end
    object btnCancelarPedido: TBitBtn
      Left = 327
      Top = 20
      Width = 120
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancelar &Pedido'
      ModalResult = 6
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnCancelarPedidoClick
    end
  end
  object FDMPedidoProduto: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 296
    Top = 328
    object FDMPedidoProdutoidProduto: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'idProduto'
    end
    object FDMPedidoProdutoDescricao: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'Descricao'
      Size = 100
    end
    object FDMPedidoProdutoQtd: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'Qtd'
      DisplayFormat = '##,###0.00'
    end
    object FDMPedidoProdutoValorUnitario: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'ValorUnitario'
      DisplayFormat = '##,###0.00'
    end
    object FDMPedidoProdutoValorTotal: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'ValorTotal'
      DisplayFormat = '##,###0.00'
    end
    object FDMPedidoProdutoid: TAutoIncField
      AutoGenerateValue = arDefault
      FieldName = 'id'
    end
  end
  object dssPedidoProduto: TDataSource
    DataSet = FDMPedidoProduto
    Left = 400
    Top = 288
  end
end
