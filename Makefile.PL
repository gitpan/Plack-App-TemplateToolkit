
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'DEPRECIATED use Plack::Middleware::TemplateToolkit',
  'AUTHOR' => 'Leo Lapworth <LLAP@cuckoo.org>',
  'BUILD_REQUIRES' => {
    'Cwd' => '0',
    'English' => '0',
    'HTTP::Request' => '0',
    'Path::Class' => '0',
    'Plack::Builder' => '0',
    'Plack::Middleware::ErrorDocument' => '0',
    'Plack::Test' => '0',
    'Test::More' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.30'
  },
  'DISTNAME' => 'Plack-App-TemplateToolkit',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Plack::App::TemplateToolkit',
  'PREREQ_PM' => {
    'Plack::Component' => '0',
    'Plack::Request' => '0.9901',
    'Plack::Util::Accessor' => '0',
    'Template' => '2',
    'parent' => '0'
  },
  'VERSION' => '0.06',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



