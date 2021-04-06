//CONSULTA SQL COM ADVPL

USER FUNCTION BANCO001()

	Local aArea := 	SB1->(GetArea())
	Local cQuery := “”
	Local aDados := {}

	cQuery := “ SELECT “
	cquery += “ B1_COD AS CODIGO, ”
	cQuery += “B1_DESC AS DESCRICAO ”
	cQuery += “FROM ”
	cQuery += “ “+ RetSQLName(“SB1”) + “SB1”
	
	
	//Executando a consulta acima
	TCQuery cQuery New Alias “TMP”
	
	While ! TMP->(EoF())
		AADD(aDados, TMP->CODIGO)
		AADD(aDados, TMP->DESCRICAO)
		TMP->(DbSkip())
	EndDo

Alert(Len(aDados))

	For nCount := 1 To Len(aDados)
		msgInfo(aDados[nCount])
	Next nCount

//Fecha a tabela Temporaria
	TMP->(DbCloseArea())

Return