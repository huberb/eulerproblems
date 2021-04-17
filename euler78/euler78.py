# 1:
# o

# 2:
# oo
# o o

# 2:
# oo
# o o

# 3:
# ooo
# oo o
# o o o

# 4:
# oooo
# ooo o
# oo oo
# oo o o
# o o o o

# 5 => 7 (given)

# 6:
# oooooo
# ooooo o
# oooo o o
# oooo oo
# ooo ooo
# ooo o o o
# ooo oo o
# oo oo oo
# oo oo o o
# oo o o o o
# o o o o o o

# number of piles with n coins if you allow pilesize of upto s
# 0  0  0  0  0  0  0 (c)
# 0  1  1  1  1  1  1  1
# 0  1  2  2  3  3  4  4
# 0  1  2  3  4  5  7  8
# 0  1  2  3  5  6  9 11
# 0  1  2  3  5  7 10 13
# 0  1  2  3  5  7 11 14
# 0  1  2  3  5  7 11 15
# (p)

import math


# dynamic programming approach seems to slow.. this is O(n^2)
def dynamic_programming_version():
    size = 3000
    table = [[0] * size for _ in range(size)]

    for i in range(1, size):
        table[i][1] = 1
    for j in range(1, size):
        table[1][j] = 1

    for i in range(2, size):
        for j in range(2, size):
            if i == j:
                table[i][j] = table[i - 1][j] + 1
            elif i + 1 > j:
                table[i][j] = table[i - 1][j]
            else:
                table[i][j] = table[i - 1][j] + table[i][j - i]


# wikipedia says p(n) = 1/n sum_{k=0}^{n-1} o(n - k)p(k)
# with o(x) as the sum of divisors of x
memory = {}


def sum_of_divisors(n):
    if n in memory:
        return memory[n]
    if n == 1:
        return 1
    divs = []
    divs.append(1)
    divs.append(n)
    for i in range(2, int(math.log2(n)) + 1):
        if (n / i).is_integer():
            divs.append(n // i)
            if n // i != i:
                divs.append(i)
    result = sum(divs)
    memory[n] = result
    return result


# this is still too slow
def recurrence_relation():
    solutions = [1, 1]
    for n in range(2, 100000):
        solution = 0
        for k in range(0, n):
            solution += sum_of_divisors(n - k) * solutions[k]
        solution //= n
        solutions.append(solution)
        if str(solution).endswith("0000"):
            print(f"{n}: {solution}")


# another way would be with pentagonal numbers
# p(n) = sum_{k=-1,1,-2,2,-3,...} (-1)^{k-1} p(n - g_k)
# where g_k = k(3k - 1)/2
# this works
def pentagonal():
    def cycle(n):
        for i in range(1, n):
            yield i
            yield -i

    size = 100000
    solutions = [1, 1]

    for n in range(2, size):
        solution = 0
        for k in cycle(size):
            g_k = k * (3 * k - 1) // 2
            if n < g_k:
                break
            if (k + 1) % 2 == 0:
                solution += solutions[n - g_k]
            else:
                solution -= solutions[n - g_k]
        solutions.append(solution)
        if str(solution).endswith("000000"):
            print(f"{n}: {solution}")
            return


if __name__ == "__main__":
    # dynamic_programming_version()
    # recurrence_relation()
    pentagonal()
