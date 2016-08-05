from feature_engineering import FeatureEngineering

f = FeatureEngineering('ex_train.csv', 'ex_test.csv', 'key', ['ex_wide_1.csv', 'ex_wide_2.csv'], 'ex_long.csv')
d = f.extract_features()
