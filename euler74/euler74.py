import math
from tqdm import tqdm


def sum_of_factorial(num):
    digits = [int(d) for d in str(num)]
    result = sum([math.factorial(d) for d in digits])
    return result


def chain(num):
    next_num = sum_of_factorial(num)
    nums = [num]
    while next_num not in nums:
        nums.append(next_num)
        next_num = sum_of_factorial(next_num)
    return len(nums)


if __name__ == "__main__":
    counter = 0
    for i in tqdm(range(1, 1000000)):
        length = chain(i)
        if length == 60:
            counter += 1
    print(counter)
