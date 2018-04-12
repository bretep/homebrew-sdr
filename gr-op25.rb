class GrOp25 < Formula
  homepage "http://op25.osmocom.org/trac/wiki"
  head "https://git.osmocom.org/op25"
  

  depends_on "cmake" => :build
  depends_on "gnuradio"
  depends_on "gr-osmosdr"
  depends_on "boost"
  depends_on "itpp"

  def install
    mkdir "build" do
      ENV.append "LDFLAGS", "-Wl,-undefined,dynamic_lookup"
      # Point Python library to existing path or CMake test will fail.
      args = %W[
        -DCMAKE_SHARED_LINKER_FLAGS='-Wl,-undefined,dynamic_lookup'
        -DPYTHON_LIBRARY='#{HOMEBREW_PREFIX}/lib/libgnuradio-runtime.dylib'
      ] + std_cmake_args

      system "cmake", "..", *args
      system "make", "install"
    end
  end
end

__END__
