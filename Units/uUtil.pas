unit uUtil;

interface

function RetornarSomenteNumeros(str : string) : string;
function FormatarValor(str : string) : string;
function VerificarExisteCaractere(const Str: string; Caractere: Char): Boolean;
function InputBoxInt(const ACaption, APrompt: string; var Value: Integer): Boolean;

implementation

uses
  System.SysUtils, Vcl.Dialogs;

function RetornarSomenteNumeros(str : string) : string;
var
    x : integer;
begin
  Result := '';
  for x := 0 to Length(str) - 1 do
    if CharInSet(str.Chars[x], ['0'..'9']) then
      Result := Result + str.Chars[x];
end;

function FormatarValor(str : string) : string;
begin
  if Str = '' then
    Str := '0';

  try
    Result := FormatFloat('#,##0.00', strtofloat(str));
  except
    Result := FormatFloat('#,##0.00', 0);
  end;
end;

function VerificarExisteCaractere(const Str: string; Caractere: Char): Boolean;
var
  I: Integer;
begin
  Result := False;

  for I := 1 to Length(Str) do
  begin
    if Str[I] = Caractere then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

function InputBoxInt(const ACaption, APrompt: string; var Value: Integer): Boolean;
var
  InputValue: string;
begin
  InputValue := IntToStr(Value);
  Result := InputQuery(ACaption, APrompt, InputValue);
  if Result then
    Result := TryStrToInt(InputValue, Value);
end;



end.
