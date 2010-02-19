require 'formula'

class Camlidl <Formula
  url 'http://caml.inria.fr/distrib/bazar-ocaml/camlidl-1.05.tar.gz'
  homepage 'http://pauillac.inria.fr/caml/camlidl/'
  md5 '4cfb863bc3cbdc1af2502042c45cc675'

  depends_on 'ocaml'

  def patches
    { :p1 => DATA }
  end

  def install
    ENV.gcc_4_2
    
    FileUtils.ln_s 'Makefile.unix', 'config/Makefile'
    inreplace 'config/Makefile.unix', '/usr/local/bin', "#{prefix}/bin"
    
    #interactive_shell
    system "make all"
    #system "./configure", "--prefix=#{prefix}"#, "--disable-debug", "--disable-dependency-tracking"
    #interactive_shell
    system "make install"
  end
end
__END__
diff --git a/config/Makefile.unix b/config/Makefile.unix
index cf4549c..d039bdc 100644
--- a/config/Makefile.unix
+++ b/config/Makefile.unix
@@ -19,11 +19,11 @@ OSTYPE=unix
 
 # How to invoke the C preprocessor
 # Works on most Unix systems:
-CPP=/lib/cpp
+# CPP=/lib/cpp
 # Alternatives:
 # CPP=cpp
 # CPP=/usr/ccs/lib/cpp
-# CPP=gcc -x c -E
+CPP=gcc -x c -E
 
 # How to invoke ranlib (only relevant for Unix)
 RANLIB=ranlib
