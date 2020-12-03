## Credit Card Fraud Detection
# 1. Intro:
Credit card fraud is the unauthorized use of a credit or debit card, to fraudulently obtain money or property. Credit and debit card numbers can be stolen from unsecured websites or can be obtained in an identity theft scheme.
# 2. About the Data:
The dataset contains almost 285k observations. The available features are Time, anonymous features V1 to V28(which are the results of PCA transformation) and Amount while the classification is given by class. Only 0.17% of the transactions are fraudulent
# 3.Scaling the data using RobustScaler:
Why? because the transaction amount is heaviliy skewed towards small transactions and to normalize the distribution.\
**Unsacled Amount:**\
![Unsacled Amount](https://github.com/ZiyadAlmatrafi/Data-science/blob/master/FinalProject/unsacledAmount.PNG)

**Sacled Amount:**\
![Sacled Amount](https://github.com/ZiyadAlmatrafi/Data-science/blob/master/FinalProject/scalcedAmount.PNG)

# 4. Using SMOTE (Synthetic Minority Over-sampling Technique) to balance the data:
1. SMOTE creates new synthetic points in order to have an equal balance of the classes.
2. SMOTE picks the distance between the closest neighbors of the minority class, in between these distances it creates synthetic points.
**Imbalance Data:**\
![Unsacled Amount](https://github.com/ZiyadAlmatrafi/Data-science/blob/master/FinalProject/imbalance.PNG)

**Balanced Data:**\
![Sacled Amount](https://github.com/ZiyadAlmatrafi/Data-science/blob/master/FinalProject/balanced.PNG)

# 5.Random Forest Classifier:
1. Random Forest is ensemble of Decision trees which performs Bagging internally. 
2. Random Forest creates several trees, sometimes thousands, and calculates the best possible model for a given dataset. Instead of considering all features while splitting a node, Random Forest algorithm selects the best feature out of a subset of all features

# 6.Moving Forward:
1. Apply Cross-validation on the data.
2. Try other models
3. Compare between the models

# References:
- [FBI Credit Card Fraud](https://www.fbi.gov/scams-and-safety/common-scams-and-crimes/credit-card-fraud#:~:text=Credit%20card%20fraud%20is%20the,in%20an%20identity%20theft%20scheme.)
- [Credit Card Fraud Detection Dataset](https://www.kaggle.com/mlg-ulb/creditcardfraud)
- [RobustScaler](https://scikit-learn.org/stable/modules/generated/sklearn.preprocessing.RobustScaler.html)
- [SMOTE explained for noobs - Synthetic Minority Over-sampling TEchnique line by line](http://rikunert.com/SMOTE_explained)
- [Random Forest Classifier](https://scikit-learn.org/stable/modules/generated/sklearn.ensemble.RandomForestClassifier.html)


