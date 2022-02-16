function d = point_line_dist(pt, v1, v2)
a = v1 - v2;
b = pt - v2;
a = [a, 0];
b = [b, 0];
d = norm(cross(a,b)) / norm(a);