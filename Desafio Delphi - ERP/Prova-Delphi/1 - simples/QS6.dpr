program QS6;

uses
  dialogs,
  uISubstitui in 'uISubstitui.pas',
  uSubstitui in 'uSubstitui.pas';

{$R *.RES}

var
  Substitui: TSubstitui;
begin
  //Somente para Teste
  Showmessage(Substitui.Substituir('O rato roeu a roupa do rei de roma','ro','teste'));
end.

