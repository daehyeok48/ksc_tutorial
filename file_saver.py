import os
import subprocess

def touch_files_recursively(directory):
        for root, dirs, files in os.walk(directory):
                for file in files:
                        file_path = os.path.join(root, file)
                        print(file_path)
                        subprocess.run(f"touch {file_path}", shell=True)

directory_path = "/scratch/x3166a05/"
touch_files_recursively(directory_path)
