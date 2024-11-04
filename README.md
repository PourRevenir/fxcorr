# Fxcorr: Cross-correlation computing function

Yaokun Yang, Nov. 5, 2024 

<yangyaokun@csu.edu.cn>

## Implementation principle

Cross-correlation of the signals $x_1(t)$ and $x_2(t)$ is given by

$$
y(t)=\int^t_0x_1(\tau)x_2(t+\tau)d\tau
$$

It is equivalent to the convolution by flipping $x_2(t)$

$$
y(t) = x_1(t)*x_2(-t)
$$

Take the Fourier transform of the above equation, among which using two special properties of the Fourier transform:

> __Convolution property__
>
> *Convolution in the time domain is equivalent to multiplication in the frequency domain.*

> __Conjugate symmetry property__
>
> *For a real signal, its flip in the time domain corresponds to the complex conjugation in the frequency domain.*

$$
Y(j\omega) = X_1(j\omega)X_2(-j\omega) = X_1(j\omega)X_2^*(j\omega)
$$

When FFT is applied to a time series signal, the array length before and after is the same, so the length of the signal must be increased (add zeros at the end of it). Here we take the `2*length(x)-1` as the length of the output array，among which `x` is the signal with the longer length.

## Reference

[1] Alan V. Oppenheim *at el*. *Signals and System, Second Edition*, 2020
