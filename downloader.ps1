$list = Get-Content [Environment]::GetFolderPath([Environment+SpecialFolder]::Desktop)\url.txt

$clnt = New-Object System.Net.WebClient

foreach($url in $list) 
{ 

	#Get the filename 
	$filename = [System.IO.Path]::GetFileName($url) 

	#Create the output path 
	$file = [System.IO.Path]::Combine($pwd.Path, $filename) 

	Write-Host -NoNewline "Getting ""$url""... "

	#Download the file using the WebClient 
	$clnt.DownloadFile($url, $file) 

	Write-Host "done." 
}