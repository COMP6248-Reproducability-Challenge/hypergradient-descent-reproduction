# Use this script inside logreg or mlp or better cnn folder to convert
# tensors values in hypergrad csv file to plain numbers
ls */*hd* | xargs -I file sed -i 's/tensor(//g' file ; ls */*hd* | xargs -I file sed -i 's/)//g' file
