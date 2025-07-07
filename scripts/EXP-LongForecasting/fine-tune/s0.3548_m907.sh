
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

finetune_model='./checkpoints/pretrained_source_domain_96_96_Informer_custom_ftM_sl96_ll48_pl96_dm64_nh8_el2_dl1_df256_fc3_ebtimeF_dtTrue_Exp_0'

for model_name in Informer
do 
for pred_len in 96 
do
  python -u run_longExp.py \
      --is_training 1 \
      --is_finetune 1 \
      --finetune_weights $finetune_model \
      --root_path ./dataset/ \
      --data_path s0.3548_m907.csv \
      --model_id finetuned_s0.3548_m907_96_$pred_len \
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
      --itr 1  >logs/LongForecasting/$model_name'_finetune_s0.3548_m907_'$pred_len.log
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