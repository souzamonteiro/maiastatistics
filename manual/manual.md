# MaiaStatistics Manual

## Overview

MaiaStatistics is a powerful statistical analysis tool for processing time series data, performing advanced statistical operations, and creating visualizations. This manual provides comprehensive usage examples and explanations.

## Table of Contents

1. [Basic Operations](#basic-operations)
2. [Data Processing](#data-processing)
3. [Statistical Analysis](#statistical-analysis)
4. [Advanced Analysis](#advanced-analysis)
5. [Visualization](#visualization)
6. [Practical Examples](#practical-examples)

## Basic Operations

### Getting Help
```bash
maiastatistics --help
```

### Basic File Processing
```bash
# Extract a specific column from CSV
maiastatistics -i data.csv --column 2 -o extracted_column.csv

# Normalize data
maiastatistics -i data.csv --normalize -o normalized_data.csv

# Split file into parts
maiastatistics -i data.csv --split --nfirst 1000
```

## Data Processing

### Column Operations
```bash
# Extract multiple columns
maiastatistics -i dataset.csv --column 1 -o col1.csv
maiastatistics -i dataset.csv --column 3 -o col3.csv

# Process with custom separator
maiastatistics -i data.tsv --separator "\t" --column 2 -o output.tsv
```

### Data Transformation
```bash
# Normalize with specific bounds
maiastatistics -i data.csv --normalize --minimum 0 --maximum 1 -o normalized.csv

# Denormalize data
maiastatistics -i normalized.csv --denormalize --minimum 0 --maximum 100 -o denormalized.csv

# Create time steps
maiastatistics -i timeseries.csv --nextstep --steps 5 -o forecast_ready.csv
```

### File Management
```bash
# Split large datasets
maiastatistics -i large_dataset.csv --split --nfirst 5000

# Replace patterns in data
maiastatistics -i data.csv --replace "NaN" --with "0" -o cleaned_data.csv
```

## Statistical Analysis

### Descriptive Statistics
```bash
# Calculate averages across multiple files
maiastatistics -i "results/*.csv" --avg --oavg averages.csv --odev deviations.csv --oerr errors.csv

# Calculate sums
maiastatistics -i "data/*.csv" --sum --osum totals.csv
```

### Distribution Analysis
```bash
# Frequency distribution
maiastatistics -i population_data.csv --frequency -o frequency_distribution.csv

# Normal distribution
maiastatistics -i sample_data.csv --normal --mean 50 --deviation 10 -o normal_dist.csv
```

### Random Sequence Generation
```bash
# Gaussian random sequence
maiastatistics -n 10000 --gaussian --mean 0 --deviation 1 -o gaussian_noise.csv

# XOR64 random sequence
maiastatistics -n 5000 --xor64 -o random_sequence.csv

# POSIX random sequence
maiastatistics -n 2000 --random -o posix_random.csv
```

## Advanced Analysis

### Correlation Analysis
```bash
# Pearson correlation
maiastatistics -i correlated_data.csv --pearson -r pearson_report.txt

# Least squares regression
maiastatistics -i regression_data.csv --lsqr -r lsqr_report.txt
```

### Detrended Fluctuation Analysis (DFA)
```bash
# Basic DFA
maiastatistics -i timeseries.csv --dfa --minbox 10 --maxbox 100 -o dfa_results.csv

# Advanced DFA with custom parameters
maiastatistics -i signal_data.csv --dfa --minbox 4 --maxbox 500 --nfit 2 --rsmode "peng" -o advanced_dfa.csv
```

### Cross-Correlation Analysis
```bash
# DCCA between two series
maiastatistics --i1 series1.csv --i2 series2.csv --dcca --minbox 10 --maxbox 200 -o dcca_results.csv

# Rho DCCA for multiple file pairs
maiastatistics --i1 BTC-USD-Input.csv --i2 "cryptocoins/*Close.csv" --rhodcca
```

## Visualization

### Creating Charts

MaiaStatistics supports creating sophisticated charts using JSON configuration files. Here's an example for visualizing multiple cryptocurrency correlations:

**cryptocoins.json:**
```json
{
    "type": "scatter",
    "data": {
        "datasets": [
            {
                "label": "ADA-USD",
                "data": statistics.loadCSV("test/cryptocoins/ADA-USD-Close-rhodcca.csv", 1, ",", true, true, ["x", "", "", "", "y"]),
                "borderColor": "aqua",
                "backgroundColor": "aqua"
            },
            {
                "label": "BNB-USD",
                "data": statistics.loadCSV("test/cryptocoins/BNB-USD-Close-rhodcca.csv", 1, ",", true, true, ["x", "", "", "", "y"]),
                "borderColor": "black",
                "backgroundColor": "black"
            },
            {
                "label": "BUSD-USD",
                "data": statistics.loadCSV("test/cryptocoins/BUSD-USD-Close-rhodcca.csv", 1, ",", true, true, ["x", "", "", "", "y"]),
                "borderColor": "blue",
                "backgroundColor": "blue"
            },
            {
                "label": "DOGE-USD",
                "data": statistics.loadCSV("test/cryptocoins/DOGE-USD-Close-rhodcca.csv", 1, ",", true, true, ["x", "", "", "", "y"]),
                "borderColor": "fuchsia",
                "backgroundColor": "fuchsia"
            },
            {
                "label": "ETH-USD",
                "data": statistics.loadCSV("test/cryptocoins/ETH-USD-Close-rhodcca.csv", 1, ",", true, true, ["x", "", "", "", "y"]),
                "borderColor": "gray",
                "backgroundColor": "gray"
            },
            {
                "label": "HEX-USD",
                "data": statistics.loadCSV("test/cryptocoins/HEX-USD-Close-rhodcca.csv", 1, ",", true, true, ["x", "", "", "", "y"]),
                "borderColor": "green",
                "backgroundColor": "green"
            },
            {
                "label": "SOL-USD",
                "data": statistics.loadCSV("test/cryptocoins/SOL-USD-Close-rhodcca.csv", 1, ",", true, true, ["x", "", "", "", "y"]),
                "borderColor": "lime",
                "backgroundColor": "lime"
            },
            {
                "label": "USDC-USD",
                "data": statistics.loadCSV("test/cryptocoins/USDC-USD-Close-rhodcca.csv", 1, ",", true, true, ["x", "", "", "", "y"]),
                "borderColor": "maroon",
                "backgroundColor": "maroon"
            },
            {
                "label": "USDT-USD",
                "data": statistics.loadCSV("test/cryptocoins/USDT-USD-Close-rhodcca.csv", 1, ",", true, true, ["x", "", "", "", "y"]),
                "borderColor": "navy",
                "backgroundColor": "navy"
            },
            {
                "label": "XRP-USD",
                "data": statistics.loadCSV("test/cryptocoins/XRP-USD-Close-rhodcca.csv", 1, ",", true, true, ["x", "", "", "", "y"]),
                "borderColor": "olive",
                "backgroundColor": "olive"
            }
        ]
    },
    "options": {
        "scales": {
            "x": {
                "type": "linear"
            }
        }
    }
}
```

**Generate the chart:**
```bash
# PNG format
maiastatistics --plot -o cryptocoins.png -i cryptocoins.json

# PDF format
maiastatistics --plot -o cryptocoins.pdf -t pdf -i cryptocoins.json

# Custom dimensions
maiastatistics --plot -o large_chart.png --width 1920 --height 1080 --background "white" -i chart_config.json
```

### Chart Configuration Options

The chart configuration supports:
- **Multiple datasets** with different colors and labels
- **Various chart types** (scatter, line, bar, etc.)
- **Custom scales** (linear, logarithmic, time)
- **Data loading directly from CSV files**
- **Custom styling** (colors, borders, backgrounds)

## Practical Examples

### Financial Time Series Analysis

```bash
# Analyze cryptocurrency correlations
maiastatistics --i1 BTC-USD.csv --i2 "altcoins/*.csv" --rhodcca

# Create correlation visualization
maiastatistics --plot -o crypto_correlations.png -i crypto_chart.json
```

### Scientific Data Processing

```bash
# Process experimental data
maiastatistics -i "experiment*.csv" --avg --oavg mean_results.csv

# Analyze signal properties
maiastatistics -i signal.csv --dfa --minbox 8 --maxbox 256 -o dfa_analysis.csv

# Generate control data
maiastatistics -n 10000 --gaussian --mean 0 --deviation 0.1 -o control_data.csv
```

### Batch Processing Multiple Files

```bash
# Process all CSV files in directory
for file in data/*.csv; do
    maiastatistics -i "$file" --normalize -o "normalized/${file##*/}"
done

# Batch DFA analysis
for series in timeseries/*.csv; do
    basename=$(basename "$series" .csv)
    maiastatistics -i "$series" --dfa -o "dfa_results/${basename}_dfa.csv" -r "reports/${basename}_report.txt"
done
```

### Complete Workflow Example

```bash
#!/bin/bash

# Financial time series analysis workflow

# 1. Preprocess data
maiastatistics -i raw_prices.csv --normalize -o normalized_prices.csv

# 2. Calculate correlations
maiastatistics --i1 normalized_prices.csv --i2 "market_data/*.csv" --rhodcca

# 3. Generate visualization
maiastatistics --plot -o market_analysis.png -i chart_config.json

# 4. Statistical summary
maiastatistics -i "market_data/*.csv" --avg --oavg market_averages.csv --odev market_deviations.csv
```

## Output Files

MaiaStatistics generates several types of output files:

- **CSV files**: Processed data and analysis results
- **Report files** (.txt): Statistical summaries and parameters
- **Image files** (.png, .pdf): Visualizations and charts
- **Configuration files** (.json): Chart and analysis settings

## Tips and Best Practices

1. **Use file globbing** for processing multiple files: `"data/*.csv"`
2. **Always specify output files** to avoid overwriting
3. **Use report files** to capture analysis parameters and results
4. **Test with small datasets** before processing large files
5. **Use normalized data** for consistent analysis results
6. **Combine operations** in scripts for complex workflows

This manual covers the main features of MaiaStatistics. For specific use cases or advanced configurations, refer to the individual command help and experiment with different parameter combinations.