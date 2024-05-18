unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spellers, Menus, StdCtrls, ComCtrls, SpellLanguageComboBox,
  ExtCtrls, Grids, Outline, DirOutln, FileCtrl, StrUtils, IniFiles,
  ShellCtrls, Mask, sSkinManager, sButton, sRichEdit, sComboBox, sMaskEdit,
  sCustomComboEdit, sToolEdit, sRadioButton, sPanel, sLabel, sCheckBox,
  sListBox, sCheckListBox, CheckLst;

type
  TForm1 = class(TForm)
    RichEdit1: TRichEdit;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    SpellChecker1: TSpellChecker;
    Saveas1: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    SpellLanguageComboBox1: TSpellLanguageComboBox;
    GoSpellBtn: TButton;
    StatusBar1: TStatusBar;
    ListBox1: TListBox;
    FoldListMemo2: TMemo;
    Memo1: TMemo;
    F1: TMenuItem;
    sRadioButton1: TRadioButton;
    sRadioButton2: TRadioButton;
    sPanel3: TPanel;
    sRadioButton3: TRadioButton;
    sRadioButton4: TRadioButton;
    H1: TMenuItem;
    S1: TMenuItem;
    sCheckListBox1: TCheckListBox;
    U1: TMenuItem;
    sRichEdit1: TRichEdit;
    sPanel1: TPanel;
    pnl1: TPanel;
    btnGetFileBtn: TButton;
    sPanel2: TPanel;
    lblFolderslbl1: TLabel;
    sComboBox2: TComboBox;
    sComboBox1: TComboBox;
    MasksPanel3: TPanel;
    procedure Open1Click(Sender: TObject);
    procedure RichEdit1Change(Sender: TObject);
    procedure GoSpellBtnClick(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SaveAs1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure SaveChangedClick(Sender: TObject);
    procedure btnGetFileBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sComboBox1Exit(Sender: TObject);
    procedure F1Click(Sender: TObject);
    procedure lblFolderslbl1Click(Sender: TObject);
    procedure MasksPanel3Click(Sender: TObject);
    procedure sComboBox2Exit(Sender: TObject);
    procedure SpellChecker1Cancel(Sender: TObject);
    procedure H1Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure sCheckListBox1Exit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  Form1: TForm1;
  FileName: string;
  RichEditModified, stopchecking: boolean;
  initdir, ss1: string;

procedure SelComment3(R: TRichEdit);
procedure SelComment(R: TRichEdit);
procedure SelIt(R: TRichEdit; start, len: integer; color: TColor);

implementation

{$R *.dfm}

//Выделить фрагмент текста

//*********************************************************

procedure SelIt(R: TRichEdit; start, len: integer; color: TColor);
//где R - рабочий экземпляр класса,
//start - начальная позиция для выделения
//len - длина выделяемого фрагмента
//color - цвет
begin
  R.SelStart := start;
  R.SelLength := len;
  R.SelAttributes.Color := color;
end;

//Выделение однострочного комментария `//`
//*********************************************************

procedure SelComment(R: TRichEdit);
//где R - рабочий экземпляр класса
var
  i, j, c, eolRCnt: integer;
  line, eolR, fnm, SWarningText: string;
  startSel, lengthSel, lengthLine: integer;
  //где i - счётчик линий
  //j - счётчик символов внутри линии
  //с - счётчик букв в формате RichEdit (нумерация с 0,
  //    в конце каждой строки два нечитаемых спецсимвола)
  //line - строка из RichEdit
  // eolR разделитель строк - #$D+#$A chr(10) chr(13) chr(10)
begin
  c := 0;
  eolR := #$D#$A;

  startSel := 0;
  lengthSel := 0;
  eolR := #$D#$A;
  //poseol:=Pos( eolR,R.Lines[1]);
//  if Pos( eolR,R.Text)>0 then

//  if Pos( eolR,R.Text)>0 then
  if Pos(eolR, R.Lines[1]) > 0 then
    eolRCnt := 2
  else
    eolRCnt := 1;

  eolRCnt := 2;

  for i := 0 to R.Lines.Count - 1 do
  begin
    line := R.Lines[i];
    lengthLine := Length(line);

    //for j := 1 to Length(line) - 1 do
    for j := 1 to lengthLine do
    begin
      if (line[j] = '/') and (line[j + 1] = '/') then
      begin
        SelIt(R, c + j - 1 + lengthSel, Length(line) - j + 1, clGreen);
        Form1.Memo1.text := R.SelText;
        Form1.Spellchecker1.Check(Form1.Memo1);

        if R.SelText <> Form1.Memo1.text then
        begin
          lengthSel := Length(Form1.Memo1.text) - Length(R.SelText);
          //Form1.FoldListMemo2.Lines.Add(IntToStr(i + 1) + '=' + R.SelText + '-->' +
           // Form1.Memo1.text);
          R.SelText := Form1.Memo1.text;
          //          Form1.ListBox1.Items.Add('22222');
          fnm := Form1.OpenDialog1.FileName;
          Form1.ListBox1.Items.Add(fnm);
          //i:=i-1; // отматываем назад, чтобы пересчитать с учетом измененного текста
          Break;
        end
        else
          R.Modified := False;

        //lengthSel := 0;
      end;
    end;
    c := c + Length(line) + eolRCnt;
          if stopchecking = true then
          Break;

  end;

        if not stopchecking = true then
          SelComment3(Form1.RichEdit1);
  //   ShowMessage('File checked '+Form1.OpenDialog1.FileName);
  SWarningText := 'File checked. Save file to ' + FileName +
    ' ?';
  if Form1.RichEdit1.Modified then //OpenDialog1.FileName
  begin

    if Form1.sRadioButton3.checked then
      case MessageDlg(SWarningText, mtConfirmation,
        [mbYes, mbNo, mbCancel], 0) of
        idYes: Form1.SaveChangedClick(nil);

        //idCancel: CanClose := False;
      end
    else
      Form1.SaveChangedClick(nil);

  end;

end;

//*************************************************

procedure TForm1.RichEdit1Change(Sender: TObject);

begin

  // при загрузке файла в richedit текст сканируется и выделяются комментарии и строковые литералы
  {
  для файлов с расширением pascal
  начало/конец  коммента фиг скобки {
  dfg

  // }

end;

//***********************************************************

procedure TForm1.GoSpellBtnClick(Sender: TObject);
var

  ifn: Integer;

begin
  stopchecking := False;

  if sRadioButton1.Checked then // single file
  begin
    // RichEdit1.Lines.LoadFromFile(ListBox1.Items[ListBox1.ItemIndex]);
     //RichEdit1.Lines.LoadFromFile(FileName);
    RichEdit1.SelStart := 0;
    RichEdit1.SelStart := 0;
    RichEdit1.SelAttributes.Color := clSkyBlue;
    RichEdit1.SelAttributes.Style := [];
    Memo1.Text := 'Noow';

    SelComment(RichEdit1);

  end

  else

  begin
    // перебираем по списку файлов и загружаем их RichEdit
    for ifn := 0 to ListBox1.Items.Count - 1 do
    begin
      if stopchecking = true then
        Break;
      ListBox1.ItemIndex := ifn;
      FileName := (ListBox1.Items[ifn]);
      RichEdit1.Lines.LoadFromFile(FileName);
      RichEdit1.SelStart := 0;
      RichEdit1.SelStart := 0;
      RichEdit1.SelAttributes.Color := clSkyBlue;
      RichEdit1.SelAttributes.Style := [];
      Memo1.Text := 'Noow';

      SelComment(RichEdit1);
      if stopchecking = true then
        Break;
    end;

  end;

end;

//***********************************************************

procedure TForm1.Memo1Change(Sender: TObject);
begin

  //    Memo1.Text:='111111111111111';

end;
//Выделение многострочного комментария `/*...*/`
// /*.../// <author></author>

//***********************************************************

procedure SelComment3(R: TRichEdit);
//где R - рабочий экземпляр класса
var
  i, j, c, eolRCnt, poseol: integer;
  line, eolR: string;
  inComment: boolean;
  startSel, finSel, lengthSel, lengthLine: integer;
label
  nextcmnt,break666;

  //где i - счётчик линий
  //j - счётчик символов внутри линии
  //с - счётчик букв в формате RichEdit (нумерация с 0,    #$D#$A
  //    в конце каждой строки два нечитаемых спецсимвола)
  //line - строка из RichEdit
  //inComment - флаг состояния текста `в комментарии`
  //startSel - позиция начала многострочного комментария
  //lengthSel - длина выделяемого текста
  // eolR разделитель строк - #$D+#$A chr(10) chr(13) chr(10)

begin
  c := 0;
  inComment := false;
  startSel := 0;
  lengthSel := 0;
  eolR := #$D#$A;
  poseol := Pos(eolR, R.Lines[1]);
  //  if Pos( eolR,R.Text)>0 then
  if poseol > 0 then
    eolRCnt := 2
  else if Pos(#$A, R.Lines[1]) > 0 then
    eolRCnt := 1
  else if Pos(#$D, R.Lines[1]) > 0 then
    eolRCnt := 1;

  eolRCnt := 2;
  finSel := 1;

  nextcmnt:
  startSel := PosEx('/*', R.text, finSel);
  if startSel > 0 then
  begin
    finSel := PosEx('*/', R.text, startSel);
    if finSel=0 then goto break666;
    lengthSel := finSel - startSel - 1;
    SelIt(R, startSel + 1, lengthSel - 1, clRed);
    // выделили текст, теперь можно его проверить на орфографию
    Form1.Memo1.text := R.SelText;
    Form1.Spellchecker1.Check(Form1.Memo1);
    R.SelText := Form1.Memo1.text;
    goto nextcmnt;
  end;
  break666:

end;

//*************************************************

procedure TForm1.Open1Click(Sender: TObject);
begin

OpenDialog1.InitialDir:=initdir;

  if OpenDialog1.Execute then
    if OpenDialog1.FileName<>'' then
    begin
    filename := OpenDialog1.FileName;
  RichEdit1.Lines.LoadFromFile(filename);
  RichEdit1.SelStart := 0;

    end;

end;

//*************************************************

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  SWarningText: string;
  Ini: Tinifile; //необходимо создать объект, чтоб потом с ним работать
begin

  //создали файл в директории программы
  Ini := TiniFile.Create(extractfilepath(paramstr(0)) + 'Spellem.ini');
  //Ini.WriteInteger('main','initialdir',DirectoryOutline1.Directory);
  if DirectoryExists(initdir) then
    Ini.WriteString('main', 'initialdir', initdir)
  else
    Ini.WriteString('main', 'initialdir', extractfilepath(paramstr(0)));
  sComboBox1.Items.SaveToFile(extractfilepath(paramstr(0)) + 'masks.txt');

  Ini.Free;

  SWarningText := 'Save file to ' + FileName + ' ?';
  if RichEdit1.Modified then //OpenDialog1.FileName
  begin
    case MessageDlg(SWarningText, mtConfirmation,
      [mbYes, mbNo, mbCancel], 0) of
      idYes: Save1Click(Self);
      //idCancel: CanClose := False;
    end;
  end;
  Action := caFree;

end;

//*************************************************

procedure TForm1.Saveas1Click(Sender: TObject);
begin
  Form1.SaveDialog1.FileName := FileName;
  if Form1.SaveDialog1.Execute then
  begin
    RichEdit1.Lines.SaveToFile(SaveDialog1.FileName);
    RichEdit1.Modified := False;

  end;
end;

//*************************************************

procedure TForm1.Save1Click(Sender: TObject);
var
  filename1: string;
begin
  //filename := OpenDialog1.FileName;
  if filename = '' then
    SaveAs1Click(Sender)
  else
  begin
    RichEdit1.Lines.SaveToFile(FileName);
    RichEdit1.Modified := False;
  end;
  if FileName = 'foldersHist.txt' then
  sComboBox2.Items.LoadFromFile('foldersHist.txt');

  if FileName = 'masks.txt' then
  sComboBox1.Items.LoadFromFile('masks.txt');


end;

//*************************************************

procedure TForm1.SaveChangedClick(Sender: TObject);
var
  filename1: string;
begin
  // filename := OpenDialog1.FileName;
  if filename = '' then
    SaveAs1Click(Sender)
  else
  begin
    //ChangeFileExt(oldName, '.new');
    //RichEdit1.Lines.SaveToFile(ChangeFileExt(OpenDialog1.FileName,''));
    RichEdit1.Lines.SaveToFile(FileName);
    RichEdit1.Modified := False;
  end;
end;

//**********************************************************

//**********************************************************

procedure TForm1.btnGetFileBtnClick(Sender: TObject);

var
  sr: TSearchRec;
  i1, i2: Integer;
  dirCntB, dirCntE: Integer;
  mask: TStringList;

label
  nxtdir;

begin
  mask := TStringList.Create;
  mask.Delimiter := ';';
  mask.DelimitedText := sComboBox1.Text;

  FoldListMemo2.Text := '';
  ListBox1.Clear;
   if not DirectoryExists(initdir) then
   begin
   ShowMessage('Initial folder '+initdir +' not exists');
    //  initdir:=extractfilepath(paramstr(0));

    Exit ;
   end;
  // create all folders/subfolders list
  if FindFirst(initdir + '\*.*', faDirectory, sr) = 0 then
    //search folders
    repeat
      // only folders
      if ((sr.attr and faDirectory) = faDirectory) and (Pos('.', sr.Name) < 1)
        then
        FoldListMemo2.Lines.Add(initdir + '\' + sr.Name);
    until FindNext(sr) <> 0;
  FindClose(sr);
  dirCntB := 0;
  dirCntE := FoldListMemo2.Lines.Count;

  nxtdir:

  for i1 := dirCntB to dirCntE - 1 do //перебираем по списку директорий
  begin
    sComboBox2.Text := FoldListMemo2.Lines[i1];
    Application.ProcessMessages;
    //DirectoryOutline1.Directory := RichEdit1.Lines[i1];
    if FindFirst(FoldListMemo2.Lines[i1] + '\*.*', faDirectory, sr) = 0 then
      //ищем  подпапки каталоге
      repeat
        // Показываем только каталоги
        if ((sr.attr and faDirectory) = faDirectory) and (Pos('.', sr.Name) < 1)
          then
          FoldListMemo2.Lines.Add(FoldListMemo2.Lines[i1] + '\' + sr.Name);
        //RichEdit1.Lines.Add(DirectoryOutline1.Directory + '\' + sr.Name);
          //выводим список в ListBox
      until FindNext(sr) <> 0;
    FindClose(sr);
  end;

  dirCntB := dirCntE;
  //  dirCntE:=RichEdit1.Lines.Count;
  dirCntE := FoldListMemo2.Lines.Count;

  if ((dirCntE > 0) and (dirCntB <> dirCntE)) then
    goto nxtdir;

  //  Label1.Caption := DirectoryOutline1.Directory;

    // составляем список файлов ================================================
  dirCntB := 0;
  //  dirCntE:=RichEdit1.Lines.Count;
  dirCntE := FoldListMemo2.Lines.Count;

  // перебираем по маскам, маски в combobox, разделитель точка с запятой
  for i2 := 0 to mask.Count - 1 do

    for i1 := dirCntB to dirCntE - 1 do //перебираем по списку директорий
    begin
      //DirectoryOutline1.Directory := FoldListMemo2.Lines[i1];
      //DirectoryOutline1.Directory := RichEdit1.Lines[i1];
      if FindFirst(FoldListMemo2.Lines[i1] + '\' + mask[i2], faAnyFile, sr)
        = 0 then
        //ищем  файлы
        repeat
          // Показываем только файлы
          if ((sr.attr and faDirectory) <> faDirectory) then
            ListBox1.Items.Add(FoldListMemo2.Lines[i1] + '\' + sr.Name);
          //RichEdit1.Lines.Add(DirectoryOutline1.Directory + '\' + sr.Name);
            //выводим список в ListBox
        until FindNext(sr) <> 0;
      FindClose(sr);
    end;

end;

//**********************************************************

procedure TForm1.FormShow(Sender: TObject);
var
  Ini: Tinifile;
  ic, ic1, ic2, ic3, ic4, ic5, ic6, ic7: Integer;
  initdir, ss1: string;
const
  SELDIRHELP = 1000;

begin
  SpellLanguageComboBox1.ItemIndex := 6;
  if FileExists(extractfilepath(paramstr(0)) +'ReadMe.rtf')   then
  sRichEdit1.Lines.LoadFromFile(extractfilepath(paramstr(0)) +'ReadMe.rtf');

  //  Ini := TiniFile.Create(extractfilepath(paramstr(0)) + 'Spellem.Ini');
  //  initdir := Ini.ReadString('main', 'initialdir', extractfilepath(paramstr(0)));
  OpenDialog1.InitialDir := initdir;
  ic := 0;
  RichEdit1.Modified:=False;

end;

//**********************************************************

procedure TForm1.ListBox1Click(Sender: TObject);
begin
  FileName := (ListBox1.Items[ListBox1.ItemIndex]);
  //RichEdit1.Lines.LoadFromFile(ListBox1.Items[ListBox1.ItemIndex ]);
  RichEdit1.Lines.LoadFromFile(FileName);
  RichEdit1.SelStart := 0;

end;

//**********************************************************

procedure TForm1.FormCreate(Sender: TObject);
var
  Ini: Tinifile;
const
  SELDIRHELP = 1000;

begin

  //открываем файл
  //{
  Application.HintColor := clYellow;
  Application.HintPause := 200;
  {
   Application.HintHidePause :=
 Application.HintPause :=
 Application.HintShortPause :=
 Application.HideHint;
 Application.HintMouseMessage();
 //}
  Ini := TiniFile.Create(extractfilepath(paramstr(0)) + 'Spellem.Ini');
  initdir := Ini.ReadString('main', 'initialdir',
    extractfilepath(paramstr(0)));
  Ini.Free;
  //}

  if DirectoryExists(initdir) then
  else
    //Ini.WriteString('main', 'initialdir', extractfilepath(paramstr(0)));
   initdir:=extractfilepath(paramstr(0));

  if FileExists('masks.txt') then
    sComboBox1.Items.LoadFromFile('masks.txt');
  sComboBox2.Items.LoadFromFile('foldersHist.txt');

  sComboBox2.Text := initdir;
  SaveDialog1.InitialDir := extractfilepath(paramstr(0));
  sCheckListBox1.Checked[0]:=True;
  sCheckListBox1.Checked[1]:=True;
  sCheckListBox1.Checked[2]:=True;
  sCheckListBox1.Checked[3]:=True;
  sCheckListBox1.ItemEnabled[3]:=false;
//  if sCheckListBox1.Checked[3]=True then
  
      OpenDialog1.InitialDir:=initdir;
  // sDirectoryEdit1.InitialDir:=initdir;

//  if SelectDirectory(initdir, [sdAllowCreate, sdPerformCreate, sdPrompt],SELDIRHELP) then
//    Label1.Caption := initdir;

end;

//*************************************************

procedure TForm1.sComboBox1Exit(Sender: TObject);
var
  Index: Integer;

begin

  Index := sComboBox1.Items.Count - 1;
  while (Index >= 0) and (sComboBox1.Text <> sComboBox1.Items[Index]) do
    Dec(Index);
  // ??? Index:=ComboBox1.Items.IndexOf(ComboBox1.Text);
  if Index = -1 then
  begin
    sComboBox1.Items.Append(sComboBox1.Text);
    sComboBox1.Items.SaveToFile(extractfilepath(paramstr(0)) +'masks.txt');

  end;

end;

//*************************************************

procedure TForm1.F1Click(Sender: TObject);
const
  SELDIRHELP = 1000;

begin

  if FileCtrl.SelectDirectory(initdir, [sdAllowCreate, sdPerformCreate,
    sdPrompt], SELDIRHELP) then
    sComboBox2.Text := initdir;

end;

//*************************************************

procedure TForm1.lblFolderslbl1Click(Sender: TObject);
begin

  RichEdit1.Lines.LoadFromFile(extractfilepath(paramstr(0)) +'foldersHist.txt');
  FileName := extractfilepath(paramstr(0)) +'foldersHist.txt';

end;

//*************************************************

procedure TForm1.MasksPanel3Click(Sender: TObject);
begin

  RichEdit1.Lines.LoadFromFile(extractfilepath(paramstr(0)) +'masks.txt');
  FileName := extractfilepath(paramstr(0)) +'masks.txt';

end;

//*************************************************

procedure TForm1.sComboBox2Exit(Sender: TObject);
var
  Index: Integer;

begin

  Index := sComboBox2.Items.Count - 1;
  while (Index >= 0) and (sComboBox2.Text <> sComboBox2.Items[Index]) do
    Dec(Index);
  // ??? Index:=ComboBox1.Items.IndexOf(ComboBox1.Text);
  if Index = -1 then
  begin
    sComboBox2.Items.Append(sComboBox2.Text);
    sComboBox2.Items.SaveToFile(extractfilepath(paramstr(0)) + 'foldersHist.txt');

  end;

end;

//*************************************************

procedure TForm1.SpellChecker1Cancel(Sender: TObject);
begin

  // ShowMessage(('Stop spellchecking?'));
  stopchecking := False;
  case MessageDlg('Stop spellchecking?', mtConfirmation,
    [mbYes, mbNo, mbCancel], 0) of
    idYes: stopchecking := true;

    //idCancel: CanClose := False;
  end

end;

procedure TForm1.H1Click(Sender: TObject);
begin

  if sRichEdit1.Visible then
    sRichEdit1.Visible := False
  else
    sRichEdit1.Visible := True;

end;

procedure TForm1.S1Click(Sender: TObject);
begin

  if sCheckListBox1.Visible then
    sCheckListBox1.Visible := False
  else
  begin
    sCheckListBox1.Visible := True;
    sCheckListBox1.SetFocus;
  end;

end;

procedure TForm1.sCheckListBox1Exit(Sender: TObject);
begin
       sCheckListBox1.Visible:=False;
end;

end.

