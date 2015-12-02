function[fidelity] = Fidelity(m1, m2)
sqrtm(m1)

fidelity = norm(sqrtm((sqrtm(m1))*m2*(sqrtm(m1))))




end