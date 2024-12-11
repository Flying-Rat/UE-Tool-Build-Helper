function VerifySuccess {
    
  	if ($? -ne "True") { 
        Write-Host "$? is not True. Exiting with error code 1"
        exit 1; 
    }

	if ($LastexitCode -ne "0") { 
        Write-Host "Last exit code: $LastexitCode"
        exit $LastexitCode; 
    }
}