#INCLUDE 'PROTHEUS.CH'
#INCLUDE 'PARMTYPE.CH'

//PROGRAMA DE ATUALIZACAO UTILIZANDO AXCADASTRO
User Function MODELO01()
    Local cAlias := "SB1"
    Local cTitulo := "Cadastro - AXCadastro"
    Local cVldExc := .T.
    Local cVldAlt := .T.

    AxCadastro(cAlias, cTitulo, cVldAlt)

    Return NIL
