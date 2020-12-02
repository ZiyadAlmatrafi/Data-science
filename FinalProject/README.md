## Credit Card Fraud Detection
# 1. Intro:
Credit card fraud is the unauthorized use of a credit or debit card, to fraudulently obtain money or property. Credit and debit card numbers can be stolen from unsecured websites or can be obtained in an identity theft scheme.
# 2. About the Data:
The dataset contains almost 285k observations. The available features are Time, anonymous features V1 to V28(which are the results of PCA transformation) and Amount while the classification is given by class. Only 0.17% of the transactions are fraudulent
# 3.Scaling the data using RobustScaler:
Why? because the transaction amount is heaviliy skewed towards small transactions and to normalize the distribution.\
Unsacled Amount:
![Unsacled Amount](https://github.com/ZiyadAlmatrafi/Data-science/blob/master/FinalProject/scalcedAmount.PNG)
\
Sacled Amount:
![Sacled Amount](https://github.com/ZiyadAlmatrafi/Data-science/blob/master/FinalProject/scalcedAmount.PNG)
