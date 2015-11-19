function [rho_1, rho_2, rho_3, rho_4] = Tom_Sim(Operation)
Zero = [1 0;0 0]
One = [0 0; 0 1]
Plus = [1/2 1/2; 1/2 1/2]
Plusi = [1/2 i/2; -i/2 1/2]
sym(Operation)
Operation = sym(Operation)
ctranspose(Operation)

rho_1 = Operation*Zero*(ctranspose(Operation))
rho_4 = Operation*One*(ctranspose(Operation))
rho_2 = Operation*Plus*(ctranspose(Operation)) - i*(Operation*Plusi*(ctranspose(Operation))) - ((1 - i)*(rho_1 + rho_4))/2
rho_3 = Operation*Plus*(ctranspose(Operation)) + i*(Operation*Plusi*(ctranspose(Operation))) - ((1 + i)*(rho_1 + rho_4))/2

end

