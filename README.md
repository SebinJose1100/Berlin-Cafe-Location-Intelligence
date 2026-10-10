# Berlin Café Location Intelligence

## Project Overview

This project uses SQL and Power BI to analyse café distribution, population, and business activity across Berlin's planning areas.

The project was developed around a business scenario in which someone is considering opening a new café in Berlin. The goal is to identify areas that may warrant further investigation based on population, existing café competition, and overall registered business activity.

## Business Questions

- How are registered cafés distributed across Berlin's planning areas?
- Which areas have the highest café density relative to resident population?
- How does café count vary with population?
- Which areas have relatively high business activity and lower café competition?
- Which locations should be investigated further?

## Tools Used

- **SQL:** Google BigQuery
- **Data visualisation:** Microsoft Power BI
- **Data sources:** Berlin Open Data and IHK Berlin

## Data Sources

1. **IHK Berlin business data:** [Berlin Open Data](https://daten.berlin.de/datensaetze/gewerbedaten-ihkberlin)
2. **Berlin population data for 31 December 2025:** [Berlin Open Data](https://daten.berlin.de/datensaetze/einwohnerinnen-und-einwohner-in-berlin-in-lor-planungsraumen-am-31-12-2025)

## Analysis Workflow

1. Inspected the source datasets and assessed data quality.
2. Cleaned business and population data for analysis.
3. Combined business counts with population data using planning-area identifiers.
4. Calculated café counts, cafés per 1,000 residents, businesses per 1,000 residents, and café share.
5. Selected 15 candidate areas using defined population, business activity, and café competition criteria.
6. Ranked the shortlisted areas using a transparent scoring method.
7. Built a two-page Power BI dashboard for an executive overview and detailed area analysis.

## Power BI Dashboard

The dashboard contains two pages:

- **Executive Overview:** Summary indicators and the 15 shortlisted candidate areas.
- **Detailed Area Analysis:** Café density, café counts, population comparisons, business activity, and a detailed planning-area table.

Interactive filters allow users to explore planning areas and population ranges.

## Dashboard Preview

### Executive Overview

![Executive Overview](Screenshot/Executive%20overview.png)

### Detailed Area Analysis

![Detailed Area Analysis](Screenshot/Detailed%20area%20analysis.png)

## Methodology

The detailed analysis includes planning areas with at least 5,000 residents.

The shortlist uses selected indicators of population, overall registered business activity, and café competition. The ranking score combines the ranks of these indicators. Lower scores indicate a more favourable relative ranking under this method.

## Limitations

- Registered business counts do not directly measure customer demand or foot traffic.
- Café density is based on resident population and may not represent daytime populations or tourism.
- Rent, purchasing power, public transport, vacant commercial units, operating costs, and local customer behaviour were not fully assessed.
- The ranking is a preliminary screening tool, not a prediction or guarantee of commercial success.

## Project Files

- `berlin_cafe_analysis.sql` — Selected SQL validation and analysis queries.
- `Berlin Cafe Analysis Visualisation.pbix` — Power BI report.
- `BERLIN CAFE ANALYTICS Notes.docx` — Project notes.

## Conclusion

This project demonstrates a practical analytics workflow using public data, SQL, and Power BI to explore a real-world business question. The findings can support further investigation into potential café locations in Berlin.
