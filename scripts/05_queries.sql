/*Seleziona il nome e la Partita IVA dei pescatori la cui media delle 
Temperature medie delle Ordinazioni da loro vendute è superiore a 5 gradi.*/
SELECT Pescatore.Nome, Pescatore.PartitaIVA
	FROM Pescatore
		JOIN Bundle ON Pescatore.PartitaIVA = Bundle.Pescatore
		JOIN Ordinazione ON Bundle.Ordinazione = Ordinazione.CodiceOrdine
	WHERE Bundle.Venduto
	GROUP BY Pescatore.PartitaIVA, Pescatore.Nome
	HAVING AVG(Ordinazione.TemperaturaMediaAlMomentoDelRitiro) > 5;

/*Seleziona i Clienti che vivono nella zona “Praiano1” che hanno effettuato ordinazioni presso un’altra zona.*/
SELECT Username, Cliente.Nome, Cognome
	FROM Cliente, Via
	WHERE Cliente.Via = Via.Nome AND
		Cliente.Zona = Via.Zona AND
		Cliente.Citta = Via.Citta AND
		Via.Zona = 1 AND
		Via.Citta = 'Praiano'
INTERSECT
SELECT Username, Nome, Cognome
	FROM Cliente, Ordinazione
	WHERE Ordinazione.Cliente = Cliente.Username AND 
		(Ordinazione.Zona <> 1 OR
		Ordinazione.Citta <> 'Praiano');

/*rider che non condividono la zona con nessun altro rider e hanno consegnato più ordinazioni della media*/
SELECT nome, zona, citta
	FROM Rider AS r1
	WHERE NOT EXISTS (SELECT * 
						FROM Rider AS r2
						WHERE r1.CodiceRider <> r2.CodiceRider AND
							r1.Zona = r2.Zona AND
							r1.Citta = r2.Citta) 
		AND
		(SELECT AVG(ordinazioni_consegnate) AS media_consegne
			FROM (SELECT rider, COUNT(*) AS ordinazioni_consegnate
					FROM Ordinazione
					WHERE Rider IS NOT NULL
					GROUP BY Rider) AS t) 
		<
		(SELECT COUNT(*)
			FROM Ordinazione
			WHERE r1.CodiceRider = Ordinazione.Rider);

/*query aggiuntiva*/
SELECT Ordinazione.Citta, AVG(Ordinazione.TemperaturaMediaAlMomentoDelRitiro)
		AS temperatura_media, SUM(Ordinazione.QuantitaBundle) AS numero_tot_bundle
	FROM Ordinazione, Zona
	WHERE (Zona.NumeroAbitanti > 1000 AND
		Ordinazione.Citta = Zona.Citta AND 
		Ordinazione.Zona = Zona.NumeroZona)
	GROUP BY Ordinazione.Citta
	HAVING AVG(Ordinazione.QuantitaBundle) > 2
	ORDER BY AVG(Ordinazione.TemperaturaMediaAlMomentoDelRitiro) desc;

/*view che permette di accedere semplicemente ad informazioni relative alle ordinazioni che dovrebbero calcolarsi*/
SELECT * FROM costoordinazioni;

SELECT cliente, SUM(peso) AS peso_acquistato, SUM(costo_ordine) AS costo_acquisti
	FROM CostoOrdinazioni JOIN Ordinazione ON
		(costoOrdinazioni.ordinazione = codiceordine)
	GROUP BY cliente
	ORDER BY costo_acquisti desc;

SELECT citta.nome, AVG(peso) AS peso_acquistato
	FROM CostoOrdinazioni, Ordinazione, Citta
	WHERE costoOrdinazioni.ordinazione = codiceordine AND
		citta.nome = Ordinazione.citta
	GROUP BY citta.nome
	HAVING citta.estensione > 1.5;
