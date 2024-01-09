unit uPedidoModel;

interface

uses
  System.Generics.Collections, uPedidoProdutoModel;

type
  TPedido = class
  private
    FIDPedido: Integer;
    FDataEmissao: TDateTime;
    FIDCliente: Integer;
    FValorTotal: Double;
    FPedidoProdutos: TObjectList<TPedidoProduto>;
  public
    property IDPedido: Integer read FIDPedido write FIDPedido;
    property DataEmissao: TDateTime read FDataEmissao write FDataEmissao;
    property IDCliente: Integer read FIDCliente write FIDCliente;
    property ValorTotal: Double read FValorTotal write FValorTotal;
    property PedidoProdutos: TObjectList<TPedidoProduto> read FPedidoProdutos;
    procedure SetIDPedido(const Value: Integer);
    procedure SetDataEmissao(const Value: TDateTime);
    procedure SetIDCliente(const Value: Integer);
    procedure SetValorTotal(const Value: Double);
    procedure SetPedidoProdutos(const Value: TObjectList<TPedidoProduto>);

    constructor Create(const AIDPedido: Integer = 0;
                       const ADataEmissao: TDateTime = 0;
                       const AIDCliente: Integer = 0;
                       const AValorTotal: Double = 0);

    function AddProduto: TPedidoProduto;
  end;

implementation

{ TPedido }

constructor TPedido.Create(const AIDPedido: Integer;
                           const ADataEmissao: TDateTime;
                           const AIDCliente: Integer;
                           const AValorTotal: Double);
begin
  FIDPedido := AIDPedido;
  FDataEmissao := ADataEmissao;
  FIDCliente := AIDCliente;
  FValorTotal := AValorTotal;
  FPedidoProdutos := TObjectList<TPedidoProduto>.Create;
end;

procedure TPedido.SetDataEmissao(const Value: TDateTime);
begin
  FDataEmissao := Value;
end;

procedure TPedido.SetIDCliente(const Value: Integer);
begin
  FIDCliente := Value;
end;

procedure TPedido.SetIDPedido(const Value: Integer);
begin
  FIDPedido := Value;
end;

procedure TPedido.SetPedidoProdutos(const Value: TObjectList<TPedidoProduto>);
begin
  FPedidoProdutos.Free;
  FPedidoProdutos := Value;
end;

procedure TPedido.SetValorTotal(const Value: Double);
begin
  FValorTotal := Value;
end;

function TPedido.AddProduto: TPedidoProduto;
begin
  Result := TPedidoProduto.Create;
  FPedidoProdutos.Add(Result);
end;

end.

