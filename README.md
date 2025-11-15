# MIAMA-HM

Health model for Morbidity Impacts in Active Modes Appraisal (for Active Travel England). See <https://github.com/ATE-tool/MIAMA/> for information on the MIAMA project.

## Background

Established as a fork of <https://github.com/jibeproject/health_microsim>, which provides a health model for Manchester and Melbourne.

However, only files from that repo which are currently anticipated as being required have been retained. Further files can be copied from that repo if they are needed.

## Working notes

These working notes record matters that may require further consideration or development.

### Health data - baseline data year

Currently, we use 2018 mortality data, 2023 disease data, 2018 population data and 2019 IMD data.

The mortality data is provided for 2011 LSOAs, and relative risks are calculated by reference to 2011 LSOAs.  Rates are then calculated, and converted to 2021 LSOAs and LADs using lookup tables, for comparison with other estimates available by reference to those LADs.  IMD deciles from 2019 (but converted from 2011 LSOAs to 2021 LSOAs using the lookup tables) are joined. Thus, mortality LSOA outputs are for 2021 LSOAs.  However, some 2021 LSOAs are excluded because the lookup tables are on a 'best fit' basis and do not include all 2021 LSOAs that actually exist.

The disease data is provided on a whole-of-England basis, and then calculated for 2011 LSOAs using the same relative risks as calculated for the mortality data (which are by reference to 2011 LSOAs).  IMD deciles are joined, using 2011 LSOAs rather than 2021 LSOAs. Thus, disease LSOA outputs are for 2011 LSOAs.  This is not overly problematic because the LSOA results are aggregated before producing final outputs.

In both cases, when aggregating data, 2018 population figures (by reference to 2011 LSOAs) are used.

These mismatches could be mitigated by using later mortality and population data (2023 is available), and avoided altogether by also using later IMD data (2025 is available) so that all data would be by reference to 2021 LSOAs. If so, the new data would need to be downloaded, and `health_data.qmd` would require updates (generally simplifications) to process it.

### Health data - aggregation method

The `health_data.qmd` file tests two methods to aggregate data from the LSOA level:

1.  grouping by IMD decile (weighted mean of the rates for all LSOAs in each IMD decile), and
2.  finding the middle rate of the deciles for all LSOAs combined (5th percentile, 15th percentile, 25th percentile ... 95th percentile).

The second method produces a broader spread of values, which is attractive. However, as the health model will use the groupings to assign a risk rating to each member of the representative population, the second method would assume that a member who is in (say) the highest risk group for one disease is also in the highest risk group for all other diseases. This might not be a reasonable assumption.

Accordingly, for the time being the aggregated outputs produced by `health_data.qmd` use the first method.

Assuming, this choice is confirmed, the `health_data.qmd` script should be updated to explain the reason for the choice.

### Health data - ASDR calculation

The 'Relative Risk' section of `health_data.qmd` contains a note "For future reference ( [https://pmc.ncbi.nlm.nih.gov/articles/PMC9575652](https://pmc.ncbi.nlm.nih.gov/articles/PMC9575652/)) we might want to improve the calculation of ASDR". @Belen - can this note be deleted, or should we do anything about it?

### Health data - relative risks for diseases

In `health_data.qmd`, we calculate disease rates by LSOA by applying the LSOA relative risks calculated for mortality to diseases. This assumes the same relative risks apply. We may want to consider this assumption further.

### Health data - raw rates

In `health_data.qmd`, the rates contained in the final health transitions outputs are raw rates, not adjusted for levels of physical activity in the population. We may want to make such adjustments.

### Rep pop - MMETS values

In `representative_population.qmd`, currently we select 5 MMETS values for each age and sex combination, being the middle of each quintile, ie the 10th, 30th, 50th, 70th and 90th percentile. We may want to consider the selection of the values further. In particular, it may be more realistic to select lower percentile values.
