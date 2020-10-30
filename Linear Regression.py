#



import pandas as pd

# Importing the dataset
dataset = pd.read_csv('50Startups.csv')
Numeric = dataset.drop(["State"],axis=1)

# Categorical
State =  dataset["State"]

# Encoding Categorical Data
from sklearn.preprocessing import LabelEncoder, OneHotEncoder

# integer encode
label_encoder = LabelEncoder()
integer_encoded = label_encoder.fit_transform(State)
print(integer_encoded)


onehot_encoder = OneHotEncoder(sparse=False)
integer_encoded = integer_encoded.reshape(len(integer_encoded), 1)
onehot_encoded = onehot_encoder.fit_transform(integer_encoded)
print(onehot_encoded)

bridge_df = pd.DataFrame(onehot_encoded, columns= ['California','Florida','New York' ])


# Pandas column bind (cbind) two data frames


from sklearn.preprocessing import MinMaxScaler
# define min max scaler
scaler = MinMaxScaler()
# transform data
scaled = scaler.fit_transform(Numeric)


Numeric = pd.DataFrame(scaled, columns= Numeric.columns)
X = pd.concat([Numeric.reset_index(drop=True), bridge_df], axis=1)


Class = X["Profit"] # Dependent Variable/Target Values
X =X.drop("Profit", axis = 1)
# Optimal Model using Backward Elimination

import statsmodels.api as sm

X = sm.add_constant(X) # adding a constant
model = sm.OLS(Class, X).fit()

model.summary()
predictions = model.predict(X) 

from sklearn.metrics import mean_squared_error 

mean_squared_error(Class, predictions) 
