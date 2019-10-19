unit Controller.PedidoDeVenda;

interface

uses
  Util.Enum, Controller.Base,
  Model.Base, DAO.PedidoDeVenda, View.PedidoDeVenda;

type

TPedidoDeVendaController = class(TBaseController)
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
  DAO : TPedidoDeVendaDAO;
  View : TPedidoDeVendaView;


end;

implementation

uses
  Vcl.Forms, System.SysUtils, View.PedidoDeVendaVis, Model.PedidoDeVenda;

{ TPedidoDeVendaController }

constructor TPedidoDeVendaController.Create;
begin
  DAO := TPedidoDeVendaDAO.Create;
  Model := TPedidoDeVendaModel.Create;
  //View := TPedidoDeVendaView.Create(Nil);
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

    end;

  with ModelItens, PedidoDeVendaView do
  begin
    for I := 1 to stgrdItens.RowCount - 1 do
    begin
      if lblID.Caption <> ''  then
        IDPedido := StrToInt(lblID.Caption);

      IDProduto := TPedidoDeVendaItensModel(stgrdItens.Objects[GroupColum.IndexOf('Produto'),I]).IDProduto;
      NomeProduto := TPedidoDeVendaItensModel(stgrdItens.Objects[GroupColum.IndexOf('Produto'),I]).NomeProduto;
      CustoUnitario := TPedidoDeVendaItensModel(stgrdItens.Objects[GroupColum.IndexOf('CustoUnitario'),I]).CustoUnitario;
      ValorUnitario := TPedidoDeVendaItensModel(stgrdItens.Objects[GroupColum.IndexOf('ValorUnitario'),I]).ValorUnitario;
      ValorTotal := TPedidoDeVendaItensModel(stgrdItens.Objects[GroupColum.IndexOf('ValorTotal'),I]).ValorTotal;
      Quantidade := TPedidoDeVendaItensModel(stgrdItens.Objects[GroupColum.IndexOf('Quantidade'),I]).Quantidade;

    end;
  end;


end;


procedure TPedidoDeVendaController.SetViewByModel;

begin



end;

end.
