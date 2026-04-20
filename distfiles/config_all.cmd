setlocal

set OPENSSL_VER=4.0.0
set OPENSSL_VER_SED=4\.0\.0
set OPENSSL_BASE=openssl-%OPENSSL_VER%
set OPENSSL_BASE_SED=openssl-%OPENSSL_VER_SED%
set OPENSSL_DIR=..\%OPENSSL_BASE%
set OPENSSL_DIR_SED=\.\.\\\\openssl-%OPENSSL_VER_SED%

set ZLIB_DIR=..\zlib

set _GEN_LIST_INCL=^
  include\crypto\dso_conf.h ^
  include\openssl\asn1.h ^
  include\openssl\asn1t.h ^
  include\openssl\bio.h ^
  include\openssl\cmp.h ^
  include\openssl\cms.h ^
  include\openssl\comp.h ^
  include\openssl\conf.h ^
  include\openssl\configuration.h ^
  include\openssl\crmf.h ^
  include\openssl\crypto.h ^
  include\openssl\ct.h ^
  include\openssl\err.h ^
  include\openssl\ess.h ^
  include\openssl\fipskey.h ^
  include\openssl\lhash.h ^
  include\openssl\ocsp.h ^
  include\openssl\opensslv.h ^
  include\openssl\pkcs12.h ^
  include\openssl\pkcs7.h ^
  include\openssl\safestack.h ^
  include\openssl\srp.h ^
  include\openssl\ssl.h ^
  include\openssl\ui.h ^
  include\openssl\x509.h ^
  include\openssl\x509_acert.h ^
  include\openssl\x509_vfy.h ^
  include\openssl\x509v3.h

set _GEN_LIST_PARAMNAMES_INCL=^
  include\openssl\core_names.h

set _GEN_LIST_PARAMNAMES_CSRC=^
  providers\implementations\asymciphers\rsa_enc.inc ^
  providers\implementations\asymciphers\sm2_enc.inc ^
  providers\implementations\ciphers\cipher_aes_cbc_hmac_sha.inc ^
  providers\implementations\ciphers\cipher_aes_cbc_hmac_sha_etm.inc ^
  providers\implementations\ciphers\cipher_aes_gcm_siv.inc ^
  providers\implementations\ciphers\cipher_aes_ocb.inc ^
  providers\implementations\ciphers\cipher_aes_siv.inc ^
  providers\implementations\ciphers\cipher_aes_wrp.inc ^
  providers\implementations\ciphers\cipher_aes_xts.inc ^
  providers\implementations\ciphers\cipher_chacha20.inc ^
  providers\implementations\ciphers\cipher_chacha20_poly1305.inc ^
  providers\implementations\ciphers\cipher_null.inc ^
  providers\implementations\ciphers\cipher_rc4_hmac_md5.inc ^
  providers\implementations\ciphers\cipher_sm4_xts.inc ^
  providers\implementations\ciphers\ciphercommon.inc ^
  providers\implementations\ciphers\ciphercommon_ccm.inc ^
  providers\implementations\ciphers\ciphercommon_gcm.inc ^
  providers\implementations\digests\blake2_prov.inc ^
  providers\implementations\digests\cshake_prov.inc ^
  providers\implementations\digests\digestcommon.inc ^
  providers\implementations\digests\mdc2_prov.inc ^
  providers\implementations\digests\ml_dsa_mu_prov.inc ^
  providers\implementations\digests\sha2_prov.inc ^
  providers\implementations\digests\sha3_prov.inc ^
  providers\implementations\encode_decode\decode_der2key.inc ^
  providers\implementations\encode_decode\decode_epki2pki.inc ^
  providers\implementations\encode_decode\decode_pem2der.inc ^
  providers\implementations\encode_decode\decode_pvk2key.inc ^
  providers\implementations\encode_decode\decode_spki2typespki.inc ^
  providers\implementations\encode_decode\encode_key2any.inc ^
  providers\implementations\encode_decode\encode_key2ms.inc ^
  providers\implementations\exchange\dh_exch.inc ^
  providers\implementations\exchange\ecdh_exch.inc ^
  providers\implementations\exchange\ecx_exch.inc ^
  providers\implementations\kdfs\argon2.inc ^
  providers\implementations\kdfs\hkdf.inc ^
  providers\implementations\kdfs\hmacdrbg_kdf.inc ^
  providers\implementations\kdfs\kbkdf.inc ^
  providers\implementations\kdfs\krb5kdf.inc ^
  providers\implementations\kdfs\pbkdf1.inc ^
  providers\implementations\kdfs\pbkdf2.inc ^
  providers\implementations\kdfs\pkcs12kdf.inc ^
  providers\implementations\kdfs\pvkkdf.inc ^
  providers\implementations\kdfs\scrypt.inc ^
  providers\implementations\kdfs\snmpkdf.inc ^
  providers\implementations\kdfs\srtpkdf.inc ^
  providers\implementations\kdfs\sshkdf.inc ^
  providers\implementations\kdfs\sskdf.inc ^
  providers\implementations\kdfs\tls1_prf.inc ^
  providers\implementations\kdfs\x942kdf.inc ^
  providers\implementations\kdfs\x963kdf.inc ^
  providers\implementations\kem\ec_kem.inc ^
  providers\implementations\kem\ecx_kem.inc ^
  providers\implementations\kem\ml_kem_kem.inc ^
  providers\implementations\kem\rsa_kem.inc ^
  providers\implementations\keymgmt\dh_kmgmt.inc ^
  providers\implementations\keymgmt\dsa_kmgmt.inc ^
  providers\implementations\keymgmt\ecx_kmgmt.inc ^
  providers\implementations\keymgmt\lms_kmgmt.inc ^
  providers\implementations\keymgmt\mac_legacy_kmgmt.inc ^
  providers\implementations\keymgmt\ml_dsa_kmgmt.inc ^
  providers\implementations\keymgmt\ml_kem_kmgmt.inc ^
  providers\implementations\keymgmt\mlx_kmgmt.inc ^
  providers\implementations\keymgmt\slh_dsa_kmgmt.inc ^
  providers\implementations\keymgmt\template_kmgmt.inc ^
  providers\implementations\macs\cmac_prov.inc ^
  providers\implementations\macs\gmac_prov.inc ^
  providers\implementations\macs\hmac_prov.inc ^
  providers\implementations\macs\kmac_prov.inc ^
  providers\implementations\macs\poly1305_prov.inc ^
  providers\implementations\macs\siphash_prov.inc ^
  providers\implementations\rands\drbg_ctr.inc ^
  providers\implementations\rands\drbg_hash.inc ^
  providers\implementations\rands\drbg_hmac.inc ^
  providers\implementations\rands\fips_crng_test.inc ^
  providers\implementations\rands\seed_src.inc ^
  providers\implementations\rands\seed_src_jitter.inc ^
  providers\implementations\rands\test_rng.inc ^
  providers\implementations\signature\dsa_sig.inc ^
  providers\implementations\signature\ecdsa_sig.inc ^
  providers\implementations\signature\eddsa_sig.inc ^
  providers\implementations\signature\ml_dsa_sig.inc ^
  providers\implementations\signature\rsa_sig.inc ^
  providers\implementations\signature\slh_dsa_sig.inc ^
  providers\implementations\signature\sm2_sig.inc ^
  providers\implementations\skeymgmt\generic.inc ^
  providers\implementations\storemgmt\file_store.inc ^
  providers\implementations\storemgmt\file_store_any2obj.inc ^
  providers\implementations\storemgmt\winstore_store.inc

set _GEN_LIST_PROV_INCL=^
  providers\common\include\prov\der_digests.h ^
  providers\common\include\prov\der_dsa.h ^
  providers\common\include\prov\der_ec.h ^
  providers\common\include\prov\der_ecx.h ^
  providers\common\include\prov\der_hkdf.h ^
  providers\common\include\prov\der_ml_dsa.h ^
  providers\common\include\prov\der_rsa.h ^
  providers\common\include\prov\der_slh_dsa.h ^
  providers\common\include\prov\der_sm2.h ^
  providers\common\include\prov\der_wrap.h ^
  providers\implementations\include\prov\blake2_params.inc

set _GEN_LIST_PROV_CSRC=^
  providers\common\der\der_digests_gen.c ^
  providers\common\der\der_dsa_gen.c ^
  providers\common\der\der_ec_gen.c ^
  providers\common\der\der_ecx_gen.c ^
  providers\common\der\der_hkdf_gen.c ^
  providers\common\der\der_ml_dsa_gen.c ^
  providers\common\der\der_rsa_gen.c ^
  providers\common\der\der_slh_dsa_gen.c ^
  providers\common\der\der_sm2_gen.c ^
  providers\common\der\der_wrap_gen.c

set _GEN_LIST=^
  %_GEN_LIST_INCL% ^
  %_GEN_LIST_PARAMNAMES_INCL% ^
  %_GEN_LIST_PARAMNAMES_CSRC% ^
  %_GEN_LIST_PROV_INCL% ^
  %_GEN_LIST_PROV_CSRC% ^
  apps\progs.c apps\progs.h ^
  apps\CA.pl apps\tsget.pl util\wrap.pl

mkdir dll64
mkdir lib64
mkdir dll32
mkdir lib32
mkdir dllarm64
mkdir libarm64
mkdir dllarm32
mkdir libarm32

pushd dll64
perl %OPENSSL_DIR%\Configure --prefix="%ProgramFiles%\OpenSSL-4" --with-zlib-include=%ZLIB_DIR% --with-zlib-lib=%ZLIB_DIR%\build\x64\Release\libz-static.lib VC-WIN64A-masm zlib
call :genfile
call :clndir
popd

pushd lib64
perl %OPENSSL_DIR%\Configure --prefix="%ProgramFiles%\OpenSSL-4" --with-zlib-include=%ZLIB_DIR% --with-zlib-lib=%ZLIB_DIR%\build\x64\Release\libz-static.lib VC-WIN64A-masm no-shared zlib
call :genfile
call :clndir
popd

pushd dll32
perl %OPENSSL_DIR%\Configure --prefix="%ProgramFiles(x86)%\OpenSSL-4" --with-zlib-include=%ZLIB_DIR% --with-zlib-lib=%ZLIB_DIR%\build\Release\libz-static.lib VC-WIN32 zlib
call :genfile
call :clndir
popd

pushd lib32
perl %OPENSSL_DIR%\Configure --prefix="%ProgramFiles(x86)%\OpenSSL-4" --with-zlib-include=%ZLIB_DIR% --with-zlib-lib=%ZLIB_DIR%\build\Release\libz-static.lib VC-WIN32 no-shared zlib
call :genfile
call :clndir
popd

pushd dllarm64
perl %OPENSSL_DIR%\Configure --prefix="%ProgramFiles%\OpenSSL-4" --with-zlib-include=%ZLIB_DIR% --with-zlib-lib=%ZLIB_DIR%\build\ARM64\Release\libz-static.lib VC-WIN64-ARM zlib
call :genfile
call :clndir
popd

pushd libarm64
perl %OPENSSL_DIR%\Configure --prefix="%ProgramFiles%\OpenSSL-4" --with-zlib-include=%ZLIB_DIR% --with-zlib-lib=%ZLIB_DIR%\build\ARM64\Release\libz-static.lib VC-WIN64-ARM no-shared zlib
call :genfile
call :clndir
popd

pushd dllarm32
perl %OPENSSL_DIR%\Configure --prefix="%ProgramFiles%\OpenSSL-4" --with-zlib-include=%ZLIB_DIR% --with-zlib-lib=%ZLIB_DIR%\build\ARM\Release\libz-static.lib VC-WIN32-ARM zlib
call :genfile
call :clndir
popd

pushd libarm32
perl %OPENSSL_DIR%\Configure --prefix="%ProgramFiles%\OpenSSL-4" --with-zlib-include=%ZLIB_DIR% --with-zlib-lib=%ZLIB_DIR%\build\ARM\Release\libz-static.lib VC-WIN32-ARM no-shared zlib
call :genfile
call :clndir
popd

goto :end

:genfile
for %%f in ( %_GEN_LIST_INCL% ) do (
  perl -I. -Mconfigdata %OPENSSL_DIR%\util\dofile.pl -omakefile %OPENSSL_DIR%\%%f.in > %%f
)
for %%f in ( %_GEN_LIST_PARAMNAMES_INCL% %_GEN_LIST_PARAMNAMES_CSRC% ) do (
  perl -I. -I%OPENSSL_DIR%\util\perl -Mconfigdata "-MOpenSSL::paramnames" %OPENSSL_DIR%\util\dofile.pl -omakefile %OPENSSL_DIR%\%%f.in > %%f
)
for %%f in ( %_GEN_LIST_PROV_INCL% %_GEN_LIST_PROV_CSRC% ) do (
  perl -I. -I%OPENSSL_DIR%\providers\common\der -Mconfigdata -Moids_to_c %OPENSSL_DIR%\util\dofile.pl -omakefile %OPENSSL_DIR%\%%f.in > %%f
)
perl %OPENSSL_DIR%\apps\progs.pl -C apps\openssl > apps\progs.c
perl %OPENSSL_DIR%\apps\progs.pl -H apps\openssl > apps\progs.h
perl -I. -Mconfigdata %OPENSSL_DIR%\util\dofile.pl -omakefile %OPENSSL_DIR%\apps\CA.pl.in > apps\CA.pl
perl -I. -Mconfigdata %OPENSSL_DIR%\util\dofile.pl -omakefile %OPENSSL_DIR%\apps\tsget.in > apps\tsget.pl
perl -I. -Mconfigdata %OPENSSL_DIR%\util\dofile.pl -omakefile %OPENSSL_DIR%\util\wrap.pl.in > util\wrap.pl
ren configdata.pm configdata.pm.org
@rem Redirection must be at front for "^^" to work. Strange.
>configdata.pm sed -e "s/%OPENSSL_DIR_SED%/\./g" -e "s/\(['\"]\)[A-Za-z]:[^^'\"]*\/%OPENSSL_BASE_SED%\(['\"\/]\)/\1\.\2/" -e "s/\"RANLIB\" =^> \"CODE(0x[0-9a-f]\+)\"/\"RANLIB\" =^> \"CODE(0xf1e2d3c4)\"/" -e "s/\(\"multilib\"\)/#\1/" configdata.pm.org
dos2unix %_GEN_LIST%
exit /b

:clndir
@echo off
call :clndir0
@echo on
exit /b

:clndir0
for /d %%d in ( * ) do (
    pushd %%d
    call :clndir0
    popd
    rmdir %%d 2>nul
)
exit /b

:end
endlocal
