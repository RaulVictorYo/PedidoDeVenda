inherited ClienteVisView: TClienteVisView
  Caption = 'ClienteVisView'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
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
