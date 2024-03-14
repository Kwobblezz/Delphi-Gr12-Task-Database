unit StudentInformation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, DataModule, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TForm1 = class(TForm)
    cbb1: TComboBox;
    lbl1: TLabel;
    qry1: TADOQuery;
    pnl1: TPanel;
    img1: TImage;
    img2: TImage;
    lbl6: TLabel;
    lblFirstName: TLabel;
    lblLastName: TLabel;
    lblEmail: TLabel;
    lblStudentID: TLabel;
    cbbGrade: TComboBox;
    lblDateOfBirth: TLabel;
    lblIDNumber: TLabel;
    lblHomePhone: TLabel;
    lblMobilePhone: TLabel;
    lblAddress: TLabel;
    lblCity: TLabel;
    mmoNotes: TMemo;
    mmoSpecialCircumstances: TMemo;
    lblZIP: TLabel;
    lblAllergies: TLabel;
    lblMedications: TLabel;
    imgSave: TImage;
    edtFirstName: TEdit;
    edtLastName: TEdit;
    edtStudentID: TEdit;
    edtIDNumber: TEdit;
    edtDateOfBirth: TEdit;
    edtHomePhone: TEdit;
    edtMobilePhone: TEdit;
    edtEmail: TEdit;
    edtAddress: TEdit;
    edtCity: TEdit;
    edtZIP: TEdit;
    edtMedications: TEdit;
    edtAllergies: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure img1Click(Sender: TObject);
    procedure cbb1Change(Sender: TObject);
    procedure img2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
Unit6;

{$R *.dfm}

procedure TForm1.cbb1Change(Sender: TObject);
begin


  qry1.SQL.Text := 'SELECT * FROM Students WHERE FirstName = ''' + Copy(cbb1.Text, 1, Pos(' ', cbb1.Text) - 1) + ''' OR LastName = ''' + Copy(cbb1.Text, Pos(' ', cbb1.Text) + 1, Length(cbb1.Text) - Pos(' ', cbb1.Text)) + '''';
  qry1.Open;
  if not qry1.IsEmpty then
    begin
      lblFirstName.Caption := qry1.FieldByName('FirstName').AsString;
      lblLastName.Caption := qry1.FieldByName('LastName').AsString;
      lblStudentID.Caption := qry1.FieldByName('StudentID').asstring;
      lblEmail.Caption := qry1.FieldByName('E-MailAddress').AsString;
      //cbbGrade.Items.Add(qry1.FieldByName('Grade').AsString);
      lblDateOfBirth.Caption := qry1.FieldByName('DateOfBirth').AsString;
      lblIDNumber.Caption := qry1.FieldByName('IDNumber').AsString;
      lblHomePhone.Caption := qry1.FieldByName('HomePhone').AsString;
      lblMobilePhone.Caption := qry1.FieldByName('MobilePhone').AsString;
      lblAddress.Caption := qry1.FieldByName('Address').AsString;
      lblCity.Caption := qry1.FieldByName('City').AsString;
      lblZIP.Caption := qry1.FieldByName('ZIP/Postal Code').AsString;
      lblAllergies.Caption := qry1.FieldByName('Allergies').AsString;
      lblMedications.Caption := qry1.FieldByName('Medications').AsString;
      mmoNotes.Lines.Add(qry1.FieldByName('Notes').AsString);
      mmoSpecialCircumstances.Lines.Add(qry1.FieldByName('SpecialCircumstances').AsString);

      lblFirstName.Visible := true;
      lblLastName.Visible := True;
      lblStudentID.Visible := True;
      lblZIP.Visible := True;
      lblEmail.Visible := True;
      lblCity.Visible := True;
      lblAddress.Visible := True;
      lblIDNumber.Visible := True;
      lblAllergies.Visible := True;
      lblHomePhone.Visible := True;
      lblMobilePhone.Visible := True;
      lblDateOfBirth.Visible := True;
      lblMedications.Visible := True;
      edtFirstName.Visible := False;
      edtLastName.Visible := False;
      edtStudentID.Visible := False;
      edtIDNumber.Visible := False;
      imgSave.Visible := False;
      edtCity.Visible := false;
      edtZIP.Visible := false;
      edtEmail.Visible := False;
      edtAddress.Visible := false;
      edtDateOfBirth.Visible := false;
      edtHomePhone.Visible := False;
      edtAllergies.Visible := false;
      edtMedications.Visible := False;
      edtMobilePhone.Visible := False;
    end
  else
    begin
      //ShowMessage('Error');
    end;
  qry1.close;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form1.Visible := false;
  Form6.Visible := true;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

    qry1.open;
    while not qry1.Eof do
    begin
      cbb1.Items.Add(qry1.FieldByName('FirstName').AsString + ' ' + qry1.FieldByName('LastName').AsString);
      Qry1.Next;
    end;
  qry1.Close;

end;

procedure TForm1.img1Click(Sender: TObject);
var
  iConfirm : integer;
begin

iConfirm := MessageDlg('Are you sure you want DELETE this record?', mtConfirmation, [mbYes, mbNo], 0);
  if iConfirm = mrYes then
  begin
    qry1.SQL.Text := 'Select * FROM Students WHERE FirstName = ''' + Copy(cbb1.Text, 1, Pos(' ', cbb1.Text) - 1) + ''' OR LastName = ''' + Copy(cbb1.Text, Pos(' ', cbb1.Text) + 1, Length(cbb1.Text) - Pos(' ', cbb1.Text))  + '''';
    qry1.Open;
    qry1.Delete;
    qry1.close;

  // Refresh combobox
      cbb1.Clear;
      qry1.SQL.Text := 'SELECT FirstName, LastName, ID FROM Students';
      qry1.Open;
      while not qry1.Eof do
      begin
        cbb1.Items.Add(qry1.FieldByName('FirstName').AsString + ' ' + qry1.FieldByName('LastName').AsString);
        qry1.Next;
      end;
      qry1.Close;

  if cbb1.Text = '' then
  begin
        {lbl2.Visible := False;
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
      end;            }
  end;


end;
end;

procedure TForm1.img2Click(Sender: TObject);
begin
  imgSave.Visible := true;

//Show Hide Edit Boxes
      lblFirstName.Visible := False;
      lblLastName.Visible := False;
      lblStudentID.Visible := False;
      lblZIP.Visible := False;
      lblEmail.Visible := False;
      lblCity.Visible := False;
      lblAddress.Visible := False;
      lblIDNumber.Visible := False;
      lblAllergies.Visible := False;
      lblHomePhone.Visible := False;
      lblMobilePhone.Visible := False;
      lblDateOfBirth.Visible := False;
      lblMedications.Visible := False;
      edtFirstName.Visible := true;
      edtLastName.Visible := true;
      edtStudentID.Visible := true;
      edtIDNumber.Visible := true;
      imgSave.Visible := true;
      edtCity.Visible := true;
      edtZIP.Visible := true;
      edtEmail.Visible := true;
      edtAddress.Visible := true;
      edtDateOfBirth.Visible := true;
      edtHomePhone.Visible := true;
      edtAllergies.Visible := true;
      edtMedications.Visible := true;
      edtMobilePhone.Visible := true;
end;

end.
