package MT::Plugin::RmExif;

use strict;
use warnings;
no warnings 'redefine'; 

use MT;
use MT::Plugin;
my $plugin = MT::Plugin->new({
    name => 'Remove Exif',
    version => '1.0.1',
    description => "Delete the Exif when generating thumbnails.",
    author_name => 'Yuichi Takeuchi',
    author_link => 'http://takeyu-web.com/',
});

MT->add_plugin($plugin);

use MT::Asset::Image;

package MT::Asset::Image;

my $redefined = defined &thumbnail_file_with_strip;

unless ( $redefined ) {

    my $thumbnail_file_without_strip = *thumbnail_file{CODE};

    *thumbnail_file_with_strip = sub {
        my ( $thumbnail, $n_w, $n_h ) = $thumbnail_file_without_strip->( @_ );
        
        if ( -f $thumbnail ) {
            require Image::Magick;
            my $thumb = Image::Magick->new();
            $thumb->Read( $thumbnail );
            return ( $thumbnail, $n_w, $n_h )
              unless $thumb->[0];
            $thumb->Profile( name=>"*", profile=>"" );
            $thumb->[0]->Write( filename => $thumbnail )
        }
        
        return ( $thumbnail, $n_w, $n_h );
    };

    *thumbnail_file = *thumbnail_file_with_strip;

}

1;

