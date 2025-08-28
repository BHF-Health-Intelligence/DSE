# DSE R Package

The **DSE** package is developed for using the British Heart Foundation Data Science Environment (BHF DSE) to provide streamlined tools for data management and analysis therein. This package is designed to help users efficiently read, process, and save data according to BHF conventions.

## Features

- **Data Reading**: Functions to read data from various sources in a consistent manner.
- **Data Saving**: Utilities to save processed data in standard formats.
- **Table Name Parsing**: Tools to parse and validate table names based on BHF DSE standards.

## Installation

To install the package from source, use the following command in R:

```r
# From the root directory of the package
install.packages(".", repos = NULL, type = "source")
```

## Usage

Load the package in your R session:

```r
library(DSE)
```

### Example Functions

- `read_data(...)`: Read data from a specified source.
- `save_data(...)`: Save data to a specified location.
- `parse_tablename(...)`: Parse and validate table names.

Refer to the documentation in the `man/` directory or use R's help system for details on each function:

```r
?read_data
?save_data
?parse_tablename
```

## Development

- **Project file**: `DSE.Rproj` for RStudio integration.
- **Documentation**: Located in the `man/` directory.
- **Source code**: All main functions are in the `R/` directory.

## Contributing

Contributions are welcome! Please follow BHF DSE coding standards and submit pull requests for review.

## License

This package is intended for internal use within the British Heart Foundation Data Science Environment. For licensing or external use, please contact the BHF DSE team.

---

*Maintained by the BHF Data Science Team.*
