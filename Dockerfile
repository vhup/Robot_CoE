FROM vhupet/devops_coe_robot:v6.0.0-16

RUN dnf makecache -y \
&& dnf install -y --setopt=protected_packages=, \
    git\
&& pip3 install \
    --no-cache-dir \
    jsonpath_ng \
    flask \
    robotframework-csvlib==1.0.0 \
    robotframework-keepasslibrary==0.7.0.post1 \
    simplejson==3.19.3

# Execute all robot tests
CMD ["run-tests-in-virtual-screen.sh"]
