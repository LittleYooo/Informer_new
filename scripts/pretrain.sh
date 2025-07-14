
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
      --is_training 1 \
      --root_path ./dataset/ \
      --data_path source_domain.csv \
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
      --enc_in 9 \
      --dec_in 9 \
      --c_out 9 \
      --learning_rate 0.00001 \
      --des 'Exp' \
      --itr 1  >logs/LongForecasting/$model_name'_source_'$pred_len.log
done
done
