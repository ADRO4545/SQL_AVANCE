-- Créez une vue matérialisée mv_synthese_segments calculant le
-- nombre de commandes et le CA total par segment client.
-- Insérez une nouvelle commande test, constatez que la vue est marquée
-- obsolète (stale), puis rafraîchissez-la et vériez la mise à jou

CREATE MATERIALIZED VIEW mv_synthese_segments AS
SELECT 
    c.segment AS segment_client,
    COUNT(DISTINCT cmd.id) AS nombre_commandes,
    ROUND(COALESCE(SUM(lc.quantite * lc.prix_unitaire_applique), 0), 2) AS ca_total
FROM clients c
LEFT JOIN commandes cmd ON cmd.client_id = c.id
LEFT JOIN lignes_commande lc ON lc.commande_id = cmd.id
GROUP BY c.segment;


INSERT INTO commandes (id, client_id, date_commande) 
VALUES (9999, 1, CURRENT_DATE);
INSERT INTO lignes_commande (commande_id, produit_id, quantite, prix_unitaire_applique) 
VALUES (9999, 1, 2, 100.00);


REFRESH MATERIALIZED VIEW mv_synthese_segments;
SELECT * FROM mv_synthese_segments ORDER BY ca_total DESC;