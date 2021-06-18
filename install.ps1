set-executionpolicy unrestricted

#####
$sharefolder= "\\WIN-OQ7JTQ6SI67\packages"

$localfolder= "c:\TEMP"

$execname= "eclipse-inst-jre-win64.exe"

$execargument = "-help"


if(test-path "$sharefolder\$execname"){


	new-item -itemtype directory  -path "$localfolder" -erroraction silentlycontinue
	copy-item "$sharefolder\$execname" "$localfolder" -force
	if (test-path "$localfolder\$execname"){
	start-process -wait -filepath "$localfolder\$execname" -argumentlist "$execargument"
	}
    Add-Content  -FilePath "C:\TEMP\log.txt" -Value "install success" 
	# remove-item "$localfolder\$execname"
}else{
	write-warning "executable ($execname) est introuvable"
}
