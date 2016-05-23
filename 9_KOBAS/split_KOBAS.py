#!/usr/bin/python

import os
import glob

def list_KOBAS():
    for directory in os.walk("./"):
        kobas = glob.glob(directory[0] + '/*.identify.txt')
        for filename in kobas:
            split_KOBAS(filename)

def split_KOBAS(filepath):
    filename, file_extension = os.path.splitext(filepath)
    file = open(filepath)
    skip_lines(file, 4)
    write_subfile(file, filename + ".pathway"+ file_extension)
    skip_lines(file, 2)
    write_subfile(file, filename + ".disease"+ file_extension)
    skip_lines(file, 2)
    write_subfile(file, filename + ".GO"+ file_extension)
    file.close()

def write_subfile(file, filename):
    print(filename)
    new_file = open(filename, "w+")
    new_file.truncate()
    new_file.write(file.readline())
    while True:
        line = file.readline()
        if line == "\n":
            break
        fdr = float(line.split("\t")[6])
        if fdr < 0.05: #threshold
            new_file.write(line)
    new_file.close()

def skip_lines(file, line):
    for _ in xrange(line):
        file.readline()

if __name__ == '__main__':
    list_KOBAS()
