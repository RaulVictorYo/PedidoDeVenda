inherited ClienteVisView: TClienteVisView
  Caption = 'ClienteVisView'
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBGrid1: TDBGrid
    OnKeyDown = DBGrid1KeyDown
  end
  inherited Panel1: TPanel
    inherited btnPesquisar: TButton
      OnClick = btnPesquisarClick
    end
    inherited btnAlterar: TButton
      OnClick = btnAlterarClick
    end
    inherited btnIncluir: TButton
      OnClick = btnIncluirClick
    end
    inherited btnExcluir: TButton
      OnClick = btnExcluirClick
    end
  end
end
