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
  procedure Search(AText : string);
  procedure Delete; override;



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
      if AModal then
        ProdutoView.ShowModal
      else
        ProdutoView.Show;
    end;
    stUpdate:
     begin
      Application.CreateForm(TProdutoView, ProdutoView);
      Model := DAO.FindByID(ProdutoViewVis.FDQueryGrid.FieldByName('ID').AsInteger);
      ProdutoView.lbl1.Visible := True;
      ProdutoView.lblID.Visible := True;
      SetViewByModel;
      if AModal then
        ProdutoView.ShowModal
      else
        ProdutoView.Show;
    end;
    stShow: ;
  end;

end;

procedure TProdutoController.Delete;
begin
  Model := DAO.FindByID(ProdutoViewVis.FDQueryGrid.FieldByName('ID').AsInteger);
  DAO.Delete(Model);
  ProdutoViewVis.FDQueryGrid.SQL.Text:= DAO.AtualizaGrid(Model.ID);
  ProdutoViewVis.FDQueryGrid.Active := true;
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

procedure TProdutoController.Search(AText: string);
begin
  ProdutoViewVis.FDQueryGrid.SQL.Text:= DAO.Search(AText);
  ProdutoViewVis.FDQueryGrid.Active := true;
end;

procedure TProdutoController.SetModelByView;
begin
  with TProdutoModel(Model), ProdutoView do
  begin
    if lblID.Caption <> ''  then
      ID := StrToInt(lblID.Caption);
    Descricao := EdtDescricao.Text;
    Custo := StrToFloat(EdtCusto.Text);
    ValorVenda := StrToFloat(EdtValorVenda.Text);
  end;
end;

procedure TProdutoController.SetViewByModel;
begin
  with TProdutoModel(Model), ProdutoView do
  begin
    lblID.Caption := IntToStr(ID);
    EdtDescricao.Text := Descricao;
    EdtCusto.Text := FormatFloat('0.00',Custo);
    EdtValorVenda.Text := FormatFloat('0.00',ValorVenda);
  end;

end;

end.
