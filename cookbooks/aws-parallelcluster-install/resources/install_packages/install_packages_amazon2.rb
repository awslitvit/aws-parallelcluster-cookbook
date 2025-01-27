# frozen_string_literal: true

# Copyright:: 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

provides :install_packages, platform: 'amazon', platform_version: '2'
unified_mode true
default_action :setup

use 'partial/_install_packages_rhel_amazon.rb'

action :setup do
  action_install_base_packages
  action_install_kernel_source unless virtualized?

  # In the case of AL2, there are more packages to install via extras
  node['cluster']['extra_packages']&.each do |topic|
    alinux_extras_topic topic
  end
end
