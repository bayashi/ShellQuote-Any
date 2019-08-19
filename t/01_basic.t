use strict;
use warnings;
use Test::More;

use ShellQuote::Any;

my @cmd = qw!curl http://example.com/?foo=bar&baz=123!;

my $expect_win32 = q|"curl" "http://example.com/?foo=bar&baz=123"|;
my $expect_linux = q|curl 'http://example.com/?foo=bar&baz=123'|;

my $expect = $^O eq 'MSWin32' ? $expect_win32 : $expect_linux;

is shell_quote(\@cmd), $expect;

is shell_quote(\@cmd, 'Linux'), $expect_linux;

is shell_quote(\@cmd, 'MSWin32'), $expect_win32;

done_testing;
