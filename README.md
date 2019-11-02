# Peak Detection
A data point is considered a peak in a time series when the moving z-score is beyond a given threshold.

### Setup
- Install all the dependencies first: ```bundle install```
- Setup DB: ``` rails db:setup```
- Run test cases: ```rails test```
- Start rails server: ```rails s```

### Project Structure
- Calculators
    - MeanCalculator: calculate the "mean" of a given population.
    - StandardDeviationCalculator: calculate the "standard deviation" of a given population, using the population mean.
    - ZScoreCalculator: calculate the "z_score" of each data point based on population's mean and standard deviation.
- Services:
    - PeakDetectionService: detect sudden peaks inside a given population using a given threshold based on z_score of each data point in the given population. ```z_score(y) > threshold```.
