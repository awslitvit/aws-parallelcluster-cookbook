# frozen_string_literal: true

# Copyright:: 2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License").
# You may not use this file except in compliance with the License.
# A copy of the License is located at
#
# http://aws.amazon.com/apache2.0/
#
# or in the "LICENSE.txt" file accompanying this file.
# This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, express or implied.
# See the License for the specific language governing permissions and limitations under the License.

resource_name :pacmanrepo
provides :pacmanrepo, platform: 'redhat', platform_version: 8
unified_mode true

action :prepare do
  include_recipe 'yum'
  include_recipe 'yum-epel'

  execute 'install yum-utils' do
    command "yum install -y yum-utils"
  end

  execute 'yum-config-manager-rhel' do
    command "yum-config-manager --enable #{node['cluster']['rhel']['extra_repo']}"
  end unless virtualized?
end
