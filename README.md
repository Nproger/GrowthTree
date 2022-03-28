# GrowthTree
Simulation of the growth of a tree over the years

the purpose of this exercise is to simulate the growth of the tree over the years.
we assume that X0 ∼ N (10:; 1:2) because trees are generally inventoried from 10 cm.
The diameter at time k depends from that at time k − 1, thus, the transition law from Xk−1 to Xk, 8 k ≥ 1 is inspired by a
growth model that of Gompertz [Gom25] and can be written as follows:
Xk = D1−exp−rXkexp −1−r k−1 for k ≥ 1;
where r and D represent respectively the growth rate and the maximum diameter of a tree. 
In the following, take r = 0:3 and D = 150 cm. k is the noise of the model and is modeled by the density law:
f(x) = (sin( 0 else x) if 0 < x < π

to perform our various calculations we must simulate X~f(x) we therefore need:
1)Determine F(x)
2)Determine "F" ^(-1) ("x)"
3)Simulate μ~[0,1]
"F" ^(-1) ("μ)" is a realization of X

By determining f(x) we get F(x) = {█(0                 Si x≤0@1-cos⁡〖(x)        Si 0<x≤π/2〗@1                   Si >π/2)┤
