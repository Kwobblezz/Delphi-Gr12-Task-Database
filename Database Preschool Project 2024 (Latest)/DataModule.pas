unit DataModule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TDataModule2 = class(TDataModule)
    con1: TADOConnection;
    tbl1: TADOTable;
    ds1: TDataSource;
    tbl2: TADOTable;
    ds2: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

implementation

uses
StudentInformation, Unit6, StudentAttendance;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
