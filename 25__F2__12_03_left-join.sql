-- Listar todas as localidades cujos utentes nunca realizaram consulta

SELECT CP.codigo_postal, CP.localidade

FROM codigo_postal CP
    LEFT JOIN utente U
        ON CP.codigo_postal = U.codigo_postal
    LEFT JOIN consulta_medica CM
        ON U.numero_utente = CM.utente

WHERE CM.realizada = 0;        
