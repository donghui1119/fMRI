file1=spm_select;   % ѡ��ͷ��Ϣ��ȷ��ͼ���ļ�
M=spm_get_space(file1);

imgfiles=spm_select(Inf,'image','Select images to be processed',[],pwd,'.nii',1:1000);

for im=1:size(imgfiles,1),
     spm_get_space(deblank(imgfiles(im,:)), M);
end
