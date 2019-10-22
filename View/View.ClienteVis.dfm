inherited ClienteVisView: TClienteVisView
  Caption = 'Clientes'
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMenu: TPanel
    inherited pnlIncluir: TPanel
      OnClick = pnlIncluirClick
      inherited imgProduto: TImage
        OnClick = pnlIncluirClick
      end
      inherited lblProduto: TLabel
        Height = 35
        OnClick = pnlIncluirClick
      end
    end
    inherited pnlAlterar: TPanel
      OnClick = pnlAlterarClick
      inherited imgCliente: TImage
        OnClick = pnlAlterarClick
      end
      inherited lblCliente: TLabel
        Height = 35
        OnClick = pnlAlterarClick
      end
    end
    inherited pnlDeletar: TPanel
      OnClick = pnlDeletarClick
      inherited imgPedidoDeVenda: TImage
        OnClick = pnlDeletarClick
      end
      inherited lblPedidoDeVenda: TLabel
        Height = 35
        OnClick = pnlDeletarClick
      end
    end
    inherited pnlPesquisar: TPanel
      OnClick = pnlPesquisarClick
      inherited imgPesquisa: TImage
        OnClick = pnlPesquisarClick
      end
      inherited lblPesquisar: TLabel
        Height = 35
        OnClick = pnlPesquisarClick
      end
    end
  end
  inherited pnl1: TPanel
    inherited pnlPesquisa: TPanel
      inherited pnlLimpar: TPanel
        OnClick = pnlLimparClick
        inherited imgLimpar: TImage
          Width = 33
          OnClick = pnlLimparClick
          ExplicitLeft = 16
          ExplicitWidth = 33
        end
        inherited lblLimpar: TLabel
          Left = 57
          Height = 35
          OnClick = pnlLimparClick
          ExplicitLeft = 57
        end
      end
      object edtID: TLabeledEdit
        Left = 160
        Top = 34
        Width = 121
        Height = 21
        EditLabel.Width = 21
        EditLabel.Height = 15
        EditLabel.Caption = 'ID:'
        EditLabel.Color = clWhite
        EditLabel.Font.Charset = ANSI_CHARSET
        EditLabel.Font.Color = clWhite
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Consolas'
        EditLabel.Font.Style = []
        EditLabel.ParentColor = False
        EditLabel.ParentFont = False
        LabelPosition = lpLeft
        TabOrder = 1
      end
      object edtRazaoSocial: TLabeledEdit
        Left = 384
        Top = 34
        Width = 281
        Height = 21
        EditLabel.Width = 91
        EditLabel.Height = 15
        EditLabel.Caption = 'Raz'#227'o Social:'
        EditLabel.Color = clWhite
        EditLabel.Font.Charset = ANSI_CHARSET
        EditLabel.Font.Color = clWhite
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Consolas'
        EditLabel.Font.Style = []
        EditLabel.ParentColor = False
        EditLabel.ParentFont = False
        LabelPosition = lpLeft
        TabOrder = 2
      end
    end
    inherited DBGrid1: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Width = 34
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RAZAOSOCIAL'
          Title.Caption = 'Raz'#227'o Social'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NomeFantasia'
          Title.Caption = 'Nome Fantasia'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CNPJ'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CIDADE'
          Title.Caption = 'Cidade'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CEP'
          Width = 100
          Visible = True
        end>
    end
  end
  inherited FDQueryGrid: TFDQuery
    SQL.Strings = (
      'select * from Cliente')
  end
end
