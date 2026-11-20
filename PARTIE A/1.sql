-- Exécutez avec EXPLAIN ANALYZE une requête listant les 10 plus
-- grosses commandes LIVREE passées en 2026 en utilisant
-- YEAR(date_commande) = 2026.
-- Identiez les 2 défauts du plan obtenu.

EXPLAIN ANALYZE
SELECT * FROM commandes WHERE statut = "LIVREE"
 AND YEAR(date_commande) = 2026 ORDER BY montant DESC LIMIT 10;

-- Pour calculer la date il ets nécessaire de calculer pour chaque ligne contrairement à un intervalle qui utiliserait un btree et donc plus rapide
-- Utiliser un index pour faire le tri car le programme parcours également toutes les lignes avant de rendre sa décision