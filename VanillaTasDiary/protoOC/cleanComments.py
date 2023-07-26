import os
import re
import sys

def remove_comments(text):
    def replacer(match):
        s = match.group(0)
        if s.startswith('/'):
            return " " # note: a space and not an empty string
        else:
            return s
    pattern = re.compile(
        r'//.*?$|/\*.*?\*/|\'(?:\\.|[^\\\'])*\'|"(?:\\.|[^\\"])*"',
        re.DOTALL | re.MULTILINE
    )
    return re.sub(pattern, replacer, text)

def remove_comments_with_path(path):
    for root, dirs, files in os.walk(path):
        for filename in files:
            print(filename)
            if filename.endswith('.pbobjc.h') or filename.endswith('.pbobjc.m'):
                filename = os.path.join(root, filename)
                code_original = open(filename).read()
                code_new = remove_comments(code_original)
                
                fh = open(filename, "w")
                fh.write(code_new)
                fh.close()

if __name__ == '__main__':
    remove_comments_with_path("./pb/")
    remove_comments_with_path("./plugin_pb/")
    remove_comments_with_path("./auth_pb/")
    remove_comments_with_path("./base_pb/")
    remove_comments_with_path("./upgrade_center_pb/")
    