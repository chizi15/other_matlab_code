% situation 2.3 more generally version
syms f n m x k
n = 0; f = 0.05; x = 1000; k = 0; m = 3;
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
PF_D = zeros(k+1,(m-2)*10^k); PF = zeros(k+1,m*10^k);
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