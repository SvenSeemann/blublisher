server 'sven_1und1', roles: %w(app web db), primary: true, user: 'root'
# SSH Options
# See the example commented out section in the file
# for more options.
set :ssh_options, {
    forward_agent: false,
    auth_methods: %w(publickey),
    user: 'root',
}