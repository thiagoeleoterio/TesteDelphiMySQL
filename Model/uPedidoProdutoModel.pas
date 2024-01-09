unit uPedidoProdutoModel;

interface

type
  TPedidoProduto = class
  private
    FIDPedidoProdutos: Integer;
    FIDPedido: Integer;
    FIDProduto: Integer;
    FQuantidade: Double;
    FValorUnitario: Double;
    FValorTotal: Double;
    FDescricao: String;
  public
    property IDPedidoProdutos: Integer read FIDPedidoProdutos write FIDPedidoProdutos;
    property IDPedido: Integer read FIDPedido write FIDPedido;
    property IDProduto: Integer read FIDProduto write FIDProduto;
    property Quantidade: Double read FQuantidade write FQuantidade;
    property ValorUnitario: Double read FValorUnitario write FValorUnitario;
    property ValorTotal: Double read FValorTotal write FValorTotal;
    property Descricao: String read FDescricao write FDescricao;

    constructor Create; overload;
    constructor Create(const AIDPedidoProdutos, AIDPedido, AIDProduto, AQuantidade: Integer;
      const AValorUnitario, AValorTotal: Double; const ADescricao: String); overload;
  end;

implementation

{ TPedidoProduto }

constructor TPedidoProduto.Create;
begin
end;

constructor TPedidoProduto.Create(const AIDPedidoProdutos, AIDPedido, AIDProduto, AQuantidade: Integer;
  const AValorUnitario, AValorTotal: Double; const ADescricao: String);
begin
  FIDPedidoProdutos := AIDPedidoProdutos;
  FIDPedido := AIDPedido;
  FIDProduto := AIDProduto;
  FQuantidade := AQuantidade;
  FValorUnitario := AValorUnitario;
  FValorTotal := AValorTotal;
  FDescricao := ADescricao;
end;

end.

