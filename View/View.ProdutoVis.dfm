inherited ProdutoVisView: TProdutoVisView
  Caption = 'Produtos'
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
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
        OnClick = pnlIncluirClick
      end
    end
    inherited pnlAlterar: TPanel
      OnClick = pnlAlterarClick
      inherited imgCliente: TImage
        OnClick = pnlAlterarClick
      end
      inherited lblCliente: TLabel
        OnClick = pnlAlterarClick
      end
    end
    inherited pnlDeletar: TPanel
      OnClick = pnlDeletarClick
      inherited imgPedidoDeVenda: TImage
        OnClick = pnlDeletarClick
      end
      inherited lblPedidoDeVenda: TLabel
        OnClick = pnlDeletarClick
      end
    end
    inherited pnlPesquisar: TPanel
      OnClick = pnlPesquisarClick
      inherited imgPesquisa: TImage
        OnClick = pnlPesquisarClick
      end
      inherited lblPesquisar: TLabel
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
          OnClick = pnlLimparClick
        end
      end
      object edtDescricao: TLabeledEdit
        Left = 381
        Top = 34
        Width = 281
        Height = 21
        BevelOuter = bvNone
        CharCase = ecUpperCase
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
        OnKeyDown = edtIDKeyDown
      end
      object edtID: TLabeledEdit
        Left = 157
        Top = 34
        Width = 121
        Height = 21
        BevelOuter = bvNone
        CharCase = ecUpperCase
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
        OnKeyDown = edtIDKeyDown
      end
    end
    inherited DBGrid1: TDBGrid
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      OnKeyDown = DBGrid1KeyDown
    end
  end
end
