class Seqan < Formula
  desc "C++ library of sequence algorithms and data structures"
  homepage "http://www.seqan.de/"
  # doi "10.1186/1471-2105-9-11"
  # tag "bioinformatics"

  url "https://github.com/seqan/seqan/releases/download/seqan-v2.3.1/seqan-library-2.3.1.tar.xz"
  sha256 "79df48e97373dd8612913fe66d7aaa03288d09859dcf918bcb4a5f754ec7af7a"
  head "https://github.com/seqan/seqan.git"

  # seqan-library installs only header files.
  bottle :unneeded

  def install
    include.install "include/seqan"
    if build.head?
      prefix.install_metafiles
      pkgshare.install Dir["*"]
    else
      prefix.install_metafiles "share/doc/seqan"
      doc.install Dir["share/doc/seqan/*"]
      mv "lib", prefix
    end
  end

  test do
    # seqan-library installs only header files.
    system "ls", include
  end
end
