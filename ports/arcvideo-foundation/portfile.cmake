vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO ArcForgesLabs/ArcVideoFoundation
    REF 1386c8b52e68984b43066fd323dec40c49cc68d0
    SHA512 4bd30bf0f3c0d656cc3851433edbf7ba844e713b5470400c099870d5cd54c130b2ebbd5fab7f3f7b8b0fe400cbaa3342dc95ef61697ca62bcae146329cf62a56
    HEAD_REF 1386c8b52e68984b43066fd323dec40c49cc68d0
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
