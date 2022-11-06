# first_not_null
#
# @brief Select the first notnull element in all args
#
# @param [out] output variable.
# @param [in] values.
function(first_not_null OUTPUT)
    foreach(VAL ${ARGN})
        if (VAL)
            set(${OUTPUT} ${VAL} PARENT_SCOPE)
            return()
        endif()
    endforeach()
endfunction()

# add_path
#
# @brief A utility function to append value to environment variable`PATH`.
#
# @param [in] values
function(add_path)
    # Add your configuration for cmake
    if (WIN32)
        set(path_separator ";")
    elseif(UNIX)
        set(path_separator ":")
    endif()

    list(JOIN ARGN "${path_separator}" ADDED_PATH)
    set(ENV{PATH} "${ADDED_PATH}${path_separator}$ENV{PATH}")
endfunction()
