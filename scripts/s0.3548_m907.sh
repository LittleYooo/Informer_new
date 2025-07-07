
if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/LongForecasting" ]; then
    mkdir ./logs/LongForecasting
fi

finetuned_model='./checkpoints/finetuned_s0.3548_m907_96_96_Informer_custom_ftM_sl96_ll48_pl96_dm64_nh8_el2_dl1_df256_fc3_ebtimeF_dtTrue_Exp_0'
data='s0.3548_m907'

for model_name in Informer
do 
for pred_len in 96 
do
  python -u run_longExp.py \
      --is_training 0 \
      --root_path ./dataset/ \
      --data_path $data.csv \
      --model_id finetuned_$data'_96_'$pred_len \
      --model $model_name \
      --data custom \
      --features M \
      --seq_len 96 \
      --label_len 48 \
      --pred_len $pred_len \
      --e_layers 2 \
      --d_layers 1 \
      --factor 3 \
      --enc_in 7 \
      --dec_in 7 \
      --c_out 7 \
      --learning_rate 0.00001 \
      --des 'Exp' \
      --itr 1  >logs/LongForecasting/$model_name'_'$data'_'$pred_len'_finetuned.log'
done
done