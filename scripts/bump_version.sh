version=$1
SEMVER=$version

sed -E "s/spec.version .+/spec.version      = \"$SEMVER\"/g" "./cocodemo.podspec" > tempfile
sed -E "s/source .+/source       = { :git => \"https:\/\/github.com\/skyflow-bharti\/skyflow-iOS.git\", :tag => \"$1\" }/g" tempfile > ./cocodemo.podspec && rm -f tempfile

echo --------------------------
echo "Done, Pod now at v$1"
