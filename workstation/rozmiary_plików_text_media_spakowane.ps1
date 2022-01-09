
#Wyłączenie obsługi błędów
$ErrorActionPreference= 'silentlycontinue'

$StartMs = (Get-Date).Milisecond
00..1000 | ForEach-Object {$i++}

#Rozmiary plików
$dir= "c:\*"

$rozszerzeniaTekstowe = 
'TXT',
'DOC*',
'ODT*',
'XLS*',
'PPT*',
'CSV',
'ODP*',
'pdf',
'xades',
'msg',
'eml'

$rozszerzeniaMulitmedialne = 
'avi',
'mp4',
'mp3',
'ogg'

$rozszerzeniaSpakowane = 
'zip',
'7z',
'rar',
'cab',
'iso'

Write-host "##########################"
Write-host "Skrypt wyciągający łaczny rozmiar plików z podziałem na kategorie."
Write-host "##########################"
Write-host ""



$sumaPELNA=0
foreach($rozszerzenieTekstowe in $rozszerzeniaTekstowe){

#Lokalizacja Folderu
$directory = $dir+$rozszerzenieTekstowe

$rozszerzenieTekstowe + ":" + (Get-ChildItem $directory -recurse | Measure-Object -Property Length -Sum).Sum/1MB

$wartosc=(Get-ChildItem $directory -ErrorAction SilentlyContinue -recurse | Measure-Object -Property Length -Sum).Sum/1MB

$sumaPELNA= $sumaPELNA +$wartosc
}
Write-host ""
Write-host "##########################"
"Suma wszystkich plikow textowych: " + $sumaPELNA | Export-Csv -Path "c:\TEMP\EXPORT.csv" -Append -Encoding UTF8
Write-host "##########################"
$sumaPELNA=0
foreach($rozszerzenieMulitmedialne in $rozszerzeniaMulitmedialne){

#Lokalizacja Folderu
$directory = $dir+$rozszerzenieMulitmedialne

$rozszerzenieMulitmedialne + ":" + (Get-ChildItem $directory -recurse | Measure-Object -Property Length -Sum).Sum/1MB

$wartosc=(Get-ChildItem $directory -ErrorAction SilentlyContinue -recurse | Measure-Object -Property Length -Sum).Sum/1MB

$sumaPELNA= $sumaPELNA +$wartosc
}

Write-host ""
Write-host "##########################"
"Suma wszystkich plikow multimedialne: " + $sumaPELNA  | Export-Csv -Path "c:\TEMP\EXPORT.csv" -Append -Encoding UTF8
Write-host "##########################"

$sumaPELNA=0
foreach($rozszerzenieSpakowane in $rozszerzeniaSpakowane){

#Lokalizacja Folderu
$directory = $dir+$rozszerzenieSpakowane 

$rozszerzenieSpakowane + ":" + (Get-ChildItem $directory -recurse | Measure-Object -Property Length -Sum).Sum/1MB

$wartosc=(Get-ChildItem $directory -ErrorAction SilentlyContinue -recurse | Measure-Object -Property Length -Sum).Sum/1MB

$sumaPELNA= $sumaPELNA +$wartosc
}
Write-host ""
Write-host "##########################"
"Suma wszystkich plikow spakowanych: " + $sumaPELNA | Export-Csv -Path "c:\TEMP\EXPORT.csv" -Append -Encoding UTF8
Write-host "##########################"





Write-host ""
$ENDMS= (get-date).Millisecond
Write-host "Czas wykonania skrypu: $($EndMS - $startMs) milisek"
