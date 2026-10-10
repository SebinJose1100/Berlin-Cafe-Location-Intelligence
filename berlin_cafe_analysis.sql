-- ============================================================
-- Berlin Café Location Intelligence
-- SQL portfolio script
-- Project: berlin-cafe-analytics
-- Dataset: berlin_cafe
--
-- Purpose:
-- Explore registered café locations and business activity across
-- Berlin planning areas with at least 5,000 residents, then review
-- a shortlist of candidate areas using a transparent relative score.
--
-- Data sources:
-- 1. IHK Berlin business data:
--    https://daten.berlin.de/datensaetze/gewerbedaten-ihkberlin
-- 2. Berlin population data (31 December 2025):
--    https://daten.berlin.de/datensaetze/einwohnerinnen-und-einwohner-in-berlin-in-lor-planungsraumen-am-31-12-2025
--
-- Important limitations:
-- - Registered business counts are not a measure of customer demand.
-- - Café density uses resident population and may be affected by
--   tourism, commercial areas, and daytime populations.
-- - The shortlist is a screening tool, not a prediction of success.
-- - Lower total_rank_score values indicate a more favourable relative
--   ranking under this project's scoring method only.
-- ============================================================


-- 01. Validate the final area-level analysis table

SELECT
  COUNT(*) AS total_planning_areas,
  COUNT(DISTINCT RAUMID) AS unique_area_ids,
  COUNTIF(population IS NULL) AS missing_population,
  COUNTIF(cafe_count IS NULL) AS missing_cafe_count,
  COUNTIF(cafe_count < 0) AS negative_cafe_counts,
  COUNTIF(cafes_per_1000 < 0) AS negative_cafe_density
FROM
  `berlin-cafe-analytics.berlin_cafe.cafe_location_analysis`;


-- 02. Count registered cafés by planning area
-- Uses the exact IHK category value 'Cafés'.

SELECT
  planungsraum_id AS RAUMID,
  Planungsraum,
  COUNTIF(ihk_branch_desc = 'Cafés') AS cafe_count
FROM
  `berlin-cafe-analytics.berlin_cafe.ihk_businesses_cleaned`
GROUP BY
  planungsraum_id,
  Planungsraum
ORDER BY
  cafe_count DESC;


-- 03. Review café density and business activity
-- Uses the precomputed area-level analysis table.

SELECT
  RAUMID,
  Planungsraum,
  population,
  total_businesses,
  cafe_count,
  ROUND(cafes_per_1000, 2) AS cafes_per_1000,
  ROUND(businesses_per_1000, 2) AS businesses_per_1000,
  ROUND(cafe_share_percent, 2) AS cafe_share_percent
FROM
  `berlin-cafe-analytics.berlin_cafe.cafe_location_analysis`
ORDER BY
  cafes_per_1000 DESC;


-- 04. Review the candidate-area ranking
-- Tied scores receive the same overall position.

SELECT
  *,
  RANK() OVER (
    ORDER BY total_rank_score ASC
  ) AS overall_position
FROM
  `berlin-cafe-analytics.berlin_cafe.cafe_opportunity_ranking`
ORDER BY
  total_rank_score ASC,
  Planungsraum ASC;
