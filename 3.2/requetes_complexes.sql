-- (a) Nombre de personnes de l'équipe par fonction pour chaque pièce
SELECT 
    p.piece_id, 
    p.nom AS piece_nom, 
    pt.fonction, 
    COUNT(*) AS nombre_personnes
FROM 
    PIECE p,
    TABLE(p.equipe) pt
GROUP BY 
    p.piece_id, 
    p.nom, 
    pt.fonction
ORDER BY 
    p.piece_id, 
    pt.fonction;

-- (b) Nombre de pièces associées à chaque mécanicien
SELECT 
    pt.fonction, 
    pt.nom AS mecanicien_nom, 
    COUNT(DISTINCT p.piece_id) AS nombre_pieces
FROM 
    PIECE p,
    TABLE(p.equipe) pt
WHERE 
    pt.fonction = 'Mécanicien'
GROUP BY 
    pt.fonction, 
    pt.nom
ORDER BY 
    nombre_pieces DESC;

-- (c) Impact de chaque indice de qualité par pièce
SELECT 
    p.piece_id, 
    p.nom AS piece_nom, 
    iqt.nom AS indice_qualite, 
    iqt.valeur, 
    iqt.poids,
    iqt.valeur * iqt.poids AS impact
FROM 
    PIECE p,
    TABLE(p.indices_qualite) iqt
ORDER BY 
    p.piece_id, 
    impact DESC;

-- (d) Impact moyen de chaque indice de qualité
SELECT 
    iqt.nom AS indice_qualite, 
    AVG(iqt.valeur * iqt.poids) AS impact_moyen
FROM 
    PIECE p,
    TABLE(p.indices_qualite) iqt
GROUP BY 
    iqt.nom
ORDER BY 
    impact_moyen DESC;