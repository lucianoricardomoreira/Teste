unit uSubstitui;

interface

uses
  uISubstitui;

type

  TSubstitui = class(TInterfacedObject, ISubstitui)
  public
    function Substituir(aStr, aVelho, aNovo: String): String;
  end;

implementation

function TSubstitui.Substituir(aStr, aVelho, aNovo: String): String;
var
  Len_aStr,
  Len_aVelho,
  I,J     : Integer;
  Qtd,Qtd2: Integer;
  Posicao : Integer;
  sTexto  : String;
  aTexto  : String;
  bAchou  : Boolean;
begin
  Result:= '';
  //Executa somente se todos parametros estiverem preenchidos
  if (aStr = '') or (aVelho = '') or (aNovo = '') then
    Exit;

  Len_aStr  := Length(aStr);   //Tamanho da string
  Len_aVelho:= Length(aVelho); //Tamanho da string

  //Localizar e contar os caracteres que serao trocados
  Qtd:= 0;
  for i:= 1 to Len_aStr do
  begin
    aTexto:= aStr[i];
    for j:= 1 to Len_aVelho - 1  do
    begin
      aTexto:= aTexto + aStr[i+j];
    end;
    if aTexto = aVelho then
    begin
      bAchou:= True;
      Qtd:= Qtd + 1;
    end;
  end;

  //Executa a busca e troca do caracter conforme citado no parametro
  bAchou := False;
  Posicao:= 0;
  Qtd2 := 0;
  for i:= 1 to Len_aStr do
  begin
    if bAchou then
    begin
      if aStr[i] = #0 then //Se Final da string, sai do For
        Break;
      if Posicao <= Qtd then
      begin
        if i < Qtd2 then //Se posicao ja foi trocada, avanca para proxima posicao
        begin
          Continue;
        end;
      end;
    end;

    aTexto:= '';
    Qtd2  := i;
    for j := 1 to Len_aVelho do
    begin
      if aStr[Qtd2] = #0 then
        Continue;

      aTexto:= aTexto + aStr[Qtd2];
      Qtd2  := Qtd2 + 1;
    end;

    if aTexto = aVelho then //Se achou o texto, faz a troca para o novo texto
    begin
      sTexto:= sTexto + aNovo;
      bAchou:= True;
      Posicao:= Posicao + 1;
    end
    else
    begin
      bAchou:= False;
      sTexto:= sTexto + aStr[i];
    end;
  end;
  Result:= sTexto;
end;


end.

