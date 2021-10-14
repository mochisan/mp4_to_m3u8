#!/bin/sh
if !(type "brew" > /dev/null 2>&1); then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
if !(type "ffmpeg" > /dev/null 2>&1); then
    brew install ffmpeg
fi
echo Lesson Identifier: 
read identifier
if [ ! -e ~/Downloads/$identifier.mp4 ]; then
    echo "ダウンロードフォルダに"$identifier".mp4が見つかりません"
else
    echo "ダウンロードフォルダの"$identifier".mp4をm3u8形式に変換します"
    mkdir ~/Downloads/$identifier
    ffmpeg -i ~/Downloads/$identifier.mp4 -flags +cgop -g 30 -hls_list_size 0 -hls_time 1 ~/Downloads/$identifier/${identifier}_.m3u8
fi
