version=$1
SEMVER=$version

sed -E "s/s.version .+/s.version      = \"$SEMVER\"/g" "./cocodemo.podspec" > tempfile
sed -E "s/source .+/source       = { :git => \"https:\/\/github.com\/skyflow-bharti\/cocodemo.git\", :tag => \"$1\" }/g" tempfile > ./cocodemo.podspec && rm -f tempfile

echo --------------------------
echo "Done, Pod now at v$1"
