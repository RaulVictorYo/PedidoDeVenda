unit View.ProdutoVis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Dtm.Main, Controller.ProdutoVis;

type
  TProdutoViewVis = class(TForm)
    Panel1: TPanel;
    btnPesquisar: TButton;
    btnAlterar: TButton;
    btnIncluir: TButton;
    btnExcluir: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ProdutoViewVis: TProdutoViewVis;
  ProdutoVisController : TControllerVisProduto;

implementation

uses
  Util.Enum, System.TypInfo;

{$R *.dfm}

procedure TProdutoViewVis.btnIncluirClick(Sender: TObject);
begin
  ProdutoVisController.ShowView(stInsert,True);
end;

procedure TProdutoViewVis.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(ProdutoVisController);
end;

procedure TProdutoViewVis.FormCreate(Sender: TObject);
begin
  ProdutoVisController := TControllerVisProduto.Create;
end;


end.
