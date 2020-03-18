#ifndef VERSION_H
#define VERSION_H

// We want this header to be both a C++ and a C header
#ifdef __cplusplus
extern "C" {
#endif

int jez_isVersioned();

#ifdef __cplusplus
}
#endif

#endif // VERSION_H
