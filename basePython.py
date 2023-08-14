import re

fileToRead = "dat.file"
fileToWrite = "data.csv"

with open(fileToRead, "r") as readFile:
    file_contents = readFile.read()

with open(fileToWrite, "w") as writeFile:
    for line in file_contents.split("\n"):
        print(line)
        matched = re.match("\s+my name is (.*) and my data fo birth is (.*)", line)
        if matched:
            print(matched.group(1), matched.group(2))
        matched = re.match("\s+my name is (.*) and my data fo birth is (\d+).(\d+).(\d+)", line)
        if matched:
            print(matched.group(1), matched.group(4))
            writeFile.write(matched.group(1)+","+matched.group(4)+"\n")
