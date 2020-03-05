
$p = (pwd) -replace "([A-Z]{1}):\\","/`$1/"
$env:PWD = ($p.substring(0,2).ToLower() + $p.substring(2)).replace("\", "/")
Get-ChildItem Env:PWD

$env:GRAYLOG_HTTP_ENABLE_CORS = "true"

docker-compose down -v

$confirmation = Read-Host "Do you want clear data"
if ($confirmation -eq "y") {
    Remove-Item -Path "data\usr\share\graylog\data\journal\*" -Exclude ".gitignore" -Recurse;
}

docker-compose up -d
docker-compose logs -f
