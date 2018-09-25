tic
load ('example.mat');

pressure_gradient = 'gravity_friction';      % 1 denote gravity only, 2 denote gravity and friction
pressure_gradient_type = {'gravity','gravity_friction'};
solution = 'numerical';               % 1 denote analytical solution and numerical solution, 2 denote numerical solution only
solution_type = {'analytical','numerical'};

n = length(d);              % n is variable number
HL = zeros(1,n);
theta = sin(pi/2);
sin_angle = ones(1,n)*theta;
syms hold_up pressure_difference1 liquid_density1 gas_density1 g1 sin_angle1 e1 d1 noslip_density1...
    Vm1 u_liquid1 u_gas1 GMA1;
for i = 1:n
    Rem = ( noslip_density(i)*-Vm(i)*d(i) / ( u_liquid(i)^hold_up * u_gas(i)^(1 - hold_up) ) );
    mix_density = ( liquid_density(i)*hold_up + gas_density(i)*(1-hold_up) );
    
    switch pressure_gradient
        case 'gravity'
            
            switch solution
                case 'analytical'
                    analysis_solution = solve( pressure_difference1 == ( liquid_density1*hold_up + gas_density1*(1-hold_up) )...
                        *g1*sin_angle1, hold_up );
                    HL(i) = solve( mix_density*g(i)*sin_angle(i) == pressure_difference(i), hold_up );
                case 'numerical'
                    HL(i) = solve( mix_density*g(i)*sin_angle(i) == pressure_difference(i), hold_up );
            end
            
        case 'gravity_friction'
            
            switch solution
                case 'analytical'
                    analysis_solution = solve( pressure_difference1 == (liquid_density1*hold_up + gas_density1*(1-hold_up))...
                        *g1*sin_angle1 + ( 1.14 - 2*log10( e1/d1 + 21.25 / ( noslip_density1*(Vm1)*d1...
                        / ( u_liquid1^hold_up * u_gas1^(1 - hold_up) ) )^0.9 ) )^(-2) * GMA1^2 /...
                        ( 2*d1*( liquid_density1*hold_up + gas_density1*(1-hold_up) ) ), hold_up );
                    HL(i) = solve( mix_density*g(i)*sin_angle(i) + ( 1.14 - 2*log10( e(i)/d(i) + 21.25 / Rem^0.9 ) )^(-2)...
                        * GMA(i)^2 / ( 2*d(i)*mix_density ) == pressure_difference(i), hold_up );
                case 'numerical'
                    HL(i) = solve( mix_density*g(i)*sin_angle(i) + ( 1.14 - 2*log10( e(i)/d(i) + 21.25 / Rem^0.9 ) )^(-2)...
                        * GMA(i)^2 / ( 2*d(i)*mix_density ) == pressure_difference(i), hold_up );
            end
            
    end
    disp(HL(i));
end
HL = real(HL);
HL = transpose(HL);
while strcmp(solution,'analytical')
    disp(analysis_solution);
    break
end
toc