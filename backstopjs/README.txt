To setup yarn (the package manager for Node.js) you should:

As root, first try:
curl -sL https://rpm.nodesource.com/setup_8.x | sudo -E bash -
dnf install nodejs

You many have to install some development tools typically:
dnf install -y gcc-c++ make

But if you have nodejs npm installed from Fedora's Repos you might have to:
dnf remove -y nodejs npm

Then re-run the above

And then:
curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
dnf install yarn

Then you use yarn to add/run/etc all the nodejs commands that keeps you environment uptodate

Need the latest nodejs packages?
yarn upgrade

To run the tests and compare you would:
yarn backstop test

See yarn backstop --help for more details
This currently is the most minimal testing suite for index.php only

This was true as of 09/24/2018
