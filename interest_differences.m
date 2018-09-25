format long

%% 
% situation 2.1
syms f n m x PF
n = 5; m = 1; x = 1000;
for f = [0.01 0.05 0.10 0.25]
    PF = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
    disp(PF);
end

%%
% situation 2.2
syms f n m x PF
f = 0.05; m = 1; x = 1000;
for n = [1 5 10 20]
    PF = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
    disp(PF);
end
%%
% situation 2.3
syms f n m x
PF = zeros(4,1); PF_D = zeros(3,1);
n = 5; f = 0.05; x = 1000;
for m = [1 4 12 365]
    if m == 1
        PF(1) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
    end
    if m == 4
        PF(2) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
    end
    if m == 12
        PF(3) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
    end
    if m == 365
        PF(4) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
    end
end

for i = 2:4
    PF_D(i-1) = PF(i) - PF(i-1);
end
%%
% situation 2.3 more generally version
syms f n m x k
n = 0; f = 0.05; x = 1000; k = 0; m = 3;
PF_D = zeros(k+1,(m-2)*10^k); PF = zeros(k+1,m*10^k);

if n < 0 || rem(n,1) ~= 0
    error('n must be nonnegative and be integer')
end
if x <= 0
    error('x must be positve');
end
if k < 0 || k > 8 || rem(k,1) ~= 0
    error('k must be chosen from one of the numbers 1,2,3,4,5,6,7')
end
if m < 3 || rem(m,1) ~= 0
    error('m must be larger than 2 and be integer')
end

for i = 0:k
    for j = (1:m)*10^i
        PF(i+1,j) = x*( f*(1+f)^(n + 1/(2*j)) / ( (1+f)^(1/j) - 1 ) - j );
    end
end

n = 0;
for i = 0:k
    for j = (2:m-1)*10^i
        PF_D(i+1,j-1*10^i) = PF(i+1,j+1*10^i) - PF(i+1,j)...
            - ( PF(i+1,j) - PF(i+1,j-1*10^i) );
        if PF_D(i+1,j-1*10^i) > 0
            n = n+1;
            disp( [ 'the increse velocity of interval [ (',...
                num2str(i+1),',',num2str(j+1*10^i),'),(',...
                num2str(i+1),',',num2str(j),') ] is larger than '...
                'interval [ (',num2str(i+1),',',num2str(j),'),(',...
                num2str(i+1),',',num2str(j-1*10^i),') ]' ] )
        end
    end
end
disp(['total number of interval whose incresing velocity is incresing is '...
    ,num2str(n)])

%%
% situation 2.4
syms f n m x PF
f = 0.05; m = 1; n = 5;
for x = [1000 5000 10000 20000]
    PF = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
    disp(PF);
end

%%
% situation 3.1
syms f n m x
PF = zeros(4,4); PF_D = zeros(4,3);
n = 5; x = 1000;
for f = [0.01 0.05 0.10 0.25]
    for m = [1 4 12 365]
        if f == 0.01 && m == 1
            PF(1,1) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if f == 0.01 && m == 4
            PF(1,2) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if f == 0.01 && m == 12
            PF(1,3) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if f == 0.01 && m == 365
            PF(1,4) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if f == 0.05 && m == 1
            PF(2,1) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if f == 0.05 && m == 4
            PF(2,2) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if f == 0.05 && m == 12
            PF(2,3) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if f == 0.05 && m == 365
            PF(2,4) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if f == 0.10 && m == 1
            PF(3,1) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if f == 0.10 && m == 4
            PF(3,2) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if f == 0.10 && m == 12
            PF(3,3) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if f == 0.10 && m == 365
            PF(3,4) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if f == 0.25 && m == 1
            PF(4,1) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if f == 0.25 && m == 4
            PF(4,2) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if f == 0.25 && m == 12
            PF(4,3) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if f == 0.25 && m == 365
            PF(4,4) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
    end
end

for i = 1:4
    for j = 1:3
        PF_D(i,j) = PF(i,j+1) - PF(i,j);
    end
end
%%
% situation 3.2
syms f n m x
PF = zeros(4,4); PF_D = zeros(4,3);
f = 0.05; x = 1000;
for n = [1 5 10 20]
    for m = [1 4 12 365]
        if n == 1 && m == 1
            PF(1,1) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if n == 1 && m == 4
            PF(1,2) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if n == 1 && m == 12
            PF(1,3) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if n == 1 && m == 365
            PF(1,4) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if n == 5 && m == 1
            PF(2,1) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if n == 5 && m == 4
            PF(2,2) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if n == 5 && m == 12
            PF(2,3) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if n == 5 && m == 365
            PF(2,4) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if n == 10 && m == 1
            PF(3,1) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if n == 10 && m == 4
            PF(3,2) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if n == 10 && m == 12
            PF(3,3) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if n == 10 && m == 365
            PF(3,4) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if n == 20 && m == 1
            PF(4,1) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if n == 20 && m == 4
            PF(4,2) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if n == 20 && m == 12
            PF(4,3) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if n == 20 && m == 365
            PF(4,4) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
    end
end

for i = 1:4
    for j = 1:3
        PF_D(i,j) = PF(i,j+1) - PF(i,j);
    end
end
%%
% situation 3.3
syms f n m x
PF = zeros(4,4); PF_D = zeros(4,3);
f = 0.05; n = 5;
for x = [1000 5000 10000 20000]
    for m = [1 4 12 365]
        if x == 1000 && m == 1
            PF(1,1) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if x == 1000 && m == 4
            PF(1,2) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if x == 1000 && m == 12
            PF(1,3) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if x == 1000 && m == 365
            PF(1,4) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if x == 5000 && m == 1
            PF(2,1) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if x == 5000 && m == 4
            PF(2,2) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if x == 5000 && m == 12
            PF(2,3) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if x == 5000 && m == 365
            PF(2,4) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if x == 10000 && m == 1
            PF(3,1) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if x == 10000 && m == 4
            PF(3,2) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if x == 10000 && m == 12
            PF(3,3) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if x == 10000 && m == 365
            PF(3,4) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if x == 20000 && m == 1
            PF(4,1) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if x == 20000 && m == 4
            PF(4,2) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if x == 20000 && m == 12
            PF(4,3) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
        if x == 20000 && m == 365
            PF(4,4) = x*( f*(1+f)^(n + 1/(2*m)) / ( (1+f)^(1/m) - 1 ) - m );
        end
    end
end

for i = 1:4
    for j = 1:3
        PF_D(i,j) = PF(i,j+1) - PF(i,j);
    end
end
