inherited ClienteVisView: TClienteVisView
  Caption = 'Clientes'
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
      ExplicitLeft = 157
      ExplicitTop = -4
    end
    inherited edtDescricao: TLabeledEdit
      EditLabel.Width = 31
      EditLabel.Caption = 'Nome:'
      EditLabel.ExplicitLeft = 335
      EditLabel.ExplicitTop = 44
      EditLabel.ExplicitWidth = 31
    end
  end
end
