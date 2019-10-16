unit Controller.Produto;

interface

uses
  Util.Enum, DAO.Produto, Model.Produto, View.Produto;

type

TProdutoController = class
  public
  constructor Create;
  destructor Destroy;
  procedure CreateView(AStatus : TAction; AModal: Boolean);
  procedure SetModelByView;
  procedure Gravar;

  var
  DAO : TProdutoDAO;
  Model : TProdutoModel;
  View : TProdutoView;

end;

implementation

uses
  Vcl.Forms, System.SysUtils;

{ TProdutoController }

constructor TProdutoController.Create;
begin
  DAO := TProdutoDAO.Create;
  Model := TProdutoModel.Create;
  //View := TProdutoView.Create(Nil);
end;

procedure TProdutoController.CreateView(AStatus: TAction; AModal: Boolean);
begin

  case AStatus of
    stInsert:
    begin
      Application.CreateForm(TProdutoView, ProdutoView);
      ProdutoView.EdtId.Text := IntToStr(DAO.GetNewID);
      if AModal then
        ProdutoView.ShowModal
      else
        ProdutoView.Show;
    end;
    stUpdate: ;
    stDelete: ;
    stShow: ;
  end;

end;

destructor TProdutoController.Destroy;
begin
  FreeAndNil(DAO);
  FreeAndNil(Model);
  FreeAndNil(View);
end;


procedure TProdutoController.Gravar;
begin
  SetModelByView;
  DAO.Save(Model);
end;

procedure TProdutoController.SetModelByView;
begin
  with TProdutoModel(Model), ProdutoView do
  begin
    ID := StrToInt(EdtId.Text);
    Descricao := EdtDescricao.Text;
    Custo := StrToFloat(EdtCusto.Text);
    ValorVenda := StrToFloat(EdtValorVenda.Text);
  end;
end;

end.
