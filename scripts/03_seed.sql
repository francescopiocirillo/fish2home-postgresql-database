/*INIZIA LA FASE DI POPOLAMENTO*/
/*segue la creazione di tuple della relazione pescatore*/
INSERT INTO citta(nome, estensione)
	VALUES( 'Positano', 8.65);
INSERT INTO citta(nome, estensione)
	VALUES( 'Praiano', 2.67);
INSERT INTO citta(nome, estensione)
	VALUES( 'Furore', 1.88);
INSERT INTO citta(nome, estensione)
	VALUES( 'Conca dei Marini', 1.13);

/*segue la creazione di tuple della relazione zona*/
INSERT INTO zona(numeroZona, citta, numeroAbitanti)
	VALUES( 1, 'Positano', 1860);
INSERT INTO zona(numeroZona, citta, numeroAbitanti)
	VALUES( 2, 'Positano', 1860);
INSERT INTO zona(numeroZona, citta, numeroAbitanti)
	VALUES( 1, 'Praiano', 1977);
INSERT INTO zona(numeroZona, citta, numeroAbitanti)
	VALUES( 1, 'Furore', 681);
INSERT INTO zona(numeroZona, citta, numeroAbitanti)
	VALUES( 1, 'Conca dei Marini', 677);

/*segue la creazione di tuple della relazione via*/
INSERT INTO via(nome, zona, citta)
	VALUES ('Via Cristoforo Colombo', 2, 'Positano');
INSERT INTO via(nome, zona, citta)
	VALUES ('Via Corvo', 1, 'Positano');
INSERT INTO via(nome, zona, citta)
	VALUES ('Via Gavitella', 1, 'Praiano');
INSERT INTO via(nome, zona, citta)
	VALUES ('Via Antico Seggio', 1, 'Praiano');
INSERT INTO via(nome, zona, citta)
	VALUES ('Via Aldo Moro', 1, 'Furore');
INSERT INTO via(nome, zona, citta)
	VALUES ('Via Croce', 1, 'Furore');
INSERT INTO via(nome, zona, citta)
	VALUES ('Via delle Querce', 1, 'Conca dei Marini');
INSERT INTO via(nome, zona, citta )
	VALUES ('Via Liscia', 1, 'Conca dei Marini');

/*segue la creazione di tuple della relazione metodo di pesca*/	
INSERT INTO MetodoDiPesca(nome)
	VALUES('Reti a strascico');
INSERT INTO MetodoDiPesca(nome)
	VALUES('Pesca con palangari');
INSERT INTO MetodoDiPesca(nome)
	VALUES('Pesca con reti a strascico');
INSERT INTO MetodoDiPesca(nome)
	VALUES('Pesca con la canna');
INSERT INTO MetodoDiPesca(nome)
	VALUES('Pesca con nasse');

/*segue la creazione di tuple della relazione pratica*/
begin;
INSERT INTO pratica(metododipesca, pescatore)
	VALUES('Reti a strascico', '01234567890');
INSERT INTO pratica(metododipesca, pescatore)
	VALUES('Pesca con nasse', '01234567890');
INSERT INTO pratica(metododipesca, pescatore)
	VALUES('Pesca con palangari', '98765432109');
INSERT INTO pratica(metododipesca, pescatore)
	VALUES('Pesca con nasse', '98765432109');
INSERT INTO pratica(metododipesca, pescatore)
	VALUES('Pesca con reti a strascico', '11223344556');
INSERT INTO pratica(metododipesca, pescatore)
	VALUES('Pesca con la canna', '11223344556');
INSERT INTO pratica(metododipesca, pescatore)
	VALUES('Pesca con la canna', '01107027890');
INSERT INTO pratica(metododipesca, pescatore)
	VALUES('Pesca con la canna', '98765200602');
INSERT INTO pratica(metododipesca, pescatore)
	VALUES('Pesca con la canna', '11223342024');
/*segue la creazione di tuple della relazione pescatore*/
INSERT INTO pescatore(partitaIVA, via, zona, citta, numeroCivico, codiceFiscale, nome, pw, descrizione, iban)
	VALUES( '01234567890', 'Via Cristoforo Colombo', 2, 'Positano', 31, 'RSSMRA80A01H501Q', 
		   'F.lli Rossi', 'mariorossiP2', 
		   'Famiglia di pescatori della costiera amalfitana che offre solo prodotti ittici di primissima qualità',
		   'IT12X3456789012345678901234');
INSERT INTO pescatore(partitaIVA, via, zona, citta, numeroCivico, codiceFiscale, nome, pw, descrizione, iban)
	VALUES( '98765432109', 'Via Antico Seggio', 1, 'Praiano', 25, 'FRRGNN85A01H123X', 
		   'Mare Chiaro', 'giovanniferraroP1', 
		   'pescatore amalfitano appassionato di barche', 'IT98Y3456789012345678901234');
INSERT INTO pescatore(partitaIVA, via, zona, citta, numeroCivico, codiceFiscale, nome, pw, descrizione, iban)
	VALUES( '11223344556', 'Via Aldo Moro', 1, 'Furore', 14, 'MSSNNA81F01H331Q', 'Non solo pesce',
		   'annamossaF1', 'premio miglior pescatrice donna in Italia 2022',
		   'IT76Z3456789012345678901234');
INSERT INTO pescatore(partitaIVA, via, zona, citta, numeroCivico, codiceFiscale, nome, pw, iban)
	VALUES( '01107027890', 'Via Corvo', 1, 'Positano', 11, 'CNTMTE88A12F205W', 
		   'Pescheria marini', 'matteoContiPescheria', 'IT12X3456789012345678902024');
INSERT INTO pescatore(partitaIVA, via, zona, citta, numeroCivico, codiceFiscale, nome, pw, iban)
	VALUES( '98765200602', 'Via delle Querce', 1, 'Conca dei Marini', 2, 'DLCSRA93C13F205M', 
		   'Mare', 'SaraDeLucaaa8', 'IT98Y3456789012345678902023');
INSERT INTO pescatore(partitaIVA, via, zona, citta, numeroCivico, codiceFiscale, nome, pw, iban)
	VALUES( '11223342024', 'Via Liscia', 1, 'Conca dei Marini', 41, 'MRTDVD85R15F205N', 'Pescheria felice', 
		   'DavideMaretto', 'IT76Z3456789012345678902022');
commit;

/*segue la creazione di tuple della relazione barca*/
INSERT INTO Barca(targa, proprietario, dataImmatricolazione, NMotori, descrizioneTipologia, lunghezza, nome)
	VALUES('BA123AB', '01234567890', '2020-08-05', 2, 'Barca da traina', 9.00, 'Santa Maria');
INSERT INTO Barca(targa, proprietario, dataImmatricolazione, NMotori, descrizioneTipologia, lunghezza, nome)
	VALUES('MI345GH', '11223344556', '2022-07-15', 2, 'Barca da traina', 10.00, 'Sofia Benedetta');
INSERT INTO Barca(targa, proprietario, dataImmatricolazione, NMotori, descrizioneTipologia, lunghezza, nome)
	VALUES('TO567OP', '98765432109', '2019-12-20', 1, 'Barca da pesca cabinata', 8.00, 'Santa Marianna');
INSERT INTO Barca(targa, proprietario, dataImmatricolazione, NMotori, lunghezza, nome)
	VALUES('TO567AF', '01107027890', '2019-12-20', 1,  7.50, 'Luisella');

/*segue la creazione di tuple della relazione cliente*/
INSERT INTO cliente(username, dataNascita, cognome, nome, pw, codiceFiscale, via, zona, citta, numeroCivico)
	VALUES('FrancescoDeAngelis', '1984-07-02', 'De Angelis', 'Francesco', 
		   '$2y$10$3Bzws0AvwI8goVnid6hsCe7sTws5aED8p385.BcXpYXMvsfKwA0/q', 'DNGFNC84B07H412K', 
		   'Via Corvo', 1, 'Positano', 80);
INSERT INTO cliente(username, dataNascita, cognome, nome, pw, codiceFiscale, via, zona, citta, numeroCivico)
	VALUES('AlessiaGiuliani', '1976-10-23', 'Giuliani', 'Alessia', 
		   '$2y$10$weWgG.Rk8ouv2TlJ2pBADuXikicf.JyFYqiI9M4yETNDeXbyRoh8C', 
		   'GLNLSS76R23H804L', 'Via Croce', 1, 'Furore', 12);
INSERT INTO cliente(username, dataNascita, cognome, nome, pw, codiceFiscale, via, zona, citta, numeroCivico)
	VALUES('Conti1992', '1992-12-08', 'Conti', 'Laura', 
		   '$2y$10$OUEOMFhcD1ZjWC587PxKCeKsjL9XUPkG7zqHGKRcwF1K1QmE8tIxW',
		   'CNTLRA92M12H315J', 'Via Gavitella', 1, 'Praiano', 1);
INSERT INTO cliente(username, dataNascita, cognome, nome, pw, codiceFiscale, via, zona, citta, numeroCivico)
	VALUES('GiovanniNovembre', '1987-11-29', 'Moretti', 'Giovanni', 
		   '$2y$10$EraILy1Nc3MDbaqy5GNmbexZjlY6omaTVtNaoaspSdjmTdxaqW8X6',
		   'MRTGNN87S29H627G', 'Via Liscia', 1, 'Conca dei Marini', 27);
INSERT INTO cliente(username, dataNascita, cognome, nome, pw,codiceFiscale, via, zona, citta, numeroCivico)
	VALUES('Ferrari02', '1988-09-03', 'Ferrari', 'Simone', 
		   '$2y$10$xrwwvZohBYHNdVsyt.RKxOLV.IUZc.mpmV3haq6ybAV7A6s99CGL.',
		   'FRRSMN89T08F205Q', 'Via Liscia', 1, 'Conca dei Marini', 2);
INSERT INTO cliente(username, dataNascita, cognome, nome, pw, codiceFiscale, via, zona, citta, numeroCivico)
	VALUES('MartinaRusso23', '1966-11-24', 'Russo', 'Martina', 
		   '$2y$10$Jw3WmG4UpSCKCn975/9QnOjnk39CCJYMFI5dEiRoWNj85QOW9e5RS',
		   'RSSMRT96D47F205J', 'Via Gavitella', 1, 'Praiano', 30);
INSERT INTO cliente(username, dataNascita, cognome, nome, pw, codiceFiscale, via, zona, citta, numeroCivico)
	VALUES('Curso08', '1962-11-18', 'Caruso', 'Francesco', 
		   '$2y$10$4goGb8lIk96oyF9IH0LqnO1Ysni73OKc/0Nh84qKF0pIzmHWZ5vPq',
		   'CRSFNC87R14F205T', 'Via Cristoforo Colombo', 2, 'Positano', 11);
INSERT INTO cliente(username, dataNascita, cognome, nome, pw, codiceFiscale, via, zona, citta, numeroCivico)
	VALUES('GiugliGalli60', '1960-01-09', 'Galli', 'Giulia', 
		   '$2y$10$O.6FyaGqh7ccWXmIMJfmnu4MrlCq6/UryT7nMzanECtOezIllB16a',
		   'GLLGLI94M41F205L', 'Via Cristoforo Colombo', 2, 'Positano', 22);

/*segue la creazione di tuple della relazione rider*/
INSERT INTO rider(codiceRider, cognome, nome, zona, citta, dataNascita, pw, iban, codiceFiscale)
	VALUES('001', 'Romano', 'Annamaria', 1, 'Positano', '1988-08-05', 
		   '$2y$10$98oITI2DGNJfHaSy2MGgp.FtmxcZSYLgU7c8pXIloOpdSph2lIjEG',
		   'IT34R3456789012345678901234', 'RMNNM73D03H736F');	
INSERT INTO rider(codiceRider, cognome, nome, zona, citta, dataNascita, pw, iban, codiceFiscale)
	VALUES('002', 'Esposito', 'Marco', 2, 'Positano', '1998-05-12', 
		   '$2y$10$gFHVU3Io3B/1yY1SFX.bUOWJRmhNkzdSaD7TtdPiJNlyM.qxd.6Ba',
		   'IT45T3456789012345678901234', 'SPTMRC80P18H929E');
INSERT INTO rider(codiceRider, cognome, nome, zona, citta, dataNascita, pw, iban, codiceFiscale)
	VALUES('003', 'Ferrara', 'Sofia', 1, 'Praiano', '1999-07-03', 
		   '$2y$10$XMytryYlNs.4PjuRCk5RdOSBNTwjoHxtyJkBXJoCqz0BBkU4diaqq', 
		   'IT56G3456789012345678901234', 'FRRSFA95M05H208D');
INSERT INTO rider(codiceRider, cognome, nome, zona, citta, pw, iban, codiceFiscale)
	VALUES('004', 'Costa', 'Matteo', 1, 'Furore', '$2y$10$xtPUoQIzh5fRthgEfn6GSueqE83IuksDmR5YymvBpequMp3/5SwHO',
		   'IT12X3456789012345678901235', 'CSTMTT82H14H919B');
INSERT INTO rider(codiceRider, cognome, nome, zona, citta, dataNascita, pw, iban, codiceFiscale)
	VALUES('005', 'Bianchi', 'Luca', 1, 'Conca dei Marini', '2000-12-12', 
		   '$2y$10$2BnSl2he4rGypUUTHlB0fe9OG.chxhO9L5RQogP3/S3zIGsZH0Kde',
		   'IT78F3456789012345678901234', 'BNCLCA90L21H123B');
INSERT INTO rider(codiceRider, cognome, nome, zona, citta, dataNascita, pw, iban, codiceFiscale)
	VALUES('006', 'Pioggia', 'Annarita', 1, 'Positano', '1982-08-05', 
		   '$2y$10$98oITI2DGNJfHaSy2MGgp.FtmxcZSYLgU7c8pXIloOpdSph2lhfg',
		   'IT34R3456789012345678900711', 'PGNNR73D03H736F');

/*segue la creazione di tuple della relazione carta pagamneto*/
INSERT INTO CartaPagamento(NumeroCarta,	CVC, Scadenza, Cliente)
	VALUES( '4556123456789012',	'789', '2027-05-01', 'FrancescoDeAngelis');
INSERT INTO CartaPagamento(NumeroCarta,	CVC, Scadenza, Cliente)
	VALUES( '4556123456789013',	'781', '2027-08-01', 'AlessiaGiuliani');
INSERT INTO CartaPagamento(NumeroCarta,	CVC, Scadenza, Cliente)
	VALUES( '4556123456780014',	'731', '2026-08-01', 'Conti1992');	
INSERT INTO CartaPagamento(NumeroCarta,	CVC, Scadenza, Cliente)
	VALUES( '4550003456780015',	'111', '2028-01-21', 'GiovanniNovembre');
INSERT INTO CartaPagamento(NumeroCarta,	CVC, Scadenza, Cliente)
	VALUES( '2002110756789013',	'331', '2027-02-01', 'Ferrari02');
INSERT INTO CartaPagamento(NumeroCarta,	CVC, Scadenza, Cliente)
	VALUES( '2002200656789013',	'331', '2027-02-20', 'MartinaRusso23');
INSERT INTO CartaPagamento(NumeroCarta,	CVC, Scadenza, Cliente)
	VALUES( '4556123407110014',	'349', '2026-03-01', 'Curso08');
INSERT INTO CartaPagamento(NumeroCarta,	CVC, Scadenza, Cliente)
	VALUES( '4550003456780620',	'433', '2028-04-21', 'GiugliGalli60');

/*segue la creazione di tuple della relazione ordinazione*/
INSERT INTO Ordinazione(CodiceOrdine, DescrizioneConfezione, Consegnato, NumeroBollaDiAccompagnament,
	TemperaturaMediaAlMomentoDelRitiro,	OraRitiro, OraConsegna,	Cliente, Via, Zona,	Citta,
	NumeroCivico, CartaPagamento, Rider)
	VALUES('ORD00', 'Borse termiche', 'true', 40505001, 3.50,	'2024-05-05 10:00:00', '2024-05-05 12:30:00', 
		'FrancescoDeAngelis', 'Via Antico Seggio', 1, 'Praiano', 36, '4556123456789012', '003');
INSERT INTO Ordinazione(CodiceOrdine, DescrizioneConfezione, Consegnato, NumeroBollaDiAccompagnament,
	TemperaturaMediaAlMomentoDelRitiro,	OraRitiro, OraConsegna,	Cliente, Via, Zona,	Citta,
	NumeroCivico, CartaPagamento, Rider, QuantitaBundle)
	VALUES('ORD01', 'Contenitori refrigeranti','true', 40505002, 3,	'2024-05-05 11:15:00', '2024-05-05 13:45:00', 
		'AlessiaGiuliani', 'Via Croce', 1, 'Furore', 12, '4556123456789013', '004', 0);
INSERT INTO Ordinazione(CodiceOrdine, Consegnato, Cliente, Via, Zona, Citta, NumeroCivico, 
	CartaPagamento, QuantitaBundle)
	VALUES('ORD02', 'false', 'Conti1992', 'Via delle Querce', 1, 'Conca dei Marini', 20, '4556123456780014',0);
INSERT INTO Ordinazione(CodiceOrdine, DescrizioneConfezione, Consegnato, NumeroBollaDiAccompagnament,
	TemperaturaMediaAlMomentoDelRitiro,	OraRitiro, Cliente, Via, Zona, Citta,
	NumeroCivico, CartaPagamento, Rider, QuantitaBundle)
	VALUES('ORD03', 'Imballaggio sottovuoto','false', 40505112, 6, '2024-06-12 11:15:00',  
		   'GiovanniNovembre', 'Via Gavitella', 1, 'Praiano', 22, '4550003456780015', '003', 0);
INSERT INTO Ordinazione(CodiceOrdine, DescrizioneConfezione, Consegnato, NumeroBollaDiAccompagnament,
	TemperaturaMediaAlMomentoDelRitiro,	OraRitiro, OraConsegna,	Cliente, Via, Zona,	Citta,
	NumeroCivico, CartaPagamento, Rider, QuantitaBundle)
	VALUES('ORD04', 'Sacchetti con ghiaccio', 'true', 40505333, 3,	'2024-05-10 11:15:00', '2024-05-10 13:45:00', 
		   'AlessiaGiuliani', 'Via Cristoforo Colombo', 2, 'Positano', 32, '4556123456789013', '002', 0);

/*segue la creazione di tuple della relazione bundle*/
INSERT INTO Bundle(Codice , Pescatore , Ordinazione , Peso , Prezzo , Venduto, Descrizione)
	VALUES ('bn000', '01234567890', 'ORD00', 3.00, 40.00, 'true', 'adatto ai bambini');
INSERT INTO Bundle(Codice , Pescatore , Ordinazione , Peso , Prezzo , Venduto)
	VALUES ('bn001', '01234567890', 'ORD01', 1.00, 20.00, 'true');
INSERT INTO Bundle(Codice , Pescatore , Ordinazione , Peso , Prezzo , Venduto)
	VALUES ('bn002', '01234567890', 'ORD01', 3.00, 60.00, 'true');
INSERT INTO Bundle(Codice , Pescatore , Ordinazione , Peso , Prezzo , Venduto, Descrizione)
	VALUES ('bn003', '01234567890', 'ORD02', 5.00, 100.00, 'true', 'paranza');
INSERT INTO Bundle(Codice , Pescatore, Peso , Prezzo , Venduto)
	VALUES ('bn004', '01234567890', 5.00, 100.00, 'false');
INSERT INTO Bundle(Codice , Pescatore , Ordinazione , Peso , Prezzo , Venduto, Descrizione)
	VALUES ('bn000', '11223344556', 'ORD03', 1.00, 10.00, 'true', 'ottima per la pasta allo scoglio');
INSERT INTO Bundle(Codice , Pescatore , Ordinazione , Peso , Prezzo , Venduto, Descrizione)
	VALUES ('bn001', '11223344556', 'ORD03', 1.00, 10.00, 'true', 'ottima per la pasta allo scoglio');
INSERT INTO Bundle(Codice , Pescatore , Ordinazione , Peso , Prezzo , Venduto, Descrizione)
	VALUES ('bn002', '11223344556', 'ORD03', 1.50, 16.00, 'true', 'polipo e alici');
INSERT INTO Bundle(Codice , Pescatore , Ordinazione , Peso , Prezzo , Venduto, Descrizione)
	VALUES ('bn003', '11223344556', 'ORD04', 1.50, 16.00, 'true', 'polipo e alici');
INSERT INTO Bundle(Codice , Pescatore, Peso, Prezzo , Venduto, Descrizione)
	VALUES ('bn001', '98765432109', 1.50, 20.00, 'false', 'bistecche di pesce');

/*segue la creazione di tuple della relazione telefono*/
INSERT INTO Telefono( Numero, Cliente)
	VALUES('0891234567', 'FrancescoDeAngelis');	
INSERT INTO Telefono( Numero, Cliente)
	VALUES('3459876543', 'Conti1992');		
INSERT INTO Telefono( Numero, Cliente)
	VALUES('3398765432', 'FrancescoDeAngelis');
INSERT INTO Telefono( Numero, Cliente)
	VALUES('3317654321', 'GiovanniNovembre');