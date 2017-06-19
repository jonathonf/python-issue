Hello Jonathon!

Before I found your packages I had a go at building my own updated Python. I wanted to keep it as vanilla as possible so that integrating upstream changes would be easier in future, but it seems there is some ubuntu-specific thing going on that makes a huge difference to performance!

This repository contains a Makefile. Other than that, everything is built and executed inside Docker.

The first rule installs runs your ppa Python, timing the pow function over 10 runs:

```
make ppa

print(__import__("timeit").timeit("pow(<some long numbers)", number=10))
6.27066612244
```

The second rule runs ours:

```
make ours

print(__import__("timeit").timeit("pow(<some long numbers)", number=10))
18.0811710358
```

wut.

Everything I used to build this package is in the build directory. You can run it with the third make rule:

```
make build
```

Although obviously with --enable-optimizations on, this is a total snorefest.

I'd love to know what you did to get that build. I'm an enthusiastic novice when it comes to deb packaging and I really have no idea what I am doing. Even if you can't get to the bottom of the specific option or patch that is causing this improvement, I'd love to know how you made your packages in the first place and how we can work with the source code.
