# MIMO linear system identification

[![PRsWelcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

MIMO linear system identification using common subspace methods is an active area, many algorithms were develop in recent years. I implemented well known methods called MOESP and N4SID during my master degree.

## Time-invariant identification

### State space model

The identification of discrete multivariable linear time-invariant systems using subspace methods allows to determine a causal and time invariant model, estimated only from the system inputs and outputs. The main advantage of this approach is that a multivariable system can be modeled, without any a priori assumption about the system order (state vector dimension). A discrete time-invariant model can be described by the following equation in the state space:

```python
 x(t+1) = A*x(t) + B*u(t)
 y(t)   = C*x(t) + D*u(t)  # equation 1
 ```

### Extended State Space Model

In this section an extended model that is useful for the subspace methods is presented.

For a time instant `t`, it is defined that inputs before that instant are null. With this, from the equation (1), it is possible to substitute the relation between inputs, outputs and states between the instants `t` and `t+k-1`, where `k` is an integer, in the following way:

```python
Y(0|k-1) = O(k)X(N-1) + Psi(k)U(0|k-1) # equation 2

```

### MOESP

 Multivariable Output-Error State sPace (MOESP) is a deterministic method to identify linear time invariant systems. The MOESP method developed by M. Verhaegen and P. Dewilde is based on the **LQ decomposition** of Hankel matrix formed from input-output data, where L is lower triangular and Q is orthogonal. A **Singular Value Decomposition (SVD)** can be performed on a block from the L (L22) matrix to obtain the system order and the extended observability matrix. From this matrix it is possible to estimate the matrices C and A of state-space model. The final step is to solve overdetermined linear equations using the least-squares method to calculate matrices B and D.



### N4SID:

 Numerical Algorithms for Subspace State Space System Identification (N4SID) developed by P. Van Overschee and B. De Moor. The method stars with the oblique projection of the future outputs to past inputs and outputs into the future inputs direction. The second step is to apply the **LQ decomposition** and then the state vector can be computed by the **SVD**. Finally, it is possible to compute the matrices A, B, C and D of state-space model by using the least-squares method.



### Testing

This is the available benchmark (MIMO time-invariant:

Second order system, matrix A is 4x4, B is 4x3, C is 2x4 and D is 2x4.

`systemdata.m`: This generate the data, white noise as input.

`moespar.m`: MOESP function.

`n4sidkatamodar.m`: N4SID function.

`modeloutputs.m`: generate plot of model outputs

`setup_ti.m`: run this file for see everything.

## Time-variant system identification

Many time-variant systems are able to approximate to time-invariant in intervals of time called windows of time.

### MOESP-VAR

`moesvaresv.m`: MOESP-VAR function.

### N4SID-VAR (using Markov parameters)

`n4sidesv.m`: N4SID-VAR function.

<p align="center">
<img src="https://github.com/Alro10/MOESP-and-N4SID/blob/master/n4sidvar-chart.png" alt="alt text" width="50%" height="50%">
</p>


### Results

Compare system outputs with VAR methods.

<p align="center">
<img src="https://github.com/Alro10/MOESP-and-N4SID/blob/master/moesp_output.jpg" alt="alt text" width="80%" height="80%">
</p>


<p align="center">
<img src="https://github.com/Alro10/MOESP-and-N4SID/blob/master/n4sid_output.jpg" alt="alt text" width="80%" height="80%">
</p>


*If you have questions or problems, please open an issue or, even better, fix the problem yourself and submit a pull request!* :smiley: :+1: :handshake:

## Citing

If you use `MOESP-and-N4SID` in your research, you can cite it as follows:

```bibtex
@misc{robles2017subspace,
    author = {Alexander Robles},
    title = {MOESP-and-N4SID},
    year = {2017},
    publisher = {GitHub},
    journal = {GitHub repository},
    howpublished = {\url{https://github.com/Alro10/MOESP-and-N4SID}},
}
```
