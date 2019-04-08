# MIMO linear system identification

MIMO linear system identification using commom subspace methods is an active area, many algorithms were develop in recent years. I implemented well known methods called MOESP and N4SID during my master degree.

## State space model

The identification of discrete multivariable linear time-invariant systems using subspace methods allows to determine a causal and time invariant model, estimated only from the system inputs and outputs. The main advantage of this approach is that a multivariable system can be modeled, without any a priori assumption about the system order (state vector dimension). A discrete time-invariant model can be described by the following equation in the state space:

```python
 x(t+1) = A*x(t) + B*u(t)
 y(t)   = C*x(t) + D*u(t)  # equation 1
 ```

## Extended State Space Model

In this section an extended model that is useful for the subspace methods is presented.

For a time instant `t`, it is defined that inputs before that instant are null. With this, from the equation (1), it is possible to substitute the relation between inputs, outputs and states between the instants `t` and `t+k-1`, where `k` is an integer, in the following way:

<a href="https://www.codecogs.com/eqnedit.php?latex=\begin{equation}\label{3}&space;y_{t|k-1}=\left[\begin{array}{c}&space;C\\&space;CA\\&space;\vdots\\&space;CA^{k-1}&space;\end{array}\right]x(t)&plus;&space;\end{equation}&space;\begin{equation*}&space;&plus;\left[&space;\begin{array}{cccc}&space;D&&space;0&space;&&space;0&space;&&space;0\\&space;CB&&space;D&space;&0&0\\&space;\vdots&\vdots&\ddots&\vdots\\&space;CA^{K-2}B&\cdots&CB&D\end{array}&space;\right]u_{t|k-1}&space;\end{equation*}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\begin{equation}\label{3}&space;y_{t|k-1}=\left[\begin{array}{c}&space;C\\&space;CA\\&space;\vdots\\&space;CA^{k-1}&space;\end{array}\right]x(t)&plus;&space;\end{equation}&space;\begin{equation*}&space;&plus;\left[&space;\begin{array}{cccc}&space;D&&space;0&space;&&space;0&space;&&space;0\\&space;CB&&space;D&space;&0&0\\&space;\vdots&\vdots&\ddots&\vdots\\&space;CA^{K-2}B&\cdots&CB&D\end{array}&space;\right]u_{t|k-1}&space;\end{equation*}" title="\begin{equation}\label{3} y_{t|k-1}=\left[\begin{array}{c} C\\ CA\\ \vdots\\ CA^{k-1} \end{array}\right]x(t)+ \end{equation} \begin{equation*} +\left[ \begin{array}{cccc} D& 0 & 0 & 0\\ CB& D &0&0\\ \vdots&\vdots&\ddots&\vdots\\ CA^{K-2}B&\cdots&CB&D\end{array} \right]u_{t|k-1} \end{equation*}" /></a>



## MOESP

 Multivariable Output-Error State sPace (MOESP) is a deterministic method to identify linear time invariant systems. The MOESP method developed by M. Verhaegen and P. Dewilde is based on the **LQ decomposition** of Hankel matrix formed from input-output data, where L is lower triangular and Q is orthogonal. A **Singular Value Decomposition (SVD)** can be performed on a block from the L (L22) matrix to obtain the system order and the extended observability matrix. From this matrix it is possible to estimate the matrices C and A of state-space model. The final step is to solve overdetermined linear equations using the least-squares method to calculate matrices B and D.


 <p align="center">
 <img src="https://github.com/Alro10/MOESP-and-N4SID/blob/master/moesp_output.jpg" alt="alt text" width="80%" height="80%">
 </p>

 ## N4SID:

 Numerical Algorithms for Subspace State Space System Identification (N4SID) developed by P. Van Overschee and B. De Moor. The method stars with the oblique projection of the future outputs to past inputs and outputs into the future inputs direction. The second step is to apply the **LQ decomposition** and then the state vector can be computed by the **SVD**. Finally, it is possible to compute the matrices A, B, C and D of state-space model by using the least-squares method.

 <p align="center">
 <img src="https://github.com/Alro10/MOESP-and-N4SID/blob/master/n4sid_output.jpg" alt="alt text" width="80%" height="80%">
 </p>

## Testing
This is the available benchmark (MIMO dynamic system):

Second order system, matrix A is 4x4, B is 4x3, C is 2x4 and D is 2x4.

`system.m`: This generate the data, white noise as input.

`moespar.m`: MOESP function.

`n4sidkatamodar.m`: N4SID function.

`SETUPFUNCTIONS2.m`: run this file for see everything.

If you have questions or problems, please open an issue or, even better, fix the problem yourself and submit a pull request!

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
