--  Expliquez le piège de la requête SELECT id, nom FROM employes
-- WHERE id NOT IN (SELECT manager_id FROM employes); et proposez une
-- correction able face aux valeurs NULL

-- SI un nul est trouver dans la sous requete ALORS

SELECT employes.id, employes.nom
FROM employes
WHERE NOT EXISTS (
  SELECT 1
  FROM employes
  WHERE employes.manager_id = employes.id
);