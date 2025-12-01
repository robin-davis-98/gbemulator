$projectRoot = Resolve-Path "$PSScriptRoot/.."
$buildDir = "$projectRoot/build"

if (Test-Path $buildDir) {
    Remove-Item -Recurse -Force $buildDir
}

# Recreate build directory
New-Item -ItemType Directory -Path $buildDir | Out-Null

$toolchain = "-DCMAKE_TOOLCHAIN_FILE=`"$projectRoot/cmake/clang-mingw-toolchain.cmake`""

cmake -S "$projectRoot" -B $buildDir -DCMAKE_BUILD_TYPE=Release $toolchain
cmake --build "$buildDir" --config Release
