DATA_DIR="data/semeval2018/multi"
TASK_NAME="semeval"
OUTPUT_DIR="output_$TASK_NAME"

curl -o $DATA_DIR/SemEval.evalscript.pl https://lipn.univ-paris13.fr/~gabor/semeval2018task7/semeval2018_task7_scorer-v1.2.pl 
curl -o $DATA_DIR/SemEval.testkeys.txt https://lipn.univ-paris13.fr/~gabor/semeval2018task7/keys.test.1.1.txt 
cut -d '(' -f 2- $DATA_DIR/SemEval.testkeys.txt > $DATA_DIR/SemEval.testkeys_suffix.txt
paste -d "(" $OUTPUT_DIR/test_results.tsv $DATA_DIR/SemEval.testkeys_suffix.txt > $OUTPUT_DIR/test_results_formatted.txt
perl $DATA_DIR/SemEval.evalscript.pl $OUTPUT_DIR/test_results_formatted.txt $DATA_DIR/SemEval.testkeys.txt
 
