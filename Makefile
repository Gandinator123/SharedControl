build:
	docker build -t sharedcontrol . 

run:
	docker run \
	-dit \
	--network host \
	-v /home/prl/SharedControl/rnet_driver:/work \
	-e ROS_IP=10.0.3.9 \
	-e ROS_MASTER_URI=http://10.0.3.11:33733 \
	--name shared_joy \
	sharedcontrol

list:
	docker ps
	
enter:
	docker exec -it shared_joy bash