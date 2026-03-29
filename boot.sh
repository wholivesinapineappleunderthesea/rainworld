DEBUGFLAGS=$1
if [ "x$DEBUGFLAGS" = "x-d" ]; then
	DEBUGFLAGS="-S -s"
else
	DEBUGFLAGS=""
fi
qemu-system-aarch64 -machine virt -cpu cortex-a57 -nographic -kernel out/kernel.bin $DEBUGFLAGS
