vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO ArcForgesLabs/OpenTimelineIO
    REF 39dd36c5bbbe993703ddea77d2f2899591adeb40
    SHA512 a99c627b0860f1af2634d6448dcec89a213c72db91e2a46e5a65d6ac443753f390845b5f8cbaa9ccc5c1d8d251e9a1226523de085333866e0753ae673f84df13
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DOTIO_CXX_INSTALL=ON
        -DOTIO_PYTHON_INSTALL=OFF
        -DOTIO_DEPENDENCIES_INSTALL=OFF
        -DOTIO_SHARED_LIBS=OFF
        -DOTIO_AUTOMATIC_SUBMODULES=OFF
        -DOTIO_FIND_IMATH=ON
        -DOTIO_FIND_RAPIDJSON=ON
        -DBUILD_TESTING=OFF
)

vcpkg_cmake_install()

# OTIO installs two separate CMake packages: opentime and opentimelineio.
# vcpkg_cmake_config_fixup can only handle one at a time and removes debug/share
# after each call. Fix up opentimelineio first (depends on opentime), then opentime.
# We must preserve debug/share/opentime before the first fixup removes it.
file(RENAME
    "${CURRENT_PACKAGES_DIR}/debug/share/opentime"
    "${CURRENT_PACKAGES_DIR}/debug/opentime-save"
)

vcpkg_cmake_config_fixup(PACKAGE_NAME opentimelineio CONFIG_PATH "share/opentimelineio")

# Restore opentime debug config
file(MAKE_DIRECTORY "${CURRENT_PACKAGES_DIR}/debug/share")
file(RENAME
    "${CURRENT_PACKAGES_DIR}/debug/opentime-save"
    "${CURRENT_PACKAGES_DIR}/debug/share/opentime"
)

vcpkg_cmake_config_fixup(PACKAGE_NAME opentime CONFIG_PATH "share/opentime")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
