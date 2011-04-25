a=0.02;
b=0.2;
c=-65;
d=2;

v=-65;
u=b*v;
spikes=[];
for t=0:1000
    % disp(v);
    I=sin(t/100)*10;
    if(v >= 30)
        fprintf('spike at %d\n', t);
        spikes=[t; spikes];
        v=  c;
        u=u+d;
    end
    fprintf('loop %10.8f %10.8f %d %f\n', u, v, t, I)
    v=v+0.5*(0.04*v.^2+5*v+140-u+I); % step 0.5 ms
    v=v+0.5*(0.04*v.^2+5*v+140-u+I); % for numerical
    u=u+a.*(b.*v-u);                 % stability
end;

fprintf('spikes:');
fprintf(' %d', spikes);
