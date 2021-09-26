import math


def continued(x):
    a = int(math.sqrt(x))
    a_0 = a
    m = 0
    d = 1
    periodic = []
    while True:
        m_next = d * a - m
        d_next = (x - m_next ** 2) / d
        if d_next == 0:
            return a_0, periodic
        a_next = int((a_0 + m_next) / d_next)
        periodic.append(a_next)
        if a_next == 2 * a_0:
            return a_0, periodic
        m, d, a = m_next, d_next, a_next


if __name__ == "__main__":
    count = 0
    for i in range(2, 10001):
        start, periodic = continued(i)
        print(f"sqrt({i}): [{start}; {tuple(periodic)}]")
        if len(periodic) % 2 == 1:
            count += 1
    print(count)
