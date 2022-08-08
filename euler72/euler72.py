from fractions import Fraction
from functools import lru_cache


# n (n + 3) / 2 - Sum(k = 2 to n, a([n/k]))

@lru_cache(maxsize=None)
def test(n):
    if n == 0:
        return 1
    c, j = -2, 2
    k1 = n // j
    while k1 > 1:
        j2 = n // k1 + 1
        c += (j2 - j) * (2 * test(k1) - 3)
        j, k1 = j2, n // j2
    return ((n * (n - 1) - c + j) // 2)


if __name__ == "__main__":
    print(test(1_000_000) - 2)
