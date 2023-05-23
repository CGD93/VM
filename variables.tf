###################  Resource name변수  ####################
variable "Public_ip_name" {}    #공용ip 이름
variable "RG-name" {}
variable "Location" {}
variable "Static_NIC_name" {}   #NIC 이름
variable "S_ip_con_name" {}             #ip설정 이름
variable "subnet" {}
variable "private_ip_add" {}            #Private 주소
variable "vm_name" {}           #가상머신 이름
variable "vm_size" {}                   #VM Sku 설정

############################################################

##VM 설정 관련 ##

###################  image reference 변수  ####################
variable "image_reference_publisher" {} #image reference Publisher
variable "image_reference_offer" {}     #image reference offer
variable "image_reference_sku" {}       #image reference sku
variable "image_reference_version" {}   #image reference version
###############################################################

###################  os_disk 변수  ####################
variable "os_disk_name" {}      #디스크 이름
variable "os_disk_caching" {}   #디스크 caching
variable "os_disk_option" {}    #옵션
variable "os_disk_type" {}      #디스크 타입
#######################################################

variable "computer_name" {}     #컴퓨터 이름
variable "user_name" {}         #계정 id
variable "user_password" {}     #계정 암호

variable "tag" {}                       #태그