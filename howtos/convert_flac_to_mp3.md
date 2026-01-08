Convert a file, from FLAC to MP3, using ffmpeg
```shell
ffmpeg -i myfile.flac -q:a 0 -map a myfile.mp3
```
Bulk convert all FLAC files in the current folder to MP3
```shell
for i in *.flac; do i2=${i:: -5}; ffmpeg -i "$i2.flac" -q:a 0 -map a "$i2.mp3"; done
```
