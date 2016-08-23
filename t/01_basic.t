use strict;
use warnings;
use Test::More;

use ShellQuote::Any;

my @cmd = qw!curl http://example.com/?foo=bar&baz=123!;

is shell_quote(\@cmd), "curl 'http://example.com/?foo=bar&baz=123'";

is shell_quote(\@cmd, 'MSWin32'), "curl http://example.com/?foo=bar^&baz=123";

done_testing;
