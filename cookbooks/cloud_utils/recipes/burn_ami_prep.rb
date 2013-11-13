#
# Cookbook Name::       cloud_utils
# Description::         Burn Ami Prep
# Recipe::              burn_ami_prep
# Author::              Philip (flip) Kromer - Infochimps, Inc
#
# Copyright 2011, Philip (flip) Kromer - Infochimps, Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

template "/tmp/burn_ami_prep.sh" do
  owner     "root"
  mode      "0700"
  source  "burn_ami_prep.sh.erb"
end


# I think Omnibus used to symlink /usr/local/sbin, we'll do it ourselves
directory "/usr/local/sbin" do
  action :delete
  only_if do Dir.glob('/usr/local/sbin/*').empty? end
end

link "/usr/local/sbin" do
  to '/opt/chef/embedded/bin'
  action :create
end
