# MaiaStatistics

A comprehensive statistical analysis tool implemented in Maiascript for processing time series data and performing various statistical operations.

## Features

### Data Processing
- **Column Extraction**: Extract specific columns from CSV files
- **Pattern Replacement**: Replace patterns in time series data
- **File Splitting**: Split files into multiple parts
- **Data Normalization**: Normalize and denormalize time series data
- **Next Steps Generation**: Create sequences with future time steps

### Statistical Analysis
- **Descriptive Statistics**: Calculate averages, standard deviations, and standard errors
- **Sum Calculations**: Compute sums across multiple files
- **Frequency Distributions**: Generate frequency distribution data
- **Normal Distributions**: Calculate normal probability distributions
- **Random Sequences**: Generate various types of random sequences
  - POSIX.1-2001 random numbers
  - Marsaglia xorshift RNG sequences
  - Gaussian distributed sequences

### Advanced Analysis
- **Pearson Correlation**: Calculate Pearson correlation coefficients
- **Least Squares Regression**: Perform linear regression using least squares method
- **Detrended Fluctuation Analysis (DFA)**: Analyze long-range correlations in non-stationary time series
- **Detrended Cross-Correlation Analysis (DCCA)**: Analyze correlations between two non-stationary time series
- **Rho DCCA**: Calculate cross-correlation coefficients using DCCA

### Visualization
- **Chart Creation**: Generate PNG charts with customizable dimensions and backgrounds

## Installation

This tool requires:
- Node.js runtime environment
- Maiascript interpreter

## Usage

```bash
maiastatistics [options] [input file] [--] [arguments]
```

### Basic Options

- `-h, --help`: Display help message
- `-i [input file]`: Specify input file
- `-o [output file]`: Specify output file
- `-t`: Set file output format
- `-r`: Specify statistics report file
- `-n`: Set number of elements in generated sequences

### Input/Output Options

- `--i1`: Input CSV file name 1
- `--i2`: Input CSV file name 2
- `--oavg`: Average output CSV file
- `--odev`: Standard deviation output CSV file
- `--oerr`: Standard error output CSV file
- `--osum`: Sums output CSV file

### Data Processing Options

- `--first`: First line to read from CSV file
- `--last`: Last line to read from CSV file
- `--lines`: Number of lines to read from CSV file
- `--separator`: Column separator (default: comma)
- `--column`: Extract specific column from time series
- `--replace`: Replace lines with pattern in time series
- `--with`: Replacement value for pattern
- `--split`: Split file into two parts
- `--nfirst`: Number of lines for first split file
- `--normalize`: Normalize time series
- `--denormalize`: Denormalize time series
- `--minimum`: Minimum value for denormalization
- `--maximum`: Maximum value for denormalization
- `--nextstep`: Create series with next steps
- `--steps`: Number of next steps

### Statistical Operations

- `--avg`: Calculate mean values, standard deviations, or standard errors
- `--sum`: Calculate sums across multiple CSV files
- `--frequency`: Calculate frequency distribution
- `--normal`: Calculate normal distribution
- `--random`: Generate random number sequence (POSIX.1-2001)
- `--xor64`: Generate random sequence (Marsaglia xorshift RNG)
- `--gaussian`: Generate Gaussian random sequence
- `--pearson`: Calculate Pearson correlation coefficient
- `--lsqr`: Perform least squares regression

### Advanced Analysis Options

- `--dfa`: Perform Detrended Fluctuation Analysis
- `--minbox`: Minimum box size for DFA
- `--maxbox`: Maximum box size for DFA
- `--rsmode`: Algorithm for scaling in DFA
- `--mavg`: Remove average from series for DFA
- `--nfit`: Order of regression fit for DFA
- `--sw`: Sliding window mode for DFA
- `--rs`: Array with scales for DFA calculation
- `--dcca`: Perform Detrended Cross-Correlation Analysis
- `--rhodcca`: Calculate rhoDCCA

### Visualization Options

- `--plot`: Create and save chart in PNG format
- `--width`: Chart width (default: 1280)
- `--height`: Chart height (default: 720)
- `--background`: Chart background color (default: white)
- `--options`: Command options

## Examples

### Basic File Processing
```bash
maiastatistics -i data.csv --column 2 -o output.csv
```

### Statistical Analysis
```bash
maiastatistics -i data.csv --normalize --frequency -r report.txt
```

### Advanced Analysis
```bash
maiastatistics --i1 series1.csv --i2 series2.csv --dcca --minbox 10 --maxbox 100
```

### Random Sequence Generation
```bash
maiastatistics -n 1000 --gaussian --mean 0 --deviation 1 -o gaussian_data.csv
```

## Output

The tool generates:
- Processed CSV files
- Statistical report files (.txt)
- Visualization charts (.png)
- Analysis results with detailed metrics

## License

Copyright 2020 Roberto Luiz Souza Monteiro, Renata Souza Barreto, Hernane Borges de Barros Pereira, Alexandre do Nascimento Silva, Thiago Murari.

Licensed under the Apache License, Version 2.0.