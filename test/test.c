#include <stdio.h>
#include <string.h>

size_t ft_strlen(const char *str);
int ft_strcmp(const char *s1, const char *s2);
char *ft_strcpy(char *dest, const char *src);

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


    printf("2 -ft_strcmp\n");
    printf("string for test: '%s' | '%s'\n", str, str);
    printf("strcmp: %d\n", strcmp(str, str));
    printf("ft_strcmp: %d\n", ft_strcmp(str, str));
    printf("string for test: '%s' | '%s'\n", str, str2);
    printf("strcmp: %d\n", strcmp(str, str2));
    printf("ft_strcmp: %d\n", ft_strcmp(str, str2));
    printf("\n");


    printf("3 -ft_strcpy\n");
    printf("string for test: '%s' with a dest of char[100] dest and a char[10] dest (< src len)\n", str);
    char dest[100];
    printf("ft_strcpy: %s\n", strcpy(dest, str));
    printf("strcpy: %s\n", strcpy(dest, str));
    char dest2[14];
    printf("ft_strcpy: %s\n", ft_strcpy(dest2, str));
    printf("strcpy: %s\n", strcpy(dest2, str));
    printf("\n");
    return (0);
}