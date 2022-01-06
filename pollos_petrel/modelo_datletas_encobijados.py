import pandas as pd


train_path = "train.csv"
test_path = "test.csv"

train_set = pd.read_csv(train_path)
test_set = pd.read_csv(test_path)

results_dic = {"id":[], "target": []}

for n_row,data_row in test_set.iterrows():
    mass_train = data_row["Masa"]
    similar_values = train_set[train_set["Masa"].between(mass_train - 1, mass_train + 1)]["Masa"]
    results_dic["id"].append(data_row["id"])
    results_dic["target"].append(similar_values.mean().round())

results_df = pd.DataFrame(results_dic)
results_df.to_csv("datletas_encobijados_first_submission.csv", index=False)