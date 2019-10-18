unit Template;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TTemplate = class(TForm)
    DataSource1: TDataSource;
    FDQueryGrid: TFDQuery;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnPesquisar: TButton;
    btnAlterar: TButton;
    btnIncluir: TButton;
    btnExcluir: TButton;
    edtID: TLabeledEdit;
    edtDescricao: TLabeledEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TemplateVisView: TTemplate;

implementation

{$R *.dfm}

end.
