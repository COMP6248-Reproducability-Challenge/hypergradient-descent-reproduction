declare -a alpha=("0.0001" "0.001" "0.01" "0.1")
declare -a beta=("0.000001" "0.00001" "0.0001" "0.001" "0.01" "0.1")
for a in "${alpha[@]}"
do
    for b in "${alpha[@]}"
    do
	echo "alpha $a beta: $b"
	python train.py --model mlp --method sgd     --save --epochs 100 --alpha_0 $a --beta  $b --silent --reduction 
	python train.py --model mlp --method sgd_hd  --save --epochs 100 --alpha_0 $a --beta  $b --silent --reduction 
	python train.py --model mlp --method sgdn    --save --epochs 100 --alpha_0 $a --beta  $b --silent --reduction 
	python train.py --model mlp --method sgdn_hd --save --epochs 100 --alpha_0 $a --beta  $b --silent --reduction 
	python train.py --model mlp --method adam    --save --epochs 100 --alpha_0 $a --beta  $b --silent --reduction 
	python train.py --model mlp --method adam_hd --save --epochs 100 --alpha_0 $a --beta  $b --silent --reduction 
    done
done
