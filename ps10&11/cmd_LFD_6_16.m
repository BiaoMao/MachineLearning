%make numbers of tests
FONT_SIZE=12;
N=1000;
Eout_condensed=zeros(N,1);
Eout_original=zeros(N,1);
parfor i=1:N
    [Eout_con,Eout_ori]=LFD_p6_16_digit();
    Eout_condensed(i,:)=Eout_con;    
    Eout_original(i,:)=Eout_ori;
end
Eout_con_ave=mean(Eout_condensed)
Eout_ori_ave=mean(Eout_original)

