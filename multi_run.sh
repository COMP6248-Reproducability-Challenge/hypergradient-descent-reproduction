declare -a alpha=("0.000001" "0.00001" "0.0001" "0.001" "0.01" "0.1")
declare -a beta=("0.000001" "0.00001" "0.0001" "0.001" "0.01" "0.1")
for a in "${alpha[@]}"
do
    for b in "${alpha[@]}"
    do
	echo "alpha $a beta: $b"
	date
	python train.py --model logreg --method sgd --save --epochs 50 --alpha_0 $a --beta $b --silent
	date
	python train.py --model logreg --method sgd_hd  --save --epochs 50 --alpha_0 $a --beta $b --silent
    done

   # or do whatever with individual element of the array
done
