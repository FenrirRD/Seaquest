#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/fs.h>
#include <linux/uaccess.h>
#include "driver.h"
/*-----------------------------------------*/
MODULE_LICENSE("GPL");
MODULE_AUTHOR("RODRIGO_DALLAGNOL, FLAVIO DA SILVA");
MODULE_DESCRIPTION("SUBMARINO");
/*----------------------------------------------------------------------------*/
#define DEVICE 60
#define DEVICE_NAME "submarino"
#define BUF_MSG 1

/*----------------------------------------------------------------------------*/
int device_init(void);
void devide_cleanup(void);
static int device_open(struct inode *inode, struct file *file);
static int device_release(struct inode *inode, struct file *file);
static ssize_t device_read(struct file *file, char __user *buffer, size_t length,loff_t * offset);
static ssize_t device_write(struct file *file, const char __user * buffer, size_t length, loff_t * offset);
//long device_ioctl(struct file *file, unsigned int ioctl_num, unsigned long ioctl_param);
/*----------------------------------------------------------------------------*/
module_init(device_init);
module_exit(devide_cleanup)

/*----------------------------------------------------------------------------*/
static int is_open = 0;
static char message[BUF_MSG];
static char *ptr;
//static int ins_read = 0;

/*----------------------------------------------------------------------------*/
struct file_operations fops = {
	.read = device_read,
	.write = device_write,
	.open = device_open,
	.release = device_release,
	//.unlocked_ioctl = device_ioctl
};

/*----------------------------------------------------------------------------*/
int device_init()
{
	int ret;

	ret = register_chrdev(DEVICE, DEVICE_NAME, &fops);

	if (ret < 0) {
		//printk("Erro ao carregar o dispositivo %d\n.",DEVICE);
		return ret;
	}
	message[0] = 'x';
	//printk("O dispositivo %d foi carregado.\n", DEVICE);

	return 0;
}

/*----------------------------------------------------------------------------*/
void devide_cleanup()
{
	unregister_chrdev(DEVICE, DEVICE_NAME);
	//printk("O dispositivo %d foi descarregado.\n", DEVICE);
}

/*----------------------------------------------------------------------------*/
static int device_open(struct inode *inode, struct file *file)
{
	if (is_open){
		return -EBUSY;
	}
	is_open = 1;
  ptr = message;
	try_module_get(THIS_MODULE);
	return 0;
}

/*----------------------------------------------------------------------------*/
static int device_release(struct inode *inode, struct file *file)
{
	is_open = 0;
	module_put(THIS_MODULE);
	return 0;
}

/*----------------------------------------------------------------------------*/
static ssize_t device_read(struct file *file, char __user * buffer, size_t length, loff_t * offset)
{

	int i;
	int bytes_read = 0;
	if (*ptr == 0 || message[0] == 'x')
	{
		return 0;
	}
	while (bytes_read < 1)
	{
		put_user(*(ptr++), buffer++);
		length--;
		bytes_read++;
	}
	//printk("Leu o Caracter: %c", message[0]);
	message[0] = 'x';

	return bytes_read;
}
/*----------------------------------------------------------------------------*/
static ssize_t device_write(struct file *file, const char __user * buffer, size_t length, loff_t * offset)
{

	if(message[0] != 'x')
	{
		return 0;
	}
	int i=0;

	for (i = 0; i < 1; i++)
	{
		get_user(message[i], buffer + i);
	}
	//printk("Escreveu o caracter: %c\n",message[0]);

	ptr = message;

	return i;
}
/*----------------------------------------------------------------------------*/
//long device_ioctl(struct file *file, unsigned int ioctl_num, unsigned long ioctl_param){
//	int length = 1;
//	char *temp = NULL, ch;
//	switch (ioctl_num) {
//		case IOCTL_WRITE:
//			device_write(file, (char *)ioctl_param, length, 0);
//			break;
//
//		case IOCTL_READ:
//			device_read(file, (char *)ioctl_param, length, 0);
//			break;
//		default:
//			printk("Essa operacao nao e permitida.\n");
//			return FAILURE;
//	}
//	return SUCCESS;
//}
