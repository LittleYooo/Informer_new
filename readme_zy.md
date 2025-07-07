To train the **Informer** on **dim1 dataset**, you can use the script `scripts/EXP-LongForecasting/Linear/dim1.sh`:
```
bash scripts/EXP-LongForecasting/Linear/dim1.sh

train的过程在./logs文件夹下
只进行test的话将dim1.sh中的--is_training改为0，test结果保存在./results文件夹下相应setting文件夹下的result.txt中

训练好的checkpoints在checkpoints/dim1_96_96_Informer_dim1_ftM_sl96_ll48_pl96_dm64_nh8_el2_dl1_df256_fc3_ebtimeF_dtTrue_Exp_0