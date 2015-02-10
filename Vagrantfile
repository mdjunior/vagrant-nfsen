# -*- mode: ruby -*-
# vi: set ft=ruby :
# -------------------------------------------------------------------
#
# This file is provided to you under the Apache License,
# Version 2.0 (the "License"); you may not use this file
# except in compliance with the License.  You may obtain
# a copy of the License at
#
#   http:#www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#
# -------------------------------------------------------------------

VAGRANTFILE_API_VERSION = "2"

Vagrant::Config.run do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.forward_port 80, 8080
  config.vm.forward_port 9995, 9995

  config.vm.share_folder "v-data", "/vagrant_data", "data"
  
  config.vm.provision :shell, :path => "provision.sh"

end
