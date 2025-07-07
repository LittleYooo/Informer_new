
if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/LongForecasting" ]; then
    mkdir ./logs/LongForecasting
fi


for model_name in Informer
do 
for pred_len in 96 
do
  python -u run_longExp.py \
      --is_training 0 \
      --root_path ./dataset/ \
      --data_path s0.3548_m907.csv \
      --model_id pretrained_source_domain_96_$pred_len \
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
      --itr 1  >logs/LongForecasting/$model_name'_s0.3548_m907_'$pred_len.log
done
done