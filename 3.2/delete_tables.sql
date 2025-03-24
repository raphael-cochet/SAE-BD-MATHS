-- Suppression des tables en respectant les contraintes de clé étrangère
DROP TABLE COMPOSITION PURGE;
DROP TABLE PIECE PURGE;

-- Suppression des types imbriqués
DROP TYPE IndicesQualite_Type;
DROP TYPE IndiceQualite_Type;
DROP TYPE Equipe_Type;
DROP TYPE Personne_Type;
DROP INDEX idx_piece_nom;
DROP INDEX idx_composition_parent;
DROP INDEX idx_composition_composant;

