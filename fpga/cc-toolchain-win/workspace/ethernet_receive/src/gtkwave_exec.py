import os, subprocess

current_dir = os.path.dirname(os.path.realpath(__file__))
vhdl_files: list[str] = []
for (_, _, files) in os.walk(current_dir):
    for file in files:
        if (file.endswith(".vhd")):
            vhdl_files.append(file + " ")
ghdl_command = ["ghdl", "-a"]
ghdl_command += vhdl_files
completedProccess = subprocess.run(ghdl_command)
