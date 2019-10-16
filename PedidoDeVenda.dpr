program PedidoDeVenda;

uses
  Vcl.Forms,
  View.Menu in 'View\View.Menu.pas' {Form1},
  View.ProdutoVis in 'View\View.ProdutoVis.pas' {ProdutoViewVis},
  Dtm.Main in 'DataModule\Dtm.Main.pas' {DtmMain: TDataModule},
  View.Produto in 'View\View.Produto.pas' {ProdutoView},
  Controller.ProdutoVis in 'Controller\Controller.ProdutoVis.pas',
  Util.Enum in 'Util\Util.Enum.pas',
  Controller.Menu in 'Controller\Controller.Menu.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMenuView, MenuView);
  Application.CreateForm(TProdutoViewVis, ProdutoViewVis);
  Application.CreateForm(TDtmMain, DtmMain);
  Application.CreateForm(TProdutoView, ProdutoView);
  Application.Run;
end.
