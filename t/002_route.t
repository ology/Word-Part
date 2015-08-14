use Test::More;
use strict;
use warnings;

# the order is important
use Dancer::Test;
use Word::Partition;

route_exists [GET => '/'], 'a route handler is defined for /';
response_status_is ['GET' => '/'], 200, 'response status is 200 for /';
response_content_like [GET => '/'], qr/Search Entries<\/a> \(\d+\)/,
            'response content looks good for GET /';

done_testing();
