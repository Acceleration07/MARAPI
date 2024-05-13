#!/bin/bash

while getopts "l:d" opt; do
  case ${opt} in
    l )
      imdb_link="$OPTARG"
      ;;
    d )
      download=true
      ;;
    \? )
      echo "Usage: poster-search -l <IMDb link> -d (to download images)"
      exit 1
      ;;
  esac
done
shift $((OPTIND -1))

if [ -z "$imdb_link" ]; then
    read -p "IMDb Code or link: " response
    imdb_link="$response"
fi

imdb_code=""
if [[ $imdb_link =~ ^https?://www.imdb.com/title/.* ]]; then
    imdb_code=$(echo "$imdb_link" | grep -oP '(?<=\/title\/)[^\/]+')
elif [[ $imdb_link =~ ^https?://m\.imdb\.com/title/.* ]]; then
    imdb_code=$(echo "$imdb_link" | grep -oP '(?<=\/title\/)[^\/]+')
fi

if [[ -z $imdb_code ]]; then
    imdb_code=$imdb_link
fi

movie_info=$(curl -s "http://www.omdbapi.com/?i=${imdb_code}&apikey=36971aec")
movie_title=$(echo "${movie_info}" | grep -oP '(?<="Title":")[^"]+')
main_title=$(echo "$movie_title" | tr '[:upper:]' '[:lower:]' | tr -d "?:&'" | sed "s/&/and/g" | tr ' ' '-')
imdbc="https://www.imdb.com/title/${imdb_code}/"
rmc=$(curl -s -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36" "$imdbc" | grep "ipc-lockup-overlay ipc-focusable" | grep -o "/mediaviewer/rm[^\"']*" | grep "?ref_=tt_ov_i" | cut -c 2-25)
  curl -s -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36" "$imdbc$rmc" | grep "sc-7c0a9e7c-2 ghbUKT" | grep -o "https://m.media-amazon.com/images[^\"']*" | grep -E 'https://m.media-amazon.com/images.*[4][0-9]{2}w.*' | tr ' ' '\n' | grep "https://m.media-amazon.com/images" | head -n 1
