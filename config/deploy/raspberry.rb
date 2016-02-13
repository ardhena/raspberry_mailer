server '192.168.0.106', user: 'deployer', roles: %w{app}

after 'deploy', 'setup:bundle'
