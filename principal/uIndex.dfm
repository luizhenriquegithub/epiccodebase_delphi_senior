object FrmIndex: TFrmIndex
  Left = 0
  Top = 0
  Caption = 'Gest'#227'o de Ordens de Servi'#231'o (OS)'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainIndex
  WindowState = wsMaximized
  TextHeight = 15
  object StatusBar1: TStatusBar
    Left = 0
    Top = 422
    Width = 624
    Height = 19
    Panels = <>
    ExplicitTop = 414
    ExplicitWidth = 622
  end
  object MainIndex: TMainMenu
    Left = 288
    Top = 152
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object Fecharaplicao1: TMenuItem
        Caption = 'Sair'
        OnClick = Fecharaplicao1Click
      end
    end
    object Cadastro1: TMenuItem
      Caption = 'Cadastros'
      object Clientes1: TMenuItem
        Caption = 'Clientes'
        OnClick = Clientes1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Tecnicos1: TMenuItem
        Caption = 'T'#233'cnicos'
        OnClick = Tecnicos1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object StatusdaOS1: TMenuItem
        Caption = 'Status da OS'
        OnClick = StatusdaOS1Click
      end
    end
    object OrdemdeSevio1: TMenuItem
      Caption = 'Ordem de Sevi'#231'o'
      object AberuradeOS1: TMenuItem
        Caption = 'Aberura de OS'
      end
    end
  end
end
