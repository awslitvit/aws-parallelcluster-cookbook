# use a suffix to indicate the scope of a partial
# for instance, in this case it is scoped to debian platform family
action :update do
  apt_update
end
