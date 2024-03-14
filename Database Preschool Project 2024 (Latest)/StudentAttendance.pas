unit StudentAttendance;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Data.Win.ADODB, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TForm2 = class(TForm)
    cbb1: TComboBox;
    lbl1: TLabel;
    qry1: TADOQuery;
    pnl1: TPanel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    chk1: TCheckBox;
    img1: TImage;
    img2: TImage;
    img4: TImage;
    lbl6: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cbb1Change(Sender: TObject);
    procedure img2Click(Sender: TObject);
    procedure img4Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure edt1Change(Sender: TObject);
    procedure edt2Change(Sender: TObject);
    procedure img1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses
Unit6, DataModule;

{$R *.dfm}

procedure TForm2.cbb1Change(Sender: TObject);
var
  sFirstName : string;
begin

//FirstName String
  qry1.SQL.Text := 'SELECT * FROM StudentAttendance WHERE FirstName = ''' + Copy(cbb1.Text, 1, Pos(' ', cbb1.Text) - 1) + ''' OR LastName = ''' + Copy(cbb1.Text, Pos(' ', cbb1.Text) + 1, Length(cbb1.Text) - Pos(' ', cbb1.Text)) + '''';
  qry1.Open;
  sFirstName := qry1.FieldByName('FirstName').asstring;
  qry1.Close;

//FirstName
  //qry1.SQL.Text := 'SELECT * FROM StudentAttendance WHERE FirstName = ''' + Copy(cbb1.text, 1, Pos(' ', cbb1.text) - 1) + ''' OR WHERE LastName = ''' + Copy(cbb1.text, Pos(' ', cbb1.text) + 1, Pos(' ', cbb1.text, Pos(' ', cbb1.text) + 1) - Pos(' ', cbb1.text) -1) + '''';
  qry1.SQL.Text := 'SELECT * FROM StudentAttendance WHERE FirstName = ''' + Copy(cbb1.Text, 1, Pos(' ', cbb1.Text) - 1) + ''' OR LastName = ''' + Copy(cbb1.Text, Pos(' ', cbb1.Text) + 1, Length(cbb1.Text) - Pos(' ', cbb1.Text)) + '''';
  qry1.Open;
  if not qry1.IsEmpty then
    begin
      lbl3.Caption := qry1.FieldByName('FirstName').AsString;
      lbl2.Caption := qry1.FieldByName('LastName').AsString;
      lbl4.Caption := qry1.FieldByName('StudentID').asstring;
      lbl5.Caption := qry1.FieldByName('AttendanceDate').asstring;
      edt1.Text := qry1.FieldByName('FirstName').AsString;
      edt2.Text := qry1.FieldByName('LastName').AsString;
      edt3.Text := qry1.FieldByName('StudentID').asstring;
      edt4.Text := qry1.FieldByName('AttendanceDate').asstring;
      //lbl6.Caption := qry1.FieldByName('').asstring;
      if qry1.FieldByName('Late').AsBoolean = true then
      begin
        chk1.Checked := true;
      end;

      lbl2.Visible := true;
      lbl3.Visible := True;
      lbl4.Visible := True;
      lbl5.Visible := True;
      edt1.Visible := False;
      edt2.Visible := False;
      edt3.Visible := False;
      edt4.Visible := False;
      img4.Visible := False;
      chk1.Visible := true;
    end
  else
    begin
      //ShowMessage('Error');

      chk1.Visible := false;
    end;
  qry1.close;

end;

procedure TForm2.edt1Change(Sender: TObject);
begin
  if edt1.Text <> Copy(cbb1.Text, 1, Pos(' ', cbb1.Text) - 1) then
  begin
    edt2.ReadOnly := true;
  end
  else
  begin
    edt2.ReadOnly := False;
  end;

end;

procedure TForm2.edt2Change(Sender: TObject);
begin
  if edt2.Text <> Copy(cbb1.Text, Pos(' ', cbb1.Text) + 1, Length(cbb1.Text) - Pos(' ', cbb1.Text)) then
  begin
    edt1.ReadOnly := true;
  end
  else
  begin
    edt1.ReadOnly := False;
  end;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form6.Visible := true;
end;

procedure TForm2.FormCreate(Sender: TObject);
var
  i : integer;
begin

    lbl5.Caption := '';
    qry1.open;
    while not qry1.Eof do
    begin
      cbb1.Items.Add(qry1.FieldByName('FirstName').AsString + ' ' + qry1.FieldByName('LastName').AsString);
      Qry1.Next;
    end;
  qry1.Close;

end;

procedure TForm2.img1Click(Sender: TObject);
var
  iConfirm : integer;
begin

iConfirm := MessageDlg('Are you sure you want DELETE this record?', mtConfirmation, [mbYes, mbNo], 0);
  if iConfirm = mrYes then
  begin
    qry1.SQL.Text := 'Select * FROM StudentAttendance WHERE FirstName = ''' + Copy(cbb1.Text, 1, Pos(' ', cbb1.Text) - 1) + ''' OR LastName = ''' + Copy(cbb1.Text, Pos(' ', cbb1.Text) + 1, Length(cbb1.Text) - Pos(' ', cbb1.Text))  + '''';
    qry1.Open;
    qry1.Delete;
    qry1.close;

  // Refresh combobox
      cbb1.Clear;
      qry1.SQL.Text := 'SELECT FirstName, LastName, ID FROM StudentAttendance';
      qry1.Open;
      while not qry1.Eof do
      begin
        cbb1.Items.Add(qry1.FieldByName('FirstName').AsString + ' ' + qry1.FieldByName('LastName').AsString);
        qry1.Next;
      end;
      qry1.Close;

  if cbb1.Text = '' then
      begin
        lbl2.Visible := False;
        lbl3.Visible := False;
        lbl4.Visible := False;
        lbl5.Visible := False;
        edt1.Visible := False;
        edt2.Visible := False;
        edt3.Visible := False;
        edt4.Visible := False;
        img4.Visible := False;
        chk1.Visible := False;
      end
      else
      begin
        lbl2.Visible := true;
        lbl3.Visible := True;
        lbl4.Visible := True;
        lbl5.Visible := True;
        edt1.Visible := False;
        edt2.Visible := False;
        edt3.Visible := False;
        edt4.Visible := False;
        img4.Visible := False;
        chk1.Visible := True;
      end;
  end
  else
  begin

  end;


end;

procedure TForm2.img2Click(Sender: TObject);
begin
  lbl2.Visible := false;
  lbl3.Visible := False;
  lbl4.Visible := False;
  lbl5.Visible := false;
  edt1.Visible := True;
  edt2.Visible := True;
  edt3.Visible := True;
  edt4.Visible := True;
  img4.Visible := True;
end;

procedure TForm2.img4Click(Sender: TObject);
var
  iConfirm : Integer;
begin

  iConfirm := MessageDlg('Are you sure you want to save changes?', mtConfirmation, [mbYes, mbNo], 0);
  if iConfirm = mrYes then
  begin

    qry1.SQL.Text := 'SELECT * FROM StudentAttendance WHERE FirstName = ''' + Copy(cbb1.Text, 1, Pos(' ', cbb1.Text) - 1) + ''' OR LastName = ''' + Copy(cbb1.Text, Pos(' ', cbb1.Text) + 1, Length(cbb1.Text) - Pos(' ', cbb1.Text)) + '''';
    qry1.Open;
    if not qry1.IsEmpty then
      begin

         qry1.SQL.Text := 'UPDATE StudentAttendance SET LastName = ''' + edt2.Text + ''' WHERE FirstName = ''' + Copy(cbb1.Text, 1, Pos(' ', cbb1.Text) - 1) + ''' OR LastName = ''' + Copy(cbb1.Text, Pos(' ', cbb1.Text) + 1, Length(cbb1.Text) - Pos(' ', cbb1.Text)) + '''';
         qry1.ExecSQL;
         qry1.SQL.Text := 'UPDATE StudentAttendance SET FirstName = ''' + edt1.Text + ''' WHERE FirstName = ''' + Copy(cbb1.Text, 1, Pos(' ', cbb1.Text) - 1) + ''' OR LastName = ''' + Copy(cbb1.Text, Pos(' ', cbb1.Text) + 1, Length(cbb1.Text) - Pos(' ', cbb1.Text)) + '''';
         qry1.ExecSQL;
         qry1.SQL.Text := 'UPDATE StudentAttendance SET StudentID = ''' + edt3.Text + ''' WHERE FirstName = ''' + Copy(cbb1.Text, 1, Pos(' ', cbb1.Text) - 1) + ''' OR LastName = ''' + Copy(cbb1.Text, Pos(' ', cbb1.Text) + 1, Length(cbb1.Text) - Pos(' ', cbb1.Text)) + '''';
         qry1.ExecSQL;
         qry1.SQL.Text := 'UPDATE StudentAttendance SET AttendanceDate = ''' + edt4.Text + ''' WHERE FirstName = ''' + Copy(cbb1.Text, 1, Pos(' ', cbb1.Text) - 1) + ''' OR LastName = ''' + Copy(cbb1.Text, Pos(' ', cbb1.Text) + 1, Length(cbb1.Text) - Pos(' ', cbb1.Text)) + '''';
         qry1.ExecSQL;
         if chk1.Checked = true then
         begin
           qry1.SQL.Text := 'UPDATE StudentAttendance SET Late = True WHERE FirstName = ''' + Copy(cbb1.Text, 1, Pos(' ', cbb1.Text) - 1) + ''' OR LastName = ''' + Copy(cbb1.Text, Pos(' ', cbb1.Text) + 1, Length(cbb1.Text) - Pos(' ', cbb1.Text)) + '''';
         end
         else
         begin
           qry1.SQL.Text := 'UPDATE StudentAttendance SET Late = False WHERE FirstName = ''' + Copy(cbb1.Text, 1, Pos(' ', cbb1.Text) - 1) + ''' OR LastName = ''' + Copy(cbb1.Text, Pos(' ', cbb1.Text) + 1, Length(cbb1.Text) - Pos(' ', cbb1.Text)) + '''';
         end;
         qry1.ExecSQL;

       end;

    qry1.Close;

// Refresh combobox
    cbb1.Clear;
    qry1.SQL.Text := 'SELECT FirstName, LastName, ID FROM StudentAttendance';
    qry1.Open;
    while not qry1.Eof do
    begin
      cbb1.Items.Add(qry1.FieldByName('FirstName').AsString + ' ' + qry1.FieldByName('LastName').AsString);
      qry1.Next;
    end;
    qry1.Close;

    cbb1.Text := edt1.Text + ' ' + edt2.Text;

    if cbb1.Text = '' then
    begin
      lbl2.Visible := False;
      lbl3.Visible := False;
      lbl4.Visible := False;
      lbl5.Visible := False;
      edt1.Visible := False;
      edt2.Visible := False;
      edt3.Visible := False;
      edt4.Visible := False;
      img4.Visible := False;
      chk1.Visible := False;
    end
    else
    begin
      lbl2.Visible := true;
      lbl3.Visible := True;
      lbl4.Visible := True;
      lbl5.Visible := True;
      edt1.Visible := False;
      edt2.Visible := False;
      edt3.Visible := False;
      edt4.Visible := False;
      img4.Visible := False;
      chk1.Visible := True;
    end;


    edt1.ReadOnly := False;
    edt2.ReadOnly := false;
    cbb1Change(Sender);

  end
  else
  begin
    qry1.SQL.Text := 'SELECT * FROM StudentAttendance WHERE FirstName = ''' + Copy(cbb1.Text, 1, Pos(' ', cbb1.Text) - 1) + ''' OR LastName = ''' + Copy(cbb1.Text, Pos(' ', cbb1.Text) + 1, Length(cbb1.Text) - Pos(' ', cbb1.Text)) + '''';
    qry1.Open;
    if not qry1.IsEmpty then
     begin
      lbl3.Caption := qry1.FieldByName('FirstName').AsString;
      lbl2.Caption := qry1.FieldByName('LastName').AsString;
      lbl4.Caption := qry1.FieldByName('StudentID').asstring;
      lbl5.Caption := qry1.FieldByName('AttendanceDate').asstring;
      edt1.Text := qry1.FieldByName('FirstName').AsString;
      edt2.Text := qry1.FieldByName('LastName').AsString;
      edt3.Text := qry1.FieldByName('StudentID').asstring;
      edt4.Text := qry1.FieldByName('AttendanceDate').asstring;
      //lbl6.Caption := qry1.FieldByName('').asstring;
       if qry1.FieldByName('Late').AsBoolean = true then
         begin
          chk1.Checked := true;
         end;
     end;

    lbl2.Visible := True;
    lbl3.Visible := True;
    lbl4.Visible := True;
    lbl5.Visible := True;
    edt1.Visible := False;
    edt2.Visible := False;
    edt3.Visible := False;
    edt4.Visible := False;
    img4.Visible := False;
    qry1.Close;
    cbb1Change(Sender);

  end;

end;

procedure TForm2.tmr1Timer(Sender: TObject);
begin
  cbb1Change(Sender);
end;

end.
