# Mechanism analysis

The planar model has four links, including the fixed frame. The trigger rotates about O₁, the connecting link joins A and B, and the slider translates at P. O₁, A, and B are revolute joints. P is a prismatic joint. The planar mobility is $3(4-1)-2(4)=1$.

The positive horizontal axis points toward the nozzle. Trigger angles and input torque are positive counterclockwise. The signed offset $e$ is measured vertically from O₁ to the path of B. With $r_2=|O_1A|$ and $r_3=|AB|$, the selected assembly branch has B to the left of A:

$$
x_4=r_2\cos\theta_2-\sqrt{r_3^2-(e-r_2\sin\theta_2)^2}.
$$

The script subtracts the initial slider position to obtain displacement and differentiates the position to obtain velocity and acceleration. The branch is differentiable where the radicand is positive.

Virtual work gives the signed feed force $F_{\mathrm{feed}}=\tau_2/(dx_4/d\theta_2)$ wherever $dx_4/d\theta_2\ne0$. The mechanical advantage is $l_\perp/|dx_4/d\theta_2|$, where $l_\perp$ is the perpendicular moment arm of the hand force. The quasi-static force model neglects the return spring shown in the diagram, friction, and inertia.

[Hand-drawn mechanism diagram](../media/kinematic-diagram.jpg) · [Internal structure reference image](../media/internal-structure.jpg)