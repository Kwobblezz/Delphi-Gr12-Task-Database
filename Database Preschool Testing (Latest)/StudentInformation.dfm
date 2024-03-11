object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 573
  ClientWidth = 875
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object lbl1: TLabel
    Left = 213
    Top = 43
    Width = 19
    Height = 15
    Caption = 'lbl1'
  end
  object cbb1: TComboBox
    Left = 8
    Top = 40
    Width = 145
    Height = 23
    TabOrder = 0
    Text = 'cbb1'
  end
  object qry1: TADOQuery
    Active = True
    Connection = DataModule2.con1
    CursorType = ctStatic
    DataSource = DataModule2.ds1
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Students')
    Left = 808
    Top = 48
  end
end
