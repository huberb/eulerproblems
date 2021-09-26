import numpy as np

# edges = np.array([
#         [ 0, 16, 12, 21,  0,  0,  0],
#         [16,  0,  0, 17, 20,  0,  0],
#         [12,  0,  0, 28,  0, 31,  0],
#         [21, 17, 28,  0, 18, 19, 23],
#         [ 0, 20,  0, 18,  0,  0, 11],
#         [ 0,  0, 31, 19,  0,  0, 27],
#         [ 0,  0,  0, 23, 11, 27,  0],
#         ])


def read_file(path):
    with open(path) as file:
        lines = file.read()
        lines = lines.replace("-", "0").split("\n")[:-1]
        shape = len(lines)
        lines = np.array([int(c) for line in lines for c in line.split(",")])
        return lines.reshape((shape, shape))


def clean_diag(edges):
    for i in range(edges.shape[0]):
        for j in range(i, edges.shape[1]):
            edges[i][j] = 0
    return edges


def kruskal(edges):
    sets = [set([i]) for i in range(edges.shape[0])]
    edges = clean_diag(edges)
    max_cost = np.sum(edges)
    cost = 0
    edges[edges == 0] = edges.max() + 1
    while len(sets) > 1:
        from_idx, to_idx = np.unravel_index(np.argmin(edges), edges.shape)
        from_set = sets[np.argmax([from_idx in curr_set for curr_set in sets])]
        to_set = sets[np.argmax([to_idx in curr_set for curr_set in sets])]
        sets = [curr_set for curr_set in sets
                if curr_set != from_set and curr_set != to_set]
        if from_set != to_set:
            cost += edges[from_idx, to_idx]
        sets.append(set.union(from_set, to_set))
        edges[from_idx, to_idx] = edges.max() + 1
    return max_cost - cost


if __name__ == "__main__":
    edges = read_file("./edges.txt")
    print(kruskal(edges))
