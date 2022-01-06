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
        mass_train = data_row[morphometric_variable]
        interval = 1
    else:
        morphometric_variable = "Longitud_ala"
        mass_train = data_row[morphometric_variable]
        interval = mass_train * 0.012
    similar_values = train_set[
        train_set[morphometric_variable].between(mass_train - interval, mass_train + interval)
    ]["target"]
    if len(similar_values) == 0:
        morphometric_variable = "Masa"
        mass_train = data_row[morphometric_variable]
        interval = 1
    similar_values = train_set[
        train_set[morphometric_variable].between(mass_train - interval, mass_train + interval)
    ]["target"]
    results_dic["id"].append(data_row["id"])
    results_dic["target"].append(similar_values.mean().round())

results_df = pd.DataFrame(results_dic)

dates = []
nido = []
years = []

for n_row, data_row in results_df.iterrows():
    dates.append(data_row["id"][0:10])
    years.append(data_row["id"][0:4])
    nido.append(data_row["id"][11:])

results_df["date"] = dates
results_df["id_nido"] = nido
results_df["date_dt"] = pd.to_datetime(results_df["date"])
results_df["year"] = years

corrected_df = results_df.copy()
for nido, data in results_df.groupby(by=["id_nido","year"]):
    first_age_predicted = data["target"].iloc[0]
    n_days = len(data)
    corrected_ages = np.linspace(first_age_predicted,first_age_predicted+n_days, n_days+1)
    corrected_df["target"].loc[data.index] = corrected_ages[:-1]
    

corrected_df.to_csv("pollos_petrel/datletas_encobijados_last_submission.csv", index=False)
