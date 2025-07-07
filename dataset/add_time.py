import os
import numpy as np
import pandas as pd

df_raw = pd.read_csv('/home/zy/LTSF-Linear-main/dataset/dim2_ori.csv')
# df_raw['date'] = pd.Series(range(1, len(df_raw) + 1))
df_raw.insert(0, 'date0', range(1, len(df_raw) + 1))
# 3. 将更新后的DataFrame写回CSV文件
df_raw.to_csv('/home/zy/LTSF-Linear-main/dataset/dim2.csv', index=False)  