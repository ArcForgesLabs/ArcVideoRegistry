vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO ArcForgesLabs/ArcVideoFoundation
    REF acc94981c636c11cc9d3121d910b6836c2ff0bf4
    SHA512 4a02a3a87844f2f6f9968f8fd125a24099e4238a81ba4e17611d7fcf43e0f28456e68d11aafe4c0e87ca8ec78bef52d2bf571bdda809fdd8b1fc105a5fd604d1
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
