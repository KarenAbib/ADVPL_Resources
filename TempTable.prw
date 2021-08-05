#INCLUDE 'TOTVS.CH'

    /*/{Protheus.doc} zLogi
    (Alterando registro com Reclock)
    @type  Function
    @author Karen Abib  
    @since 04/08/2021
    @version 1.0
    /*/
User Function zLogi()
    Local aArea         := GetArea()
    Local cAliasTemp    := "TMP_XPTO"

    //Cria a tabela temporária
    oTempTable := FWTemporaryTable():New(cAliasTemp)

    //Adiciona o array das colunas que serão incluidas (Nome do campo, Tipo do Campo, Tamanho, Decimais)
    aFields := {}
    aAdd(aFields, {"FILIAL", "C", 2 ,0})
    aAdd(aFields, {"NOME", "C", 50 ,0})
    aAdd(aFields, {"VALOR", "N", 8 ,2})
    aAdd(aFields, {"EMISSAO", "D", 8 ,0})

    //Define as colunas usadas
    oTempTable:SetFields( aFields )

    //Cria índice com colunas setadas anteriormente
    oTempTable:AddIndex("INDICE1", {"FILIAL", "NOME"} )

    //Efetua a criação da tabela
    oTempTable:Create()

    RecLock( cAliasTemp, .T.)
        (cAliasTemp)->FILIAL    := ""
        (cAliasTemp)->NOME      := "Name"
        (cAliasTemp)->VALOR     := 30
        (cAliasTemp)->EMISSAO   := Date()
        (cAliasTemp)->(MsUnlock())

    Alert("Nome real da temporária: [" + oTempTable:GetRealName() + "]")

    //Excluindo a temporária
    oTempTable:Delete()

    RestArea(aArea)
        
    MsUnlock()

Return
