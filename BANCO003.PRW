#INCLUDE 'PROTHEUS.CH'
#INCLUDE 'PARMTYPE.CH'

User Function BANCO003()

    Local aArea := GetArea()
    Local aDados := {}
    Private lMSErroAuto := .F.

    aDados := {;
                {"B1_COD", "11111", , NIL},;
                {"B1_TIPO", "GG",   , NIL},;
                {"B1_UM", "UN",     , NIL},;
                {"B1_LOCPAD", "1",  , NIL},;
                {"B1_CONTRAT", "N", , NIL},;
                {"B1_LOCALIZ", "N", , NIL};
                }
    //INICIO DO CONTROLE DE TRANSACAO
    Begin Transaction
        //MATA010
        MsExecAuto({|x,y|Mata010(x,y),aDados,3|})//INCLUIR


        If lMSErroAuto := .T.
            Alert("Ocorreram erros durante a operacao")
            MostraErro()

            DisarmTransaction()

        Else
            MsgInfo("Operacao finalizada")
        EndIf
        
        End Transaction

        RestArea(aArea)

Return
