#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
//#include <sys/ioctl.h>
//#include <termios.h>
//#include "driver.h"

#define DEVICE_NAME "/dev/submarino"
#define BUF_MSG 1

int writeDriver(char word[BUF_MSG])
{
  int file, ret;
  file = open(DEVICE_NAME, O_WRONLY);

  if (file > 0) {
    write(file, word, BUF_MSG);
    //ret = ioctl(file, IOCTL_WRITE, word);
    close(file);
  }

  return 1;
}

char readDriver()
{
  int file, ret;
  char word = 'x';//(char) malloc(BUF_MSG);
  file = open(DEVICE_NAME, O_RDONLY);

  if (file > 0) {
    //ret = ioctl(file, IOCTL_READ, &word);
    read(file, &word, BUF_MSG);
    close(file);
  }

  return word;
}
