echo "Configuration: $1"
echo "Server address: $2"
echo "Server port: $3"
echo "Api key: $4"
cd Bin/$1
for f in *.nupkg
do
dotnet nuget push -s http://$2:$3/v3/index.json -k $4 $f
done
