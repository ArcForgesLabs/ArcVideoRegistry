vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO ArcForgesLabs/ArcVideoFoundation
    REF 19484e9d1531d8e60f5077653e85fd9220da8a3b
    SHA512 fd0d72a9472d044076c7143531b2bb5d81cfd3652d893c292137bcccab83962b6611888daf65407c04101702a1e87802b6229fc18295c5434fce44d00c6a2909
    HEAD_REF dac4eca29ef3ca6a6e7a71c232b3ca3c90a3e7a9
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DUSE_WERROR=OFF
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/arcvideo-foundation")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
