#!/bin/bash
#SBATCH -p general
#SBATCH -N 1
#SBATCH -n 1

R --vanilla --args n.image $1 < /location/denoise.R
R --vanilla --args n.image $2 < /location/denoise.R
R --vanilla --args n.image $3 < /location/denoise.R
R --vanilla --args n.image ${4} < /location/denoise.R
