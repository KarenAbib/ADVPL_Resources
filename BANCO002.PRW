   #include 'protheus.ch'
   #include 'parmtype.ch'

   User Function BANCO002() 
    Local aArea

    DbSelectArea('SB1')
    SB1->(DbSetOrder(1))
    SB1->(DbGoTop())

    //Init transaction
    Begin Transaction 

        MsgInfo("A descricao do produto sera alterada")
        
        If SB1->(DbSeek(FWxFilial('SB1') + '000002'))
            ReckLock('SB1', .F.)
        Replace B1_DESC With "PRODUTO 02" //ALTERACAO DA DESCRICAO

            SB1->(MsUnlock())
        EndIf

        MsgAlert("Alteracao efetuada")

        End Transaction
        RestArea(aArea) 

    Return
