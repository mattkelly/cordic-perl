cordic-perl
===========

Simple scripts for experimenting with CORDIC algorithms in Perl.

---

CORDIC Multiply & Divide:

    Computes x * y or x / y. 

    Usage: perl cordic_mul_div [mul|div] x y

    Multiply and divide converges for x, y in [-1.0, 1.0]. y <= x is required for division. 

---

CORDIC log10(x) and 10^x

    Computes log10(x) or 10^x.

    Usage: perl cordic_log [log|exp10] x

    log10(x) converges for x in [1.26, 3.46] 
    10^x converges for x in [-0.539, 0.377]
