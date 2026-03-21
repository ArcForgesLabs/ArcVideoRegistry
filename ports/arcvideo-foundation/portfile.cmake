vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO ArcForgesLabs/ArcVideoFoundation
    REF 118770ddac8be257ba9929e3e4fedadb86bd5380
    SHA512 ede7a38966e604ebf933096aa26f6c6fecf9a5568287bca2abf600b48002f842caf5a59fa2c35bd4cad920f771f9ee74351430999f7da18247b1e7a1aea7203f
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
