#!/bin/bash
name="wallpaper"
aux="aux"
total=$(ls | wc -l)

getExtension(){
  extension="${1#*.}"
  case "$extension" in 
    *"."* ) getExtension "$extension" ;;
  esac
}

cd wallpapers/ && ls -1v | while read filename; do
  getExtension "${filename}"
  number=1
  while true; do
    if [ ! -e "${name}${number}.${extension}" ]; then
      mv -v $filename "${name}${number}.${extension}" 
      break
    else
      number=$((number+1))
    fi
  done
done

