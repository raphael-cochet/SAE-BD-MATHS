-- Création d'un type pour un indice de qualité
CREATE OR REPLACE TYPE Indice_Qualite AS OBJECT (
  nom VARCHAR2(100),
  valeur DECIMAL(5,2),
  poids DECIMAL(5,2)
);

-- Création d'un type pour une personne dans l'équipe
CREATE OR REPLACE TYPE Personne AS OBJECT (
  nom VARCHAR2(100),
  fonction VARCHAR2(100),
  piece_id INTEGER
);

-- Création d'un type pour l'impact de chaque indice de qualité sur une pièce
CREATE OR REPLACE TYPE Impact_Indice AS OBJECT (
  piece_id INTEGER,
  indice Indice_Qualite,
  impact DECIMAL(10,2)
);
