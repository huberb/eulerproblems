import numpy as np

matrix_a = np.array([
        [-1, 2, 2],
        [-2, 1, 2],
        [-2, 2, 3],
        ])

matrix_b = np.array([
        [1, 2, 2],
        [2, 1, 2],
        [2, 2, 3],
        ])

matrix_c = np.array([
        [1, -2, 2],
        [2, -1, 2],
        [2, -2, 3],
        ])

base_matrices = [matrix_a, matrix_b, matrix_c]


def generate_next(root):
    return [matrix.dot(root) for matrix in base_matrices]


def yield_multiples(root, limit):
    a, b, c = root
    a_n, b_n, c_n = a, b, c
    k = 1
    while sum([a_n, b_n, c_n]) <= limit:
        yield a_n, b_n, c_n
        k += 1
        a_n, b_n, c_n = a * k, b * k, c * k


def primitive_triples(limit):
    queue = [(3, 4, 5)]
    while len(queue) > 0:
        a, b, c = queue.pop()
        yield a, b, c
        for next in generate_next((a, b, c)):
            if sum(next) <= limit:
                queue.append(next)


def all_triples(limit):
    for triple in primitive_triples(limit):
        if sum(triple) < limit:
            yield from yield_multiples(triple, limit)


if __name__ == "__main__":
    triples = set()

    for triple in all_triples(1500000):
        triples.add(tuple(sorted(triple)))

    sums, counts = np.unique([sum(triple) for triple in triples],
                             return_counts=True)

    print(np.sum(counts == 1))
