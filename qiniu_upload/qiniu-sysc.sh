HEXO_PUBLIC_FILE=$(dirname $(pwd))/public
wget https://devtools.qiniu.com/qshell-v2.10.0-linux-386.tar.gz
tar xzvf qshell-v2.10.0-linux-386.tar.gz

./qshell account $QINIU_ACCESS_KEY $QINIU_SECRET_KEY $QINIU_USER_NAME
./qshell qupload2 --src-dir=$HEXO_PUBLIC_FILE --bucket=$QINIU_BUCKET --overwrite=true --rescan-local=true