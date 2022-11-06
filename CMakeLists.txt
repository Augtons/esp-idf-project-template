# For more information about build system see
# https://docs.espressif.com/projects/esp-idf/en/latest/api-guides/build-system.html
# The following five lines of boilerplate have to be in your project's
# CMakeLists in this exact order for cmake to work correctly
cmake_minimum_required(VERSION 3.5)

include(cmake/CMakeUtils.cmake)

first_not_null(IDF_USER_NAME "$ENV{USERNAME}" "$ENV{USER}")
message("Got user name `${IDF_USER_NAME}`")
first_not_null(IDF_HOST_SYSTEM "${CMAKE_SYSTEM_NAME}" "${CMAKE_HOST_SYSTEM_NAME}")
message("Got system name `${IDF_HOST_SYSTEM}`")

set(CMAKE_USER_PROFILE_FILE ${CMAKE_CURRENT_SOURCE_DIR}/CMakeProfile_${IDF_USER_NAME}_${IDF_HOST_SYSTEM}.cmake)
message("Select `${CMAKE_USER_PROFILE_FILE}` as user-specific profile path.")

if (EXISTS ${CMAKE_USER_PROFILE_FILE})
    include(${CMAKE_USER_PROFILE_FILE})
    message("User-specific profile was included.")
else()
    file(WRITE ${CMAKE_USER_PROFILE_FILE} "# Add your configuration for cmake")
    message("User specific profile does not exist. It has been automatically created at ${CMAKE_USER_PROFILE_FILE}")
endif()

include($ENV{IDF_PATH}/tools/cmake/project.cmake)
project(esp-idf-template)
