package_name='calculator'
work_dir='..'
platforms=("darwin/amd64" "linux/amd64" "windows/amd64")

go env -w GO111MODULE=on

for platform in "${platforms[@]}"
do
    echo "platform -> ${platform}"c
    GOOS=`echo ${platform} | cut -d "/" -f 1`
    echo "GOOS -> ${GOOS}"
    GOARCH=`echo ${platform} | cut -d "/" -f 2`
    echo "GOARCH -> ${GOARCH}"
    output_name=../../${work_dir}/bin/$package_name'-'$GOOS'-'$GOARCH
    echo $output_name

    env GOOS=$GOOS GOARCH=$GOARCH go build -o $output_name ${work_dir}/main.go
done


