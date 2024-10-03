object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'N'#250'meros Aleat'#243'rios'
  ClientHeight = 312
  ClientWidth = 236
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 217
    Height = 15
    Caption = 'Quantidade de n'#250'meros a serem gerados'
  end
  object Label2: TLabel
    Left = 8
    Top = 67
    Width = 194
    Height = 15
    Caption = 'Limite de n'#250'meros, come'#231'ando do 1'
  end
  object Label3: TLabel
    Left = 8
    Top = 187
    Width = 95
    Height = 15
    Caption = 'N'#250'meros Gerados'
  end
  object edtQuantidadeNumeros: TEdit
    Left = 8
    Top = 29
    Width = 217
    Height = 23
    TabOrder = 0
    Text = '6'
  end
  object edtLimiteNumeros: TEdit
    Left = 8
    Top = 88
    Width = 217
    Height = 23
    TabOrder = 1
    Text = '60'
  end
  object btnGerarNumeros: TButton
    Left = 8
    Top = 128
    Width = 217
    Height = 41
    Caption = 'Gerar N'#250'meros Aleat'#243'rios'
    TabOrder = 2
    OnClick = btnGerarNumerosClick
  end
  object mmNumerosGerados: TMemo
    Left = 8
    Top = 208
    Width = 217
    Height = 89
    TabOrder = 3
  end
end
