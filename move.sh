for dir in global_step{100000..190000}; do 
  if [ -d "$dir" ]; then 
    mv "$dir" /mnt/nfs/Users/tn/checkpoints_ja_llama410m_v2 
  fi 
done
