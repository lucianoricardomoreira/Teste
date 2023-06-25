program QS7;

uses
  Dialogs,
  SysUtils,
  Classes,
  uTroco in 'uTroco.pas',
  uIMaquina in 'uIMaquina.pas',
  uMaquina in 'uMaquina.pas';

{$R *.RES}

var
  MaquinaTroco: TMaquina;
  sList  : TList;
  I      : Integer;
  Texto  : String;
  Cedula : TCedula;
  Qtde   : Integer;
begin

  //Rotina somente para teste
  sList:= TList.create;
  try
    sList:= MaquinaTroco.MontarTroco(125.15);
    For I:= 0 to pred(sList.count) do
    begin
      Cedula:= TTroco(sList.Items[i]).Tipo;
      Qtde  := TTroco(sList.Items[i]).Quantidade;
      if Cedula in [ceNota100, ceNota50, ceNota20, ceNota10, ceNota5, ceNota2] then
        Texto:= Texto + IntToStr(Qtde) + ' nota de ' + FloatToStr(CValorCedula[Cedula]) + #13
      else if Cedula in [ceMoeda100, ceMoeda50, ceMoeda25, ceMoeda10, ceMoeda5, ceMoeda1] then
        Texto:= Texto + IntToStr(Qtde) + ' moeda de ' + FloatToStr(CValorCedula[Cedula]) + #13;
    end;
    Showmessage(Texto);
  finally
    sList.Free;
  end;

end.

