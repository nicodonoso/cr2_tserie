# cr2_tserie
Read CR2 climate netcdf and create 1 file (.mat) x each variable  

regcm4_cr2_unir.m is a script that has the configuration of the point to be extracted (lat / long), the path where the .nc files are and the path where I want to save the .mat files. This script call the function cr2_tserie.m

cr2_tserie.m is a function that calls the cr2_tserie.m function to read the .nc files, joins them and saves the .nc files, leaving one file per variable.

por Nico Donoso

   Ejemplo de uso:
 [z.t,z.temp] = era5_nc_tsiere(-33.1776,-70.2167,'t','/path/to/file/cr2_crp_1979.nc')

