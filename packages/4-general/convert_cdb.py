#!/usr/bin/python3

import argparse
import json
import os
import re


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("project_path")
    parser.add_argument("src_cdb_path")
    parser.add_argument("dst_cdb_path")
    args = parser.parse_args()

    return args.project_path, args.src_cdb_path, args.dst_cdb_path

def main():
    project_path, src_cdb_path, dst_cdb_path = parse_args()

    with open(src_cdb_path, "r") as f:
        cdb_data = f.read()

    cdb_data = re.sub("/work", project_path, cdb_data)
    cdb_data = re.sub("/usr/bin/clang\+\+", "/usr/bin/clang++-11", cdb_data)
    cdb_data = re.sub("-I/usr/arm-linux-gnueabihf/include/c\+\+/10/arm-linux-gnueabihf", "-I/usr/arm-linux-gnueabihf/include/c++/11/arm-linux-gnueabihf", cdb_data)

    cdb_data = re.sub("-Winvalid-pch", "", cdb_data)
    cdb_data = re.sub("-Xclang -include-pch", "", cdb_data)
    cdb_data = re.sub("-Xclang [^ ]*.pch ", " ", cdb_data)



    # cdb_data = re.sub("target/src", "src", cdb_data)
    # cdb_data = re.sub("target/src", "src", cdb_data)
    # cdb_data = re.sub("target/x86_64/cmake/src", "src", cdb_data)
    # cdb_data = re.sub("target/tests", "tests", cdb_data)
    # cdb_data = re.sub("target/x86_64/cmake/tests", "tests", cdb_data)
    # cdb_data = re.sub("target/example", "example", cdb_data)
    # cdb_data = re.sub("target/x86_64/cmake/example", "example", cdb_data)

    with open(dst_cdb_path, "w") as f:
        f.write(cdb_data)

if __name__ == "__main__":
    main()
