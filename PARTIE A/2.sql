-- Créez un index pertinent sur commandes, activez le
-- partitionnement RANGE, et réécrivez la requête de façon SARGable (sans
-- SELECT *).
-- Comparez le coût total avant/après et expliquez l'eet du Partition Pruning.

CREATE INDEX idx_cmd_statut_date ON commandes (statut, date_commande, montant_total DESC);
EXPLAIN ANALYZE
SELECT id, montant_total, date_commande FROM commandes WHERE statut = 'LIVREE'
AND date_commande >= '2026-01-01' AND date_commande < '2027-01-01' ORDER BY montant_total DESC LIMIT 10;


-- Le coût total à diminué grâce à l'utisation d'un index ce qui est peu visible sur peu de données mais très visible sur un grand jeu de données
-- 8.4 avant et 0.38 après
--Le partition pruning sert à ouvrir uniquement la bonne partition  pour afficher une information