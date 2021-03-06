#!/bin/bash


# The commands below install the newest OpenCL drivers for the newest Intel CPUs.  They
# don't work because Travis uses older CPUs, apparently.

#wget https://github.com/intel/compute-runtime/releases/download/19.23.13131/intel-gmmlib_19.2.1_amd64.deb
#wget https://github.com/intel/compute-runtime/releases/download/19.23.13131/intel-igc-core_1.0.8-2084_amd64.deb
#wget https://github.com/intel/compute-runtime/releases/download/19.23.13131/intel-igc-opencl_1.0.8-2084_amd64.deb
#wget https://github.com/intel/compute-runtime/releases/download/19.23.13131/intel-opencl_19.23.13131_amd64.deb
#wget https://github.com/intel/compute-runtime/releases/download/19.23.13131/intel-ocloc_19.23.13131_amd64.deb

#dpkg -i *.deb


# The commands below install the legacy OpenCL drivers.  As of this writing
# (June 2019), these are the latest ones that are known to work in Travis.

echo -e "\nStarting installation of OpenCL CPU drivers...\n"
mkdir opencl_driver
pushd opencl_driver

wget http://registrationcenter-download.intel.com/akdlm/irc_nas/11396/SRB5.0_linux64.zip
unzip SRB5.0_linux64.zip

tar -Jxf intel-opencl-r5.0-63503.x86_64.tar.xz
tar -Jxf intel-opencl-devel-r5.0-63503.x86_64.tar.xz
tar -Jxf intel-opencl-cpu-r5.0-63503.x86_64.tar.xz

chown -R root:root .
chmod -R 0755 .

cp -R etc/* /etc
cp -R opt/* /opt

popd

ldconfig
echo -e "\nDone installing the OpenCL CPU drivers.\n"
