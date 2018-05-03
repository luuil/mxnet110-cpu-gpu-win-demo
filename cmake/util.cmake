macro(copy_file_if_different target file)
    if(EXISTS ${file})
        message(STATUS "Post build will copy: ${target} ${file}")
        add_custom_command(TARGET ${target} POST_BUILD      # Adds a post-build event to ${target}
            COMMAND ${CMAKE_COMMAND} -E copy_if_different   # which executes "cmake - E copy_if_different..."
            "${file}"                                       # in-file
            $<TARGET_FILE_DIR:${target}>)                   # out-file path
    else(EXISTS ${file})
        message(FATAL_ERROR "File not found (check `../3rdparty` download first):
            ${file}
            ")
    endif(EXISTS ${file})
endmacro(copy_file_if_different target file)

macro(copy_rename_file_if_different target srcname tgtname)
    message(STATUS "Post build will copy and rename: 
            ${target} ${srcname} -> $<TARGET_FILE_DIR:${target}>/${tgtname}
        ")
    add_custom_command(TARGET ${target} POST_BUILD      # Adds a post-build event to ${target}
        COMMAND ${CMAKE_COMMAND} -E copy_if_different   # which executes "cmake - E copy_if_different..."
        "${srcname}"                                    # in-file
        $<TARGET_FILE_DIR:${target}>/${tgtname})        # out-file path
endmacro(copy_rename_file_if_different target srcname tgtname)

function(copy_files_if_different target files)
    foreach(file ${${files}})
        copy_file_if_different(${target} ${file})
    endforeach(file)
endfunction(copy_files_if_different target files)