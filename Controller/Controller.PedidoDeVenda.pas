unit Controller.PedidoDeVenda;

interface

uses
  Util.Enum, Controller.Base,
  Model.Base, DAO.PedidoDeVenda, View.PedidoDeVenda, Model.Cliente,
  Model.Produto;

type

TPedidoDeVendaController = class(TBaseController)
  private
    FCliente: TClienteModel;
    FProduto: TProdutoModel;
    procedure SetCliente(const Value: TClienteModel);
    procedure SetProduto(const Value: TProdutoModel);
  public
  constructor Create; overload;
  destructor Destroy; overload;
  procedure CreateView(AStatus : TAction; AModal: Boolean); override;
  procedure SetModelByView; override;
  procedure Gravar; override;
  procedure SetViewByModel; override;
  procedure Search(AText : string);
  procedure SearchCliente(AText : string);
  procedure SearchProduto(AText : string; ARow: integer);
  procedure Delete; override;
  property Cliente: TClienteModel read FCliente write SetCliente;
  property Produto: TProdutoModel read FProduto write SetProduto;



  var
  DAO : TPedidoDeVendaDAO;
  View : TPedidoDeVendaView;


end;

implementation

uses
  Vcl.Forms, System.SysUtils, View.PedidoDeVendaVis, Model.PedidoDeVenda,
  View.ClienteVis, FireDAC.Comp.Client, DAO.Cliente, Singleton.Connection,
  DAO.Produto, View.ProdutoVis, System.Generics.Collections;

{ TPedidoDeVendaController }

constructor TPedidoDeVendaController.Create;
begin
  DAO := TPedidoDeVendaDAO.Create;
  Model := TPedidoDeVendaModel.Create;
  Cliente := TClienteModel.Create;
  //View := TPedidoDeVendaView.Create(nil);
end;

procedure TPedidoDeVendaController.CreateView(AStatus: TAction; AModal: Boolean);
begin

  case AStatus of
    stInsert:
    begin
      Application.CreateForm(TPedidoDeVendaView, PedidoDeVendaView);
      if AModal then
        PedidoDeVendaView.ShowModal
      else
        PedidoDeVendaView.Show;
    end;
    stUpdate:
     begin
      Application.CreateForm(TPedidoDeVendaView, PedidoDeVendaView);
      Model := DAO.FindByID(PedidoDeVendaVisView.FDQueryGrid.FieldByName('ID').AsInteger);
      PedidoDeVendaView.lbl1.Visible := True;
      PedidoDeVendaView.lblID.Visible := True;
      SetViewByModel;
      if AModal then
        PedidoDeVendaView.ShowModal
      else
        PedidoDeVendaView.Show;
    end;
    stShow: ;
  end;

end;

procedure TPedidoDeVendaController.Delete;
begin
  Model := DAO.FindByID(PedidoDeVendaVisView.FDQueryGrid.FieldByName('ID').AsInteger);
  DAO.Delete(Model);
  PedidoDeVendaVisView.FDQueryGrid.SQL.Text:= DAO.AtualizaGrid(Model.ID);
  PedidoDeVendaVisView.FDQueryGrid.Active := true;
end;

destructor TPedidoDeVendaController.Destroy;
begin
  FreeAndNil(DAO);
  FreeAndNil(View);
end;


procedure TPedidoDeVendaController.Gravar;
begin
  SetModelByView;
  PedidoDeVendaVisView.FDQueryGrid.SQL.Text:= DAO.AtualizaGrid(DAO.Insert(Model));
  PedidoDeVendaVisView.FDQueryGrid.Active := true;

end;

procedure TPedidoDeVendaController.Search(AText: string);
begin
  PedidoDeVendaVisView.FDQueryGrid.SQL.Text:= DAO.Search(AText);
  PedidoDeVendaVisView.FDQueryGrid.Active := true;
end;

procedure TPedidoDeVendaController.SearchCliente(AText: string);
var
  FDQuery: TFDQuery;
  DAOCliente : TClienteDAO;
begin
  DAOCliente := TClienteDAO.Create;
  FDQuery := TFDQuery.Create(nil);
  FDQuery.Connection := TConnectionSingleton.GetInstance.Connection;
  FDQuery.Close;
  FDQuery.SQL.Text := DAOCliente.Search(AText);
  FDQuery.Open;

  if FDQuery.RecordCount = 1 then
  begin
    PedidoDeVendaView.edtCliente.Tag := FDQuery.FieldByName('ID').AsInteger;
    PedidoDeVendaView.edtCliente.Text := FDQuery.FieldByName('RazaoSocial').AsString;
  end
  else
  begin
    Application.CreateForm(TClienteVisView, ClienteVisView);
    ClienteVisView.ViewPesquisa := True;
    ClienteVisView.FDQueryGrid.SQL.Text := FDQuery.SQL.Text;
    ClienteVisView.FDQueryGrid.Active := True;
    ClienteVisView.ShowModal;
    Cliente := ClienteVisView.Cliente;
    PedidoDeVendaView.edtCliente.Tag := Cliente.ID;
    PedidoDeVendaView.edtCliente.Text := Cliente.RazaoSocial;
  end;



end;

procedure TPedidoDeVendaController.SearchProduto(AText: string; ARow: integer);
var
  FDQuery: TFDQuery;
  DAOProduto : TProdutoDAO;
begin
  DAOProduto := TProdutoDAO.Create;
  FDQuery := TFDQuery.Create(nil);
  FDQuery.Connection := TConnectionSingleton.GetInstance.Connection;
  FDQuery.Close;
  FDQuery.SQL.Text := DAOProduto.Search(AText);
  FDQuery.Open;

  if FDQuery.RecordCount = 1 then
  begin

    with PedidoDeVendaView do
    begin
      stgrdItens.Cells[GroupColum.IndexOf('ID'), ARow] := IntToStr(FDQuery.FieldByName('ID').AsInteger);
      stgrdItens.Cells[GroupColum.IndexOf('Produto'), ARow] := FDQuery.FieldByName('DESCRICAO').AsString;
      stgrdItens.Cells[GroupColum.IndexOf('CustoUnitario'), ARow] := FDQuery.FieldByName('Custo').AsString;
      stgrdItens.Cells[GroupColum.IndexOf('ValorUnitario'), ARow] := FDQuery.FieldByName('VALORVENDA').AsString;
      stgrdItens.Cells[GroupColum.IndexOf('Quantidade'), ARow] := '1.00';
      stgrdItens.Cells[GroupColum.IndexOf('ValorTotal'), ARow] := FormatFloat('0.00', Produto.ValorVenda);

    end;
  end
  else
  begin
    Application.CreateForm(TProdutoViewVis, ProdutoViewVis);
    ProdutoViewVis.ViewPesquisa := True;
    ProdutoViewVis.FDQueryGrid.SQL.Text := FDQuery.SQL.Text;
    ProdutoViewVis.FDQueryGrid.Active := True;
    ProdutoViewVis.ShowModal;
    Produto := ProdutoViewVis.Produto;
    with PedidoDeVendaView do
    begin
      stgrdItens.Cells[GroupColum.IndexOf('ID'), ARow] := IntToStr(Produto.ID);
      stgrdItens.Cells[GroupColum.IndexOf('Produto'), ARow] := Produto.Descricao;
      stgrdItens.Cells[GroupColum.IndexOf('CustoUnitario'), ARow] := FormatFloat('0.00', Produto.Custo);
      stgrdItens.Cells[GroupColum.IndexOf('ValorUnitario'), ARow] := FormatFloat('0.00', Produto.ValorVenda);
      stgrdItens.Cells[GroupColum.IndexOf('Quantidade'), ARow] := '1.00';
      stgrdItens.Cells[GroupColum.IndexOf('ValorTotal'), ARow] := FormatFloat('0.00', Produto.ValorVenda);

    end;
  end;
end;

procedure TPedidoDeVendaController.SetCliente(const Value: TClienteModel);
begin
  FCliente := Value;
end;

procedure TPedidoDeVendaController.SetModelByView;
var
  I: integer;
  ModelItens: TPedidoDeVendaItensModel;

begin

  ModelItens := TPedidoDeVendaItensModel.Create;

  with TPedidoDeVendaModel(Model), PedidoDeVendaView do
  begin
    if lblID.Caption <> ''  then
      ID := StrToInt(lblID.Caption);

      IDCliente := edtCliente.Tag;
      NomeCliente := edtCliente.Text;

  end;

  with ModelItens, PedidoDeVendaView do
  begin
    for I := 1 to stgrdItens.RowCount - 1 do
    begin
      if lblID.Caption <> ''  then
        IDPedido := StrToInt(lblID.Caption);

      IDProduto := StrToInt(stgrdItens.Cells[GroupColum.IndexOf('ID'),I]);
      NomeProduto := stgrdItens.Cells[GroupColum.IndexOf('Produto'),I];
      CustoUnitario := StrToFloat(stgrdItens.Cells[GroupColum.IndexOf('CustoUnitario'),I]);
      ValorUnitario := StrToFloat(stgrdItens.Cells[GroupColum.IndexOf('ValorUnitario'),I]);
      ValorTotal := StrToFloat(stgrdItens.Cells[GroupColum.IndexOf('ValorTotal'),I]);
      Quantidade := StrToFloat(stgrdItens.Cells[GroupColum.IndexOf('Quantidade'),I]);

      TPedidoDeVendaModel(Model).Itens.Add(ModelItens);

    end;
  end;


end;


procedure TPedidoDeVendaController.SetProduto(const Value: TProdutoModel);
begin
  FProduto := Value;
end;

procedure TPedidoDeVendaController.SetViewByModel;
var
  I: integer;
  ModelItens: TPedidoDeVendaItensModel;

begin

  ModelItens := TPedidoDeVendaItensModel.Create;

  with TPedidoDeVendaModel(Model), PedidoDeVendaView do
  begin
      lblID.Caption := IntToStr(ID);

      edtCliente.Tag := IDCliente;
      NomeCliente := edtCliente.Text;

    end;

  with ModelItens, PedidoDeVendaView do
  begin
    for I := 1 to stgrdItens.RowCount - 1 do
    begin
      if lblID.Caption <> ''  then
        IDPedido := StrToInt(lblID.Caption);

      stgrdItens.Cells[GroupColum.IndexOf('ID'),I] := IntToStr(IDProduto);
      stgrdItens.Cells[GroupColum.IndexOf('Produto'),I] := NomeProduto;
      stgrdItens.Cells[GroupColum.IndexOf('CustoUnitario'),I] := FormatFloat('0.00', CustoUnitario);
      stgrdItens.Cells[GroupColum.IndexOf('ValorUnitario'),I] := FormatFloat('0.00', ValorUnitario);
      stgrdItens.Cells[GroupColum.IndexOf('ValorTotal'),I] := FormatFloat('0.00', ValorTotal);
      stgrdItens.Cells[GroupColum.IndexOf('Quantidade'),I] := FormatFloat('0.00', Quantidade);

    end;
  end;

end;

end.
