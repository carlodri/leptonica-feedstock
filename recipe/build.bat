mkdir build
cd build

:: STRICT_CONF=ON makes CMake fail instead of silently dropping an image format
cmake %CMAKE_ARGS% ^
      -G Ninja ^
      -D BUILD_PROG=ON ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D CMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -D SW_BUILD=OFF ^
      -D STRICT_CONF=ON ^
      -D BUILD_SHARED_LIBS=ON ^
      ..
if errorlevel 1 exit 1

cmake --build . --config Release --target install
if errorlevel 1 exit 1
