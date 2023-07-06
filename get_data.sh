#!/bin/bash
#YBATCH -r  epyc-7543_1 
#SBATCH -N 1
#SBATCH -o ./proces%j.out
#SBATCH --time=72:00:00
#SBATCH -J preproces
#SBATCH --error ./proces%j.err

source activate
conda deactivate
conda activate /home/lfsm/anaconda3/envs/megatron

folder='/mnt/nfs/Users/lfsm/ja_corpus_filterd/mc4'
files=$(find $folder -type f -printf "%p,")
files=${files%,}  # Remove the trailing comma
python tools/preprocess_data.py \
            --input $files \
            --output-prefix /mnt/nfs/Users/lfsm/ja_corpus_preprocessed/mc4 \
            --dataset-impl mmap \
            --tokenizer-type HFT5Tokenizer \
            --workers 64 \
            --append-eod

folder='/mnt/nfs/Users/lfsm/ja_corpus_filterd/oscar-2023'
files=$(find $folder -type f -printf "%p,")
files=${files%,}  # Remove the trailing comma
python tools/preprocess_data.py \
            --input $files \
            --output-prefix /mnt/nfs/Users/lfsm/ja_corpus_preprocessed/oscar-2023 \
            --dataset-impl mmap \
            --tokenizer-type HFT5Tokenizer \
            --workers 64 \
            --append-eod

folder='/mnt/nfs/Users/lfsm/ja_corpus_filterd/cc100'
files=$(find $folder -type f -printf "%p,")
files=${files%,}  # Remove the trailing comma
python tools/preprocess_data.py \
            --input $files \
            --output-prefix /mnt/nfs/Users/lfsm/ja_corpus_preprocessed/cc100 \
            --dataset-impl mmap \
            --tokenizer-type HFT5Tokenizer \
            --workers 64 \
            --append-eod

            
files='/mnt/nfs/Users/lfsm/ja_corpus_filterd/wiki_ja_20230320_train.jsonl.zst'
python tools/preprocess_data.py \
            --input $files \
            --output-prefix /mnt/nfs/Users/lfsm/ja_corpus_preprocessed/ja_wiki \
            --dataset-impl mmap \
            --tokenizer-type HFT5Tokenizer \
            --workers 64 \
            --append-eod

files='/mnt/nfs/Users/lfsm/ja_corpus_filterd/aozora_books.jsonl.zst'
python tools/preprocess_data.py \
            --input $files \
            --output-prefix /mnt/nfs/Users/lfsm/ja_corpus_preprocessed/auzora \
            --dataset-impl mmap \
            --tokenizer-type HFT5Tokenizer \
            --workers 64 \
            --append-eod