unit View.ClienteVis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Template, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TClienteVisView = class(TTemplateVisView)
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClienteVisView: TClienteVisView;


implementation

uses
  Util.Enum, Singleton.Connection, Controller.Cliente;

var
  ClienteController: TClienteController;

{$R *.dfm}

procedure TClienteVisView.btnAlterarClick(Sender: TObject);
begin
  inherited;
  ClienteController.CreateView(stUpdate,True);
end;

procedure TClienteVisView.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Você tem certeza que quer excluir esse Cliente?','Exclusão',mb_yesno + mb_iconquestion) = id_yes then
    ClienteController.Delete;
end;

procedure TClienteVisView.btnIncluirClick(Sender: TObject);
begin
  inherited;
  ClienteController.CreateView(stInsert,True);
end;

procedure TClienteVisView.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  if Trim(edtID.Text) <> '' then
  begin
    ClienteController.Search(edtID.Text);
  end
  else if Trim(edtDescricao.Text) <> '' then
  begin
    ClienteController.Search(edtDescricao.Text);
  end
  else
  begin
    ClienteController.Search('');
  end;
end;


procedure TClienteVisView.FormCreate(Sender: TObject);
begin
  inherited;
  ClienteController := TClienteController.Create;
  FDQueryGrid.Connection := TConnectionSingleton.GetInstance.Connection;
end;


procedure TClienteVisView.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(ClienteController);
end;

end.
