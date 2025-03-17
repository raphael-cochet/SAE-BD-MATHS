INSERT INTO PIECE (piece_id, nom, description, prix_unitaire) VALUES
(1, "Vis en titane", "Vis en titane haute résistance", 5.00),
(2, "Rivets en aluminium", "Rivets légers pour fixation", 1.50),
(3, "Raidisseur en composite", "Renforcement structurel léger", 100.00),
(4, "Plaque en alliage d'aluminium", "Plaque résistante pour structure", 500.00),
(5, "Boulon en acier", "Boulon de fixation robuste", 3.00),
(6, "Panneau de fuselage", "Section de fuselage intégrant plusieurs composants", 3000.00),
(7, "Segment de fuselage", "Partie plus large intégrant plusieurs panneaux", 15000.00),
(8, "Structure principale de l'avion", "Assemblage de plusieurs segments de fuselage", 500000.00);

INSERT INTO COMPOSITION (piece_parent_id, piece_composant_id, quantite) VALUES
-- Le panneau de fuselage est composé de plusieurs pièces simples
(6, 1, 8),  -- 8 Vis en titane
(6, 2, 20), -- 20 Rivets en aluminium
(6, 3, 4),  -- 4 Raidisseurs en composite
(6, 4, 1),  -- 1 Plaque en alliage d'aluminium
(6, 5, 10), -- 10 Boulons en acier

-- Le segment de fuselage est composé de 5 Panneaux de fuselage.
(7, 6, 5),  

-- La structure principale de l'avion est composée de 3 Segments de fuselage
(8, 7, 3);