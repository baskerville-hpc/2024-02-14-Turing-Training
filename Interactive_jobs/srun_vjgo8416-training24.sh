#
# Example srun file where:
# --export=USER,HOME,PATH,TERM == Exports this subset of environment variables
# --account == This defines the project account this interactive job is run under
# --qos == The QoS (Quality of Service) of this job
# --nodes == How many nodes reserved for this job
# --ntasks == Specify the number of tasks to run and 
# --gres=gpu: == General resource request for gpus
# --reservation == Using reserved resource under the name vjgo8416-training24
# --time == Amount of time interactive job is active
# --pty /bin/bash == Request of a bash shell on a compute node
# --x11 == allows X11 forwarding and GUI options
# More details on srun options can be found: https://slurm.schedmd.com/srun.html

srun --export=USER,HOME,PATH,TERM --account=vjgo8416-training24 --qos=arc --nodes=1-1 --ntasks=36 --gres=gpu:1 --reservation=vjgo8416-training24 --time=6:0:0 --pty /bin/bash
