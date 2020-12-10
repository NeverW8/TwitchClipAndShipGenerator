#!/bin/bash

sudo apt install ffmpeg toilet figlet youtube-dl rename -y


toilet -f mono9 -t Twitch Clips Generator
echo "----------------------------------------------------------------"
echo "Download direct links for top weekly clips for specific category"
echo "----------------------------------------------------------------"
echo "starting download in 5.."
sleep 1
echo "starting in 4.."
sleep 1
echo "starting in 3.."
sleep 1
echo "starting in 2.."
sleep 1
echo "starting in 1"
sleep 1
echo "Firing up!!"
sleep 3
clear

echo "Creating directories"
mkdir {1..7}
mkdir {1..7}/final
ls
echo "Make sure you see seven directories with the name 1,2,3,4,5,6 and 7."
sleep 5

echo "----------------------------------------------------------------"
curl -H 'Accept: application/vnd.twitchtv.v5+json' \
    -H 'Client-ID: kimne78kx3ncx6brgo4mv6wki5h1ko' \
    -X GET 'https://api.twitch.tv/kraken/clips/top?game=Just%20Chatting&period=week&limit=20&language=en' |  grep -io 'https://clips.twitch.tv/[a-z0-9+-]*' | egrep -ve 'embed' > 1/1-links.txt

echo "----------------------------------------------------------------"
echo "Just chatting downloaded and exported"
echo "----------------------------------------------------------------"

echo "starting  "
curl -H 'Accept: application/vnd.twitchtv.v5+json' \
    -H 'Client-ID: kimne78kx3ncx6brgo4mv6wki5h1ko' \
    -X GET 'https://api.twitch.tv/kraken/clips/top?game=League%20of%20Legends&period=week&limit=20&language=en' |  grep -io 'https://clips.twitch.tv/[a-z0-9+-]*' | egrep -ve 'embed' > 2/2-links.txt

echo "----------------------------------------------------------------"
echo "League of legends downloaded and exported"
echo "----------------------------------------------------------------"

echo "starting  "
curl -H 'Accept: application/vnd.twitchtv.v5+json' \
    -H 'Client-ID: kimne78kx3ncx6brgo4mv6wki5h1ko' \
    -X GET 'https://api.twitch.tv/kraken/clips/top?game=Among%20Us&period=week&limit=20&language=en' |  grep -io 'https://clips.twitch.tv/[a-z0-9+-]*' | egrep -ve 'embed' > 3/3-links.txt

echo "----------------------------------------------------------------"
echo "Among us downloaded and exported"
echo "----------------------------------------------------------------"

echo "starting  "
curl -H 'Accept: application/vnd.twitchtv.v5+json' \
    -H 'Client-ID: kimne78kx3ncx6brgo4mv6wki5h1ko' \
    -X GET 'https://api.twitch.tv/kraken/clips/top?game=Fortnite&period=week&limit=20&language=en' |  grep -io 'https://clips.twitch.tv/[a-z0-9+-]*' | egrep -ve 'embed' > 4/4-links.txt

echo "----------------------------------------------------------------"
echo "Fortnite downloaded and exported"
echo "----------------------------------------------------------------"

echo "starting  "
curl -H 'Accept: application/vnd.twitchtv.v5+json' \
    -H 'Client-ID: kimne78kx3ncx6brgo4mv6wki5h1ko' \
    -X GET 'https://api.twitch.tv/kraken/clips/top?game=FIFA%2021&period=week&limit=20&language=en' |  grep -io 'https://clips.twitch.tv/[a-z0-9+-]*' | egrep -ve 'embed' > 5/5-links.txt

echo "----------------------------------------------------------------"
echo "Fifa 2021 downloaded and exported"
echo "----------------------------------------------------------------"

echo "starting  "
curl -H 'Accept: application/vnd.twitchtv.v5+json' \
    -H 'Client-ID: kimne78kx3ncx6brgo4mv6wki5h1ko' \
    -X GET 'https://api.twitch.tv/kraken/clips/top?game=Call%20Of%20Duty%3A%20Modern%20Warfare&period=week&limit=20&language=en' |  grep -io 'https://clips.twitch.tv/[a-z0-9+-]*' | egrep -ve 'embed' > 6/6-links.txt

echo "----------------------------------------------------------------"
echo "COD Warzone downloaded and exported"
echo "----------------------------------------------------------------"

echo "starting  "
curl -H 'Accept: application/vnd.twitchtv.v5+json' \
    -H 'Client-ID: kimne78kx3ncx6brgo4mv6wki5h1ko' \
    -X GET 'https://api.twitch.tv/kraken/clips/top?game=Dota%202&period=week&limit=20&language=en' |  grep -io 'https://clips.twitch.tv/[a-z0-9+-]*' | egrep -ve 'embed' > 7/7-links.txt

echo "----------------------------------------------------------------"
echo "Dota2 downloaded and exported"
echo "----------------------------------------------------------------"

sleep 5
clear
echo "------------------------------------"
figlet Export done
sleep 2
echo "exiting...."

echo "------------------------------------"
echo "Downloading every category"
echo "------------------------------------"

cd 1
youtube-dl -f best -a *.txt
cd ..

echo "Category 1 downloaded"
echo "---------------------"

cd 2
youtube-dl -f best -a *.txt
cd ..

echo "Category 2 downloaded"
echo "---------------------"

cd 3
youtube-dl -f best -a *.txt
cd ..

echo "Category 3 downloaded"
echo "---------------------"

cd 4
youtube-dl -f best -a *.txt
cd ..

echo "Category 4 downloaded"
echo "---------------------"

cd 5
youtube-dl -f best -a *.txt
cd ..

echo "Category 5 downloaded"
echo "---------------------"

cd 6
youtube-dl -f best -a *.txt
cd ..

echo "Category 6 downloaded"
echo "---------------------"

cd 7
youtube-dl -f best -a *.txt
cd ..

echo "Category 7 downloaded"
echo "---------------------"
sleep 2

clear

echo "-----------------------------"
figlet Download completed
echo "-----------------------------"
sleep 4
echo "exiting..."

#Editing videos together should start here then maybe remove after download/upload or something?

echo "-----------------------------"
figlet Fixing 1
echo "-----------------------------"

cd 1


echo "----------------------------"
echo "Formating text.."
echo "----------------------------"
echo "removing dots breakers"
rename 's/\.(?=[^.]*\.)/_/g' *.mp4
echo "removing spaces + dots"
rename 's/^[. ]+//' *.mp4
echo "removing quotes (singles)"
for file in *.mp4; do dest="${file//[[:space:]]/.}" && mv -i "$file" "${dest//[^[:alnum:]._-]/}"; done
echo "-"
for f in *.mp4; do mv "$f" "${f// /}"; done

echo "----------------------------"
echo "-"echo "----------------------------"
echo "removing dots breakers"
rename 's/\.(?=[^.]*\.)/_/g' *.mp4
echo "removing spaces + dots"
rename 's/^[. ]+//' *.mp4
echo "removing quotes (singles)"
for file in *.mp4; do dest="${file//[[:space:]]/.}" && mv -i "$file" "${dest//[^[:alnum:]._-]/}"; done
echo "-"
for f in *.mp4; do mv "$f" "${f// /}"; done


#Converting & merging all videos together

SECONDS=0

for i in *.mp4; do ffmpeg -i "$i" -qscale 0 "${i%.*}.mpeg"; done

for filename in *.mpeg; do
echo "file $filename" >> concat-list.txt
done

ffmpeg -f concat -safe 0 -i concat-list.txt -s 1920x1080 -vcodec copy -acodec copy merged.mp4
echo "Concatenated videos list:"
cat concat-list.txt
rm concat-list.txt
mv merged.mp4 final/
rm *.mpeg
rm *.mp4
duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."


cd ..

echo "-----------------------------"
figlet Fixing 2
echo "-----------------------------"

cd 2


echo "----------------------------"
echo "Formating text.."
echo "----------------------------"
echo "removing dots breakers"
rename 's/\.(?=[^.]*\.)/_/g' *.mp4
echo "removing spaces + dots"
rename 's/^[. ]+//' *.mp4
echo "removing quotes (singles)"
for file in *.mp4; do dest="${file//[[:space:]]/.}" && mv -i "$file" "${dest//[^[:alnum:]._-]/}"; done
echo "-"
for f in *.mp4; do mv "$f" "${f// /}"; done

echo "----------------------------"
echo "-"echo "----------------------------"
echo "removing dots breakers"
rename 's/\.(?=[^.]*\.)/_/g' *.mp4
echo "removing spaces + dots"
rename 's/^[. ]+//' *.mp4
echo "removing quotes (singles)"
for file in *.mp4; do dest="${file//[[:space:]]/.}" && mv -i "$file" "${dest//[^[:alnum:]._-]/}"; done
echo "-"
for f in *.mp4; do mv "$f" "${f// /}"; done


#Converting & merging all videos together

SECONDS=0

for i in *.mp4; do ffmpeg -i "$i" -qscale 0 "${i%.*}.mpeg"; done

for filename in *.mpeg; do
echo "file $filename" >> concat-list.txt
done

ffmpeg -f concat -safe 0 -i concat-list.txt -s 1920x1080 -vcodec copy -acodec copy merged.mp4
echo "Concatenated videos list:"
cat concat-list.txt
rm concat-list.txt
mv merged.mp4 final/
rm *.mpeg
rm *.mp4
duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."


cd ..

echo "-----------------------------"
figlet Fixing 3
echo "-----------------------------"

cd 3


echo "----------------------------"
echo "Formating text.."
echo "----------------------------"
echo "removing dots breakers"
rename 's/\.(?=[^.]*\.)/_/g' *.mp4
echo "removing spaces + dots"
rename 's/^[. ]+//' *.mp4
echo "removing quotes (singles)"
for file in *.mp4; do dest="${file//[[:space:]]/.}" && mv -i "$file" "${dest//[^[:alnum:]._-]/}"; done
echo "-"
for f in *.mp4; do mv "$f" "${f// /}"; done

echo "----------------------------"
echo "-"echo "----------------------------"
echo "removing dots breakers"
rename 's/\.(?=[^.]*\.)/_/g' *.mp4
echo "removing spaces + dots"
rename 's/^[. ]+//' *.mp4
echo "removing quotes (singles)"
for file in *.mp4; do dest="${file//[[:space:]]/.}" && mv -i "$file" "${dest//[^[:alnum:]._-]/}"; done
echo "-"
for f in *.mp4; do mv "$f" "${f// /}"; done


#Converting & merging all videos together

SECONDS=0

for i in *.mp4; do ffmpeg -i "$i" -qscale 0 "${i%.*}.mpeg"; done

for filename in *.mpeg; do
echo "file $filename" >> concat-list.txt
done

ffmpeg -f concat -safe 0 -i concat-list.txt -s 1920x1080 -vcodec copy -acodec copy merged.mp4
echo "Concatenated videos list:"
cat concat-list.txt
rm concat-list.txt
mv merged.mp4 final/
rm *.mpeg
rm *.mp4
duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."


cd ..

echo "-----------------------------"
figlet Fixing 4
echo "-----------------------------"

cd 4


echo "----------------------------"
echo "Formating text.."
echo "----------------------------"
echo "removing dots breakers"
rename 's/\.(?=[^.]*\.)/_/g' *.mp4
echo "removing spaces + dots"
rename 's/^[. ]+//' *.mp4
echo "removing quotes (singles)"
for file in *.mp4; do dest="${file//[[:space:]]/.}" && mv -i "$file" "${dest//[^[:alnum:]._-]/}"; done
echo "-"
for f in *.mp4; do mv "$f" "${f// /}"; done

echo "----------------------------"
echo "-"echo "----------------------------"
echo "removing dots breakers"
rename 's/\.(?=[^.]*\.)/_/g' *.mp4
echo "removing spaces + dots"
rename 's/^[. ]+//' *.mp4
echo "removing quotes (singles)"
for file in *.mp4; do dest="${file//[[:space:]]/.}" && mv -i "$file" "${dest//[^[:alnum:]._-]/}"; done
echo "-"
for f in *.mp4; do mv "$f" "${f// /}"; done


#Converting & merging all videos together

SECONDS=0

for i in *.mp4; do ffmpeg -i "$i" -qscale 0 "${i%.*}.mpeg"; done

for filename in *.mpeg; do
echo "file $filename" >> concat-list.txt
done

ffmpeg -f concat -safe 0 -i concat-list.txt -s 1920x1080 -vcodec copy -acodec copy merged.mp4
echo "Concatenated videos list:"
cat concat-list.txt
rm concat-list.txt
mv merged.mp4 final/
rm *.mpeg
rm *.mp4
duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."


cd ..

echo "-----------------------------"
figlet Fixing 5
echo "-----------------------------"

cd 5


echo "----------------------------"
echo "Formating text.."
echo "----------------------------"
echo "removing dots breakers"
rename 's/\.(?=[^.]*\.)/_/g' *.mp4
echo "removing spaces + dots"
rename 's/^[. ]+//' *.mp4
echo "removing quotes (singles)"
for file in *.mp4; do dest="${file//[[:space:]]/.}" && mv -i "$file" "${dest//[^[:alnum:]._-]/}"; done
echo "-"
for f in *.mp4; do mv "$f" "${f// /}"; done

echo "----------------------------"
echo "-"echo "----------------------------"
echo "removing dots breakers"
rename 's/\.(?=[^.]*\.)/_/g' *.mp4
echo "removing spaces + dots"
rename 's/^[. ]+//' *.mp4
echo "removing quotes (singles)"
for file in *.mp4; do dest="${file//[[:space:]]/.}" && mv -i "$file" "${dest//[^[:alnum:]._-]/}"; done
echo "-"
for f in *.mp4; do mv "$f" "${f// /}"; done


#Converting & merging all videos together

SECONDS=0

for i in *.mp4; do ffmpeg -i "$i" -qscale 0 "${i%.*}.mpeg"; done

for filename in *.mpeg; do
echo "file $filename" >> concat-list.txt
done

ffmpeg -f concat -safe 0 -i concat-list.txt -s 1920x1080 -vcodec copy -acodec copy merged.mp4
echo "Concatenated videos list:"
cat concat-list.txt
rm concat-list.txt
mv merged.mp4 final/
rm *.mpeg
rm *.mp4
duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."


cd ..

echo "-----------------------------"
figlet Fixing 6
echo "-----------------------------"

cd 6


echo "----------------------------"
echo "Formating text.."
echo "----------------------------"
echo "removing dots breakers"
rename 's/\.(?=[^.]*\.)/_/g' *.mp4
echo "removing spaces + dots"
rename 's/^[. ]+//' *.mp4
echo "removing quotes (singles)"
for file in *.mp4; do dest="${file//[[:space:]]/.}" && mv -i "$file" "${dest//[^[:alnum:]._-]/}"; done
echo "-"
for f in *.mp4; do mv "$f" "${f// /}"; done

echo "----------------------------"
echo "-"echo "----------------------------"
echo "removing dots breakers"
rename 's/\.(?=[^.]*\.)/_/g' *.mp4
echo "removing spaces + dots"
rename 's/^[. ]+//' *.mp4
echo "removing quotes (singles)"
for file in *.mp4; do dest="${file//[[:space:]]/.}" && mv -i "$file" "${dest//[^[:alnum:]._-]/}"; done
echo "-"
for f in *.mp4; do mv "$f" "${f// /}"; done


#Converting & merging all videos together

SECONDS=0

for i in *.mp4; do ffmpeg -i "$i" -qscale 0 "${i%.*}.mpeg"; done

for filename in *.mpeg; do
echo "file $filename" >> concat-list.txt
done

ffmpeg -f concat -safe 0 -i concat-list.txt -s 1920x1080 -vcodec copy -acodec copy merged.mp4
echo "Concatenated videos list:"
cat concat-list.txt
rm concat-list.txt
mv merged.mp4 final/
rm *.mpeg
rm *.mp4
duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."


cd ..


echo "-----------------------------"
figlet Fixing 7
echo "-----------------------------"

cd 7


echo "----------------------------"
echo "Formating text.."
echo "----------------------------"
echo "removing dots breakers"
rename 's/\.(?=[^.]*\.)/_/g' *.mp4
echo "removing spaces + dots"
rename 's/^[. ]+//' *.mp4
echo "removing quotes (singles)"
for file in *.mp4; do dest="${file//[[:space:]]/.}" && mv -i "$file" "${dest//[^[:alnum:]._-]/}"; done
echo "-"
for f in *.mp4; do mv "$f" "${f// /}"; done

echo "----------------------------"
echo "-"echo "----------------------------"
echo "removing dots breakers"
rename 's/\.(?=[^.]*\.)/_/g' *.mp4
echo "removing spaces + dots"
rename 's/^[. ]+//' *.mp4
echo "removing quotes (singles)"
for file in *.mp4; do dest="${file//[[:space:]]/.}" && mv -i "$file" "${dest//[^[:alnum:]._-]/}"; done
echo "-"
for f in *.mp4; do mv "$f" "${f// /}"; done


#Converting & merging all videos together

SECONDS=0

for i in *.mp4; do ffmpeg -i "$i" -qscale 0 "${i%.*}.mpeg"; done

for filename in *.mpeg; do
echo "file $filename" >> concat-list.txt
done

ffmpeg -f concat -safe 0 -i concat-list.txt -s 1920x1080 -vcodec copy -acodec copy merged.mp4
echo "Concatenated videos list:"
cat concat-list.txt
rm concat-list.txt
mv merged.mp4 final/
rm *.mpeg
rm *.mp4
duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."


cd ..

sleep 5
clear

echo "-----------------------------"
figlet Download and rendering complete
echo "-----------------------------"
echo "All files should now be in their respective location"
echo "merged.mp4 in final folder in each category folder."
echo "good luck fixing the youtube shit OMEGALUL"
sleep 5


clear
echo "Checking if all files is created..."

VALUE=$(ls {1..7}/final/ | grep merged.mp4 | wc -l)

if [ $VALUE -eq 7 ] ; then
echo "Everything checks out" && toilet -t -f mono9 --filter border:gay "7/7 Complete :D"
else
echo "something doesn't look right" && figlet "Oh no?! D:"

fi
echo "----------------------------------------------------"
echo "I'm out"
