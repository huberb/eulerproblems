def find_cubes(n):
    return [i**3 for i in range(n)]


def is_permutation(first, second):
    if len(first) != len(second):
        return False
    for f in first:
        if f not in second:
            return False
        second = second.replace(f, "", 1)
    if len(second) == 0:
        return True


def find_permutations(n, cubes):
    permutations = []
    for cube in cubes:
        if is_permutation(str(n), str(cube)):
            permutations.append(cube)
    return permutations


if __name__ == "__main__":
    cubes = find_cubes(10000)
    for cube in cubes:
        permutations = find_permutations(cube, cubes)
        if len(permutations) >= 4:
            print(f"{cube}: {permutations}, smallest: {min(permutations + [cube])}")
