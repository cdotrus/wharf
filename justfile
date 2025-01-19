# Quick command runners for internal testing and development.

build IMG DIR:
    docker build -t {{IMG}} {{DIR}}

run IMG:
    docker exec -it "$(docker run -d --rm --entrypoint tail -it {{IMG}} -f /dev/null)" \
    /bin/bash