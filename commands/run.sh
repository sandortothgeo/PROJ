
#--- regi es uj megoldas kulonbsege (ami itt van kulonbseg a koordinatakban annyinak kellene kulonboznie a cs2cs outputjanak)
# echo 20.0 47.0 100.0 | /usr/bin/proj -f "%.6f" +proj=somerc +lat_0=47.1666666666667 +lon_0=19.04857177777778 +latc=47.1 +k_0=0.99993 +x_0=650000 +y_0=200000 +ellps=GRS67 +units=m +no_defs
# echo 20.0 47.0 100.0 | /usr/bin/proj -f "%.6f" +proj=somerc +lat_0=47.14439372222222 +lon_0=19.04857177777778 +k_0=0.99993 +x_0=650000 +y_0=200000 +ellps=GRS67 +units=m +no_defs 

# export PROJ_DEBUG="3"
# #--- Tranfo NEW
# echo "---------------------------------------------------------------"
echo 20.0 47.0 100.0 | /usr/bin/cs2cs -f "%.4f" +init=epsg:4258 +to +proj=somerc +lat_0=47.1666666666667 +lon_0=19.04857177777778 +latc=47.1 +k_0=0.99993 +x_0=650000 +y_0=200000 +ellps=GRS67 +nadgrids=etrs2eov.gsb +geoidgrids=vitel2014.gtx +units=m +no_defs
echo 20.0 47.0 100.0 | /usr/bin/cs2cs -f "%.4f" +proj=longlat +ellps=GRS80 +no_defs +to +proj=somerc +lat_0=47.1666666666667 +lon_0=19.04857177777778 +latc=47.1 +k_0=0.99993 +x_0=650000 +y_0=200000 +ellps=GRS67 +nadgrids=etrs2eov.gsb +geoidgrids=vitel2014.gtx +units=m +no_defs

# #--- Tranfo NEW +latc nelul
# # echo "---------------------------------------------------------------"
# # echo 20.0 47.0 100.0 | /usr/bin/cs2cs -f "%.4f" +init=epsg:4258 +to +proj=somerc +lat_0=47.1666666666667 +lon_0=19.04857177777778 +k_0=0.99993 +x_0=650000 +y_0=200000 +ellps=GRS67 +nadgrids=etrs2eov.gsb +geoidgrids=vitel2014.gtx +units=m +no_defs 
# #--- Trafo OLD
# echo "---------------------------------------------------------------"
# # echo 20.0 47.0 100.0 | /usr/bin/cs2cs -f "%.4f" +init=epsg:4258 +to +proj=somerc +lat_0=47.14439372222222 +lon_0=19.04857177777778 +k_0=0.99993 +x_0=650000 +y_0=200000 +ellps=GRS67 +nadgrids=etrs2eov.gsb +geoidgrids=vitel2014.gtx +units=m +no_defs 
# echo 20.0 47.0 100.0 | /usr/bin/cs2cs -f "%.4f" +proj=longlat +ellps=GRS80 +no_defs +to +proj=somerc +lat_0=47.14439372222222 +lon_0=19.04857177777778 +k_0=0.99993 +x_0=650000 +y_0=200000 +ellps=GRS67 +nadgrids=etrs2eov.gsb +geoidgrids=vitel2014.gtx +units=m +no_defs 


# echo 19.9988788890   46.9997396806  | /usr/bin/proj -f "%.6f" +proj=somerc +lat_0=47.1666666666667 +lon_0=19.04857177777778 +latc=47.1 +k_0=0.99993 +x_0=650000 +y_0=200000 +ellps=GRS67 +units=m +no_defs
# exit
echo 20.0 47.0 100.0 2022.0| /usr/bin/cct +proj=pipeline \
+step +proj=vgridshift +grids=vitel2014.gtx \
+step +proj=hgridshift  +grids=etrs2eov.gsb +inv \
+step +proj=somerc +lat_0=47.1666666666667 +lon_0=19.04857177777778 +latc=47.1 +k_0=0.99993 +x_0=650000 +y_0=200000 +ellps=GRS67 +units=m

# echo 722440.3647 184418.8416 57.4600 2022.0000| /usr/bin/cct +proj=pipeline \
# +step +proj=somerc +lat_0=47.1666666666667 +lon_0=19.04857177777778 +latc=47.1 +k_0=0.99993 +x_0=650000 +y_0=200000 +ellps=GRS67 +units=m +inv \
# +step +proj=hgridshift  +grids=etrs2eov.gsb \
# +step +proj=vgridshift +grids=vitel2014.gtx +inv 


