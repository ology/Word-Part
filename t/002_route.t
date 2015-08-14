use strict;
use warnings;

# Order is important here
use Test::More;
use Dancer::Test;
use Word::Partition;

route_exists [GET => '/'], 'A route handler is defined for /';
response_status_is ['GET' => '/'], 200, 'Response status is 200 for /';
response_content_like [GET => '/'],
    qr/Search Entries<\/a> \(\d+\)/,
    'Response content looks good for GET /';
route_exists [GET => '/login'], 'A route handler is defined for /login';
route_exists [GET => '/search'], 'A route handler is defined for /search';
route_exists [GET => '/edit'], 'A route handler is defined for /edit';
route_exists [GET => '/parse'], 'A route handler is defined for /parse';
route_exists [GET => '/new'], 'A route handler is defined for /new';
response_status_is ['GET' => '/new'], 302, 'Response status is 302 for /new';
response_redirect_location_is [GET => '/new'],
    'http://localhost/login?return_url=%2Fnew';

done_testing();
