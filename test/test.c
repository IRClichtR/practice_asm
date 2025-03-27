#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>

size_t ft_strlen(const char *str);
int ft_strcmp(const char *s1, const char *s2);
char *ft_strcpy(char *dest, const char *src);
ssize_t ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);
char *ft_strdup(const char *s);

int main(void) 
{
    printf("=== TESTS ===\n\n");

    printf("1 - ft_strlen\n");

    char *str = "Hello, World!";
    char *str2 = "My god, it's full of stars!";


    printf("string for test: '%s' and Empty string\n", str);
    printf("ft_strlen: %zu\n", ft_strlen(str));
    printf("strlen: %zu\n", strlen(str));
    printf("ft_strlen: %zu\n", ft_strlen(""));
    printf("strlen: %zu\n", strlen(""));
    printf("\n");


    printf("2 - ft_strcmp\n");
    printf("string for test: '%s' | '%s'\n", str, str);
    printf("strcmp: %d\n", strcmp(str, str));
    printf("ft_strcmp: %d\n", ft_strcmp(str, str));
    printf("string for test: '%s' | '%s'\n", str, str2);
    printf("strcmp: %d\n", strcmp(str, str2));
    printf("ft_strcmp: %d\n", ft_strcmp(str, str2));
    printf("\n");


    printf("3 - ft_strcpy\n");
    printf("string for test: '%s' with a dest of char[100] dest and a char[10] dest (< src len)\n", str);
    char dest[100];
    printf("ft_strcpy: %s\n", strcpy(dest, str));
    printf("strcpy: %s\n", strcpy(dest, str));
    char dest2[14];
    printf("ft_strcpy: %s\n", ft_strcpy(dest2, str));
    printf("strcpy: %s\n", strcpy(dest2, str));
    printf("\n");


    printf("4 - ft_write\n");
    printf("string for test: '%s'\n", str);
    printf("ft_write: %zd\n", ft_write(1, str, ft_strlen(str)));
    printf("write: %zd\n", write(1, str, ft_strlen(str)));
    printf("test error\n");
    printf("ft_write: %zd\n", ft_write(111, str, ft_strlen(str)));
    printf("write: %zd\n", write(111, str, ft_strlen(str)));
    printf("\n");

    printf("5 - ft_read\n");
    char buf[100];
    int fd = open("test.txt", O_RDONLY);
    printf("ft_read: %zd\n", ft_read(fd, buf, 100));
    close(fd);
    int fd2 = open("test.txt", O_RDONLY);
    printf("read: %zd\n", read(fd2, buf, 100));
    close(fd2);
    printf("test error\n");
    printf("ft_read: %zd\n", ft_read(111, str, ft_strlen(str)));
    printf("read: %zd\n", read(111, str, ft_strlen(str)));
    printf("\n");

    printf("6 - ft_strdup\n");
    printf("string for test: '%s'\n", str);
    char *dup = ft_strdup(str);
    printf("ft_strdup: %s\n", dup);
    free(dup);
    char *dup2 = strdup(str);
    printf("strdup: %s\n", dup2);
    free(dup2);
    
    return (0);
}