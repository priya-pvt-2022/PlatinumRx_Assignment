minutes = int(input())

hours = minutes // 60
remaining = minutes % 60

print(str(hours) + " hrs " + str(remaining) + " minutes")