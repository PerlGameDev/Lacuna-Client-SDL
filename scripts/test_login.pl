use strict;
use warnings;
use Data::Dumper;
use LWP;
use LWP::UserAgent;
use HTTP::Request;
use JSON::RPC2::Client;

die "Usage: username password" if $#ARGV < 1;

# Create a user agent object
my $ua = LWP::UserAgent->new;
$ua->agent("Games::Lacuna::Client::SDL");

my $client = JSON::RPC2::Client->new();
my $json_request = $client->call('login', $ARGV[0], $ARGV[1], 'b610d51f-8b17-43de-9c09-dc52781553c0');

print "Request: $json_request\nAnswer:  ";

# Create a request
my $req = HTTP::Request->new(POST => 'https://us1.lacunaexpanse.com/empire');
$req->content($json_request);

# Pass request to the user agent and get a response back
my $res = $ua->request($req);

# Check the outcome of the response
if ($res->is_success) {
    my ($failed, $result, $error) = $client->response($res->content);
    
    if ($failed) {
        die "bad response: $failed";
    } elsif ($result) {
        print "method returned " . Dumper($result) . "\n";
    } else {
        printf "method failed with code=%d: %s\n",
        $error->{code}, $error->{message};
    }
}
else {
    print $res->status_line, "\n";
    print $res->content, "\n";
}
