CREATE VIEW CostoOrdinazioni(ordinazione, numero_bundle, costo_ordine, peso) AS
    SELECT ordinazione, quantitaBundle AS numero_bundle, SUM(prezzo), SUM(peso)
    FROM Bundle, Ordinazione
    WHERE venduto
      AND Bundle.ordinazione = codiceOrdine
    GROUP BY ordinazione, Ordinazione.codiceOrdine
    ORDER BY SUM(prezzo) DESC;
