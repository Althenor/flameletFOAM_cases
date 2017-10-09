#!/bin/bash
#SBATCH --account=k1242
#SBATCH --job-name=SwBdFLTL3
#SBATCH --nodes=3
#SBATCH --ntasks-per-node=32
#SBATCH --ntasks-per-socket=16
#SBATCH --time=1-00:00:00
#SBATCH -e job%J.err
#SBATCH -o job%J.out
#SBATCH --partition=workq
##SBATCH --partition=72hours
##SBATCH --qos=72hours

OMP_NUM_THREADS=1

module load python/3.6.2
AIRINLET="AIR1 AIR2 AIR3 AIR4"

#cd constant/boundaryData
#for folder in $AIRINLET
#do
#    cd $folder
#    cp /project/k1242/Zhen/OpenFOAM/OpenFOAM_py/python3.6/process/inlet_time_ext.py .
#    cd ..
#done
#cd ../..
#
#canteraToFoam
#sed "s/@NUMSUBDOM@/96/g" \
#    system/decomposeParDict_template > system/decomposeParDict
#decomposePar -latestTime
#
#sed -e "s/@STARTTIME@/startTime/g" -e "s/@ENDTIME@/0.001/g" \
#    -e "s/@DELTAT@/1e-7/g" -e  "s/@WRITEINTERVAL@/0.001/g" \
#    -e "s/@WRITEFORMAT@/binary/g" \
#    -e "s/@ENABLED@/false/g"  \
#    -e "s/@RESTART@/true/g" -e "s/@RESTARTOUT@/true/g" \
#    system/controlDict_template > system/controlDict
#sed -e "s/@DIVPHIU@/Gauss vanLeer/g" \
#    system/fvSchemes_template > system/fvSchemes
#srun --hint=nomultithread flameletFoam -parallel
#
#cp system/controlDict system/log1_controlDict
#sed -e "s/@STARTTIME@/latestTime/g" -e "s/@ENDTIME@/0.01/g" \
#    -e "s/@DELTAT@/1e-6/g" -e "s/@WRITEINTERVAL@/0.001/g" \
#    -e "s/@WRITEFORMAT@/binary/g" \
#    -e "s/@ENABLED@/false/g" \
#    -e "s/@RESTART@/true/g" -e "s/@RESTARTOUT@/true/g" \
#    system/controlDict_template > system/controlDict
#sed -e "s/@DIVPHIU@/Gauss vanLeer/g" \
#    system/fvSchemes_template > system/fvSchemes
#srun --hint=nomultithread flameletFoam -parallel
#
#cp system/controlDict system/log2_controlDict
#sed -e "s/@STARTTIME@/latestTime/g" -e "s/@ENDTIME@/0.10/g" \
#    -e "s/@DELTAT@/5e-6/g" -e "s/@WRITEINTERVAL@/0.01/g" \
#    -e "s/@WRITEFORMAT@/binary/g" \
#    -e "s/@ENABLED@/false/g" \
#    -e "s/@RESTART@/true/g" -e "s/@RESTARTOUT@/true/g" \
#    system/controlDict_template > system/controlDict
#sed -e "s/@DIVPHIU@/Gauss vanLeer/g" \
#    system/fvSchemes_template > system/fvSchemes
#srun --hint=nomultithread flameletFoam -parallel
#
#cd constant/boundaryData
#for folder in $AIRINLET
#do
#    cd $folder
#    python3 inlet_time_ext.py
#    cd ..
#done
#cd ../..
#
#cp system/controlDict system/log3_controlDict
#sed -e "s/@STARTTIME@/latestTime/g" -e "s/@ENDTIME@/0.20/g" \
#    -e "s/@DELTAT@/5e-6/g" -e  "s/@WRITEINTERVAL@/0.01/g" \
#    -e "s/@WRITEFORMAT@/binary/g" \
#    -e "s/@ENABLED@/false/g" \
#    -e "s/@RESTART@/true/g" -e "s/@RESTARTOUT@/true/g" \
#    system/controlDict_template > system/controlDict
#sed -e "s/@DIVPHIU@/Gauss vanLeer/g" \
#    system/fvSchemes_template > system/fvSchemes
#srun --hint=nomultithread flameletFoam -parallel
#
#cd constant/boundaryData
#for folder in $AIRINLET
#do
#    cd $folder
#    python3 inlet_time_ext.py
#    cd ..
#done
#cd ../..
#
#cp system/controlDict system/log4_controlDict
#sed -e "s/@STARTTIME@/latestTime/g" -e "s/@ENDTIME@/0.3/g" \
#    -e "s/@DELTAT@/5e-6/g" -e  "s/@WRITEINTERVAL@/0.01/g" \
#    -e "s/@WRITEFORMAT@/binary/g" \
#    -e "s/@ENABLED@/false/g" \
#    -e "s/@RESTART@/false/g" -e "s/@RESTARTOUT@/false/g" \
#    system/controlDict_template > system/controlDict
#sed -e "s/@DIVPHIU@/Gauss vanLeer/g" \
#    system/fvSchemes_template > system/fvSchemes
#srun --hint=nomultithread flameletFoam -parallel
#
#cd constant/boundaryData
#for folder in $AIRINLET
#do
#    cd $folder
#    python3 inlet_time_ext.py
#    cd ..
#done
#cd ../..
#
cp system/controlDict system/log5_controlDict
sed -e "s/@STARTTIME@/latestTime/g" -e "s/@ENDTIME@/0.4/g" \
    -e "s/@DELTAT@/5e-6/g" -e  "s/@WRITEINTERVAL@/0.01/g" \
    -e "s/@WRITEFORMAT@/binary/g" \
    -e "s/@ENABLED@/false/g" \
    -e "s/@RESTART@/false/g" -e "s/@RESTARTOUT@/false/g" \
    system/controlDict_template > system/controlDict
sed -e "s/@DIVPHIU@/Gauss linear/g" \
    system/fvSchemes_template > system/fvSchemes
srun --hint=nomultithread flameletFoam -parallel

cd constant/boundaryData
for folder in $AIRINLET
do
    cd $folder
    python3 inlet_time_ext.py
    cd ..
done
cd ../..

cp system/controlDict system/log6_controlDict
sed -e "s/@STARTTIME@/latestTime/g" -e "s/@ENDTIME@/0.5/g" \
    -e "s/@DELTAT@/5e-6/g" -e  "s/@WRITEINTERVAL@/0.02/g" \
    -e "s/@WRITEFORMAT@/binary/g" \
    -e "s/@ENABLED@/false/g" \
    -e "s/@RESTART@/false/g" -e "s/@RESTARTOUT@/false/g" \
    system/controlDict_template > system/controlDict
sed -e "s/@DIVPHIU@/Gauss linear/g" \
    system/fvSchemes_template > system/fvSchemes
srun --hint=nomultithread flameletFoam -parallel

cd constant/boundaryData
for folder in $AIRINLET
do
    cd $folder
    python3 inlet_time_ext.py
    cd ..
done
cd ../..

cp system/controlDict system/log7_controlDict
sed -e "s/@STARTTIME@/latestTime/g" -e "s/@ENDTIME@/0.6/g" \
    -e "s/@DELTAT@/5e-6/g" -e  "s/@WRITEINTERVAL@/0.02/g" \
    -e "s/@WRITEFORMAT@/binary/g" \
    -e "s/@ENABLED@/false/g" \
    -e "s/@RESTART@/false/g" -e "s/@RESTARTOUT@/false/g" \
    system/controlDict_template > system/controlDict
sed -e "s/@DIVPHIU@/Gauss linear/g" \
    system/fvSchemes_template > system/fvSchemes
srun --hint=nomultithread flameletFoam -parallel

cd constant/boundaryData
for folder in $AIRINLET
do
    cd $folder
    python3 inlet_time_ext.py
    cd ..
done
cd ../..

cp system/controlDict system/log8_controlDict
sed -e "s/@STARTTIME@/latestTime/g" -e "s/@ENDTIME@/0.7/g" \
    -e "s/@DELTAT@/5e-6/g" -e  "s/@WRITEINTERVAL@/0.02/g" \
    -e "s/@WRITEFORMAT@/binary/g" \
    -e "s/@ENABLED@/true/g" \
    -e "s/@RESTART@/true/g" -e "s/@RESTARTOUT@/true/g" \
    system/controlDict_template > system/controlDict
sed -e "s/@DIVPHIU@/Gauss linear/g" \
    system/fvSchemes_template > system/fvSchemes
srun --hint=nomultithread flameletFoam -parallel

cd constant/boundaryData
for folder in $AIRINLET
do
    cd $folder
    python3 inlet_time_ext.py
    cd ..
done
cd ../..

cp system/controlDict system/log9_controlDict
sed -e "s/@STARTTIME@/latestTime/g" -e "s/@ENDTIME@/0.8/g" \
    -e "s/@DELTAT@/5e-6/g" -e  "s/@WRITEINTERVAL@/0.02/g" \
    -e "s/@WRITEFORMAT@/binary/g" \
    -e "s/@ENABLED@/true/g" \
    -e "s/@RESTART@/true/g" -e "s/@RESTARTOUT@/true/g" \
    system/controlDict_template > system/controlDict
sed -e "s/@DIVPHIU@/Gauss linear/g" \
    system/fvSchemes_template > system/fvSchemes
srun --hint=nomultithread flameletFoam -parallel
