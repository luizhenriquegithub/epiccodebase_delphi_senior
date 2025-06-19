inherited FrmConsCliente: TFrmConsCliente
  Caption = 'Consulta de Clientes'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 13
  inherited Panel3: TPanel
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 912
    inherited lblFiltro: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited edConsulta: TEdit
      Width = 559
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 557
    end
    inherited ComboCompo: TComboBox
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited btnProcurar: TButton
      Left = 799
      ExplicitLeft = 797
    end
  end
  inherited CoolBar1: TCoolBar
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 24
        Width = 908
      end>
    ExplicitWidth = 912
    inherited ToolBar1: TToolBar
      inherited ToolButton1: TToolButton
        ExplicitWidth = 56
      end
    end
  end
  inherited CoolBar2: TCoolBar
    Bands = <
      item
        Control = ToolBar2
        ImageIndex = -1
        MinHeight = 27
        Width = 908
      end>
    ExplicitWidth = 912
    inherited ToolBar2: TToolBar
      inherited TBCadastrar: TToolButton
        OnClick = TBCadastrarClick
      end
    end
  end
  inherited StatusBar1: TStatusBar
    ExplicitTop = 613
    ExplicitWidth = 912
  end
end
