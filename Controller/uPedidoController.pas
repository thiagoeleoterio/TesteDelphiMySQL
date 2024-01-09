unit uPedidoController;

interface

uses
  uPedidoModel, uPedidoDAO;

type
  TPedidoController = class
  private
    FPedidoDAO: TPedidoDAO;
  public
    constructor Create;
    destructor Destroy; override;
    procedure InserirPedido(Pedido: TPedido);
    function LocalizarPedidoPorID(IDPedido: Integer): TPedido;
    function DeletarPedidoEProdutos(IDPedido: Integer): Boolean;
  end;

implementation

{ TPedidoController }

constructor TPedidoController.Create;
begin
  FPedidoDAO := TPedidoDAO.Create;
end;

function TPedidoController.DeletarPedidoEProdutos(IDPedido: Integer): Boolean;
begin
  Result := FPedidoDAO.DeletarPedidoEProdutos(IDPedido);
end;

destructor TPedidoController.Destroy;
begin
  FPedidoDAO.Free;
  inherited;
end;

procedure TPedidoController.InserirPedido(Pedido: TPedido);
begin
  FPedidoDAO.InserirPedido(Pedido);
end;

function TPedidoController.LocalizarPedidoPorID(IDPedido: Integer): TPedido;
begin
  Result := FPedidoDAO.LocalizarPedidoPorID(IDPedido);
end;

end.

