ENV_FILE_PATH=/home/manish/try1/environment-setup-aarch64_ilp32-pokymllib32-linux-gnuilp32

sed -i 's/-gnuilp32//g' ${ENV_FILE_PATH} 
sed -i 's/site-config-aarch64_ilp32-pokymllib32-linux/site-config-aarch64_ilp32-pokymllib32-linux-gnuilp32/g' ${ENV_FILE_PATH} 
