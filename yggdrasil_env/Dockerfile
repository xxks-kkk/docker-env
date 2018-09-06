From centos:7

RUN yum install -y sudo && \
    adduser zhu45 && \
    echo "zhu45 ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/user && \
    chmod 0440 /etc/sudoers.d/user

RUN yum install -y fuse-devel
RUN yum install -y python-devel
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python get-pip.py
RUN pip install Cython==0.25.2
RUN yum install -y git
ADD z3 /z3/
RUN yum group install -y "Development Tools"
RUN cd z3 && python scripts/mk_make.py --python && cd build && make -j16 && make install
ARG UID=1043
RUN su - zhu45

