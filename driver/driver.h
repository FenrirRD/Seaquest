#ifndef _SPEAKER_H_
#define _SPEAKER_H_
#define SUCCESS 0
#define FAILURE -1
#define SET 's'
#define IOCTL_WRITE _IOW(SET, 1, int)
#define IOCTL_READ _IOR(SET, 1,int)
#endif
