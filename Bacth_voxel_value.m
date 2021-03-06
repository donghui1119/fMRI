%The script can be used to extract voxel intensity(or calculated voxel-wise value of metrics)
%Written by Donghui Song,10/04/2020,Baltimore,MD,USA(https://scholar.google.com/citations?user=ObUL2-MAAAAJ&hl=en)
%mm2vox function from John Ashburner(https://github.com/spunt/bspm/blob/master/utilities/mm2vox.m)
clear

file='C:\Users\DonghuiSong\Desktop\HIV_Normal';%imge folder path
filefolder=dir(file);
newfilefolder=filefolder(3:end);
mm=[-21,-66,42];%input MNI(mm)coordinates
V='C:\Users\DonghuiSong\Desktop\HIV_HAND\swBEN_060042_F04_S0_D3_r0.600000.nii';%structure containing Image information (e.g., use the MNI template) -
vox=mm2vox(mm, V);
xyz=[vox(1,1);vox(1,2);vox(1,3)];%you can also comment out function mm2vox, then find the mm to vox coordicate by spm gui display

for i=1:length(newfilefolder);
  img=[file,'\',newfilefolder(i).name];
  M=spm_get_data(img,xyz);
  value{i}=M;
end
value=value'
xlswrite('C:\Users\DonghuiSong\Desktop\ANCOVA\BEN_Value.xlsx',value,'BEN1','A2')

 