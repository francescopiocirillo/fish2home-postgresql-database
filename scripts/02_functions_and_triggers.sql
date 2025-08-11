CREATE OR REPLACE FUNCTION almeno_una_pratica() RETURNS TRIGGER AS $$
BEGIN
	IF (EXISTS (SELECT PartitaIVA 
					FROM Pescatore 
					WHERE PartitaIVA NOT IN (SELECT Pescatore FROM Pratica))) THEN
		RAISE EXCEPTION 'ERRORE: ogni pescatore deve praticare almeno un tipo di pesca';
	END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_almeno_una_pratica
AFTER INSERT ON Pescatore
FOR EACH ROW EXECUTE PROCEDURE almeno_una_pratica();

CREATE TRIGGER trigger_almeno_una_pratica
AFTER DELETE ON Pratica
FOR EACH ROW EXECUTE PROCEDURE almeno_una_pratica();

CREATE OR REPLACE FUNCTION calcola_quantita_bundle() RETURNS TRIGGER AS $$
DECLARE
    new_quantita_bundle INT;
	old_quantita_bundle INT;
BEGIN
    SELECT COUNT(*) INTO new_quantita_bundle
		FROM Bundle
		WHERE Ordinazione = NEW.Ordinazione;

    UPDATE Ordinazione
		SET QuantitaBundle = new_quantita_bundle
		WHERE CodiceOrdine = NEW.Ordinazione;
		
	SELECT COUNT(*) INTO old_quantita_bundle
		FROM Bundle
		WHERE Ordinazione = OLD.Ordinazione;
		
	UPDATE Ordinazione
		SET QuantitaBundle = old_quantita_bundle
		WHERE CodiceOrdine = OLD.Ordinazione;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_calcola_quantita_bundle
AFTER INSERT OR DELETE OR UPDATE OF Ordinazione ON Bundle
FOR EACH ROW
EXECUTE PROCEDURE calcola_quantita_bundle();

CREATE OR REPLACE FUNCTION controllo_copertura_rider() RETURNS TRIGGER AS $$
BEGIN
    IF (NEW.Rider NOT IN (SELECT CodiceRider
						  	FROM Rider
						  	WHERE Rider.Zona = NEW.Zona AND
						 		Rider.Citta = NEW.Citta)) THEN
		RAISE EXCEPTION 'ERRORE: i Rider possono solo accettare ordini della propria zona';
	END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_controllo_copertura_rider
AFTER INSERT OR UPDATE OF Rider ON Ordinazione
FOR EACH ROW
EXECUTE PROCEDURE controllo_copertura_rider();

CREATE OR REPLACE FUNCTION controllo_possesso_carta_di_pagamento() RETURNS TRIGGER AS $$
BEGIN
	IF (NOT EXISTS (SELECT *
				   		FROM CartaPagamento
				   		WHERE CartaPagamento.NumeroCarta = NEW.CartaPagamento
							AND CartaPagamento.Cliente = NEW.Cliente)) THEN
		RAISE EXCEPTION 'ERRORE: la carta di pagamento non è registrata per il cliente che ha effettuato questo ordine';
	END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_controllo_possesso_carta_di_pagamento
AFTER INSERT ON Ordinazione
FOR EACH ROW
EXECUTE PROCEDURE controllo_possesso_carta_di_pagamento();
