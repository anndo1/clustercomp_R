# clustercomp_R
Scripts for computing on a cluster with R.

Please see Dropbox link http://tiny.cc/clustercomp_weideman for more details regarding these scripts. Feel free to leave comments at that link. In brief, this folder contains the following three files and one folder:

1. denoise.R - an R script that is meant to be run on a cluster to denoise (clean) background from historical documents. For more information regarding these documents, see bullet 4 below.

2. swarm.sh - This is a bash script. For a really awesome introduction to bash scripting, please see this link: https://ryanstutorials.net/bash-scripting-tutorial/bash-script.php. This script will submit each R script by requesting one task (-n 1) on a single node (-N 1) on the given partition (-p "partition name here"). The default here is one CPU per task. This swarm calls the R script denoise.R 4x for each image number.

3. generate_jobs.sh - This is another bash script. This script generates six separate calls to swarm.sh. That way, we can "essentially" run all six calls simultaneously (depending on your cluster availability), where each call results in 4 cleaned images.

4. constitution (folder) - This folder contains the following historical documents: the U.S. Constitution, Bill of Rights, and ammendments to the U.S. Constitution. The folder originally contained 6 documents, but, for the purposes of testing, these documents were replicated 4x for a total of 24 documents. These documents were downloaded from the National Archives at https://www.archives.gov/founding-docs/downloads.

This research was supported by UNC Center for AIDS Research (CFAR), an NIH funded program P30 AI050410, and utilized the computational resources of the UNC Longleaf cluster. I want to personally thank Mark Reed with ITS Research Computing and Scott Zentz, system programmer/specialist, for their helpful input and help writing code for the cluster.

The algorithm to clean these images was developed in a Kaggle competetion by programmer Colin Priest. Please see https://www.kaggle.com/colinpriest/denoising-with-r-part-1 for more details.
