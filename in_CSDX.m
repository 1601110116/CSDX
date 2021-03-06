clear all; close all
global tau bz nts ntp enable_source visual savedata denref Tref
path = 'D:\code_3d_linear_device_separate_den';
addpath(path);  addpath([path,'\analysis_utils']);

%  Switches
enable_source = 1;
restart = 0;
simulate = 1;
visual = 1;
savedata = 1;
make_movie = 1;
analyse = 0;


%  Basic parameters
Tref = 3;  % initial temperature at r = 0 in eV
denref = 8e12;  %initial density at r = 0 in cm^-3
B = 1e3;  %  Bz in Gauss
mu = 40;  %  ion mass over proton mass. mu_argon=40
Rho = 7;  %  a in cm
rdif = 5.5;  %  dif_in for r < rdif, dif_out for r > rdif
nzdif = 3;  %  difz_out for the first and last nzdif grids in z direction, and difz_in for the inner ones
rfpow = 4.5e-2;  %  total rf power input in kW, 1.5 in experiment
densrc = 0;  %  ionization rate per cm in z direction in cm^-1s^-1

%  Sizes
alx = 17;  %  simulation area x width in cm
aly = 17;
alz = 270;  %  simulation area z width in cm
dx = 0.15;  %  x grid size in gyroradius
dy = 0.15;
nz = 15;  %  grid count in z direction
intdenpdst = 3;  %  initial density max gradient position in cm
intdenwdth = 1;  %  initial density width in cm
intpepdst = 3;  %  initial temperature max gradient position in cm
intpewdth = 0.2;
densrcctr = 0;  %  density source center radius in cm
densrcwdth = 4.5;  %  density source width radius in cm  (which is 3 \sigma of the Gaussian distribution function)
pesrcctr = 0;
pesrcwdth = 4.5;

%  Steps
ntp = 40;
nts = 500;
tau=0.01;  %  time step length in a/cs

%  Normalized small parameters
pert=1.e-10;
dif_in=0.006;  %  for r < rdif
dif_out = 0.15;  %  for r > rdif
difz_in = 0.02;
difz_out = 0.3;
bz=1;
calc_parameter;
if simulate
    scmod;
end
if make_movie
    movieMaker;
end
if analyse
    analysis;
end
%draw_prifile
