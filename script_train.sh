BERT_BASE_DIR="../bigdata/uncased_L-12_H-768_A-12"
TASK_NAME="ace"
OUTPUT_DIR="output_$TASK_NAME"
mkdir $OUTPUT_DIR 2>/dev/null

if [ $TASK_NAME = "ace" ]; then
    EPOCHS=15
    MAX_NUM_REL=128
    MAX_SEQ_LEN=157
    DATA_DIR='data/ace05/multi'
else
    EPOCHS=30
    MAX_SEQ_LEN=256
    DATA_DIR='data/semeval2018/multi'
    MAX_NUM_REL=12
fi

python run_classifier.py \
        --task_name=$TASK_NAME \
        --do_train=true \
        --do_eval=false \
        --do_predict=false \
        --data_dir=$DATA_DIR \
        --vocab_file=$BERT_BASE_DIR/vocab.txt \
        --bert_config_file=$BERT_BASE_DIR/bert_config.json \
        --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
        --max_seq_length=$MAX_SEQ_LEN \
        --train_batch_size=4 \
        --learning_rate=2e-5 \
        --num_train_epochs=$EPOCHS \
        --max_distance=2 \
        --max_num_relations=$MAX_NUM_REL \
        --output_dir=$OUTPUT_DIR/

