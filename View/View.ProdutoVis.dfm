inherited ProdutoVisView: TProdutoVisView
  Caption = 'Produtos'
  OnCreate = FormCreate
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
          OnClick = pnlLimparClick
        end
        inherited lblLimpar: TLabel
          Height = 35
          OnClick = pnlLimparClick
        end
      end
      object edtDescricao: TLabeledEdit
        Left = 381
        Top = 34
        Width = 281
        Height = 21
        EditLabel.Width = 70
        EditLabel.Height = 15
        EditLabel.Caption = 'Descri'#231#227'o:'
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
      object edtID: TLabeledEdit
        Left = 157
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
        TabOrder = 2
      end
    end
  end
end
