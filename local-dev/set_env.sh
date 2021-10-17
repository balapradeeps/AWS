# emulate ruby and serverless cli on local host

function my_ruby {
    FILE=$(basename "$1" .rb)   # filemane without extention
    FILE_EXT=$(basename "$1")   # filename with extension

    # copy file in docker
    docker cp "$1" ruby:/app/"${FILE_EXT}"

    # exec main function in ruby file, like in production context
    return docker exec -it ruby ruby -r "./${FILE_EXT}" -e "${FILE}(event: nil, context: nil)"
}

function my_serverless {
    # cp aws creddentias
    docker cp ~/.aws/ serverless_framework:/root

    # exec serverless cli
    return docker exec -it serverless_framework serverless $@
}

docker-compose up -d
