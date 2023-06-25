unit uMaquina;

interface

uses
  uIMaquina, uTroco, Classes, SysUtils;

type

  TMaquina = class(TInterfacedObject, IMaquina)

  public
    function MontarTroco(aTroco: Double): TList;
  end;

implementation

function TMaquina.MontarTroco(aTroco: Double): TList;
var
  iQtde  : Integer;
  Cedula : TCedula;
  sLista : TList;
begin
  sLista := TList.Create;
  for Cedula := Low(CValorCedula) to High(CValorCedula) do
  begin
    if aTroco > CValorCedula[Cedula] then
    begin
      iQtde  := Trunc(aTroco / CValorCedula[Cedula]);
      aTroco := aTroco - (CValorCedula[Cedula] * iQtde);
      sLista.Add(TTroco.Create(Cedula,iQtde));
    end;
  end;
  Result := sLista;
end;

end.

