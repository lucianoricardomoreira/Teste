unit uBotao;

interface

uses
  uComponente;

type

  TBotao = class(TComponente)

  public
    Constructor Create(vX, vY, vAltura, vLargura : Integer);
    Destructor  Destroy; Override;
    procedure Redimensionar(vAltura, vLargura : Integer; pAltura, pLargura : Real); override;
  end;

implementation

{ TBotao }

constructor TBotao.Create(vX, vY, vAltura, vLargura: Integer);
begin
  Self.X       := vX;
  Self.Y       := vY;
  Self.Altura  := vAltura;
  Self.Largura := vLargura;
end;

destructor TBotao.Destroy;
begin
  inherited;
end;

procedure TBotao.Redimensionar(vAltura, vLargura: integer; pAltura, pLargura: real);
begin
  Self.X       := Trunc(Self.X + vAltura/2);
  Self.Y       := Trunc(Self.Y + vLargura/2);
  Self.Largura := Trunc(Self.Largura * ((pLargura/100) + 1 ));
end;

end.

