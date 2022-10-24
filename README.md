# 1. Brief

A template project for ESP-IDF. Some CMake features have been added to optimize CMake IDE (such as CLion)

# 2. Advantage

1. **Cross-platform.** All added features are written in cross-platform CMake language, which ignores IDE, system differences.

2. **Specifically optimized for version control.** Either using a version control system (VCS) or copying the entire project directly in the storage medium (contains configurations specific to different developers), these features allow the build system to automatically select different configurations that are relevant to you.

# 3. Details

1. Generate a dedicated CMake profile specific to you based on your **system username** and **system name**. (Such as `CMakeProfile_Augtons_Linux.cmake`)<br>
This file is automatically imported to the main `CMakeLists.txt`. **When there are multiple such profiles in the project folder, the build system only import the one that is specific to you.** <br>
You can set your system environment in this file, without interfering with other developers and your other projects. Do everything that can be done in CMake language.

For example, this is file named `CMakeProfile_Augtons_Linux.cmake`:
```cmake
# Add your configuration for cmake

# The cmake function `add_path` was provided in `CMakeUtils.cmake`
# You can add environment variables like this: 
add_path(
    /home/Augtons/esp/esp-idf-v4.4.2/components/esptool_py/esptool
    /home/Augtons/esp/esp-idf-v4.4.2/components/espcoredump
    /home/Augtons/esp/esp-idf-v4.4.2/components/partition_table
    /home/Augtons/esp/esp-idf-v4.4.2/components/app_update
    /home/Augtons/.espressif/tools/xtensa-esp32-elf/esp-2021r2-patch3-8.4.0/xtensa-esp32-elf/bin
    /home/Augtons/.espressif/tools/xtensa-esp32s2-elf/esp-2021r2-patch3-8.4.0/xtensa-esp32s2-elf/bin
    /home/Augtons/.espressif/tools/xtensa-esp32s3-elf/esp-2021r2-patch3-8.4.0/xtensa-esp32s3-elf/bin
    /home/Augtons/.espressif/tools/riscv32-esp-elf/esp-2021r2-patch3-8.4.0/riscv32-esp-elf/bin
    /home/Augtons/.espressif/tools/esp32ulp-elf/2.28.51-esp-20191205/esp32ulp-elf-binutils/bin
    /home/Augtons/.espressif/tools/esp32s2ulp-elf/2.28.51-esp-20191205/esp32s2ulp-elf-binutils/bin
    /home/Augtons/.espressif/tools/openocd-esp32/v0.11.0-esp32-20220411/openocd-esp32/bin
    /home/Augtons/.espressif/python_env/idf4.4_py3.8_env/bin
    /home/Augtons/esp/esp-idf-v4.4.2/tools
)

```

2. **These files are not be added to the version control system (VCS) by default.** Out of the box `.gitignore` was provided.

![image](https://user-images.githubusercontent.com/79037928/197556088-223be616-f9d2-4f30-bde5-49da7d75da49.png)
