version=$1
SEMVER=$version

if [ -z $2 ]
then

    sed -E "s/s.version .+/s.version      = \"$SEMVER\"/g" "./cocodemo.podspec" > tempfile
    sed -E "s/source .+/source       = { :git => \"https:\/\/github.com\/skyflow-bharti\/cocodemo.git\", :tag => \"$1\" }/g" tempfile > ./cocodemo.podspec && rm -f tempfile
	sed -E "s/var SDK_VERSION = .+/var SDK_VERSION = \"$SEMVER\"/g" ./cocodemo/Classes/Version.swift > tempfile && cat tempfile > ./cocodemo/Classes/Version.swift && rm -f tempfile

    echo --------------------------
    echo "Done, Pod now at v$1"

else

    sed -E "s/s.version .+/s.version      = \"$SEMVER-dev.$2\"/g" "./cocodemo.podspec" > tempfile
    sed -E "s/source .+/source       = { :git => \"https:\/\/github.com\/skyflow-bharti\/cocodemo.git\", :commit => \"$2\" }/g" tempfile > ./cocodemo.podspec && rm -f tempfile
	sed -E "s/var SDK_VERSION = .+/var SDK_VERSION = \"$SEMVER-dev.$2\"/g" ./cocodemo/Classes/Version.swift > tempfile && cat tempfile > ./cocodemo/Classes/Version.swift && rm -f tempfile

    echo --------------------------
    echo "Done, Pod now at v$1-dev.$2"
fi