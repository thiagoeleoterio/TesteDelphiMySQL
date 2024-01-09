unit uClienteController;

interface

uses
  uClienteModel,
  uClienteDAO,
  System.Generics.Collections;

type
  TClienteController = class
  private
    FClienteDAO: TClienteDAO;
  public
    constructor Create;
    destructor Destroy; override;
    procedure InserirCliente(Cliente: TCliente);
    function ObterClientePorID(IDCliente: Integer): TCliente;
    function ObterClientesPorNomeParcial(NomeParcial: string): TObjectList<TCliente>;
  end;

implementation

constructor TClienteController.Create;
begin
  FClienteDAO := TClienteDAO.Create;
end;

destructor TClienteController.Destroy;
begin
  FClienteDAO.Free;
  inherited;
end;

procedure TClienteController.InserirCliente(Cliente: TCliente);
begin
  FClienteDAO.InserirCliente(Cliente);
end;

function TClienteController.ObterClientePorID(IDCliente: Integer): TCliente;
begin
  Result := FClienteDAO.ObterClientePorID(IDCliente);
end;

function TClienteController.ObterClientesPorNomeParcial(NomeParcial: string): TObjectList<TCliente>;
begin
  Result := FClienteDAO.ObterClientesPorNomeParcial(NomeParcial);
end;

end.

