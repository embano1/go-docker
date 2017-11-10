# Small(er) godoc container for the Go standard lib
Compared to the official Golang images which contains `godoc`, this Dockerfile creates a minimal Golang container based on the `alpine` Golang image.  
Size difference ~500MB (as of Go 1.9.2).

# Why not use godoc.org?
My understanding is, that you cannot select the version of Go when browsing the Go standard lib packages on godoc.org. Sometimes I find myself digging into older Go version, where having `godoc` running locally for this version comes in handy.  

Also, this doesn´t require changing `GOPATH` to not bloat `godoc` with the other dozens of packages installed. 

# Build your own 
Modify `${REPO}` and `${IMG_VERSION}` in `build.sh` to match a Golang version (must be based on Alpine). Then:  

```
sh build.sh
```