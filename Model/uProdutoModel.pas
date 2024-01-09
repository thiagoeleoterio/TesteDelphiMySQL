unit uProdutoModel;

interface

type
  TProduto = class
  private
    FIDProduto: Integer;
    FDescricao: string;
    FPrecoVenda: Double;
  public
    property IDProduto: Integer read FIDProduto write FIDProduto;
    property Descricao: string read FDescricao write FDescricao;
    property PrecoVenda: Double read FPrecoVenda write FPrecoVenda;
  end;

implementation

end.

