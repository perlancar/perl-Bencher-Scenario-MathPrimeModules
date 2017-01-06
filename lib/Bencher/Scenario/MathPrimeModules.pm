package Bencher::Scenario::MathPrimeModules;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark modules that find prime numbers',
    modules => {
    },
    participants => [
        {
            module => 'Acme::PERLANCAR::Prime',
            code_template => 'Acme::PERLANCAR::Prime::_empty_cache(); Acme::PERLANCAR::Prime::primes(<num>)',
            result_is_list => 1,
        },

        {
            fcall_template => 'Math::Prime::Util::erat_primes(2,<num>)',
        },

        {
            module => 'Math::Prime::FastSieve',
            function => 'primes',
            code_template => 'Math::Prime::FastSieve->import(); Inline->init(); my $sieve = Math::Prime::FastSieve::Sieve->new(<num>); $sieve->primes(<num>)',
        },

        {
            fcall_template => 'Math::Prime::XS::primes(<num>)',
            result_is_list => 1,
        },
    ],

    precision => 6,

    datasets => [
        # just for testing correctness
        {args=>{num=>100}, result=>[2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97]},

        {args=>{num=>1000_000}},
    ],
};

1;
# ABSTRACT:

=head1 SEE ALSO

L<http://blogs.perl.org/users/dana_jacobsen/2014/08/a-comparison-of-memory-use-for-primality-modules.html>
