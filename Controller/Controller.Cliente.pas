unit Controller.Cliente;

interface

uses
  Util.Enum, Controller.Base,
  Model.Base, DAO.Cliente, View.Cliente;

type

TClienteController = class(TBaseController)
  public
  constructor Create; overload;
  destructor Destroy; overload;
  procedure CreateView(AStatus : TAction; AModal: Boolean); override;
  procedure SetModelByView; override;
  procedure Gravar; override;
  procedure SetViewByModel; override;
  procedure Search(AText : string);
  procedure Delete; override;



  var
  DAO : TClienteDAO;
  View : TClienteView;


end;

implementation

uses
  Vcl.Forms, System.SysUtils, View.ProdutoVis, View.ClienteVis, Model.Cliente;

{ TClienteController }

constructor TClienteController.Create;
begin
  DAO := TClienteDAO.Create;
  Model := TClienteModel.Create;
  //View := TClienteView.Create(Nil);
end;

procedure TClienteController.CreateView(AStatus: TAction; AModal: Boolean);
begin

  case AStatus of
    stInsert:
    begin
      Application.CreateForm(TClienteView, ClienteView);
      if AModal then
        ClienteView.ShowModal
      else
        ClienteView.Show;
    end;
    stUpdate:
     begin
      Application.CreateForm(TClienteView, ClienteView);
      Model := DAO.FindByID(ClienteVisView.FDQueryGrid.FieldByName('ID').AsInteger);
      SetViewByModel;
      if AModal then
        ClienteView.ShowModal
      else
        ClienteView.Show;
    end;
    stShow: ;
  end;

end;

procedure TClienteController.Delete;
begin
  Model := DAO.FindByID(ClienteVisView.FDQueryGrid.FieldByName('ID').AsInteger);
  DAO.Delete(Model);
  ClienteVisView.FDQueryGrid.SQL.Text:= DAO.AtualizaGrid(Model.ID);
  ClienteVisView.FDQueryGrid.Active := true;
end;

destructor TClienteController.Destroy;
begin
  FreeAndNil(DAO);
  FreeAndNil(View);
end;


procedure TClienteController.Gravar;
begin
  SetModelByView;
  ClienteVisView.FDQueryGrid.SQL.Text:= DAO.AtualizaGrid(DAO.Insert(Model));
  ClienteVisView.FDQueryGrid.Active := true;

end;

procedure TClienteController.Search(AText: string);
begin
  ClienteVisView.FDQueryGrid.SQL.Text:= DAO.Search(AText);
  ClienteVisView.FDQueryGrid.Active := true;
end;

procedure TClienteController.SetModelByView;
begin
  with TClienteModel(Model), ClienteView do
  begin
    RazaoSocial := edtRazaoSocial.Text;
    NomeFantasia := edtNomeFantasia.Text;
    CNPJ := edtCNPJ.Text;
    Logradouro := edtLogradouro.Text;
    Numero := edtNumero.Text;
    Bairro := edtBairro.Text;
    Cidade := edtCidade.Text;
    CEP := edtCEP.Text;
    UF := edtUF.Text;
    Email := edtEmail.Text;
    Telefone := edtTelefone.Text;
  end;
end;

procedure TClienteController.SetViewByModel;
begin
  with TClienteModel(Model), ClienteView do
  begin
    edtRazaoSocial.Text := RazaoSocial;
    edtNomeFantasia.Text := NomeFantasia;
    edtCNPJ.Text := CNPJ;
    edtLogradouro.Text := Logradouro;
    edtNumero.Text := Numero;
    edtBairro.Text := Bairro;
    edtCidade.Text := Cidade;
    edtCEP.Text := CEP;
    edtUF.Text := UF;
    edtEmail.Text := Email;
    edtTelefone.Text := Telefone;
  end;

end;

end.
