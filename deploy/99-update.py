import subprocess
import threading

def update_git():
    "Update sample notebooks and remove this file on first run."
    subprocess.Popen(["/usr/bin/git", "pull"], cwd="/home/swuser/notebooks/samples")
    subprocess.Popen(["/bin/rm", "/home/swuser/.ipython/profile_default/startup/99-update.py"])

t = Thread(target=update_git)
t.start()
