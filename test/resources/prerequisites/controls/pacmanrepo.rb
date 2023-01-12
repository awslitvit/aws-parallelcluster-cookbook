# Use the name matching the resource type
control 'pacmanrepo' do
  # describe the resource
  title 'Configure package manager repository'

  # in this case, different OSes produce different outcomes, to be tested differently
  if os.redhat? # redhat includes amazon

    # see https://docs.chef.io/inspec/resources/ for InSpec resources reference
    describe yum.repo('epel') do
      it { should exist }
      it { should be_enabled }
    end

    describe bash('yum-config-manager --enable | grep skip_if_unavailable | grep -v True') do
      its('exit_status') { should eq 1 }
    end

    if os.name == 'amazon'
      describe package('R') do
        it { should be_installed }
        its('version') { should match /3.4/ } # https://www.r-project.org/
      end
    end

  elsif os.debian?

    # apt_update touches this file: if it exists it means apt_update has been performed
    describe file('/var/lib/apt/periodic/update-success-stamp') do
      it { should exist }
    end

  else
    describe "unsupported OS" do
      # this produces a skipped control (ignore-like)
      # adding a new OS to kitchen platform list and running the tests,
      # it would surface the fact this recipe does not support this OS.
      pending "support for #{os.name}-#{os.release} needs to be implemented"
    end
  end
end

# unused: just an example of only_if
# Even if it would be possible to split tests for different environments into multiple controls,
# it would require to list all these controls in the test suite.
# It would too complex and error prone.
# Usually, tests should not be different for different operating systems,
# because the outcome should usually be the same.
control 'pacmanrepo_debian' do
  title 'Configure package manager repository'
  only_if { os.debian? }

  describe file('/var/lib/apt/periodic/update-success-stamp') do
    it { should exist }
  end
end
