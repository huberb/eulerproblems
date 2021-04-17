from fractions import Fraction
from tqdm import tqdm


# naive slow way does not work
def generate_fractions(upto=10000):
    fractions = {}
    for n in tqdm(range(1, upto + 2)):
        for d in range(2, upto + 1):
            if n >= d:
                continue
            new = Fraction(n, d)
            if new not in fractions:
                fractions[new] = 1
    print(sorted(fractions))
    print(len(fractions))


# lets check wikipedia on irreducable fractions
# => numbers need to have only common factor 1
# => this is called coprime
# generating all coprime integer pairs:
# https://en.wikipedia.org/wiki/Coprime_integers#Generating_all_coprime_pairs
def generate_coprime_pairs(root, max_value):
    new_pairs = []
    new_pairs.append((root[0] * 2 - root[1], root[0]))
    new_pairs.append((root[0] * 2 + root[1], root[0]))
    new_pairs.append((root[0] + 2 * root[1], root[1]))
    return [
            pair for pair in new_pairs
            if pair[0] <= max_value and pair[1] <= max_value
           ]


def generate_all_coprime_pairs(root, max_value=8):
    all_pairs = [root]
    pairs = generate_coprime_pairs(all_pairs[0], max_value)
    while len(pairs) > 0:
        pair = pairs.pop()
        all_pairs.append(pair)
        new = generate_coprime_pairs(pair, max_value)
        pairs += new
    return all_pairs


def test_coprime_generation():
    print("generating coprime integer pairs..")
    even_pairs = generate_all_coprime_pairs((2, 1))
    odd_pairs = generate_all_coprime_pairs((3, 1))
    pairs = even_pairs + odd_pairs
    fractions = sorted([Fraction(pair[1], pair[0]) for pair in pairs])
    idx = fractions.index(Fraction(3, 7))
    print(fractions[idx - 1])


# generating coprimes is still too slow.
# let's try a approach that does not need to generate all fractions
# left of 3/7 is 2/5 which has a difference of 1/35
# note that 7 * 5 = 35
# left of 2/7 is 1/4 which has a difference of 1/28
# again 7 * 4 = 28
# if we knew the denominator of the left fraction
# we get the left fraction by subtracting 1/d_left*d_right from the right one
# => denominator of the difference is a multiplicative of denominator
#    of the given fraction with factor 2 <= x <= max_value
def test(max_value=1000000):
    root = Fraction(3, 7)
    fractions = []
    for i in range(2, max_value + 1):
        difference = Fraction(1, i * root.denominator)
        test = root - difference
        if test.denominator <= max_value:
            fractions.append(test)

    print(max(fractions))


if __name__ == "__main__":
    test()
