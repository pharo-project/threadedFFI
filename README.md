# ThreadedFFI-Plugin

A Threaded FFI plugin for Pharo. It extends the Cog VM with non blocking queue based FFI.
This plugin has two main parts: a VM plugin written in C, and a Pharo library to access it.

## Installation

If you're running a headless VM, you very probably have the threaded FFI plugin with it.

### Installing the Pharo library

You can then load this project importing it through Iceberg, or by executing the following metacello expression:

```smalltalk
Metacello new
		baseline: 'ThreadedFFI';
		repository: 'github://pharo-project/threadedFFI-Plugin';
		onConflictUseLoaded;
		load.
```

If you're missing the plugin, update your headless VM or compile one from sources.

### Using with UFFI

This new FFI implementation is fully compatible with UFFI. 
It implements a new UFFI backend that can be used as an alternative to the one implemented using SqueakFFI plugin. 
To use it please refer to [this page](https://github.com/pharo-project/threadedFFI-Plugin/wiki/Using-with-UFFI).

### Compiling the plugin from sources

```bash
cmake .
make install
make test
make package
```
The build results can be found in `build/packages/*`

#### Compilation in OS X Catalina and Newer

Since some changes in the compilation toolchain of XCode, it is needed to give some hints to the build of libFFI. 
LibFFI is built during the building of the plugin.
To run the build correctly, the environment variable CPATH should be set: 

```
export CPATH=`xcrun --show-sdk-path`/usr/include
```

### Running the tests

Running the tests requires an external library with defined functions and types.
To obtain the test library, you need to compile it from sources.
Then copy it close to your image or your VM.
