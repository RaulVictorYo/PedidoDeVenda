unit View.ProdutoVis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Controller.ProdutoVis,
  Controller.Produto, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Model.Produto;

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
    edtID: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    FViewPesquisa: Boolean;
  private
    FProduto: TProdutoModel;
    procedure SetViewPesquisa(const Value: Boolean);
    procedure SetProduto(const Value: TProdutoModel);
  published
    { Private declarations }
  public
    { Public declarations }
     property ViewPesquisa: Boolean read FViewPesquisa write SetViewPesquisa;
     property Produto: TProdutoModel read FProduto write SetProduto;
     function DevolverPesquisa(Model: TProdutoModel): TProdutoModel;
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

procedure TProdutoViewVis.btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Você tem certeza que quer excluir esse Produto?','Exclusão',mb_yesno + mb_iconquestion) = id_yes then
    ProdutoController.Delete;

end;

procedure TProdutoViewVis.btnIncluirClick(Sender: TObject);
begin
  ProdutoController.CreateView(stInsert,True);
end;

procedure TProdutoViewVis.btnPesquisarClick(Sender: TObject);
begin
  if Trim(edtID.Text) <> '' then
  begin
    ProdutoController.Search(edtID.Text);
  end
  else if Trim(edtDescricao.Text) <> '' then
  begin
    ProdutoController.Search(edtDescricao.Text);
  end
  else
  begin
    ProdutoController.Search('');
  end;


end;

procedure TProdutoViewVis.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ViewPesquisa then
  begin
    case Key of

      VK_RETURN:
      begin
         Produto := DevolverPesquisa(Produto);
         Close;
      end;



    end;
  end;
end;

function TProdutoViewVis.DevolverPesquisa(Model: TProdutoModel): TProdutoModel;
begin
  Model := TProdutoModel.Create;
  Model.ID := FDQueryGrid.FieldByName('ID').AsInteger;
  Model.Descricao := FDQueryGrid.FieldByName('Descricao').AsString;
  Model.Custo := FDQueryGrid.FieldByName('Custo').AsFloat;
  Model.ValorVenda := FDQueryGrid.FieldByName('ValorVenda').AsFloat;
  Result := Model;
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


procedure TProdutoViewVis.FormShow(Sender: TObject);
begin
  DBGrid1.SetFocus;
end;

procedure TProdutoViewVis.SetProduto(const Value: TProdutoModel);
begin
  FProduto := Value;
end;

procedure TProdutoViewVis.SetViewPesquisa(const Value: Boolean);
begin
  FViewPesquisa := Value;
end;

end.
