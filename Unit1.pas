//------------------------------------------------------------------------------------------------------------
//********* Sobre ************
//Autor: Gisele de Melo
//Esse c�digo foi desenvolvido com o intuito de aprendizado para o blog codedelphi.com, portanto n�o me
//responsabilizo pelo uso do mesmo.
//
//********* About ************
//Author: Gisele de Melo
//This code was developed for learning purposes for the codedelphi.com blog, therefore I am not responsible for
//its use.
//------------------------------------------------------------------------------------------------------------
unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edtQuantidadeNumeros: TEdit;
    edtLimiteNumeros: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnGerarNumeros: TButton;
    mmNumerosGerados: TMemo;
    Label3: TLabel;
    procedure btnGerarNumerosClick(Sender: TObject);
  private
    procedure GerarNumerosAleatorios(Quantidade, LimiteSuperior: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnGerarNumerosClick(Sender: TObject);
var
  qtdeNumeros, limiteNumeros: Integer;

begin

  if (edtQuantidadeNumeros.Text = '') or (edtLimiteNumeros.Text = '') then
    begin
      ShowMessage('Informe a quantidade de n�meros e o limite de n�meros!');
      Exit;
    end;

  try
    qtdeNumeros := StrToInt(edtQuantidadeNumeros.Text);
    limiteNumeros := StrToInt(edtLimiteNumeros.Text);

    GerarNumerosAleatorios(qtdeNumeros, limiteNumeros);
  except
    on e: exception do
      ShowMessage('Erro ao gerar os n�meros: '+e.Message);
  end;

end;

procedure TForm1.GerarNumerosAleatorios(Quantidade, LimiteSuperior: Integer);
var
  NumerosGerados: TList;
  NumeroAleatorio, i: Integer;
  texto : String;

begin
  // Inicializa o gerador de n�meros aleat�rios com base no hor�rio do sistema
  Randomize;

  // Cria uma lista para armazenar os n�meros gerados
  NumerosGerados := TList.Create;
  try
    // Gera n�meros aleat�rios sem repeti��o
    while NumerosGerados.Count < Quantidade do
    begin
      NumeroAleatorio := Random(LimiteSuperior) + 1; // Gera n�mero entre 1 e LimiteSuperior

      // Verifica se o n�mero j� foi gerado
      if NumerosGerados.IndexOf(Pointer(NumeroAleatorio)) = -1 then
      begin
        NumerosGerados.Add(Pointer(NumeroAleatorio)); // Adiciona o n�mero � lista se ainda n�o foi gerado
      end;
    end;

    // Exibe os n�meros gerados
    mmNumerosGerados.Clear;
    for i := 0 to NumerosGerados.Count - 1 do
      texto := texto + IntToStr(Integer(NumerosGerados[i])) + ' - ';
    mmNumerosGerados.Lines.Add(Copy(texto,1,length(texto)-3));

  finally
    NumerosGerados.Free; // Libera a mem�ria alocada pela lista
  end;
end;

end.
