
if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/LongForecasting" ]; then
    mkdir ./logs/LongForecasting
fi
# seq_len=100
# model_name=DLinear

# python -u run_longExp.py \
#   --is_training 1 \
#   --root_path ./dataset/ \
#   --data_path dim1.csv \
#   --model_id dim1_$seq_len'_'100 \
#   --model $model_name \
#   --data dim1 \
#   --features M \
#   --seq_len $seq_len \
#   --label_len 0 \
#   --pred_len 100 \
#   --enc_in 9 \
#   --des 'Exp' \
#   --itr 1 --batch_size 32 --learning_rate 0.001 >logs/LongForecasting/$model_name'_'dim1_$seq_len'_'101.log

# for model_name in Autoformer Informer Transformer
for model_name in  Informer
do 
for pred_len in 96 
do
  python -u run_longExp.py \
      --is_training 1 \
      --root_path ./dataset/ \
      --data_path dim1.csv \
      --model_id dim1_96_$pred_len \
      --model $model_name \
      --data dim1 \
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
      --itr 1  >logs/LongForecasting/$model_name'_dim1_'$pred_len.log
done
done
# # python -u run_longExp.py \
# #   --is_training 1 \
# #   --root_path ./dataset/ \
# #   --data_path dim1.csv \
# #   --model_id dim1_$seq_len'_'192 \
# #   --model $model_name \
# #   --data dim1 \
# #   --features M \
# #   --seq_len $seq_len \
# #   --pred_len 192 \
# #   --enc_in 7 \
# #   --des 'Exp' \
# #   --itr 1 --batch_size 32 --learning_rate 0.005 >logs/LongForecasting/$model_name'_'dim1_$seq_len'_'192.log

# # python -u run_longExp.py \
# #   --is_training 1 \
# #   --root_path ./dataset/ \
# #   --data_path dim1.csv \
# #   --model_id dim1_$seq_len'_'336 \
# #   --model $model_name \
# #   --data dim1 \
# #   --features M \
# #   --seq_len $seq_len \
# #   --pred_len 336 \
# #   --enc_in 7 \
# #   --des 'Exp' \
# #   --itr 1 --batch_size 32 --learning_rate 0.005 >logs/LongForecasting/$model_name'_'dim1_$seq_len'_'336.log

# # python -u run_longExp.py \
# #   --is_training 1 \
# #   --root_path ./dataset/ \
# #   --data_path dim1.csv \
# #   --model_id dim1_$seq_len'_'720 \
# #   --model $model_name \
# #   --data dim1 \
# #   --features M \
# #   --seq_len $seq_len \
# #   --pred_len 720 \
# #   --enc_in 7 \
# #   --des 'Exp' \
# #   --itr 1 --batch_size 32 --learning_rate 0.005 >logs/LongForecasting/$model_name'_'dim1_$seq_len'_'720.log