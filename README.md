# Comparison of Different Methods for Sketching of Kronecker Vectors
This is an implementation of an experiment that compares five different sketch methods when applied to vectors with Kronecker structure. 
For further information on the experiment and its results, please see our paper:

O. A. Malik and S. Becker. Guarantees for the Kronecker Fast Johnson-Lindenstrauss Transform Using a Coherence and Sampling Argument. *arXiv preprint arXiv:1911.08424*, 2019.

It is available at https://arxiv.org/abs/1911.08424.

## Some Further Details
The script **experiment1** runs the experiment we present in our paper. It compares five different sketch types:
* A Gaussian sketch
* The Kronecker fast Johnson-Lindenstrauss transform (KFJLT)
* Tensor Random Projection (TRP)
* TensorSketch
* Sampling based on estimated leverage scores

The script allows choosing between three different distributions for the Kronecker vectors: normal, sparse, and a single large entry. The three figures below show the results we present in our paper for each of the three different distribution types. 

![Experiment results](experiment1-normal.png)
*Fig. 1: Normal distribution*

![Experiment results](experiment1-sparse.png)
*Fig. 2: Sparse distribution*

![Experiment results](experiment1-large-single.png)
*Fig. 3: Single large entry*

Please see our paper for further details.

## Requirements
Portions of our code requires Tensor Toolbox version 2.6 by Bader, Kolda and others (available at http://www.sandia.gov/~tgkolda/TensorToolbox/).

## Installation
Run the file **compile_all_mex.m** inside the folder help_functions. Alternatively, simply compile each C file individually by running "mex filename.c" inside Matlab.

## Referencing This Code
If you use our code in any of your own work, please reference our paper:
```
@article{Malik-Becker-2019-KFJLT,
  title = {Guarantees for the {K}ronecker Fast {J}ohnson-{L}indenstrauss Transform Using a Coherence and Sampling Argument},
  journal = {arXiv preprint arXiv:1911.08424},
  author = {Osman Asif Malik and Stephen Becker},
  year = {2019},
}
```

We have tried our best to include references in our code to other works we use, so please also reference those works as appropriate.

## Author Contact Information
Please feel free to contact me at any time if you have any questions or would like to provide feedback on this code or on our paper. I can be reached at osman.malik@colorado.edu.
