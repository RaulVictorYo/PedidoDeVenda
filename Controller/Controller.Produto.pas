unit Controller.Produto;

interface

uses
  Util.Enum, DAO.Produto, Model.Produto, View.Produto, Controller.Base,
  Model.Base;

type

TProdutoController = class(TBaseController)
  public
  constructor Create; overload;
  destructor Destroy; overload;
  procedure CreateView(AStatus : TAction; AModal: Boolean); override;
  procedure SetModelByView; override;
  procedure Gravar; override;
  procedure SetViewByModel; override;


  var
  DAO : TProdutoDAO;
  View : TProdutoView;


end;

implementation

uses
  Vcl.Forms, System.SysUtils, View.ProdutoVis;

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
      ProdutoView.EdtId.Text := IntToStr(DAO.GetNewID(Model));
      if AModal then
        ProdutoView.ShowModal
      else
        ProdutoView.Show;
    end;
    stUpdate:
     begin
      Application.CreateForm(TProdutoView, ProdutoView);
      Model := DAO.FindByID(ProdutoViewVis.FDQueryGrid.FieldByName('ID').AsInteger);
      SetViewByModel;
      if AModal then
        ProdutoView.ShowModal
      else
        ProdutoView.Show;
    end;
    stDelete: ;
    stShow: ;
  end;

end;

destructor TProdutoController.Destroy;
begin
  FreeAndNil(DAO);
  FreeAndNil(View);
end;


procedure TProdutoController.Gravar;
begin
  SetModelByView;
  ProdutoViewVis.FDQueryGrid.SQL.Text:= DAO.AtualizaGrid(DAO.Insert(Model));
  ProdutoViewVis.FDQueryGrid.Active := true;

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

procedure TProdutoController.SetViewByModel;
begin
  with TProdutoModel(Model), ProdutoView do
  begin
    EdtId.Text := IntToStr(ID) ;
    EdtDescricao.Text := Descricao;
    EdtCusto.Text := FormatFloat('0.00',Custo);
    EdtValorVenda.Text := FormatFloat('0.00',ValorVenda);
  end;

end;

end.
