object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Call Microsoft Visual Studio C from Delphi'
  ClientHeight = 439
  ClientWidth = 518
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 32
    Top = 24
    Width = 185
    Height = 289
    Caption = 'Sum values'
    TabOrder = 0
    object lblFirstValue: TLabel
      Left = 15
      Top = 147
      Width = 91
      Height = 13
      Caption = 'Passed First Value:'
    end
    object lblSecondValue: TLabel
      Left = 16
      Top = 197
      Width = 105
      Height = 13
      Caption = 'Passed Second Value:'
    end
    object Label5: TLabel
      Left = 15
      Top = 24
      Width = 167
      Height = 52
      Caption = 
        'Send values for calculation in C display result in Delphi. The c' +
        'alculation sums a public Delphi variable'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object lblPubIntVar: TLabel
      Left = 15
      Top = 96
      Width = 92
      Height = 13
      Caption = 'Public Delphi Value:'
    end
    object edFirstValue: TEdit
      Left = 15
      Top = 166
      Width = 121
      Height = 21
      TabOrder = 0
      Text = '13'
    end
    object edSecondValue: TEdit
      Left = 16
      Top = 216
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '15'
    end
    object btAddValues: TButton
      Left = 15
      Top = 248
      Width = 75
      Height = 25
      Caption = '&Calculate'
      TabOrder = 2
      OnClick = btAddValuesClick
    end
    object edPublicIntVal: TEdit
      Left = 15
      Top = 116
      Width = 121
      Height = 21
      TabOrder = 3
      Text = '100'
    end
  end
  object GroupBox2: TGroupBox
    Left = 240
    Top = 24
    Width = 265
    Height = 289
    Caption = 'Strings'
    TabOrder = 1
    object lblCaption: TLabel
      Left = 16
      Top = 147
      Width = 37
      Height = 13
      Caption = 'Caption'
    end
    object lblMessage: TLabel
      Left = 16
      Top = 197
      Width = 26
      Height = 13
      Caption = 'Text:'
    end
    object lblDispStrings: TLabel
      Left = 16
      Top = 32
      Width = 217
      Height = 26
      Caption = 
        'Send string to display in C and receive string from C to dsplay ' +
        'in Delphi'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object lblPublicStrVar: TLabel
      Left = 16
      Top = 96
      Width = 94
      Height = 13
      Caption = 'Public Delphi String:'
    end
    object edCaption: TEdit
      Left = 16
      Top = 166
      Width = 169
      Height = 21
      TabOrder = 0
      Text = 'Hello from Delphi'
    end
    object edMessage: TEdit
      Left = 16
      Top = 216
      Width = 217
      Height = 21
      TabOrder = 1
      Text = 'Delphi sent this message to Visual Studio for display'
    end
    object btShowMessage: TButton
      Left = 16
      Top = 248
      Width = 83
      Height = 25
      Caption = '&Show Message'
      TabOrder = 2
      OnClick = btShowMessageClick
    end
    object edPublicStrVal: TEdit
      Left = 16
      Top = 115
      Width = 169
      Height = 21
      TabOrder = 3
      Text = 'I am a public Delphi String'
    end
  end
  object GroupBox3: TGroupBox
    Left = 32
    Top = 340
    Width = 185
    Height = 91
    Caption = 'Get public variables from C'
    TabOrder = 2
    object btGeetCVars: TButton
      Left = 3
      Top = 24
      Width = 103
      Height = 25
      Caption = 'Get Integer'
      TabOrder = 0
      OnClick = btGeetCVarsClick
    end
    object btGetString: TButton
      Left = 3
      Top = 55
      Width = 103
      Height = 25
      Caption = 'Get String'
      TabOrder = 1
      OnClick = btGetStringClick
    end
  end
end
