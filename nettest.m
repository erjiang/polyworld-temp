a=0.02;
b=0.2;
c=-65;
d=2;

v=-65;
u=b*v;
for t=0:1000
    % disp(v);
    I=sin(t)*10;
    fprintf('loop %f %f %d %f\n', u, v, t, I)
    if(v >= 30)
        disp("spike");
        v=  c;
        u=u+d;
    end
    v=v+0.5*(0.04*v.^2+5*v+140-u+I); % step 0.5 ms
    v=v+0.5*(0.04*v.^2+5*v+140-u+I); % for numerical
    u=u+a.*(b.*v-u);                 % stability
end;
