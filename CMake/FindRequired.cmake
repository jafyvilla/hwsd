
# generated by Buildyard, do not edit. Sets FOUND_REQUIRED if all required
# dependencies are found. Used by Buildyard.cmake
set(FIND_REQUIRED_FAILED)
find_package(Lunchbox 1.9.0 QUIET)
if(NOT Lunchbox_FOUND AND NOT LUNCHBOX_FOUND)
  set(FIND_REQUIRED_FAILED "${FIND_REQUIRED_FAILED} Lunchbox")
endif()
find_package(Boost 1.41.0 COMPONENTS program_options regex QUIET)
if(NOT Boost_FOUND AND NOT BOOST_FOUND)
  set(FIND_REQUIRED_FAILED "${FIND_REQUIRED_FAILED} Boost")
endif()
if(FIND_REQUIRED_FAILED)
  set(FOUND_REQUIRED FALSE)
else()
  set(FOUND_REQUIRED TRUE)
endif()