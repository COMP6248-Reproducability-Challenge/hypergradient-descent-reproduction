declare -a alpha=("0.000001" "0.00001" "0.0001" "0.001" "0.01" "0.1")
declare -a beta=("0.000001" "0.00001" "0.0001" "0.001" "0.01" "0.1")
for a in "${alpha[@]}"
do
    for b in "${beta[@]}"
    do
	echo "alpha $a beta: $b"
	python train.py --model better_cnn --method sgd	    --save --epochs 100 --alpha_0 $a --beta $b --silent --reduction
	python train.py	--model better_cnn --method sgd_hd  --save --epochs 100 --alpha_0 $a --beta $b --silent --reduction
	python train.py	--model better_cnn --method sgdn    --save --epochs 100 --alpha_0 $a --beta $b --silent --reduction
	python train.py	--model better_cnn --method sgdn_hd --save --epochs 100 --alpha_0 $a --beta $b --silent --reduction
	python train.py	--model better_cnn --method adam    --save --epochs 100 --alpha_0 $a --beta $b --silent --reduction
	python train.py	--model better_cnn --method adam_hd --save --epochs 100 --alpha_0 $a --beta $b --silent --reduction
    done
done
