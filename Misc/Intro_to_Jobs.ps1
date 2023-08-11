$sjopt = New-ScheduledJobOption -RunElevated -HideInTaskScheduler
$sjtrig = New-JobTrigger -Once -At (Get-Date).AddMinutes(1)
Register-ScheduledJob -Name gussj -ScriptBlock {'Hello'} -Trigger $sjtrig -ScheduledJobOption $sjopt
Get-Job -IncludeChildJob