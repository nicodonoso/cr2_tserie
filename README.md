# cr2_tserie
Read CR2 climate netcdf and create 1 file x each variable 


% función cr2_tserie por Nico Donoso

Extrae serie de tiempo de la variable var (ej.var='t') desde el archivo netcdf nc_file (ej. nc_file = cr2_rcp_1979.nc')
en el punto (lat_aws, lon_aws).
 
   Ejemplo de uso:
 [z.t,z.temp] = era5_nc_tsiere(-33.1776,-70.2167,'t','/path/to/file/cr2_crp_1979.nc')

