-- use Versandhandel

	--erstelle Tabelle ARTIKEL
	CREATE TABLE ARTIKEL
	(
		Artikel_Nr		NUMBER		NOT NULL ,
		Bezeichnung		VARCHAR2 (100)	NOT NULL ,
		Kategorie		VARCHAR2 (30)	NOT NULL ,
		Beschreibung	VARCHAR2(4000)				NULL ,
		ME				char (5)	NOT NULL ,
		Bestand			NUMBER		NOT NULL ,
		Preis			NUMBER			NOT NULL 
	);


	

	--erstelle Tabelle BESTELLDATEN
	CREATE TABLE BESTELLDATEN
	(
		Bestell_Nr		NUMBER				NOT NULL ,
		Artikel_Nr		NUMBER				NOT NULL ,
		Anzahl			NUMBER			NOT NULL 
	);



	
	
	
	--erstelle Tabelle BESTELLUNGEN
	CREATE TABLE BESTELLUNGEN
	(
		Bestell_Nr		NUMBER				NOT NULL ,
		Kunden_Nr		NUMBER				NOT NULL ,
		Bestelldatum	DATE				NOT NULL ,
		Lieferdatum		DATE			NULL ,
		Betrag			NUMBER				NOT NULL ,
		Bemerkung		VARCHAR2(4000)				NULL 
	);

		


	
	--erstelle Tabelle KUNDEN
	CREATE TABLE KUNDEN
	(
		Kunden_Nr		NUMBER				NOT NULL ,
		Name			VARCHAR2 (40)	NOT NULL ,
		Vorname			VARCHAR2 (30)	NOT NULL ,
		Anrede			VARCHAR2 (20)	NOT NULL ,
		Strasse			VARCHAR2 (40)	NOT NULL ,
		PLZ				NUMBER	NOT NULL ,
		Wohnort			VARCHAR2 (40)	NOT NULL ,
		Telefon_Nr		VARCHAR2 (20)		NULL ,
		Telefax_Nr		VARCHAR2 (20)		NULL ,
		Email_Adr		VARCHAR2 (30)		NULL ,
		Datum			DATE	NOT NULL ,
		Wert			NUMBER		NOT NULL 
	);




	

	--erstelle Tabelle MENGENEINHEITEN
	CREATE TABLE MENGENEINHEITEN
	(
		ME		char (5)	NOT NULL ,
		Beschreibung	VARCHAR2 (255)	NOT NULL 
	);

	-- Anlegen des Primary Keys 'Kunden_Nr' in der Tabelle 'KUNDEN'
	ALTER TABLE KUNDEN 
		ADD CONSTRAINT PK_Kunden 
						PRIMARY KEY(Kunden_Nr);
	

	
	

	-- Anlegen des Primary Keys 'ME' in der Tabelle 'MENGENEINHEITEN'
	ALTER TABLE MENGENEINHEITEN
		ADD CONSTRAINT PK_Mengeneinheiten 
						PRIMARY KEY(ME);
	

	
	

	-- Anlegen des Primary Keys 'Artikel_Nr' in der Tabelle 'ARTIKEL'
	ALTER TABLE ARTIKEL 
		ADD CONSTRAINT PK_Artikel
						PRIMARY KEY(Artikel_Nr);
	

	
	

	-- Anlegen des Primary Keys 'Bestell_Nr,Artikel_Nr' in der Tabelle 'BESTELLDATEN'
	ALTER TABLE BESTELLDATEN 
		ADD CONSTRAINT PK_Bestelldaten
						PRIMARY KEY(Bestell_Nr,Artikel_Nr);


	
	

	-- Anlegen des Primary Keys 'Bestell_Nr' in der Tabelle 'BESTELLUNGEN'
	ALTER TABLE BESTELLUNGEN
		ADD CONSTRAINT PK_Bestellungen 
						PRIMARY KEY(Bestell_Nr);
	

	
	

	
	
	-- Anlegen des Foreign Keys 'ME' in der Tabelle 'ARTIKEL'	    
	ALTER TABLE ARTIKEL 
		ADD CONSTRAINT FK_Artikel_Mengeneinheiten 
						FOREIGN KEY(ME) REFERENCES Mengeneinheiten (ME);
	

	
	

	-- Anlegen des Foreign Keys 'Artikel_Nr' in der Tabelle 'BESTELLDATEN'
	ALTER TABLE BESTELLDATEN 
		ADD CONSTRAINT FK_Bestelldaten_Artikel
						FOREIGN KEY(Artikel_Nr) REFERENCES Artikel (Artikel_Nr);
	

	
	

	-- Anlegen des Foreign Keys 'Bestell_Nr' in der Tabelle 'BESTELLDATEN'
	ALTER TABLE BESTELLDATEN 
		ADD CONSTRAINT FK_Bestelldaten_Bestellungen
						FOREIGN KEY(Bestell_Nr) REFERENCES Bestellungen (Bestell_Nr);
	

	
	

	-- Anlegen des Foreign Keys 'Kunden_Nr' in der Tabelle 'BESTELLUNGEN'
	ALTER TABLE BESTELLUNGEN 
		ADD CONSTRAINT FK_Bestellungen_Kunden
						FOREIGN KEY(Kunden_Nr) REFERENCES Kunden (Kunden_Nr);
	

	
	
	
	
	

	-- Anlegen einer Einschränkung, das Kunden.PLZ nur 5 stellig sein darf.
	--ALTER TABLE Kunden
	--	ADD CONSTRAINT CK_Kunden_plz 
	--					CHECK (PLZ LIKE '[0-9][0-9][0-9][0-9][0-9]')
	
	
	
	

	-- Anlegen einer Einschränkung, das Kunden.Kunden_Nr nur 8 stellig sein darf.
	--ALTER TABLE Kunden
	--	ADD CONSTRAINT CK_Kunden_Kunden_Nr
	--					CHECK (Kunden_Nr LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
	

	
	

	-- Anlegen einer Einschränkung, das ARTIKEL.Artikel_Nr nur 8 stellig sein darf.
	--ALTER TABLE Artikel
	--	ADD CONSTRAINT CK_Artikel_Artikel_Nr
	--					CHECK (Artikel_Nr LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
	

	
	

	-- Anlegen einer Einschränkung, das Bestellungen.Bestell_Nr nur 5 stellig sein darf.
	--ALTER TABLE Bestellungen
	--	ADD CONSTRAINT CK_Bestellungen_Bestell_Nr
	--					CHECK (Bestell_Nr LIKE '[0-9][0-9][0-9][0-9][0-9]')
	

	
	

	-- Anlegen einer Einschränkung, das Bestelldaten.Anzahl nur größer 0 sein darf.
	ALTER TABLE Bestelldaten
		ADD CONSTRAINT CK_Bestelldaten_Anzahl
						CHECK (Anzahl > 0);
	

	
	
	
	--Anlegen einer Einschränkung, das Bestellungen.Lieferdatum später sein muss als das
	--Bestelldatum
	ALTER TABLE Bestellungen
		ADD CONSTRAINT CK_Bestelldatum_Lieferdatum
						CHECK (Lieferdatum > Bestelldatum);
	
	
	
  
	
	
	--Anlegen einer Einschränkung, das Artikel.Bestand nur größer oder gleich 0 sein darf.
	ALTER TABLE Artikel
		ADD CONSTRAINT CK_Artikel_Bestand
						CHECK (Bestand >= 0);
	
	
	
	

	
