SET(SRC intf.c)

add_library(add_shared SHARED ${SRC})
add_library(add_static STATIC ${SRC})

set_target_properties(add_shared PROPERTIES OUTPUT_NAME "add_shared")
set_target_properties(add_static PROPERTIES OUTPUT_NAME "add_static")
