function [] = crear_ts_cr2(aws_lat,aws_lon,var_nc,type,rcp,files_path,structure_path)
%Función que lee los netcdf de cordex de CR2, los apila y los guarda en estructuras
%matlab. Ocupa la función cr2_tserie.
debug = 0;                                                                  if debug == 1; disp('Debug mode in crear_ts_cr2'); end

addpath('/home/nico/Documents/matlab_script')

if debug==1; disp('Execute function crear_ts_cr2'); end
% var_nc = 'tasmax';
% type = 'MPI-M-MPI-ESM-LR';
% files_path = '/media/nico/data_nicod_/CR2/cordex/SAM_22i/rcp_85/day/tasmax/GERICS-REMO2015/MPI-M-MPI-ESM-LR/r1i1p1/';
% structure_path = '/home/nico/Documents/cecs/reanalysis/cr2';


cd(files_path);
aa = dir('*.nc');%no funciona con path completo, es necesario hacer "cd" de linea anterior
z(1).var_names = {var_nc};
z(1).type = {type};
z(1).rcp = {rcp};
%leemos todos los archivos,quedando guardado en la estructura "y"
for i=1:length(aa)
            [y(i).time,y(i).var] = cr2_tserie(aws_lat,aws_lon,var_nc,aa(i).name);
            if debug == 1; disp('Execute function cr2_tserie');end
            disp(['File: ',num2str(i),'/',num2str(length(aa))]);
            disp(['Var: ',var_nc]);
            disp(['Type: ',type]);
            disp(['rcp: ',rcp]);
end
%unimos las series de tiempo
z.time(1)    = NaN;
z(1).var(1)  = NaN;

for i = 1:length(aa)       
    z(1).time = vertcat(z.time, y(i).time); 
    z(1).var = vertcat(z(1).var, y(i).var');
end
clear y;% es necesario para no ir iterando sobre los mismos elementos y LIMPIAR LA MEMORIA
z(1).time(1) = [];
z(1).var(1) = [];
%% 
cd(structure_path)
file_name = [var_nc,'_',type,'_',rcp,'.mat'];
save(file_name,'z')
disp(['Saved: ',file_name,' en ',structure_path])
%save(['cr2_',var_nc,'_',type,'.mat'],'z')
%disp(['Se guardó: ',var_nc,'_',type,'_',rcp,'.mat en ',structure_path])
end

