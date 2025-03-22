#include <stdio.h>
#include <string.h>

size_t ft_strlen(const char *str);

int main(void)
{
    printf("=== TESTS ===\n\n");
    printf("FT_STRLEN\n");
    char *str = "Hello, World!";
    printf("ft_strlen: %zu\n", ft_strlen(str));
    printf("strlen: %zu\n", strlen(str));
    printf("ft_strlen: %zu\n", ft_strlen(""));
    printf("strlen: %zu\n", strlen(""));
    return (0);
}