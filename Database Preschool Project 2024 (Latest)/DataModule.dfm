object DataModule2: TDataModule2
  Height = 480
  Width = 640
  object con1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\HCS 1\Docu' +
      'ments\Embarcadero\Studio\Projects\Delphi-Gr12-Task-Database\Data' +
      'base Preschool Testing (Latest)\Database7.mdb;Persist Security I' +
      'nfo=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 24
    Top = 16
  end
  object tbl1: TADOTable
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
