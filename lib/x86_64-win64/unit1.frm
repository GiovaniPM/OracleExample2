object Form1: TForm1
  Left = 315
  Height = 162
  Top = 156
  Width = 234
  Caption = 'Configura acesso ao DB'
  ClientHeight = 162
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
  end
  object Edit1: TEdit
    Left = 118
    Height = 23
    Top = 8
    Width = 112
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
    TabOrder = 1
    Text = 'Edit2'
  end
  object Edit3: TEdit
    Left = 118
    Height = 23
    Top = 56
    Width = 112
    TabOrder = 2
    Text = 'Edit3'
  end
  object Edit4: TEdit
    Left = 118
    Height = 23
    Top = 80
    Width = 112
    TabOrder = 3
    Text = 'Edit4'
  end
  object ToggleBox1: TToggleBox
    Left = 152
    Height = 25
    Top = 120
    Width = 75
    Caption = 'Update'
    OnChange = ToggleBox1Change
    TabOrder = 4
  end
end
