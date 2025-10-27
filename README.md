# MIAMA-HM

Health model for Morbidity Impacts in Active Modes Appraisal (for Active Travel England). See <https://github.com/ATE-tool/MIAMA/> for information on the MIAMA project.

## Working notes

Established as a fork of <https://github.com/jibeproject/health_microsim>, which provides a health model for Manchester and Melbourne.

Accordingly, initially the repo includes all files from the JIBE repo, which are gradually being updated and adapted as required for the MIAMA project. These working notes need to be kept updated to record the files that have been worked on. Those not required should ultimately be deleted.

-   *health_microsim.Rproj* - retain.

-   *health_data.Rmd* - renamed from *health_data_Manchester.Rmd* - mortality section revised; diseases section to be done. Invokes function files *gbd_process.R* and *interpolation.R*, but these have not yet been reviewed/used.

-   *representative_population.Rmd* - new file created for MIAMA.

-   *health_data\_)Melbourne.Rmd* - will not be required (but keep for now as disease processing may be useful when doing the MIAMA disease processing).
