import random


def throw_dice(sides=4):
    return random.randint(1, sides) + random.randint(1, sides)


def community_chest(position, chest):
    card = chest[-1]
    chest = [card] + chest[:-1]
    if card == "Advance to GO":
        position = fields.index("GO")
    if card == "Go to JAIL":
        position = fields.index("JAIL")
    return position, chest


def chance(position, chest):
    card = chest[-1]
    chest = [card] + chest[:-1]
    if card == "Advance to GO":
        position = fields.index("GO")
    if card == "Go to JAIL":
        position = fields.index("JAIL")
    if card == "Go to C1":
        position = fields.index("C1")
    if card == "Go to E3":
        position = fields.index("E3")
    if card == "Go to H2":
        position = fields.index("H2")
    if card == "Go to R1":
        position = fields.index("R1")
    if card == "Go to next R":
        position = next_char(position, fields, char='R')
    if card == "Go to next U":
        position = next_char(position, fields, char='U')
    if card == "Go back 3 squares":
        position -= 3
    return position, chest


def next_char(position, fields, char):
    while True:
        position += 1
        if position >= len(fields):
            position %= len(fields)
        if fields[position].startswith(char):
            return position


def next_pos(current_pos, fields, cc, ch, double_six_count):
    score = throw_dice()

    if score == 12:
        double_six_count += 1
        if double_six_count == 3:
            return fields.index("JAIL"), cc, ch, 0
    else:
        double_six_count = 0

    position = current_pos + score

    if position >= len(fields):
        position %= len(fields)

    if fields[position] == "G2J":
        position = fields.index("JAIL")

    if fields[position].startswith("CC"):
        position, cc = community_chest(position, cc)

    if fields[position].startswith("CH"):
        position, ch = chance(position, ch)

    return position, cc, ch, double_six_count


if __name__ == "__main__":

    fields = ["GO", "A1", "CC1", "A2", "T1", "R1", "B1", "CH1", "B2", "B3", "JAIL", "C1", "U1", "C2", "C3", "R2", "D1", "CC2", "D2", "D3", "FP", "E1", "CH2", "E2", "E3", "R3", "F1", "F2", "U2", "F3", "G2J", "G1", "G2", "CC3", "G3", "R4", "CH3", "H1", "T2", "H2"]

    # Community Chest (2/16 cards):
    cc = ["Advance to GO", "Go to JAIL"] + ["NULL"] * 14
    random.shuffle(cc)

    # Chance (10/16 cards):
    ch = ["Advance to GO", "Go to JAIL", "Go to C1", "Go to E3", "Go to H2", "Go to R1", "Go to next R", "Go to next R", "Go to next U", "Go back 3 squares"] + ["NULL"] * 6
    random.shuffle(ch)

    position = 0
    double_six_count = 0
    field_counts = [0] * len(fields)
    for i in range(10_000_000):
        position, cc, ch, double_six_count = next_pos(position, fields,
                                                      cc, ch, double_six_count)
        field_counts[position] += 1

    steps = sum(field_counts)
    probs = []
    for field, count in zip(fields, field_counts):
        prob = count / steps
        probs.append(prob)
        print(f"{field}: {round(prob * 100, 4)}")

    sorted_probs = sorted(probs, reverse=True)
    max0 = probs.index(sorted_probs[0])
    max1 = probs.index(sorted_probs[1])
    max2 = probs.index(sorted_probs[2])
    print(f"{max0}{max1}{max2}")
