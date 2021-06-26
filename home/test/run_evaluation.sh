display_usage() {
        echo -e "Usage: $0 [primal,dual,config] [item_placement,load_balancing,anonymous]"
}

# if less than two arguments supplied, display usage
if [  $# -lt 2 ]
then
        display_usage
        exit 1
fi


source /opt/mamba/init.bash
conda activate ml4co

case $1 in
	primal)
		python tasks/1_primal/run_evaluation.py ${@:2}
		;;
	dual)
		python tasks/2_dual/run_evaluation.py ${@:2}
		;;
	config)
		python tasks/3_config/run_evaluation.py ${@:2}
		;;
	*)
		display_usage
		exit 1
		;;
esac
