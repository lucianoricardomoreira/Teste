unit uLabel;

interface

uses
  uComponente;

type

  TLabel = class(TComponente)
  public
    procedure Redimensionar(vAltura, vLargura : Integer; pAltura, pLargura : Real); override;
    Constructor Create(vX, vY, vAltura, vLargura : Integer);
    Destructor  Destroy; Override;
  end;

implementation

{ TLabel }

constructor TLabel.Create(vX, vY, vAltura, vLargura : Integer);
begin
  Self.X       := vX;
  Self.Y       := vY;
  Self.Altura  := vAltura;
  Self.Largura := vLargura;
end;

destructor TLabel.Destroy;
begin
  inherited;
end;

procedure TLabel.Redimensionar(vAltura, vLargura : Integer; pAltura, pLargura : Real);
begin
  Self.X := Trunc(Self.X + vAltura/2);
  Self.Y := Trunc(Self.Y + vLargura/2);
end;

end.

