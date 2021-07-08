from tqdm import tqdm


# just bruteforce it..
def chain(num):
    nums = []
    nums.append(num)
    while num != 1 and num != 89:
        next_num = 0
        for digit in str(num):
            next_num += int(digit) ** 2
        num = next_num
        nums.append(num)
    return num == 89


if __name__ == "__main__":
    count = 0
    for i in tqdm(range(1, 10000000)):
        if chain(i):
            count += 1
    print(count)
