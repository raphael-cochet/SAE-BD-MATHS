-- 1 Liste des composants direct d'une pièce composée (ex : ”Panneau de fuselage”)
SELECT p.nom, c.quantite
FROM PIECE p
JOIN COMPOSITION c ON p.piece_id = c.piece_composant_id
JOIN PIECE parent ON parent.piece_id = c.piece_parent_id
WHERE parent.nom = 'Panneau de fuselage';

-- 2 Listez les pièces composées triées par le nombre de composants qu’elles contiennent.
SELECT p.piece_id, p.nom, COUNT(c.piece_composant_id) AS nombre_composants
FROM PIECE p
JOIN COMPOSITION c ON p.piece_id = c.piece_parent_id
GROUP BY p.piece_id, p.nom
ORDER BY nombre_composants DESC;

-- 3 Comptez combien de pièces composées existent dans la base.
SELECT COUNT(DISTINCT piece_parent_id) AS nombre_pieces_composees
FROM COMPOSITION;

-- 4 Calculez le coût total de chaque pièce composée en additionnant le prix de ses composants directs.
SELECT 
    parent.piece_id AS piece_composee_id,
    parent.nom AS piece_composee_nom,
    SUM(composant.prix_unitaire * quantite) AS cout_total
FROM 
    PIECE parent
JOIN 
    COMPOSITION ON parent.piece_id = piece_parent_id
JOIN 
    PIECE composant ON piece_composant_id = composant.piece_id
GROUP BY 
    parent.piece_id, parent.nom
ORDER BY 
    parent.piece_id;


-- 5 Trouvez toutes les pièces qui entrent dans la fabrication d’une pièce composée, directement ou indirectement.
-- La réponse est une table qui, pour chaque pièce composée, indique son composant, direct ou indirect. Cette table est ordonnée par le id de la pièce composée.

WITH RECURSIVE ComposantsRecursifs AS (
    -- Cas de base: tous les composants directs
    SELECT 
        piece_parent_id AS piece_composee_id,
        piece_composant_id,
        1 AS niveau
    FROM 
        COMPOSITION
    
    UNION ALL
    
    -- Cas récursif: composants des composants
    SELECT 
        cr.piece_composee_id,
        comp.piece_composant_id,
        cr.niveau + 1
    FROM 
        ComposantsRecursifs cr
    JOIN 
        COMPOSITION comp ON cr.piece_composant_id = comp.piece_parent_id
)

SELECT 
    pc.piece_id AS piece_composee_id,
    pc.nom AS piece_composee_nom,
    comp.piece_id AS composant_id,
    comp.nom AS composant_nom,
    MIN(niveau) AS niveau_minimal
FROM 
    ComposantsRecursifs cr
JOIN 
    PIECE pc ON piece_composee_id = pc.piece_id
JOIN 
    PIECE comp ON piece_composant_id = comp.piece_id
GROUP BY 
    pc.piece_id, pc.nom, comp.piece_id, comp.nom
ORDER BY 
    pc.piece_id, niveau_minimal, comp.piece_id;

