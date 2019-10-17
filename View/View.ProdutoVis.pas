unit View.ProdutoVis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Controller.ProdutoVis,
  Controller.Produto, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TProdutoViewVis = class(TForm)
    Panel1: TPanel;
    btnPesquisar: TButton;
    btnAlterar: TButton;
    btnIncluir: TButton;
    btnExcluir: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    FDQueryGrid: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ProdutoViewVis: TProdutoViewVis;
  ProdutoController : TProdutoController;

implementation

uses
  Util.Enum, System.TypInfo, Singleton.Connection;

{$R *.dfm}

procedure TProdutoViewVis.btnAlterarClick(Sender: TObject);
begin
  ProdutoController.CreateView(stUpdate,True);
end;

procedure TProdutoViewVis.btnIncluirClick(Sender: TObject);
begin
  ProdutoController.CreateView(stInsert,True);
end;

procedure TProdutoViewVis.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(ProdutoController);
end;

procedure TProdutoViewVis.FormCreate(Sender: TObject);
begin
  ProdutoController := TProdutoController.Create;
  FDQueryGrid.Connection := TConnectionSingleton.GetInstance.Connection;
end;


end.
