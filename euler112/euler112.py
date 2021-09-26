def is_bouncy(num):
    num = str(num)
    increasing = False
    decreasing = False
    for i in range(0, len(num) - 1):
        if num[i] < num[i + 1]:
            increasing = True
        if num[i] > num[i + 1]:
            decreasing = True
    return increasing and decreasing


if __name__ == "__main__":
    bouncy_count = 0
    non_bouncy_count = 0
    i = 1
    while True:
        if is_bouncy(i):
            bouncy_count += 1
        i += 1
        if (bouncy_count + 1) / i >= 0.99:
            print(i)
            break
