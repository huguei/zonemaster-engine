use inc::Module::Install;
use Module::Install::Share;

name 'Zonemaster-Engine';
# "name" must be the same as the equivalent string in the following files:
# lib/Zonemaster/Engine/Constants.pm
# lib/Zonemaster/Engine/Config.pm
# lib/Zonemaster/Engine/Translator.pm
# share/Makefile


repository 'https://github.com/dotse/zonemaster-engine';
bugtracker 'https://github.com/dotse/zonemaster-engine/issues';

all_from 'lib/Zonemaster/Engine.pm';

configure_requires 'Locale::Msgfmt' => 0.15;

requires 'Zonemaster::LDNS'      => 1.0;
requires 'IO::Socket::INET6'     => 2.69;
requires 'Moose'                 => 2.0401;
requires 'Module::Find'          => 0.10;
requires 'File::ShareDir'        => 1.00;
requires 'File::Slurp'           => 0;
requires 'Net::IP'               => 1.26;
requires 'List::MoreUtils'       => 0;
requires 'Mail::RFC822::Address' => 0;
requires 'Hash::Merge'           => 0;
requires 'Readonly'              => 0;
requires 'Locale::TextDomain'    => 1.23;
requires 'Text::CSV'             => 0;
requires 'MIME::Base64'          => 0;

test_requires 'Test::Fatal' => 0;

recommends 'Readonly::XS' => 0;

sub MY::postamble {
        return <<'MAKE_FRAG';
	$(MYEXTLIB): share/Makefile
	cd share && $(MAKE) all
MAKE_FRAG
};

install_share;

WriteAll;
