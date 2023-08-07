#!/bin/bash
#YBATCH -r threadripper-3960x_8
#SBATCH -N 1
#SBATCH -o ./proces%j.out
#SBATCH --time=72:00:00
#SBATCH -J preproces
#SBATCH --error ./proces%j.err

echo "start"
folder='/mnt/nfs/Users/tn/llm-jp-corpus/scripts/data/filter/gpt-neox-ja-cc'
files=$(find $folder -type f -printf "%p,")
files=${files%,}  # Remove the trailing comma
python tools/preprocess_data.py \
            --input $files \
            --output-prefix /mnt/nfs/Users/tn/llm-jp-corpus_preprocessed/ja_cc-v1-cc100_ja40K_en10K/ja_cc \
            --vocab-file /home/tn/gpt-neox/tokenizer/cc100_ja40K_en10K.symbolRemoved.vocab.reestimated.model \
            --dataset-impl mmap \
            --tokenizer-type JapaneseSentencePiece \
            --workers 128 \
            --append-eod

echo "finish"


# folder='/mnt/nfs/Users/lfsm/ja_corpus_filterd/oscar-2023'
# files=$(find $folder -type f -printf "%p,")
# files=${files%,}  # Remove the trailing comma
# python tools/preprocess_data.py \
#             --input $files \
#             --output-prefix /mnt/nfs/Users/lfsm/ja_corpus_preprocessed/oscar-2023 \
#             --dataset-impl mmap \
#             --tokenizer-type HFT5Tokenizer \
#             --workers 64 \
#             --append-eod

# folder='/mnt/nfs/Users/lfsm/ja_corpus_filterd/cc100'
# files=$(find $folder -type f -printf "%p,")
# files=${files%,}  # Remove the trailing comma
# python tools/preprocess_data.py \
#             --input $files \
#             --output-prefix /mnt/nfs/Users/lfsm/ja_corpus_preprocessed/cc100 \
#             --dataset-impl mmap \
#             --tokenizer-type HFT5Tokenizer \
#             --workers 64 \
#             --append-eod

            
# files='/mnt/nfs/Users/lfsm/ja_corpus_filterd/wiki_ja_20230320_train.jsonl.zst'
# python tools/preprocess_data.py \
#             --input $files \
#             --output-prefix /mnt/nfs/Users/lfsm/ja_corpus_preprocessed/ja_wiki \
#             --dataset-impl mmap \
#             --tokenizer-type HFT5Tokenizer \
#             --workers 64 \
#             --append-eod

# files='/mnt/nfs/Users/lfsm/ja_corpus_filterd/aozora_books.jsonl.zst'
# python tools/preprocess_data.py \
#             --input $files \
#             --output-prefix /mnt/nfs/Users/lfsm/ja_corpus_preprocessed/auzora \
#             --dataset-impl mmap \
#             --tokenizer-type HFT5Tokenizer \
#             --workers 64 \
#             --append-eod