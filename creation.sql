CREATE TABLE PIECE (
    piece_id INTEGER PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    description TEXT,
    prix_unitaire DECIMAL(12,2) NOT NULL
);

CREATE TABLE COMPOSITION (
    piece_parent_id INTEGER NOT NULL,
    piece_composant_id INTEGER NOT NULL,
    quantite INTEGER NOT NULL CHECK (quantite > 0),
    PRIMARY KEY (piece_parent_id, piece_composant_id),
    FOREIGN KEY (piece_parent_id) REFERENCES PIECE(piece_id),
    FOREIGN KEY (piece_composant_id) REFERENCES PIECE(piece_id),
    CHECK (piece_parent_id != piece_composant_id)
);

CREATE INDEX idx_piece_nom ON PIECE(nom);
CREATE INDEX idx_composition_parent ON COMPOSITION(piece_parent_id);
CREATE INDEX idx_composition_composant ON COMPOSITION(piece_composant_id);

