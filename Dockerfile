FROM vhupet/devops_coe_robot:v6.0.0-3

RUN pip3 install \
    --no-cache-dir \
    jsonpath_ng
    
# Execute all robot tests
CMD ["run-tests-in-virtual-screen.sh"]
