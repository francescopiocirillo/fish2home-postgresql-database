CREATE DOMAIN PWD VARCHAR(70) NOT NULL;

CREATE TABLE Citta (
	Nome VARCHAR(30) PRIMARY KEY,
	Estensione NUMERIC(5, 2)
);

CREATE TABLE Zona (
	NumeroZona INT,
	Citta VARCHAR(30),
	NumeroAbitanti INT NOT NULL,
	PRIMARY KEY(NumeroZona, Citta),
	FOREIGN KEY(Citta) REFERENCES Citta(Nome)
);

CREATE TABLE Via (
	Nome VARCHAR(30),
	Zona INT,
	Citta VARCHAR(30),
	CONSTRAINT localizzazione PRIMARY KEY(Nome, Zona, Citta),
	FOREIGN KEY(Zona, Citta) REFERENCES Zona(NumeroZona, Citta)
);

CREATE TABLE Pescatore (
	PartitaIVA CHAR(11),
	Via VARCHAR(30) NOT NULL,
	Zona INT NOT NULL,
	Citta VARCHAR(30) NOT NULL,
	NumeroCivico INT NOT NULL,
	CodiceFiscale CHAR(16) NOT NULL,
	Nome VARCHAR(30) NOT NULL,
	pw PWD,
	Descrizione VARCHAR(300),
	IBAN CHAR(27) UNIQUE NOT NULL,
	PRIMARY KEY(PartitaIVA),
	FOREIGN KEY(Via, Zona, Citta) REFERENCES Via(Nome, Zona, Citta)
);

CREATE TABLE MetodoDiPesca (
	Nome VARCHAR(30) PRIMARY KEY
);

CREATE TABLE Pratica (
	MetodoDiPesca VARCHAR(30) 
		REFERENCES MetodoDiPesca(Nome),
	Pescatore CHAR(11),
	PRIMARY KEY(MetodoDiPesca, Pescatore),
	FOREIGN KEY(Pescatore) REFERENCES Pescatore(PartitaIVA)
		ON DELETE CASCADE ON UPDATE CASCADE
		DEFERRABLE INITIALLY DEFERRED
);

CREATE TABLE Barca (
	Targa CHAR(8),
	Proprietario CHAR(11) UNIQUE NOT NULL,/*un pescatore può possedere una sola barca*/
	DataImmatricolazione DATE,
	NMotori INT,
	DescrizioneTipologia VARCHAR(300) DEFAULT'peschereccio',
	Lunghezza NUMERIC(4, 2),
	Nome VARCHAR(30),
	PRIMARY KEY(Targa),
	FOREIGN KEY(Proprietario) REFERENCES Pescatore(PartitaIVA)
);

CREATE TABLE Rider (
	CodiceRider CHAR(3),
	Cognome VARCHAR(30) NOT NULL,
	Nome VARCHAR(30) NOT NULL,
	Zona INT NOT NULL,
	Citta VARCHAR(30) NOT NULL,
	DataNascita DATE,
	pw PWD,
	IBAN CHAR(27) UNIQUE NOT NULL,
	CodiceFiscale CHAR(16) UNIQUE NOT NULL,
	PRIMARY KEY(CodiceRider),
	FOREIGN KEY(Zona, Citta) REFERENCES Zona(NumeroZona, Citta)
);

CREATE TABLE Cliente (
	Username VARCHAR(30),
	DataNascita DATE,
	Cognome VARCHAR(30) NOT NULL,
	Nome VARCHAR(30) NOT NULL,
	pw PWD,
	CodiceFiscale CHAR(16) UNIQUE NOT NULL,
	Via VARCHAR(30) NOT NULL,
	Zona INT NOT NULL,
	Citta VARCHAR(30) NOT NULL,
	NumeroCivico INT NOT NULL,
	PRIMARY KEY(Username),
	FOREIGN KEY(Via, Zona, Citta) REFERENCES Via(Nome, Zona, Citta)
);

CREATE TABLE CartaPagamento (
	NumeroCarta VARCHAR(16),
	CVC CHAR(3) NOT NULL,
	Scadenza DATE NOT NULL,
	Cliente VARCHAR(30) NOT NULL,
	PRIMARY KEY(NumeroCarta),
	FOREIGN KEY(Cliente) REFERENCES Cliente(Username)
);

CREATE TABLE Ordinazione (
	CodiceOrdine CHAR(5),
	DescrizioneConfezione VARCHAR(300) CHECK
		(rider IS NOT NULL OR DescrizioneConfezione IS NULL), 
	Consegnato BOOLEAN  CHECK
		(rider IS NOT NULL OR consegnato = 'false'), 
	NumeroBollaDiAccompagnament INT  CHECK
		(rider IS NOT NULL OR NumeroBollaDiAccompagnament IS NULL),
	TemperaturaMediaAlMomentoDelRitiro NUMERIC(4, 2)  CHECK
		(rider IS NOT NULL OR TemperaturaMediaAlMomentoDelRitiro IS NULL),
	OraRitiro TIMESTAMP CHECK
		(rider IS NOT NULL OR OraRitiro IS NULL),
	OraConsegna TIMESTAMP CHECK
		((consegnato = 'true' OR OraConsegna IS NULL) 
		AND (rider IS NOT NULL OR OraRitiro IS NULL)
		AND (OraConsegna IS NULL OR OraConsegna > OraRitiro)),
	Cliente VARCHAR(30) NOT NULL,
	Via VARCHAR(30) NOT NULL,
	Zona INT NOT NULL,
	Citta VARCHAR(30) NOT NULL,
	NumeroCivico INT NOT NULL,
	CartaPagamento VARCHAR(16) NOT NULL,
	Rider CHAR(3), /*se il l'ordine non è stato affidato a un rider allora l'orario di ritiro e le altre 
						informazioni associate non possono essere conosciute*/
	QuantitaBundle INT NOT NULL DEFAULT 0 CHECK (QuantitaBundle >= 0), 
	PRIMARY KEY(CodiceOrdine),
	FOREIGN KEY(CartaPagamento) REFERENCES CartaPagamento(NumeroCarta),
	FOREIGN KEY(Via, Zona, Citta) REFERENCES Via(Nome, Zona, Citta),
	FOREIGN KEY(Rider) REFERENCES Rider(CodiceRider),
	FOREIGN KEY(Cliente) REFERENCES Cliente(Username)
);

CREATE TABLE Bundle (
	Codice CHAR(5),
	Pescatore CHAR(11) NOT NULL,
	Ordinazione CHAR(5) CHECK (
		(Venduto = true AND Ordinazione IS NOT NULL) OR
		(Venduto = false AND Ordinazione IS NULL)),
	Peso NUMERIC(4, 2) NOT NULL CHECK (Peso > 0),
	Prezzo NUMERIC(5, 2) NOT NULL CHECK (Prezzo > 0),
	Venduto BOOLEAN NOT NULL, /*se l'ordine non è stato venduto non si può sapere 
	l'ordinazione associata ma se è venduto deve essere conosciuta l'ordinazione nel quale è inserito*/
	Descrizione VARCHAR(50),
	PRIMARY KEY(Codice, Pescatore),
	FOREIGN KEY(Pescatore) REFERENCES Pescatore(PartitaIVA),
	FOREIGN KEY(Ordinazione) REFERENCES Ordinazione(CodiceOrdine)
);

CREATE TABLE Telefono (
	Numero VARCHAR(10) PRIMARY KEY,
	Cliente VARCHAR(30) NOT NULL,
	FOREIGN KEY(Cliente) REFERENCES Cliente(Username)
);
