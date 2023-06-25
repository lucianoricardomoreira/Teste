unit uFrame;

interface

uses
  uComponente;

type

  TFrame = class(TComponente)
    public
    procedure Redimensionar(vAltura, vLargura : Integer; pAltura, pLargura : Real); override;
    procedure ConfiguraeRedimensiona(vAltura, vLargura : Integer; pAltura, pLargura : Integer);
    Constructor Create(vX, vY, vAltura, vLargura : Integer);
    Destructor  Destroy; Override;
  end;

implementation

{ TFrame }

constructor TFrame.Create(vX, vY, vAltura, vLargura : Integer);
begin
  Self.X := vX;
  Self.Y := vY;
  Self.Altura  := vAltura;
  Self.Largura := vLargura;
end;

destructor TFrame.Destroy;
begin
  inherited;
end;

procedure TFrame.ConfiguraeRedimensiona(vAltura, vLargura: Integer; pAltura, pLargura: Integer);
var
  I: Integer;
  vAlt, vLar : Integer;
  pAlt, pLar : Real;
begin
  vAlt := vAltura - Self.Altura;
  vLar := vLArgura - Self.Largura;
  pAlt := ((vAltura * 100)/ Self.Altura) - 100;
  pLar := ((vLargura * 100)/ Self.Largura) - 100;
  Self.Altura  := vAltura;
  Self.Largura := vLargura;

  for I := 0 to (Length(Self.Componentes)-1) do
     Self.Componentes[i].Redimensionar(vLar, vAlt, pAlt, pLar);
end;

procedure TFrame.Redimensionar(vAltura, vLargura: Integer; pAltura, pLargura: Real);
begin
  Self.Largura:= Trunc(Self.Largura * ((pLargura/100) + 1));
  Self.Altura := Trunc(Self.Altura * ((pAltura/100) + 1 ));
  Self.X      := Trunc(Self.X + vAltura/2);
  Self.Y      := Trunc(Self.Y + vLargura/2);
end;

end.

