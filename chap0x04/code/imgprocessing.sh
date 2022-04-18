#!/usr/bin/env bash
envcheck(){
  REQUIRED_PKG="imagemagick"
  PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
  echo Checking for $REQUIRED_PKG: $PKG_OK
  if [ "" = "$PKG_OK" ]; then
    echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
    sudo apt-get --yes install $REQUIRED_PKG
  fi
}

envcheck

PARSED_ARGUMENTS=$(getopt -a -n imgprocessing -o f:q:hc:w:rC --long file:,quality:,help,compress:,watermark:,conversion,rename -- "$@")

eval set -- "$PARSED_ARGUMENTS"

usage(){
  cat <<EOF
Usage: imgprocessing [options] <parameter>

-h | --help                                  This is some help text.
-f | --file      <file path>                 Input the path or directory where the image is located
-q | --quality   <quality size>              Quality compression of jpeg files
-c | --compress  <compress size>             Compress the resolution of jpeg/png/svg format images while maintaining the original aspect ratio
-w | --watermark <your watermark text>       Add custom text watermarks to images in bulk
-r | --rename                                Batch renaming
-C | --conversion                            Convert png/svg images to jpg format
EOF
  exit 2
}


filecheck(){
  if  [[  -f $1 ]]; then
    echo "OK" > /dev/null
  elif [[  -d $1 ]]; then
    echo "OK" > /dev/null
  else
    echo "Invalid file path"
    exit 1
  fi
}

jpegquality(){
  for img in "$2"*
  do
    fileformat="${img##*.}"
    filename="${img%.*}"
    if [ "$fileformat" = "jpg" ] || [ "$fileformat" = "jpeg" ] ; then
      convert -quality "$1"% "$img" "$filename"-quality-output.jpg
    else
      echo "$img is invalid format file"
    continue
    fi
  done
}

compression(){
  for img in "$2"*
  do
    fileformat="${img##*.}"
    filename="${img%.*}"
    if [ "$fileformat" = "jpg" ] || [ "$fileformat" = "jpeg" ] || [ "$fileformat" = "png" ] || [ "$fileformat" = "svg" ] ; then
      convert -resize "$1"x"$1" "$img" "$filename"-compression-output."$fileformat"
    else
      echo "$img is invalid format file"
    continue
    fi
  done
}

watermark(){
  for img in "$2"*
  do
    fileformat="${img##*.}"
    filename="${img%.*}"
    if [ "$fileformat" = "jpg" ] || [ "$fileformat" = "jpeg" ] || [ "$fileformat" = "png" ] || [ "$fileformat" = "svg" ] ; then
      convert -fill red -pointsize 24 -draw "text 30,30 '$1' "  "$img"  "$filename"-watermark."$fileformat"
    else
      echo "$img is invalid format file"
    continue
    fi
  done
}

rename(){
  for img in "$2"*
  do
    fileformat="${img##*.}"
    filename="${img%.*}"
    if [ "$fileformat" = "jpg" ] || [ "$fileformat" = "jpeg" ] || [ "$fileformat" = "png" ] || [ "$fileformat" = "svg" ] ; then
      mv "$img" "$(/bin/date +%Y-%m-%d)$filename.$fileformat"
    else
      echo "$img is invalid format file"
    continue
    fi
  done  
}

conversion(){
  for img in "$1"*
  do
    fileformat="${img##*.}"
    filename="${img%.*}"
    if [ "$fileformat" = "png" ] ; then
      convert "$img" "$filename".jpg   
    elif  [ "$fileformat" = "svg" ] ; then
      convert "$img"  -background gray  -flatten  "$filename".jpg  
    else
      echo "$img is invalid format file"
    continue
    fi
  done  
}

while :
do
  case "$1" in
    -h | --help)
    usage ;;
    -f | --file)   
      filepath="$2"
      filecheck "$filepath"
      shift 2 ;;
    -q | --quality)    
      qualitysize="$2"
      jpegquality "$qualitysize" "$filepath"
      shift 2  ;;
    -c | --compress)
      compressionsize="$2"
      compression "$compressionsize" "$filepath"
      shift 2 ;;
    -w | --watermark)
      watermark "$2" "$filepath"
      shift 2 ;;
    -r | --rename)
      rename "$filepath"   
      shift ;;
    --) shift; break ;;
    -C | --conversion)
      conversion "$filepath"
      shift ;;
    *) echo "Unexpected option: $1 - this should not happen."
       usage ;;
  esac
done

