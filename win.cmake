set(BASE_URL 	"http://files.pharo.org/vm/pharo-spur64-headless/win")
set(URL_NAME	"PharoVM-8.5.0-3cf4aab2-win64")
set(VM_URL 		"${BASE_URL}/${URL_NAME}-bin.zip")
set(HEADER_URL 	"${BASE_URL}/include/${URL_NAME}-include.zip")
 
set(LIBFFI_TARGET "x86_64-unknown-cygwin")

set(LIBFFI_OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/build/libffi/install/bin/ffi-7.dll")
set(PHARO_PLUGIN_DIR pharo-vm/)

set(TEST_LIBRARY_DLL TestLibrary.dll) 

set(DYLIB_EXT "*.dll")

set(CMAKE_SHARED_LIBRARY_PREFIX "")
set(CMAKE_SHARED_LIBRARY_SUFFIX ".dll")
set(CMAKE_SHARED_MODULE_PREFIX "")
set(CMAKE_SHARED_MODULE_SUFFIX ".dll")    


set(LIBFFI_FILES "${CMAKE_CURRENT_BINARY_DIR}/build/libffi/install/bin/cygffi-7.dll")

# transform the path into a windows path with unix backslashes C:/bla/blu
# this is the path required to send as argument to libraries outside of the control of cygwin (like pharo itself)
execute_process(
	COMMAND cygpath ${CMAKE_CURRENT_SOURCE_DIR} --mixed
	OUTPUT_VARIABLE CMAKE_CURRENT_SOURCE_DIR_TO_OUT
	OUTPUT_STRIP_TRAILING_WHITESPACE)
	
set(LIBFFI_ADDITIONAL "AR=${CMAKE_TOOLCHAIN_PREFIX}-ar.exe" "DLLTOOL=${CMAKE_TOOLCHAIN_PREFIX}-dlltool.exe")
