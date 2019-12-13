package=libsodium
$(package)_version=1.0.15
$(package)_download_path=https://github.com/MyHush/libsodium/releases/download/1.0.15
$(package)_file_name=$(package)-$($(package)_version).tar.gz
$(package)_sha256_hash=fb6a9e879a2f674592e4328c5d9f79f082405ee4bb05cb6e679b90afe9e178f4
$(package)_dependencies=
$(package)_config_opts=

ifeq ($(build_os),darwin)
define $(package)_set_vars
  $(package)_build_env=MACOSX_DEPLOYMENT_TARGET="10.11"
  $(package)_cc=clang
  $(package)_cxx=clang++
endef
endif

define $(package)_preprocess_cmds
  cd $($(package)_build_subdir); ./autogen.sh
endef

define $(package)_config_cmds
  $($(package)_autoconf) --enable-static --disable-shared
endef

define $(package)_build_cmds
  $(MAKE)
endef

define $(package)_stage_cmds
  $(MAKE) DESTDIR=$($(package)_staging_dir) install
endef
