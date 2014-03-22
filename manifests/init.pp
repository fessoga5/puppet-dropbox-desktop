# vim: sts=4 ts=4 sw=4 expandtab autoindent
#
#INSTALL SKYPE ON DESKTOP
#
class puppet-dropbox-desktop ($source, $destination = "/root/dropbox.amd64.deb") {
    wget::fetch { 'dropbox':
        source      => $source,
        destination => $destination,
        timeout     => 0,
        verbose     => false,
        redownload  => false,
    }

    package {"dropbox":
        provider => dpkg,
        ensure   => latest,
        source   => $destination,
        require  => Wget::Fetch['dropbox']
    }
}
