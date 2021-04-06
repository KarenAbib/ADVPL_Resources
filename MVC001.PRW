//Autor: Karen Abib

//CONSTRUCAO DA MENUDEF
Static Function MenuDef()

    Local aRotina := {}

    Add OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.MVC001' OPERATION 2 ACESSO 0
    Add OPTION aRotina TITLE 'Incluir' ACTION 'VIEWDEF.MVC001' OPERATION 3 ACESSO 0
    Add OPTION aRotina TITLE 'Alterar' ACTION 'VIEWDEF.MVC001' OPERATION 4 ACESSO 0
    Add OPTION aRotina TITLE 'Excluir' ACTION 'VIEWDEF.MVC001' OPERATION 5 ACESSO 0
    Add OPTION aRotina TITLE 'Pesquisar' ACTION 'VIEWDEF.MVC001' OPERATION 1 ACESSO 0

    Return aRotina
    /*
    1 - Pesquisar
    2 - Visualizar
    3 - Incluir
    4 - Alterar
    5 - Excluir
    7 - Copiar
    */

Static Function ModelDef()

    Local oModel := Nil
    Local oStZZB := FwFormStruct(1, "ZZB") //1 - Model   

    //Instanciando Modelo de Dados
    oModel := MPFormModel():New("ZMODEL", , , ,)

    oModel:AddFields("FORMZZB", , oStZZB)

    oModel:SetPrimaryKey({'ZZB_FILIAL','ZZB_COD'})
Return
