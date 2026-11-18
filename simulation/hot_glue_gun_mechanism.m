clear;
clc;

%% 1. Define symbolic variables
syms r2 r3 F_hand l_perp positive
syms e theta2 theta2_0 omega2 alpha2 tau2 real

% r2       = length O1A (m)
% r3       = length AB (m)
% e        = signed vertical offset from O1 to the path of B (m)
% theta2   = trigger angle, CCW positive from +x (rad)
% theta2_0 = trigger angle at the start of the feed stroke (rad)
% omega2   = trigger angular velocity (rad/s)
% alpha2   = trigger angular acceleration (rad/s^2)
% tau2     = signed input torque about O1, CCW positive (N*m)
% F_hand   = magnitude of the hand force (N)
% l_perp   = perpendicular moment arm of the hand force (m)
% Positive x points toward the nozzle.

%% 2. Position and displacement
d = e - r2*sin(theta2);
q = sqrt(r3^2 - d^2);

% Select the negative root because B is to the left of A.
x4 = r2*cos(theta2) - q;

x4_0 = subs(x4, theta2, theta2_0);
delta_x4 = x4 - x4_0;

%% 3. Velocity and acceleration
dx4_dtheta2 = diff(x4, theta2);
d2x4_dtheta2 = diff(x4, theta2, 2);

v4 = dx4_dtheta2 * omega2;
a4 = d2x4_dtheta2 * omega2^2 + dx4_dtheta2 * alpha2;

%% 4. Quasi-static force analysis using virtual work
% tau2*dtheta2 = F_feed*dx4
% Spring force, friction, and inertia are neglected.

F_feed = tau2 / dx4_dtheta2;  % Positive force points toward the nozzle.

% abs(tau2) = F_hand * l_perp
F_feed_mag = F_hand * l_perp / abs(dx4_dtheta2);
mechanical_advantage = simplify(F_feed_mag / F_hand);

%% 5. Display symbolic results
disp('Slider position x4 (m):');
pretty(x4)

disp('Slider displacement delta_x4 (m):');
pretty(delta_x4)

disp('Slider velocity v4 (m/s):');
pretty(v4)

disp('Slider acceleration a4 (m/s^2):');
pretty(a4)

disp('Signed feed force F_feed (N):');
pretty(F_feed)

disp('Feed force magnitude F_feed_mag (N):');
pretty(F_feed_mag)

disp('Mechanical advantage F_feed_mag / F_hand:');
pretty(mechanical_advantage)