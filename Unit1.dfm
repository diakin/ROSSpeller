object Form1: TForm1
  Left = 590
  Top = 75
  Width = 885
  Height = 698
  Caption = 'Form1'
  Color = 14614508
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RichEdit1: TRichEdit
    Left = 0
    Top = 0
    Width = 122
    Height = 345
    Align = alClient
    BevelEdges = []
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clMoneyGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Source Code Pro'
    Font.Style = []
    HideSelection = False
    ParentFont = False
    PlainText = True
    ScrollBars = ssVertical
    TabOrder = 0
    WordWrap = False
    OnChange = RichEdit1Change
  end
  object Panel1: TPanel
    Left = 0
    Top = 448
    Width = 877
    Height = 199
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object ListBox1: TListBox
      Left = 0
      Top = 0
      Width = 877
      Height = 180
      Align = alClient
      BorderStyle = bsNone
      Color = 16767483
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Source Code Pro'
      Font.Style = []
      ItemHeight = 15
      ParentFont = False
      TabOrder = 1
      OnClick = ListBox1Click
    end
    object StatusBar1: TStatusBar
      Left = 0
      Top = 180
      Width = 877
      Height = 19
      Panels = <>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 345
    Width = 877
    Height = 103
    Align = alBottom
    Color = 10944511
    TabOrder = 2
    object SpellLanguageComboBox1: TSpellLanguageComboBox
      Left = 789
      Top = 73
      Width = 23
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 0
      Visible = False
    end
    object GoSpellBtn: TButton
      Left = 4
      Top = 62
      Width = 75
      Height = 37
      Caption = 'GoSpell'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = GoSpellBtnClick
    end
    object FoldListMemo2: TMemo
      Left = 844
      Top = 51
      Width = 32
      Height = 51
      Align = alRight
      BorderStyle = bsNone
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Source Code Pro'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = False
      WordWrap = False
    end
    object Memo1: TMemo
      Left = 603
      Top = 51
      Width = 241
      Height = 51
      Align = alRight
      BorderStyle = bsNone
      Color = clGradientInactiveCaption
      ScrollBars = ssVertical
      TabOrder = 3
      WordWrap = False
      OnChange = Memo1Change
    end
    object sRadioButton1: TRadioButton
      Left = 81
      Top = 62
      Width = 105
      Height = 17
      Caption = 'Only current file'
      TabOrder = 4
    end
    object sRadioButton2: TRadioButton
      Left = 81
      Top = 81
      Width = 117
      Height = 17
      Caption = 'Batch spellchecking'
      Checked = True
      TabOrder = 5
      TabStop = True
    end
    object sPanel1: TPanel
      Left = 1
      Top = 1
      Width = 875
      Height = 50
      Align = alTop
      BevelOuter = bvNone
      Caption = 'sPanel1'
      Color = clPurple
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 6
      object pnl1: TPanel
        Left = 788
        Top = 25
        Width = 87
        Height = 25
        Align = alRight
        BevelOuter = bvNone
        Color = clTeal
        TabOrder = 0
        object btnGetFileBtn: TButton
          Left = 1
          Top = -1
          Width = 87
          Height = 27
          Caption = 'GetFiles'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = btnGetFileBtnClick
        end
      end
      object sPanel2: TPanel
        Left = 0
        Top = 0
        Width = 875
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Color = 9691267
        TabOrder = 1
        object lblFolderslbl1: TLabel
          Left = 0
          Top = 0
          Width = 91
          Height = 25
          Hint = 'Edit folders history'
          Align = alLeft
          Alignment = taCenter
          Anchors = [akLeft, akBottom]
          AutoSize = False
          Caption = 'Folders History'
          Color = 9691267
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Layout = tlCenter
          OnClick = lblFolderslbl1Click
        end
        object sComboBox2: TComboBox
          Left = 91
          Top = 0
          Width = 784
          Height = 24
          AutoDropDown = True
          Color = 9691267
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 16
          ParentFont = False
          TabOrder = 0
          Text = 'sComboBox2'
          OnExit = sComboBox2Exit
          Items.Strings = (
            '111111'
            '22222'
            '3333'
            '4444')
        end
      end
      object sComboBox1: TComboBox
        Left = 91
        Top = 25
        Width = 697
        Height = 24
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 16
        ParentFont = False
        TabOrder = 2
        Text = '*.h;*.c*'
        OnExit = sComboBox1Exit
        Items.Strings = (
          '*.h;*.c*')
      end
      object MasksPanel3: TPanel
        Left = 0
        Top = 25
        Width = 91
        Height = 25
        Hint = 'Edit masks list'
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'Files\Masks'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = MasksPanel3Click
      end
    end
    object sPanel3: TPanel
      Left = 204
      Top = 48
      Width = 136
      Height = 55
      TabOrder = 7
      object sRadioButton3: TRadioButton
        Left = 6
        Top = 14
        Width = 91
        Height = 17
        Caption = 'Prompt to save'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object sRadioButton4: TRadioButton
        Left = 5
        Top = 33
        Width = 68
        Height = 17
        Caption = 'Auto Save'
        TabOrder = 1
      end
    end
  end
  object sRichEdit1: TRichEdit
    Left = 122
    Top = 0
    Width = 755
    Height = 345
    Align = alRight
    Color = clWhite
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 3
    Visible = False
    WordWrap = False
  end
  object sCheckListBox1: TCheckListBox
    Left = 84
    Top = 0
    Width = 181
    Height = 265
    AllowGrayed = True
    BevelOuter = bvRaised
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 13
    Items.Strings = (
      'Ignore all-caps words'
      'Ignore Words with Numbers'
      'Ignore Roman numerals'
      'Ignore MixedCaps'
      'Find uncapped sentences'
      'Find missing spaces'
      'Find repead word'
      'Find extra spaces'
      'Find spaces before punctuation'
      'Find spaces after punctuation'
      'Rate suggestions'
      'Find initial numerals'
      'Show finish message'
      'HTML support'
      'Suggest from user dictionary'
      'Modal dialog')
    ParentFont = False
    TabOrder = 4
    Visible = False
    OnExit = sCheckListBox1Exit
  end
  object MainMenu1: TMainMenu
    Left = 659
    Top = 60
    object File1: TMenuItem
      Caption = 'File'
      object Open1: TMenuItem
        Caption = 'Open'
        OnClick = Open1Click
      end
      object Save1: TMenuItem
        Caption = 'Save'
        OnClick = Save1Click
      end
      object Saveas1: TMenuItem
        Caption = 'Save as..'
        OnClick = Saveas1Click
      end
    end
    object F1: TMenuItem
      Caption = 'Folder'
      OnClick = F1Click
    end
    object S1: TMenuItem
      Caption = 'Settings'
      OnClick = S1Click
    end
    object U1: TMenuItem
      Caption = 'User dictionary'
    end
    object H1: TMenuItem
      Caption = 'Help'
      OnClick = H1Click
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = '*.h;*.c*'
    Left = 656
    Top = 10
  end
  object SaveDialog1: TSaveDialog
    Left = 658
    Top = 118
  end
  object SpellChecker1: TSpellChecker
    Language = 2057
    SpellerType = sptISpell
    UserLanguage = ulEnglish
    Options = [spoSuggestFromUserDict, spoIgnoreAllCaps, spoIgnoreMixedDigits, spoIgnoreRomanNumerals]
    OnCancel = SpellChecker1Cancel
    Caption = '1111'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    MisspellFont.MspName = 'Arial'
    MisspellFont.MspColor = clRed
    MisspellFont.MspStyle = []
    ModalDialog = True
    FinishMessage = 'All done!'
    ShowFinishMessage = False
    Left = 560
    Top = 15
  end
end
