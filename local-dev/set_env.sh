# emulate ruby cli on local host

function my_ruby {
    FILE=$(basename "$1" .rb)   # filemane without extention
    FILE_EXT=$(basename "$1")   # filename with extension

    # copy file in docker
    docker cp "$1" ruby:/app/"${FILE_EXT}"

    # exec main function in ruby file, like in production context
    docker exec -it ruby ruby -r "./${FILE_EXT}" -e "${FILE}(event: nil, context: nil)"
}

docker-compose up -d
