# --------------------------------------------------------------
# Name:        denoise.R
# Description: Script to denoise pages of the constitution,
#              bill of rights, and declaration of independence.
#              The algorithm to clean these images was developed
#              in a Kaggle competetion by Colin Priest.
#              This script is accessed 24x for each image.
#
# https://www.kaggle.com/colinpriest/denoising-with-r-part-1
# -----------------------------------------------------------

# reset command-line arguments to NULL 
n.image=NULL

# allows command-line arguments to be passed to R
batch::parseCommandArgs()
# Note: Once the above line is run, n.image from the command line exists in the workspace

#access name and location of image to be cleaned
dirtyFolder = "<location of folder containing dirty images here>"
outputFolder = "<location of folder to output cleaned images here>"
filenames = list.files(dirtyFolder)
f=filenames[n.image]

#denoising (pasted from Colin Priest's Kaggle script)
require(png)
imgX = readPNG(file.path(dirtyFolder, f))
x = matrix(imgX, nrow(imgX) * ncol(imgX), 1)
y = -0.04337585 + 1.250061* x
y[y < 0] = 0
y[y > 1] = 1
img = matrix(y, nrow(imgX), ncol(imgX))
require(data.table)
img.dt=data.table(melt(img))
names.dt<-names(img.dt)
setnames(img.dt,names.dt[1],"X1")
setnames(img.dt,names.dt[2],"X2")
Numfile = gsub(".png", "", f, fixed=TRUE)
img.dt[,id:=paste(Numfile,X1,X2,sep="_")]

#write data
write.table(img.dt[,c("id","value"),with=FALSE], 
            file = paste0(outputFolder,
                          sub('\\.png$', '', f),".csv"), sep = ",", 
                          col.names = (f == filenames[1]),
                          row.names = FALSE,quote = FALSE,
                          append=(f != filenames[1]))

#write image
writePNG(img, paste0(outputFolder,"cleaned_",f))
