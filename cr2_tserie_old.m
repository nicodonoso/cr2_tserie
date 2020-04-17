function [time,var_serie] = cr2_tserie(lat_aws,lon_aws,var,nc_file)
%Warning
%for i=1:1000000;disp('NO FUNCIONANOD BIEN AÚN, LOS TIEMPOS QUEDAN MAL');end;

% función cr2_tserie por Nico Donoso
% extrae serie de tiempo de la variable var (ej.var='t')
% desde el archivo netcdf nc_file (ej. nc_file =
% '/home/nico/Documents/cecs/reanalysis/era5/era5_olivares/olivares_era5_TPP_suba_1979_1982.nc')
% en el punto (lat_aws, lon_aws).
% 
%   Ejemplo de uso:
% [z.t,z.temp] = era5_nc_tsiere(-33.1776,-70.2167,'t','/home/nico/Documents/cecs/reanalysis/era5/era5_olivares/olivares_era5_TPP_suba_1979_1982.nc')
% nc_file = '/home/nico/Documents/cecs/reanalysis/era5/era5_olivares/olivares_era5_TPP_suba_1979_1982.nc';
disp('####################################################################')
disp(['leyendo ',nc_file])
%lat_aws = -33.1776;
%lon_aws = -70.2167;

a=ncinfo(nc_file);
for i=1:length(a(1).Variables)
disp(['Variables ',num2str(i),': ',a(1).Variables(i).Name]);
end
%temp  = ncread('download_2014.nc','t');

lat = ncread(nc_file,'lat');
lon = ncread(nc_file,'lon');
netcdf_time = ncread(nc_file,'time');
time = datenum(1949,12,double(t)+1,0,0,0);
%% busco pto grilla cercano
[lat_min,indx_lat] = min(abs(lat-lat_aws));
[lon_min,indx_lon] = min(abs(lon-lon_aws));

disp(['Indice de LAT en el .nc es: ',num2str(indx_lat),', con una diferencia abs de: ',num2str(lat_min)]);
disp(['Indice de LON en el .nc es: ',num2str(indx_lon),', con una diferencia abs de: ',num2str(lon_min)]);

var_serie = ncread(nc_file,var,[indx_lon indx_lat 1],[1 1 Inf]); 
var_serie = (squeeze(var_serie)');


end

