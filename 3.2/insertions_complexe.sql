INSERT INTO PIECE (piece_id, nom, description, prix_unitaire) VALUES
(1, 'Vis en titane', 'Vis en titane haute résistance', 5.00);

INSERT INTO PIECE (piece_id, nom, description, prix_unitaire) VALUES
(2, 'Rivets en aluminium', 'Rivets légers pour fixation', 1.50);

INSERT INTO PIECE (piece_id, nom, description, prix_unitaire) VALUES
(3, 'Raidisseur en composite', 'Renforcement structurel léger', 100.00);

INSERT INTO PIECE (piece_id, nom, description, prix_unitaire) VALUES
(4, 'Plaque en alliage d''aluminium', 'Plaque résistante pour structure', 500.00);

INSERT INTO PIECE (piece_id, nom, description, prix_unitaire) VALUES
(5, 'Boulon en acier', 'Boulon de fixation robuste', 3.00);

INSERT INTO PIECE (piece_id, nom, description, prix_unitaire) VALUES
(6, 'Panneau de fuselage', 'Section de fuselage intégrant plusieurs composants', 3000.00);

INSERT INTO PIECE (piece_id, nom, description, prix_unitaire) VALUES
(7, 'Segment de fuselage', 'Partie plus large intégrant plusieurs panneaux', 15000.00);

INSERT INTO PIECE (piece_id, nom, description, prix_unitaire) VALUES
(8, 'Structure principale de l''avion', 'Assemblage de plusieurs segments de fuselage', 500000.00);

UPDATE PIECE
SET equipe = Equipe_Type(),
    indices_qualite = IndicesQualite_Type();


INSERT INTO TABLE (SELECT equipe FROM PIECE WHERE piece_id = 6)
VALUES (Personne_Type('Goschiny', 'Mécanicien'));

INSERT INTO TABLE (SELECT equipe FROM PIECE WHERE piece_id = 6)
VALUES (Personne_Type('Uderzo', 'Inspecteur'));

INSERT INTO TABLE (SELECT indices_qualite FROM PIECE WHERE piece_id = 6)
VALUES (IndiceQualite_Type('carbone', 3, 4));

INSERT INTO TABLE (SELECT indices_qualite FROM PIECE WHERE piece_id = 6)
VALUES (IndiceQualite_Type('securite', 4, 5));

INSERT INTO TABLE (SELECT indices_qualite FROM PIECE WHERE piece_id = 6)
VALUES (IndiceQualite_Type('prix', 4, 3));

INSERT INTO TABLE (SELECT equipe FROM PIECE WHERE piece_id = 7)
VALUES (Personne_Type('Morris', 'Mécanicien'));

INSERT INTO TABLE (SELECT equipe FROM PIECE WHERE piece_id = 7)
VALUES (Personne_Type('Franquin', 'Mécanicien'));

INSERT INTO TABLE (SELECT equipe FROM PIECE WHERE piece_id = 7)
VALUES (Personne_Type('Peyo', 'Inspecteur'));

INSERT INTO TABLE (SELECT indices_qualite FROM PIECE WHERE piece_id = 7)
VALUES (IndiceQualite_Type('carbone', 4, 4));

INSERT INTO TABLE (SELECT indices_qualite FROM PIECE WHERE piece_id = 7)
VALUES (IndiceQualite_Type('securite', 5, 5));

INSERT INTO TABLE (SELECT indices_qualite FROM PIECE WHERE piece_id = 7)
VALUES (IndiceQualite_Type('prix', 5, 3));

INSERT INTO TABLE (SELECT equipe FROM PIECE WHERE piece_id = 8)
VALUES (Personne_Type('Hergé', 'Mécanicien'));

INSERT INTO TABLE (SELECT equipe FROM PIECE WHERE piece_id = 8)
VALUES (Personne_Type('Jacobs', 'Mécanicien'));

INSERT INTO TABLE (SELECT equipe FROM PIECE WHERE piece_id = 8)
VALUES (Personne_Type('Giraud', 'Inspecteur'));

INSERT INTO TABLE (SELECT equipe FROM PIECE WHERE piece_id = 8)
VALUES (Personne_Type('Jijé', 'Inspecteur'));

INSERT INTO TABLE (SELECT indices_qualite FROM PIECE WHERE piece_id = 8)
VALUES (IndiceQualite_Type('carbone', 5, 4));

INSERT INTO TABLE (SELECT indices_qualite FROM PIECE WHERE piece_id = 8)
VALUES (IndiceQualite_Type('securite', 5, 5));

INSERT INTO TABLE (SELECT indices_qualite FROM PIECE WHERE piece_id = 8)
VALUES (IndiceQualite_Type('prix', 5, 3));

INSERT INTO COMPOSITION (piece_parent_id, piece_composant_id, quantite) VALUES
(6, 1, 8);

INSERT INTO COMPOSITION (piece_parent_id, piece_composant_id, quantite) VALUES
(6, 2, 20);

INSERT INTO COMPOSITION (piece_parent_id, piece_composant_id, quantite) VALUES
(6, 3, 4);

INSERT INTO COMPOSITION (piece_parent_id, piece_composant_id, quantite) VALUES
(6, 4, 1);

INSERT INTO COMPOSITION (piece_parent_id, piece_composant_id, quantite) VALUES
(6, 5, 10);

INSERT INTO COMPOSITION (piece_parent_id, piece_composant_id, quantite) VALUES
(7, 6, 5);

INSERT INTO COMPOSITION (piece_parent_id, piece_composant_id, quantite) VALUES
(8, 7, 3);
