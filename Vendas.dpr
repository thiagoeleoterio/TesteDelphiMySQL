program Vendas;

uses
  Vcl.Forms,
  uVendasPrincipal in 'uVendasPrincipal.pas' {frmVendasView},
  uUtil in 'Units\uUtil.pas',
  uClienteModel in 'Model\uClienteModel.pas',
  uClienteController in 'Controller\uClienteController.pas',
  uClienteDAO in 'DAO\uClienteDAO.pas',
  udmConexao in 'DAO\udmConexao.pas' {DMConexao: TDataModule},
  uProdutoView in 'View\uProdutoView.pas' {frmProdutoView},
  uClienteView in 'View\uClienteView.pas' {frmClienteView},
  uProdutoModel in 'Model\uProdutoModel.pas',
  uProdutoDAO in 'DAO\uProdutoDAO.pas',
  uProdutoController in 'Controller\uProdutoController.pas',
  uPedidoModel in 'Model\uPedidoModel.pas',
  uPedidoDAO in 'DAO\uPedidoDAO.pas',
  uPedidoController in 'Controller\uPedidoController.pas',
  uPedidoProdutoModel in 'Model\uPedidoProdutoModel.pas',
  uPedidoProdutoDAO in 'DAO\uPedidoProdutoDAO.pas',
  uPedidoProdutoController in 'Controller\uPedidoProdutoController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmVendasView, frmVendasView);
  Application.CreateForm(TDMConexao, DMConexao);
  Application.CreateForm(TfrmProdutoView, frmProdutoView);
  Application.CreateForm(TfrmClienteView, frmClienteView);
  if not dmConexao.FDConnection.Connected then
    Application.Terminate;
  Application.Run;
end.
