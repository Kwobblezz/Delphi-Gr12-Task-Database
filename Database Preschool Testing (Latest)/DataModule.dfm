object DataModule2: TDataModule2
  Height = 480
  Width = 640
  object con1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\Projects\Databas' +
      'e Preschool Testing (3)\Database7.mdb;Persist Security Info=Fals' +
      'e'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 24
    Top = 16
  end
  object tbl1: TADOTable
    Active = True
    Connection = con1
    CursorType = ctStatic
    TableName = 'Students'
    Left = 64
    Top = 80
  end
  object ds1: TDataSource
    DataSet = tbl1
    Left = 24
    Top = 80
  end
  object tbl2: TADOTable
    Active = True
    Connection = con1
    CursorType = ctStatic
    MasterSource = ds1
    TableName = 'StudentAttendance'
    Left = 64
    Top = 144
  end
  object ds2: TDataSource
    DataSet = tbl2
    Left = 24
    Top = 144
  end
end
