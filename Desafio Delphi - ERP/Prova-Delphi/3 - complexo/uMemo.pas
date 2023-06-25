unit uMemo;

interface

uses
  uComponente;

type

  TMemo = class(TComponente) 
  public
   Constructor Create(vX, vY, vAltura, vLargura: Integer);
   Destructor  Destroy; Override;
   procedure Redimensionar(vAltura, vLargura : Integer; pAltura, pLargura : Real); override;
  end;

implementation

{ TMemo }
constructor TMemo.Create(vX, vY, vAltura, vLargura: Integer);
begin
  Self.X      := vX;
  Self.Y      := vY;
  Self.Altura := vAltura;
  Self.Largura:= vLargura;
end;

destructor TMemo.Destroy;
begin
  inherited;
end;

procedure TMemo.Redimensionar(vAltura, vLargura: Integer; pAltura, pLargura: Real);
begin
  Self.Largura:= Trunc(Self.Largura * ((pLargura/100)+1));
  Self.Altura := Trunc(Self.Altura * ((pAltura/100) + 1));
  Self.X      := Trunc(Self.X + vAltura/2);
  Self.Y      := Trunc(Self.Y + vLargura/2);
end;

end.

