require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php54Couchbase < AbstractPhp54Extension
  init
  homepage 'https://github.com/couchbase/php-ext-couchbase'
  url 'https://github.com/couchbase/php-ext-couchbase.git', :tag => '1.1.1'
  version '1.1.1'
  head 'https://github.com/couchbase/php-ext-couchbase.git'

  depends_on 'libcouchbase'

  def install
    # Dir.chdir "php-ext-couchbase" unless build.head?

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig
    system "make"
    prefix.install "modules/couchbase.so"
    write_config_file unless build.include? "without-config-file"
  end
end
