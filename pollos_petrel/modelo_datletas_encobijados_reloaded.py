import pandas as pd
import numpy as np

train_path = "pollos_petrel/train.csv"
test_path = "pollos_petrel/test.csv"

train_set = pd.read_csv(train_path)
test_set = pd.read_csv(test_path)

results_dic = {"id": [], "target": []}
percents_array = np.linspace(0.01,0.015,10)
mass_intervals_array = np.linspace(0.4,1,10)
count = 1

for mass_intervals in mass_intervals_array:
    for percents in percents_array:
        for n_row, data_row in test_set.iterrows():
            if np.isnan(data_row["Longitud_ala"]):
                morphometric_variable = "Masa"
                mass_train = data_row[morphometric_variable]
                interval = mass_intervals
            else:
                morphometric_variable = "Longitud_ala"
                mass_train = data_row[morphometric_variable]
                interval = mass_train * percents
            similar_values = train_set[
                train_set[morphometric_variable].between(mass_train - interval, mass_train + interval)
            ]["target"]
            if len(similar_values) == 0:
                morphometric_variable = "Masa"
                mass_train = data_row[morphometric_variable]
                interval = mass_intervals
            similar_values = train_set[
                train_set[morphometric_variable].between(mass_train - interval, mass_train + interval)
            ]["target"]
            results_dic["id"].append(data_row["id"])
            results_dic["target"].append(similar_values.mean().round())
        results_df = pd.DataFrame(results_dic)
        results_df.to_csv("pollos_petrel/datletas_encobijados_reloaded_{}_submission.csv".format(count), index=False)
        count += 1
