def swap(keys, a, b):
    index_a = keys.index(a)
    index_b = keys.index(b)
    keys[index_a] = b
    keys[index_b] = a
    return keys

def correct_order(all_keys, a, b):
    a = all_keys.index(a)
    b = all_keys.index(b)
    return a < b


if __name__ == "__main__":
    with open("keys.txt", 'r') as file:
        lines = [line.replace("\n", "") for line in file.readlines()]

        all_keys = []
        for line in lines:
            for key in line:
                if key not in all_keys:
                    all_keys.append(key)

        for line in lines:
            for i in [0, 1]:
                a = line[i]
                b = line[i + 1]
                print(all_keys)
                if not correct_order(all_keys, a, b):
                    print(line)
                    print(f"swapping {a} and {b}")
                    all_keys = swap(all_keys, a, b)
            
        password = ''.join(all_keys)
        print(password)
