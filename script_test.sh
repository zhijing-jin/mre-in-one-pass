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

echo "$DATA_DIR"
python run_classifier.py \
        --task_name=$TASK_NAME \
        --do_train=false \
        --do_eval=false \
        --do_predict=true \
        --data_dir=$DATA_DIR \
        --vocab_file=$BERT_BASE_DIR/vocab.txt \
        --bert_config_file=$BERT_BASE_DIR/bert_config.json \
        --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
        --max_seq_length=$MAX_SEQ_LEN \
        --max_distance=2 \
        --max_num_relations=$MAX_NUM_REL \
        --output_dir=$OUTPUT_DIR

