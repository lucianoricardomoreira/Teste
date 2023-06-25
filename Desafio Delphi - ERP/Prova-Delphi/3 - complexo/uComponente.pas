unit uComponente;

interface

type

  TComponente = class;

  TComponenteArray = array of TComponente;

  TComponente = class
  private
    FX: Integer;
    FY: Integer;
    FAltura: Integer;
    FLargura: Integer;
    FComponentes: TComponenteArray;
    procedure SetX(const Value: Integer);
    procedure SetY(const Value: Integer);
    procedure SetAltura(const Value: Integer);
    procedure SetLargura(const Value: Integer);
  public
    procedure AdicionaComponente(aComponente: TComponente); virtual;
    procedure RemoveComponente(aComponente: TComponente); virtual;
    procedure Redimensionar(vAltura, vLargura : Integer; pAltura, pLargura : Real); virtual; Abstract;
    property X : Integer read FX write SetX;
    property Y : Integer read FY write SetY;
    property Altura : Integer read FAltura write SetAltura;
    property Largura : Integer read FLargura write SetLargura;
    property Componentes: TComponenteArray read FComponentes write FComponentes;
  end;

implementation

procedure TComponente.AdicionaComponente(aComponente: TComponente);
begin
  SetLength(FComponentes, Length(FComponentes) + 1);
  FComponentes[length(FComponentes) - 1]:= aComponente;
end;

procedure TComponente.RemoveComponente(aComponente: TComponente);
var
  I      : Integer;
  bAchou : Boolean;
begin
  bAchou:= False;
  I     := 0;
  if Length(FComponentes) <> 0 then
  begin
    Repeat
      if bAchou = true then
      begin
        FComponentes[i] := FComponentes[i + 1];
      end
      else
      begin
        if FComponentes[i] = aComponente then
        begin
          bAchou := true;
          FComponentes[i] := FComponentes[i + 1];
        end;
      end;
      i := i + 1;
    Until length(FComponentes) = I;
    FComponentes[i] := nil;
    SetLength(FComponentes, Length(FComponentes) - 1);
  end;
end;

procedure TComponente.SetAltura(const Value: Integer);
begin
  FAltura := Value;
end;

procedure TComponente.SetLargura(const Value: Integer);
begin
  FLargura := Value;
end;

procedure TComponente.SetX(const Value: Integer);
begin
  FX := Value;
end;

procedure TComponente.SetY(const Value: Integer);
begin
  FY := Value;
end;

end.

