import pandas as pd
import numpy as np
from tqdm import tqdm


def gcd(a, b):
    while b != 0:
        tmp = b
        b = a % b
        a = tmp
    return a


def sieve(n):
    primes = [True for i in range(n)]
    for i in range(2, n):
        j = i + i
        while j < n:
            primes[j] = False
            j += i
    return [i for i in range(2, n) if primes[i]]


def prime_factors(n):
    factors = []
    divisor = 2
    while n > 1:
        if n % divisor == 0:
            factors.append(divisor)
            n //= divisor
        else:
            divisor += 1
    return factors


def phi(n):
    divisors = []
    divisors = set(prime_factors(n))
    prod = np.prod([1 - (1 / div) for div in divisors])
    return n * prod


if __name__ == "__main__":
    upto = 10**6
    primes = sieve(upto)
    nums = np.ones(upto) * -1
    for i in tqdm(range(2, upto)):
        if nums[i] != -1:
            continue
        if i in primes:
            nums[i] = i - 1
        else:
            nums[i] = phi(i)
        j = 2
        while j < i and j * i < upto:
            if gcd(i, j) == 1:
                nums[i * j] = nums[i] * nums[j]
            j += 1
    print((np.arange(upto) / nums).argmax())
