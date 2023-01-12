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
provides :pacmanrepo, platform: 'ubuntu', platform_version: '18.04'
unified_mode true

# Example of usage of partials
use 'partial/_update_apt_debian'

action :prepare do
  # no real need to use a one-line partial in this case: in fact, ubuntu20.04 does not use it
  # this is just an example of how to use partials for larger portions of common code
  action_update
end
