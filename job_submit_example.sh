#!/bin/sh
#PBS -N [your job name]
#PBS -V
#PBS -q normal	
#PBS -A lammps
#PBS -l select=1:ncpus=40:mpiprocs=40:ompthreads=1
#PBS -l walltime=48:00:00
#PBS -m abe				    
#PBS -M [your mail]			 

cd $PBS_O_WORKDIR
pwd

module purge

########### for lammps #########
module load craype-network-opa intel/19.1.2 impi/19.1.2 craype-mic-knl lammps/2Aug23
mpirun -np 40 lmp_mpi -in spm_lj

########### for python #########
# PBS 명령어에서 -A etc로 바꿀것
module load craype-network-opa intel/19.1.2 impi/19.1.2 craype-mic-knl
mpirun -np 40 ~/.conda/envs/myenv/bin/python3 pythonfile.py


#normal, debug, long queue는 이와 같이 진행, norm_skl queue 사용시 -q norm_skl로 바꾸고, craype-mic-knl을 craype-x86-skylake로 교체
#######################################

