clear
pasta_dados = 'A:\OneDrive - Universidade Federal do Rio Grande do Sul\MATLAB\Gabi\DADOS';
[filename,path] = uigetfile(pasta_dados,'*.m');
file = fullfile(path,filename);
load(file)

dt=1/1000;
timevec = (dt:dt:length(AD10)/1000)-dt;
plot(timevec/60,[AD10 AD12+1 AD14+2 AD15+3],'k')

loopend = floor((timevec(end)/60)/10)*10;

X = [];
for i = [0:10:loopend]
    xlim([0 10]+i)
    ylim([-1 4])
    xlabel('Time (min)')
    [x,y] = ginput(2);
    X = [X x(2)-x(1)];
end

disp(['total time = ' num2str(sum(X)) 'min'])
disp(['time 10 min = ' num2str(X) 'min'])