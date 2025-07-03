import os
import subprocess

def touch_files_recursively(directory):
    for root, dirs, files in os.walk(directory):
        for file in files:
            file_path = os.path.join(root, file)
            subprocess.run(f"touch {file_path}", shell=True)

directory_path = "/scratch/x3166a05/"
touch_files_recursively(directory_path)

work_done_file = "/home01/x3166a05/.work_done"
with open(work_done_file, 'w') as f:
    f.write("Task completed successfully.")
