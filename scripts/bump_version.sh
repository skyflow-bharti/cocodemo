version=$1
SEMVER=$version

sed -E "s/s.version .+/s.version      = \"$SEMVER\"/g" "./cocodemo.podspec" > tempfile
sed -E "s/source .+/source       = { :git => \"https:\/\/github.com\/skyflow-bharti\/cocodemo.git\", :tag => \"$1\" }/g" tempfile > ./cocodemo.podspec && rm -f tempfile
awk -v semver="$SEMVER" '{gsub(/var SDK_VERSION = ".+"/, "var SDK_VERSION = \"" semver "\"")}1' "./cocodemo/Classes/Version.swift" > tempfile && mv tempfile "./cocodemo/Classes/Version.swift"

echo --------------------------
echo "Done, Pod now at v$1"
