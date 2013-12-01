require 'formula'

class Sx < Formula
  homepage 'https://github.com/spesmilo/sx'
  url 'https://github.com/spesmilo/sx.git', :tag => 'v0.2'

  depends_on 'automake' => :build
  depends_on 'qrencode' => :recommended
  depends_on 'WyseNynja/bitcoin/libbitcoin'
  depends_on 'WyseNynja/bitcoin/obelisk'

  def install
    ENV['CC'] = ENV['LD'] = "#{HOMEBREW_PREFIX}/opt/gcc48/bin/gcc-4.8"
    ENV['CXX'] = "#{HOMEBREW_PREFIX}/opt/gcc48/bin/g++-4.8"

    system "autoreconf", "-i"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
