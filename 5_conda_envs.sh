mamba activate base
mamba install ipykernel ipython ruff snakemake -y
mamba create -n gis python=3.11 rasterio geopandas ipykernel ipython  -y
mamba create -n R r-base>=4.3.1 r-essentials radian -y