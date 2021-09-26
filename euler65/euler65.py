from fractions import Fraction


def build(start, nums):
    if len(nums) == 0:
        return start
    if len(nums) == 1:
        return start + Fraction(1, nums[0])
    denominator = nums[-2] + Fraction(1, nums[-1])
    for num in reversed(nums[:-2]):
        denominator = num + Fraction(1, denominator)
    result = start + Fraction(1, denominator)
    return result


def build_e(i):
    nums = [1, 2, 1, 1, 4, 1, 1, 6, 1]
    k = 4
    while i > len(nums):
        nums.append(1)
        nums.append(2 * k)
        k += 1
        nums.append(1)
    return nums[:i]


if __name__ == "__main__":
    result = build(2, build_e(99))
    print(result.numerator)
    print(sum([int(c) for c in str(result.numerator)]))
