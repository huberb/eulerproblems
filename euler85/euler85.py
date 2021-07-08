import numpy as np

if __name__ == "__main__":
    table_dim = 100
    results = np.zeros((table_dim, table_dim))
    results[0, :] = np.arange(table_dim)
    results[:, 0] = np.arange(table_dim)
    results[1, 1] = 1

    j = 2
    for i in range(1, table_dim):
        counter = (i + 1) * (i) // 2
        for j in range(2, table_dim):
            results[i, j] = results[i, j - 1] + j * counter

    diff = np.abs(results - 2000000)
    x, y = np.unravel_index(diff.argmin(), diff.shape)
    print(f"min value at {x}, {y} is {results[x, y]} " +
          f"with a difference of {diff[x, y]}")
    print(f"area is {x * y}")
