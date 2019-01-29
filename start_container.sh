# Build and Start RStudio server tidyverse
# with publishing tools container for course
if [[ $# -eq 0 ]] ; then
    echo "ERROR... No password supplied"
    echo "Usage: bash $0 <PASSWORD>"
    exit 1
fi

docker run \
  -d \
  --restart=always \
  -p 8794:8787 \
  -e USERID=$UID \
  -e PASSWORD="$1" \
  -e ROOT=TRUE \
  --volume $HOME/project/cv2019-dataviz/user_data:/home \
  --name cv-dataviz \
  rocker/verse:latest

# Check container loading
docker logs -f cv-dataviz
