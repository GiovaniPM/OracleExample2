object Form1: TForm1
  Left = 315
  Height = 112
  Top = 156
  Width = 234
  Caption = 'Form1'
  ClientHeight = 112
  ClientWidth = 234
  OnActivate = FormActivate
  LCLVersion = '7.2'
  object Label1: TLabel
    Left = 8
    Height = 15
    Top = 16
    Width = 80
    Caption = 'DatabaseName'
    ParentColor = False
    OnClick = Label1Click
  end
  object Edit1: TEdit
    Left = 118
    Height = 23
    Top = 8
    Width = 112
    Enabled = False
    TabOrder = 0
    Text = 'Edit1'
  end
  object Label2: TLabel
    Left = 8
    Height = 15
    Top = 40
    Width = 57
    Caption = 'HostName'
    ParentColor = False
  end
  object Label3: TLabel
    Left = 8
    Height = 15
    Top = 64
    Width = 55
    Caption = 'UserName'
    ParentColor = False
  end
  object Label4: TLabel
    Left = 8
    Height = 15
    Top = 88
    Width = 50
    Caption = 'Password'
    ParentColor = False
  end
  object Edit2: TEdit
    Left = 118
    Height = 23
    Top = 32
    Width = 112
    Enabled = False
    TabOrder = 1
    Text = 'Edit2'
  end
  object Edit3: TEdit
    Left = 118
    Height = 23
    Top = 56
    Width = 112
    Enabled = False
    TabOrder = 2
    Text = 'Edit3'
  end
  object Edit4: TEdit
    Left = 118
    Height = 23
    Top = 80
    Width = 112
    Enabled = False
    TabOrder = 3
    Text = 'Edit4'
  end
end
