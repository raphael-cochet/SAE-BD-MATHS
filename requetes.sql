-- Liste des composants direct d'une pièce composée

SELECT p.nom, c.quantite
FROM PIECE p
JOIN COMPOSITION c ON p.piece_id = c.piece_composant_id
JOIN PIECE parent ON parent.piece_id = c.piece_parent_id
WHERE parent.nom = 'Panneau de fuselage';