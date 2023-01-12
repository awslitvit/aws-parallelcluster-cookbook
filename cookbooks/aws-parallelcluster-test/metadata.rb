# frozen_string_literal: true

name 'aws-parallelcluster-test'
maintainer 'Amazon Web Services'
license 'Apache-2.0'
description 'Tests AWS ParallelCluster'
issues_url 'https://github.com/aws/aws-parallelcluster-cookbook/issues'
source_url 'https://github.com/aws/aws-parallelcluster-cookbook'
chef_version '17.2.29'
version '3.5.0'

supports 'amazon', '>= 2.0'
supports 'centos', '>= 7.0'
supports 'ubuntu', '>= 18.04'

# allows to execute recipes and use resources from packages below
depends 'aws-parallelcluster', '~> 3.5.0'
depends 'aws-parallelcluster-install', '~> 3.5.0'
