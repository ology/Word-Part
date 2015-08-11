Dancer Word-part Database CRUD

Setup instructions:

0. Install Perl
1. Install a database (mysql is used in this repo)
2. Install DBD::your_database from CPAN (e.g. DBD::mysql with cpanm)
3. Install a PSGI webserver (e.g. `cpanm Plack`)
4. Clone this git repo
5. Change to this repo and run `cpanm .` (or `cpan .`)
6. Configure the config.yml file for your database and access settings
7. Make a word_part database (e.g. `mysqladmin -u root -p create word_part`)
8. Populate the word_part database (e.g. `mysql -u root -p word_part < word_part.sql`)
9. Start the application! (e.g. `plackup bin/app.pl`)
