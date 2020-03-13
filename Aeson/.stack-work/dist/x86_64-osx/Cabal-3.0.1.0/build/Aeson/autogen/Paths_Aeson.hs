{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_Aeson (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/shashibhushanrana/Desktop/Haskell/Aeson/.stack-work/install/x86_64-osx/7a1d478829c72ca3457eaaccd74d2c7cbd9d0dbab0fb2eb98c84e7d1e7b53799/8.8.2/bin"
libdir     = "/Users/shashibhushanrana/Desktop/Haskell/Aeson/.stack-work/install/x86_64-osx/7a1d478829c72ca3457eaaccd74d2c7cbd9d0dbab0fb2eb98c84e7d1e7b53799/8.8.2/lib/x86_64-osx-ghc-8.8.2/Aeson-0.1.0.0-51g1iMUloO2AqJqIzhbEZQ-Aeson"
dynlibdir  = "/Users/shashibhushanrana/Desktop/Haskell/Aeson/.stack-work/install/x86_64-osx/7a1d478829c72ca3457eaaccd74d2c7cbd9d0dbab0fb2eb98c84e7d1e7b53799/8.8.2/lib/x86_64-osx-ghc-8.8.2"
datadir    = "/Users/shashibhushanrana/Desktop/Haskell/Aeson/.stack-work/install/x86_64-osx/7a1d478829c72ca3457eaaccd74d2c7cbd9d0dbab0fb2eb98c84e7d1e7b53799/8.8.2/share/x86_64-osx-ghc-8.8.2/Aeson-0.1.0.0"
libexecdir = "/Users/shashibhushanrana/Desktop/Haskell/Aeson/.stack-work/install/x86_64-osx/7a1d478829c72ca3457eaaccd74d2c7cbd9d0dbab0fb2eb98c84e7d1e7b53799/8.8.2/libexec/x86_64-osx-ghc-8.8.2/Aeson-0.1.0.0"
sysconfdir = "/Users/shashibhushanrana/Desktop/Haskell/Aeson/.stack-work/install/x86_64-osx/7a1d478829c72ca3457eaaccd74d2c7cbd9d0dbab0fb2eb98c84e7d1e7b53799/8.8.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Aeson_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Aeson_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "Aeson_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "Aeson_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Aeson_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Aeson_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
