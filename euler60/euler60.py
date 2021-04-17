import math


def generate_primes(upto=10000):
    nums = list(range(0, upto + 1))
    for i in range(2, len(nums)):
        if nums[i] is None:
            continue
        j = nums[i] * 2
        while j < len(nums):
            nums[j] = None
            j += nums[i]
    primes = [num for num in nums if num is not None]
    return primes[2:]


def is_prime(n):
    if n % 2 == 0 and n > 2:
        return False
    for i in range(3, int(math.sqrt(n)) + 1, 2):
        if n % i == 0:
            return False
    return True


class Node():
    def __init__(self, value, parent):
        self.value = value
        self.parent = parent
        self.children = []

    def compatible(self, test_num, prime):
        if is_prime(int(str(test_num) + str(prime))):
            if is_prime(int(str(prime) + str(test_num))):
                return True
        return False

    def find_children(self, primes, depth, max_depth):
        node = self
        test_primes = [self.value]
        while not node.is_root():
            node = node.parent
            test_primes.append(node.value)
        if depth == max_depth:
            print(test_primes, sum(test_primes))
            return
        for prime in primes:
            if prime in test_primes:
                continue
            child = True
            for num in test_primes:
                if not self.compatible(num, prime):
                    child = False
                    break
            if child:
                new_node = Node(prime, self)
                self.children.append(new_node)
                new_node.find_children(primes, depth + 1, max_depth)

    def is_root(self):
        return self.parent is None


if __name__ == "__main__":
    primes = generate_primes()

    for prime in primes:
        print(f"testing with root {prime}")
        root = Node(prime, None)
        root.find_children(primes, 1, 5)
