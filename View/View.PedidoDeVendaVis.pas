unit View.PedidoDeVendaVis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Template, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.pngimage,
  Vcl.Imaging.jpeg;

type
  TPedidoDeVendaVisView = class(TTemplateVisView)
    edtID: TLabeledEdit;
    edtCliente: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure pnlPesquisarClick(Sender: TObject);
    procedure pnlIncluirClick(Sender: TObject);
    procedure pnlDeletarClick(Sender: TObject);
    procedure pnlAlterarClick(Sender: TObject);
    procedure pnlLimparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PedidoDeVendaVisView: TPedidoDeVendaVisView;

implementation

uses
  View.PedidoDeVenda, Singleton.Connection, Controller.PedidoDeVenda,
  Util.Enum;

var
  PedidoDeVendaController: TPedidoDeVendaController;

{$R *.dfm}


procedure TPedidoDeVendaVisView.FormCreate(Sender: TObject);
begin
  inherited;
  FDQueryGrid.Connection := TConnectionSingleton.GetInstance.Connection;
  PedidoDeVendaController := TPedidoDeVendaController.Create;
end;

procedure TPedidoDeVendaVisView.pnlAlterarClick(Sender: TObject);
begin
  inherited;
  PedidoDeVendaController.CreateView(stUpdate,True);
end;

procedure TPedidoDeVendaVisView.pnlDeletarClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Você tem certeza que quer excluir esse Pedido?','Exclusão',mb_yesno + mb_iconquestion) = id_yes then
    PedidoDeVendaController.Delete;
end;

procedure TPedidoDeVendaVisView.pnlIncluirClick(Sender: TObject);
begin
  inherited;
  PedidoDeVendaController.CreateView(stInsert,True);
end;

procedure TPedidoDeVendaVisView.pnlLimparClick(Sender: TObject);
begin
  inherited;
  edtID.Text := '';
  edtCliente.Text := '';
end;

procedure TPedidoDeVendaVisView.pnlPesquisarClick(Sender: TObject);
begin
  inherited;
  if Trim(edtID.Text) <> '' then
  begin
    PedidoDeVendaController.Search(edtID.Text);
  end
  else if Trim(edtCliente.Text) <> '' then
  begin
    PedidoDeVendaController.Search(edtCliente.Text);
  end
  else
  begin
    PedidoDeVendaController.Search('');
  end;
end;

end.
