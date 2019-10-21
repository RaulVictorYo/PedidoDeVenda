object ProdutoViewVis: TProdutoViewVis
  Left = 0
  Top = 0
  Caption = 'ProdutoViewVis'
  ClientHeight = 381
  ClientWidth = 756
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 756
    Height = 67
    Align = alTop
    TabOrder = 0
    object btnPesquisar: TButton
      Left = 233
      Top = 1
      Width = 82
      Height = 65
      Align = alLeft
      Caption = 'Pesquisar'
      TabOrder = 0
      OnClick = btnPesquisarClick
    end
    object btnAlterar: TButton
      Left = 76
      Top = 1
      Width = 75
      Height = 65
      Align = alLeft
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnIncluir: TButton
      Left = 1
      Top = 1
      Width = 75
      Height = 65
      Align = alLeft
      Caption = 'Incluir'
      TabOrder = 2
      OnClick = btnIncluirClick
    end
    object btnExcluir: TButton
      Left = 151
      Top = 1
      Width = 82
      Height = 65
      Align = alLeft
      Caption = 'Excluir'
      TabOrder = 3
      OnClick = btnExcluirClick
    end
    object edtID: TLabeledEdit
      Left = 369
      Top = 13
      Width = 121
      Height = 21
      EditLabel.Width = 15
      EditLabel.Height = 13
      EditLabel.Caption = 'ID:'
      LabelPosition = lpLeft
      TabOrder = 4
    end
    object edtDescricao: TLabeledEdit
      Left = 369
      Top = 40
      Width = 368
      Height = 21
      EditLabel.Width = 50
      EditLabel.Height = 13
      EditLabel.Caption = 'Descricao:'
      LabelPosition = lpLeft
      TabOrder = 5
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 67
    Width = 756
    Height = 176
    Align = alTop
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALORVENDA'
        Title.Caption = 'Vlr. Venda'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUSTO'
        Title.Caption = 'Custo'
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = FDQueryGrid
    Left = 512
    Top = 304
  end
  object FDQueryGrid: TFDQuery
    SQL.Strings = (
      'select * from produto')
    Left = 424
    Top = 304
  end
end
