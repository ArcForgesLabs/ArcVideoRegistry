vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO ArcForgesLabs/ArcVideoFoundation
    REF a7078c216c39b31fef3e6df5c2051b4108aff172
    SHA512 b9d59d11b43a1b4b53efb9bfc9085c7b1084712114bd8aebc48bb208c8382fc9b7b4b6f21a2124e3813b29d08e45ed4508ae6b3bdbc51125d4b45946cd9dba36
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
