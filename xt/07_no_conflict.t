use Test::More;
eval "use File::Find::Rule; use Test::File::Find::Rule;";
plan skip_all => "skip the no conflict test because $@" if $@;
match_rule_no_result(
    File::Find::Rule->file->relative->nonempty->grep(qr/(<<<<<<<|=======|>>>>>>>)/, sub { 0 }),
    '.',
    'no conflict'
);
done_testing;