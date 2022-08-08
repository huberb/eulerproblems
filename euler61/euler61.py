def triangle(n):
    return n * (n + 1) / 2

def square(n):
    return n * n

def pentagonal(n):
    return n * (3 * n - 1) / 2

def hexagonal(n):
    return n * (2 * n - 1)

def heptagonal(n):
    return n * (5 * n - 3) / 2

def octagonal(n):
    return n * (3 * n - 2)

def upto(n, func):
    return [int(func(i)) for i in range(n)]

def generate_chain(previous, groups_dict, max_n=6):
    # yield if the result is sufficient
    if len(previous) == max_n:
        yield previous
        return
    last = str(previous[-1])
    first = str(previous[0])
    # find all possible candidates for the chain
    for name, nums in groups_dict.items():
        if len(previous) == max_n - 1:
            # the last member has to fit to the predecessor and the first member
            next_nums = [num for num in nums 
                        if last[-2:] == str(num)[:2]
                        and first[:2] == str(num)[-2:]]
        else:
            # an intermediate member only fits to the predecessor
            next_nums = [num for num in nums 
                        if last[-2:] == str(num)[:2]]
        # start recursion for every candidate
        for num in next_nums:
            if num in previous:
                continue
            # append new member
            new_previous = previous + [num]
            # remove group of next member
            new_groups = {key: item for key, item in groups_dict.items() if key != name}
            # start recursion
            yield from generate_chain(new_previous, new_groups)

def main():
    # all possible generating functions
    funcs = [triangle, square, pentagonal, hexagonal, heptagonal, octagonal]

    # bruteforce all candidate numbers because it's quick enough
    groups_dict = {
            func.__name__: [n for n in upto(1000, func) if len(str(n)) == 4]
            for func in funcs
            }

    found = []
    # start a chain of numbers with every possible first member
    for name, start_nums in groups_dict.items():
        for start_num in start_nums:
            new_groups = {key: items for key, items in groups_dict.items() if key != name}
            chains = list(generate_chain([start_num], new_groups))
            for chain in chains:
                print(chain)
                found.append(chain)
    print(set([sum(nums) for nums in found]))


if __name__ == "__main__":
    main()
