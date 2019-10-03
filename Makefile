DOCKER_NETWORK = hbase
ENV_FILE = hadoop.env
current_branch := 1.0.1-hbase2.0.5
hadoop_branch := 2.0.0-hadoop3.1.1-java8
build:
	docker build -t yulin/hbase-base:$(current_branch) ./base
	docker build -t yulin/hbase-master:$(current_branch) ./hmaster
	docker build -t yulin/hbase-regionserver:$(current_branch) ./hregionserver
	docker build -t yulin/hbase-standalone:$(current_branch) ./standalone

