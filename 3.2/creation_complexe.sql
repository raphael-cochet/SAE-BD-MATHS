DROP INDEX idx_piece_nom;
DROP INDEX idx_composition_parent;
DROP INDEX idx_composition_composant;

DROP TABLE COMPOSITION CASCADE CONSTRAINTS PURGE;
DROP TABLE PIECE CASCADE CONSTRAINTS PURGE;

DROP TYPE IndicesQualite_Type;
DROP TYPE IndiceQualite_Type;
DROP TYPE Equipe_Type;
DROP TYPE Personne_Type;

CREATE OR REPLACE TYPE Personne_Type AS OBJECT (
    nom VARCHAR2(50),
    fonction VARCHAR2(50)
);
/

CREATE OR REPLACE TYPE Equipe_Type AS TABLE OF Personne_Type;
/

CREATE OR REPLACE TYPE IndiceQualite_Type AS OBJECT (
    nom VARCHAR2(50),
    valeur NUMBER,
    poids NUMBER
);
/

CREATE OR REPLACE TYPE IndicesQualite_Type AS TABLE OF IndiceQualite_Type;
/

-- Création de la table PIECE avec les types imbriqués
CREATE TABLE PIECE (
    piece_id INTEGER PRIMARY KEY,
    nom VARCHAR2(100) NOT NULL,
    description CLOB,
    prix_unitaire NUMBER(12,2) NOT NULL,
    date_debut TIMESTAMP,
    date_fin TIMESTAMP,
    equipe Equipe_Type,
    indices_qualite IndicesQualite_Type
) NESTED TABLE equipe STORE AS equipe_tab
  NESTED TABLE indices_qualite STORE AS indices_qualite_tab;
/

-- Création de la table COMPOSITION
CREATE TABLE COMPOSITION (
    piece_parent_id INTEGER NOT NULL,
    piece_composant_id INTEGER NOT NULL,
    quantite INTEGER NOT NULL CHECK (quantite > 0),
    PRIMARY KEY (piece_parent_id, piece_composant_id),
    FOREIGN KEY (piece_parent_id) REFERENCES PIECE(piece_id),
    FOREIGN KEY (piece_composant_id) REFERENCES PIECE(piece_id),
    CHECK (piece_parent_id != piece_composant_id)
);
/


