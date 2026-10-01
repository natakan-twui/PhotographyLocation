// Recommendation query from the supplied Colab notebook
// Parameters: $target_user
MATCH (target:User {name: $target_user})-[:LIKES]->(liked:Location)
MATCH (similar:User)-[:LIKES]->(liked)
WHERE similar <> target
MATCH (similar)-[:LIKES]->(recommended:Location)
WHERE NOT (target)-[:LIKES]->(recommended)
RETURN recommended.name AS location, count(*) AS score
ORDER BY score DESC, location ASC;
