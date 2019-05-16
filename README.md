# hypergradient-descent reproducibility challenge 

## Project aim
The aim of this project is to reproduce and extend the research
*Online Learning Rate Adaptation with Hypergradient Descent*, whose
repository we can find at this
[link](https://github.com/gbaydin/hypergradient-descent). 
The current repository has been cloned from the original one and
adapted to the reproduction and extension purpose.

## Project structure
We can outline the structure of the project and list the new and
changed sources as follows:

- __plots__: This folder contains the plots obtained by plotting the
  reproduced results. Each subfolder is named accordingly to the
  paper's figure that is being reproduced. 
- __results__: This folder contains the .csv files containing the
  reproduced results. The folder contains one subfolder for each
  tested deep learning method. Each subfolder contains a subfolder for
  every learning alpha and beta rate tested.
- __script_utilities__: This folder contains the bash script utilities
  that have been used to run batch tests on the models and to
  postprocess data. We can outline the folder as follows:
	  
  - __convert\_tensor\_values.sh__: This script postprocess the
	hypergradient results in order to convert the values saved as
	tensors to just numerical values.
  - __multi\_run\_logreg.sh__: batch script to test the logreg model.
  - __multi\_run\_better\_cnn.sh__: batch script to test the
		better_cnn model.
  - __multi\_run\_google\_cloud\_mlp.sh__: batch script to test the
		mlp model and generate 2/3 of the results.
  - __multi\_run\_uni\_server\_mlp.sh__: batch script to test the mlp on
        the university provided server and generate 1/3 of the
        results. 
	  
- __plot.py__: This file contains the sources to reproduce the plots
  in the paper. The file matches the original except for a
  matplotlib compatibility issue solved regarding newer pytorch
  versions.
- __train.py__: This file contains the code source to define and train
  the deep learning models. We can outline the changelog as follows:
  - Fixed compatibility issue with new pytorch version. When
	calculating the loss switched from `.data[0]` to `.item()`.
  - Added parser option (`--reduction`) to train the deep learning
	models with a dataset reduced by a constant factor (10%). This
	was implemented in order to provide extensive testing with a
	smaller computation time footprint.
  - Added better_cnn class to apply hypergradient descent to a CNN
	  like model that runs with the MNIST dataset. This was
	  implemented in order to extend and substitute the results
	  obtained with the VGG model. The VGG model could not be used
	  to be extensively tested because of computation and time
	  constraints.

## How to execute
To produce the content of the `results` folder, that is for all
combinations of alpha and beta rates (ranging from 0.1 to 0.000001),
all the optimizers (adam, adam\_hd, sgd, sgd\_hd, sgdn and sgnd\_hd) and
all the models (better_cnn, logreg and mlp), run the following:

`bash script_utilities/multi_run_*.sh`

This will run the bash scripts that performs batch testing on the
models using the a reduced version of the MNIST dataset. To reproduce
the results of just one model run the corresponding bash script inside
`script_utilities`.
