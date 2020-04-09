# cr2_tserie
Read CR2 climate netcdf  


% función cr2_tserie por Nico Donoso
extrae serie de tiempo de la variable var (ej.var='t')
desde el archivo netcdf nc_file (ej. nc_file =
'/home/nico/Documents/cecs/reanalysis/era5/era5_olivares/olivares_era5_TPP_suba_1979_1982.nc')
en el punto (lat_aws, lon_aws).
 
   Ejemplo de uso:
 [z.t,z.temp] = era5_nc_tsiere(-33.1776,-70.2167,'t','/home/nico/Documents/cecs/reanalysis/era5/era5_olivares/olivares_era5_TPP_suba_1979_1982.nc')
 nc_file = '/home/nico/Documents/cecs/reanalysis/era5/era5_olivares/olivares_era5_TPP_suba_1979_1982.nc';
