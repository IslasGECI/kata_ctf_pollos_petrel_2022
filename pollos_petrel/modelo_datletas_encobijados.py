import pandas as pd
import numpy as np

train_path = "pollos_petrel/train.csv"
test_path = "pollos_petrel/test.csv"

train_set = pd.read_csv(train_path)
test_set = pd.read_csv(test_path)

results_dic = {"id": [], "target": []}

for n_row, data_row in test_set.iterrows():
    if np.isnan(data_row["Longitud_ala"]):
        morphometric_variable = "Masa"
        interval = 1
    else:
        morphometric_variable = "Longitud_ala"
        interval = 2
    mass_train = data_row[morphometric_variable]
    similar_values = train_set[
        train_set[morphometric_variable].between(mass_train - interval, mass_train + interval)
    ][morphometric_variable]
    results_dic["id"].append(data_row["id"])
    results_dic["target"].append(similar_values.mean().round())

results_df = pd.DataFrame(results_dic)
results_df.to_csv("pollos_petrel/datletas_encobijados_first_submission.csv", index=False)