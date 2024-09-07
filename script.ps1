$res = (invoke-webrequest "https://azure.microsoft.com/en-us/blog/content-type/announcements/").Links.href | Select-Object -Unique
$filter = "/blog/.*"
$links = ($res | Select-String $filter -AllMatches).Matches
$results = ($links | Where-Object {$_.Value -ne "/blog/content-type/announcements/" -and $_.Value -ne "/blog/" -and $_.Value -notlike "/blog/author*"}).Value
$results[0..4]