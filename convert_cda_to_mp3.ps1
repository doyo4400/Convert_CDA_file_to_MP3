<#
    Convert rip Audio CD files to mp3 files with VLC media player.
    default path of VLC : C:\Program Files\VideoLAN\VLC\vlc.exe
    Run this script in folder you want to receipe the file
#>

param (
    [string]$vlc = "c:\program files\videolan\vlc\vlc.exe",
    [string]$cddrive = "D:",
    [int]$number_of_track = 16
)

# rip one track
if ($track -gt 0) {
    & $vlc -I dummy cdda:///$cddrive/ --cdda-track=$track :sout="#transcode{acodec=mp3}:std{access=file,mux=raw,dst=Track$track.mp3}" vlc://quit
    exit 0
}

# rip all tracks
<#
$tracks = get-childitem $cddrive -Filter *.cda
$i = 1

foreach ($i in $tracks) {
    & $vlc -I dummy cdda:///$cddrive/ --cdda-track=$i :sout="#transcode{acodec=mp3}:std{access=file,mux=raw,dst=Track$i.mp3}" vlc://quit
    $i = $i + 1
}
exit 0
#>