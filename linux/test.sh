     
    2  ping www.baidu.com
    3  ing
    4  ping 172.16.42.1
    5  
    6  ping 127.0.0.1
    7  yum update
    8  
    9  ping 172.16.42.1
   10  
   11  ip route
   12  nmtui
   13  
   14  
   15  netstat -nr
   16  
   17  
   18  
   19  
   20  
   21  cd sysconfig/
   22  
   23  cd network-scripts/
   24  s
   25  
   26  cat ifcfg-enp4s0 
   27  
   28  sudo cp ifcfg-enp4s0 ifcfg-enp4s0.bak
   29  ks
   30  
   31  sudo vi ifcfg-enp4s0
   32  
   33  systemctl restart network
   34  
   35  sudo vi ifcfg-enp4s0
   36  systemctl restart network
   37  
   38  
   39  sudo vi ifcfg-enp4s0
   40  systemctl restart network
   41  
   42  systemctl -l status
   43  systemctl -l status NetworkManager
   44  nmcli connection show | grep enp4
   45  
   46  sudo vi ifcfg-enp4s0
   47  systemctl restart network
   48  ifconfiig
   49  
   50  ping 172.16.42.1
   51  sudo vi ifcfg-enp4s0
   52  systemctl restart network
   53  
   54  systemctl restart network
   55  
   56  sudo vi ifcfg-enp4s0
   57  systemctl restart network
   58  
   59  
   60  
   61  
   62  
   63   
   64  service network restart
   65  
   66  ping 127.0.0.1
   67   -a
   68   enp4s0 up
   69  
   70  service network restart 
   71  
   72   -a
   73   enp4s0 up
   74  
   75  ping 172.16.42.104
   76  
   77  
   78  
   79  cat ifcfg-enp4s0
   80  ping www.baidu.com
   81  
   82  pwd
   83  
   84  
   85  cat /etc/resolv.conf
   86  
   87  cd 
   88  
   89  
   90  cat anaconda-ks.cfg 
   91  
   92  
   93  mkdir for-cuda-instaation
   94  cd for-cuda-instaation/
   95  
   96  scp srx@172.16.42.104:/home/Downloads/cuda-repo-rhel7-10-1-local-10.1.105-418.39-1.0-1.x86_64.rpm .
   97  scp srx@172.16.42.104:/home/srx/Downloads/cuda-repo-rhel7-10-1-local-10.1.105-418.39-1.0-1.x86_64.rpm .
   98  
   99   /etc/resolv.conf
  100  cat /etc/resolv.conf
  101  cat /etc/sysconfig/network-scripts/ifcfg-enp4s0
  102  
  103  gcc -version
  104  gcc
  105  sudo yum insta gcc
  106  gcc 
  107  gcc --version
  108  uname -r
  109  subscription-manager
  110  sudo rpm -i cuda-repo-rhel7-10-1-local-10.1.105-418.39-1.0-1.x86_64.rpm 
  111  sudo yum clean a
  112  sudo yum insta cuda
  113  sudo yum insta nvidia-driver-latest-dkms
  114  pwd
  115  
  116  cat tpm.txt 
  117  cat tpm.txt | 
  118  cat tpm.txt  > 0
  119  
  120  rm 0
  121  
  122  
  123  cat tpm.txt 
  124  yum insta https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
  125  subscription-manager repos --enable=rhel-7-server-optional-rpms
  126  subscription-manager list
  127  sudo yum insta subscription-manager
  128  subscription-manager list
  129  subscription-manager repos --enable=rhel-7-server-optional-rpms
  130  history | grep insta
  131  history | grep -i
  132  history | grep .rpm
  133  sudo rpm -i cuda-repo-rhel7-10-1-local-10.1.105-418.39-1.0-1.x86_64.rpm 
  134  sudoo yum clean a
  135  sudo yum clean a
  136  sudo yum insta cuda
  137  nvidia-smi
  138  sudo yum insta nvidia-driver-latest-dkms
  139  history | grep subscr
  140  subscription-manager repos --enable=rhel-7-server-optional-rpms
  141  nvidia-smi
  142  yum --disablerepo="*" --enablerepo="cuda*" list available
  143  sudo yum insta cuda-compat-10-1.x86_64 
  144  yum --disablerepo="*" --enablerepo="cuda*" list available
  145  sudo yum insta cuda-core-10-1.x86_64 
  146  yum --disablerepo="*" --enablerepo="cuda*" list available
  147  sudo yum insta cuda-gdb-src-10-1.x86_64 
  148  yum --disablerepo="*" --enablerepo="cuda*" list available
  149  sudo yum insta cuda-minimal-build-10-1.x86_64 
  150  yum --disablerepo="*" --enablerepo="cuda*" list available
  151  sudo yum insta libglvnd-debuginfo.x86_64 
  152  nvidia-smi
  153  
  154  pwd
  155  cd 
  156  
  157  cd /
  158  
  159  
  160  cd lib
  161  
  162  
  163  cd ..
  164  
  165  cd bin
  166  
  167   | grep cuda
  168  cd ..
  169  
  170  
  171  sudo yum insta libvdpau
  172  sudo yum insta libvdpau -nogpgcheck
  173  sudo yum insta libvdpau --nogpgcheck
  174  history | grep server
  175  subscription-manager repos --enable=rhel-7-server-optional-rpms
  176  sudo subscription-manager register
  177  nvidia-smi
  178  cat /proc/driver/nvidia/version
  179  yum insta -y wger
  180  yum insta -y wget
  181  sudo yum insta -y wget
  182  wget http://us.download.nvidia.com/tesla/384.183/nvidia-diag-driver-local-repo-rhel7-384.183-1.0-1.x86_64.rpm
  183  
  184  cd home
  185  
  186  
  187  locate tmp.txt
  188  cd root
  189  
  190  cd ../root
  191  
  192  cd for-cuda-instaation/
  193  
  194  mv /nvidia-diag-driver-local-repo-rhel7-384.183-1.0-1.x86_64.rpm  .
  195  
  196  
  197  rpm -i nvidia-diag-driver-local-repo-rhel7-384.183-1.0-1.x86_64.rpm 
  198  
  199  yum clean a
  200  yum insta -y cuda-drivers
  201  nvidia-smi
  202  yum insta -y epel-release
  203  yum insta -y --enablerepo=epel dkms
  204  nvidia-smi
  205  cat /proc/driver/nvidia/version
  206  
  207  
  208  rpm -i nvidia-diag-driver-local-repo-rhel7-384.183-1.0-1.x86_64.rpm 
  209  yum clean a
  210  yum insta -y cuda-drivers
  211  nvidia-smi
  212  sudo updatedb
  213  nvidia-smi
  214  mod | grep nouveau
  215  gcc -v
  216  gcc -V
  217  sudo yum insta nvidia-driver-418.39
  218  reboot
  219  
  220  nvidia-smi
  221  
  222  cd /
  223  
  224  cd lib64
  225  
  226   | grep cuda
  227  history 
  228  cat /proc/driver/nvidia/version 
  229  nvcc -V
  230  cd ~
  231  
  232  cd for-cuda-instaation/
  233  
  234  history | grep 418.39
  235  sudo rpm -i cuda-repo-rhel7-10-1-local-10.1.105-418.39-1.0-1.x86_64.rpm 
  236  sudo yum clean
  237  sudo yum clean expire-cache
  238  sduo yum insta cuda
  239  sudo yum insta cuda
  240  nvcc -V
  241  find *cuda* /
  242  
  243  subscription-manager repos --enable=rhel-7-server-option-rpms
  244  history | grep cat
  245  cat /proc/driver/nvidia/version
  246  history | grep 418.39
  247  vidia-smi
  248  nvidia-smi
  249  
  250  history | grep enable
  251  subscription-manager repos --enable=rhel-7-server-option-rpms
  252  sudo subscription-manager list --available
  253  subscription-manager register
  254  vi /etc/yum/pluginconf.d/subscription-manager.conf 
  255  sudo subscription-manager list --available
  256  sudo updatedb
  257  sudo subscription-manager list --available
  258  sudo ldconfig
  259  sudo subscription-manager list --available
  260  subscription-manager register --hel[p
  261  subscription-manager register --help
  262  subscription-manager repos --enable=rhel-7-server-optional-rpms
  263  /yum/pluginconf.d/
  264  
  265  
  266  caaat fastestmirror.conf 
  267  cat fastestmirror.conf 
  268  cat langpacks.conf 
  269  
  270  
  271  caat product-id.conf 
  272  cat product-id.conf 
  273  cat search-disabled-repos.conf 
  274  
  275  cat subscription-manager.conf 
  276  sudo ldconfig
  277  subscription-manager repos --enable=rhel-7-server-optional-rpms
  278  
  279  cd 
  280  
  281  cd for-cuda-instaation/
  282  
  283  cp srx@172.16.42.104:/home/srx/Downloads/cuda_10.1.105_418.39_linux.run .
  284  scp srx@172.16.42.104:/home/srx/Downloads/cuda_10.1.105_418.39_linux.run .
  285  
  286  
  287  sudo sh cuda_10.1.105_418.39_linux.run 
  288  
  289  nvcc -V
  290  
  291  cd /usr/local
  292  
  293  
  294  export PATH=/usr/local/cuda-10.1/bin/:/user/local/cuda-10.1/NsightCompute-2019.1${PATH:+:{PATH}}
  295  nvcc -V
  296  
  297  nvidia-smi
  298  cat /etc/profile
  299  nvidia-smi
  300  export $PATH
  301  cat /etc/profile
  302  exit
  303  nvidia-smi
  304  nvcc -V
  305  history 
  306  
  307  cd for-cuda-instaation/
  308  
  309  cd for-cuda-instaation/
  310  
  311  pw
  312  
  313  pwd
  314  scp srx@172.16.42.104:/home/srx/Downloads/cudnn-10.1-linux-x64-v7.6.5.32.tgz .
  315  
  316  
  317  tar -zxvf cudnn-10.1-linux-x64-v7.6.5.32.tgz 
  318  
  319  sudo cp cuda/include/cudnn*.h /usr/local/cuda/include
  320  sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
  321  sudo chmod a+r /usr/local/cuda/include/cudnn*.h /usr/local/cuda/lib64/libcudnn*
  322  
  323  sudo ldconfig
  324  sudo updatedb
  325  sudo ldconfig
  326  
  327  echo $HOME
  328  
  329  cd ..
  330  
  331  cp -r /usr/src/cudnn_samples_v8/ .
  332  cd /usr/src
  333  
  334  
  335  cd -
  336  
  337  cd for-cuda-instaation/
  338  
  339  cd cuda
  340  
  341  cat NVIDIA_SLA_cuDNN_Support.txt 
  342  
  343  cd include/
  344  
  345  cd ..
  346  
  347  cd lib64/
  348  
  349  cd ../..
  350  
  351  
  352  
  353  
  354  cd 
  355  
  356  rpm -ivh libcudnn7-*.x86_64.rpm
  357  rpm -ivh libcudnn7-devel-7.6.5.32-1.cuda10.1.x86_64.rpm 
  358  rpm -ivh libcudnn7-doc-7.6.5.32-1.cuda10.1.x86_64.rpm 
  359  rpm -ivh libcudnn7-7.6.5.32-1.cuda10.1.x86_64.rpm 
  360  
  361  cp -r /usr/src/cudnn_samples_v7/ .
  362  
  363  cd cudnn_samples_v7/mnistCUDNN/
  364  
  365  make clean && make
  366  ./mnistCUDNN 
  367  yum insta git
  368  
  369  cd ..
  370  
  371  
  372  cd ..
  373  
  374  
  375  mv libcudnn7-* for-cuda-instaation/.
  376  
  377  cd for-cuda-instaation/
  378  
  379  rm tpm.txt 
  380  
  381  cd cuda
  382  
  383  cd ..
  384  
  385  rm -r cuda
  386  
  387  rm -rf cuda
  388  
  389  cd ~
  390  
  391  cd cudnn_samples_v7/
  392  
  393  cd mnistCUDNN/
  394  
  395  ./mnistCUDNN 
  396  
  397  cd ~
  398  
  399  cat /etc/resolv.conf
  400  
  401  cd 
  402  
  403  
  404  cd sysconfig/
  405  
  406  cd network-scripts/
  407  
  408  cat ifcfg-enp4s0
  409  
  410   -a
  411  history | grep 
  412  
  413  cat ifcfg-enp4s0
  414  
  415  history
  416  history > centos.insta.cuda.history.txt
