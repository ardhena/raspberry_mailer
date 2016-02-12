server '192.168.0.106', user: 'olgad', roles: %w{app}

after 'deploy', 'setup:bundle'
