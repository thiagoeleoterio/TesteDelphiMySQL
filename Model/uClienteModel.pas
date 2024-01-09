unit uClienteModel;

interface

type
  TCliente = class
  private
    FIDCliente: Integer;
    FNome: string;
    FCidade: string;
    FUF: string;
  public
    property IDCliente: Integer read FIDCliente write FIDCliente;
    property Nome: string read FNome write FNome;
    property Cidade: string read FCidade write FCidade;
    property UF: string read FUF write FUF;
  end;

implementation

end.

