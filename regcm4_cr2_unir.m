close all; clear all;

% script para unir los datos de era5 descargados 
%tic
addpath('/home/nico/Documents/matlab_script')
%load /home/nico/Documents/cecs/olivares/met/procesados/resultados/oar_editada.mat

%% setup general
aws_lat = -33.1776;
aws_lon = -70.2167;
structure_path = '/home/nico/Documents/cecs/reanalysis/cr2';%where it is gonna be save structure .mat file 

rcp = {'rcp_85','rcp_26'};
var_nc = {'tasmin','tasmax','pr','tas'};
type = {'MOHC-HadGEM2-ES','MPI-M-MPI-ESM-LR','NCC-NorESM1-M'};

for rcp_i=1:length(rcp)
    for var_nc_i = 1:length(var_nc)
        for type_i =1:length(type)
            disp(['file path...   /media/nico/data_nicod_/CR2/cordex/SAM_22i/',char(rcp(rcp_i)),'/day/',char(var_nc(var_nc_i)),'/GERICS-REMO2015/',char(type(type_i)),'/r1i1p1/'])
            files_path =(['/media/nico/data_nicod_/CR2/cordex/SAM_22i/',char(rcp(rcp_i)),'/day/',char(var_nc(var_nc_i)),'/GERICS-REMO2015/',char(type(type_i)),'/r1i1p1/']);            
            %Execute ->
            crear_ts_cr2(aws_lat,aws_lon,char(var_nc(var_nc_i)),char(type(type_i)),char(rcp(rcp_i)),files_path,structure_path);
            %clear all;
            disp('ejecutado !!')
        end
    end
end

%% Figuras! 

% figure(1)
% clf
% plot(z.time,z.var-273.15,'b.-')
% datetick
% grid on
% datestr(z.time)
% title("Time serie from netcdf file")














% código no resumido
%% RCP 85

% %% 1- 'tasmax'  'MPI-M-MPI-ESM-LR' 
% %%setup local
% type = 'MPI-M-MPI-ESM-LR';
% var_nc = 'tasmax';
% rcp = 'rcp_85';
% files_path =(['/media/nico/data_nicod_/CR2/cordex/SAM_22i/',rcp,'/day/',var_nc,'/GERICS-REMO2015/',type,'/r1i1p1/']);
% %% Corremos Función
% crear_ts_cr2(aws_lat,aws_lon,var_nc,type,rcp,files_path,structure_path)
% clear all;
% return
% %% 2-  'tasmax'  'MOHC-HadGEM2-ES'
% %%setup local
% type = 'MOHC-HadGEM2-ES';
% var_nc = 'tasmax';
% rcp = 'rcp_85';
% files_path =(['/media/nico/data_nicod_/CR2/cordex/SAM_22i/',rcp,'/day/',var_nc,'/GERICS-REMO2015/',type,'/r1i1p1/']);
% %% Corremos Función
% crear_ts_cr2(aws_lat,aws_lon,var_nc,type,rcp,files_path,structure_path)
% clear all
% %% 3-  'tasmax'  NCC-NorESM1-M
% %setup local
% type = 'NCC-NorESM1-M';
% var_nc = 'tasmax';
% rcp = 'rcp_85';
% files_path =(['/media/nico/data_nicod_/CR2/cordex/SAM_22i/',rcp,'/day/',var_nc,'/GERICS-REMO2015/',type,'/r1i1p1/']);
% %% Corremos Función
% crear_ts_cr2(aws_lat,aws_lon,var_nc,type,rcp,files_path,structure_path)
% clear all
% return


 toc
