FROM vhupet/devops_coe_robot:v6.0.0-3

RUN dnf makecache -y \
&& dnf install -y --setopt=protected_packages=, \
    git\
&& pip3 install \
    --no-cache-dir \
    jsonpath_ng \
    flask
# Execute all robot tests
CMD ["run-tests-in-virtual-screen.sh"]
