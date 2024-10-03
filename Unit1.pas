//------------------------------------------------------------------------------------------------------------
//********* Sobre ************
//Autor: Gisele de Melo
//Esse código foi desenvolvido com o intuito de aprendizado para o blog codedelphi.com, portanto não me
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
      ShowMessage('Informe a quantidade de números e o limite de números!');
      Exit;
    end;

  try
    qtdeNumeros := StrToInt(edtQuantidadeNumeros.Text);
    limiteNumeros := StrToInt(edtLimiteNumeros.Text);

    GerarNumerosAleatorios(qtdeNumeros, limiteNumeros);
  except
    on e: exception do
      ShowMessage('Erro ao gerar os números: '+e.Message);
  end;

end;

procedure TForm1.GerarNumerosAleatorios(Quantidade, LimiteSuperior: Integer);
var
  NumerosGerados: TList;
  NumeroAleatorio, i: Integer;
  texto : String;

begin
  // Inicializa o gerador de números aleatórios com base no horário do sistema
  Randomize;

  // Cria uma lista para armazenar os números gerados
  NumerosGerados := TList.Create;
  try
    // Gera números aleatórios sem repetição
    while NumerosGerados.Count < Quantidade do
    begin
      NumeroAleatorio := Random(LimiteSuperior) + 1; // Gera número entre 1 e LimiteSuperior

      // Verifica se o número já foi gerado
      if NumerosGerados.IndexOf(Pointer(NumeroAleatorio)) = -1 then
      begin
        NumerosGerados.Add(Pointer(NumeroAleatorio)); // Adiciona o número à lista se ainda não foi gerado
      end;
    end;

    // Exibe os números gerados
    mmNumerosGerados.Clear;
    for i := 0 to NumerosGerados.Count - 1 do
      texto := texto + IntToStr(Integer(NumerosGerados[i])) + ' - ';
    mmNumerosGerados.Lines.Add(Copy(texto,1,length(texto)-3));

  finally
    NumerosGerados.Free; // Libera a memória alocada pela lista
  end;
end;

end.
