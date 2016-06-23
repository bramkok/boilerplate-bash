#!/usr/bin/env bats

load test_helper

setup() {
  export _COMMAND="${BATS_TEST_DIRNAME}/../boilerplate-bash"
}

@test "\`boilerplate-bash\` with no arguments exits with status 0." {
  run "${_COMMAND}"
  [[ "${status}" -eq 0 ]]
}

@test "\`boilerplate-bash\` with no arguments prints a string." {
  run "${_COMMAND}"
  [[ "${output}" == "Perform a simple operation." ]]
}

@test "\`boilerplate-bash -h\` with no arguments exits with status 0." {
  run "${_COMMAND}" -h
  [[ "${status}" -eq 0 ]]
}

#@test "\`boilerplate-bash -h\` prints help." {
  #run "${_COMMAND}" -h
  #_compare "${_HELP_HEADER}" "$(IFS=$'\n'; echo "${lines[*]:0:6}")"
  #[[ "$(IFS=$'\n'; echo "${lines[*]:0:6}")" == "${_HELP_HEADER}" ]]
#}

@test "\`boilerplate-bash --help\` with no arguments exits with status 0." {
  run "${_COMMAND}" --help
  [[ "${status}" -eq 0 ]]
}

#@test "\`boilerplate-bash --help\` prints help." {
  #run "${_COMMAND}" --help
  #_compare "${_HELP_HEADER}" "$(IFS=$'\n'; echo "${lines[*]:0:6}")"
  #[[ "$(IFS=$'\n'; echo "${lines[*]:0:6}")" == "${_HELP_HEADER}" ]]
#}

@test "\`boilerplate-bash -x\` with no arguments exits with status 0." {
  run "${_COMMAND}" -x
  [[ "${status}" -eq 0 ]]
}

@test "\`boilerplate-bash -x\` prints message for option 'x'." {
  run "${_COMMAND}" -x
  [[ "${output}" == "Perform a simple operation with --option-x." ]]
}

@test "\`boilerplate-bash --option-x\` with no arguments exits with status 0." {
  run "${_COMMAND}" --option-x
  [[ "${status}" -eq 0 ]]
}

@test "\`boilerplate-bash --option-x\` prints message for option 'x'." {
  run "${_COMMAND}" --option-x
  [[ "${output}" == "Perform a simple operation with --option-x." ]]
}

@test "\`boilerplate-bash -o\` with no value exits with status 1." {
  run "${_COMMAND}" -o
  [[ "${status}" -eq 1 ]]
}

@test "\`boilerplate-bash -o\` with no value prints message." {
  run "${_COMMAND}" -o
  [[ "${output}" == "Option requires a argument: -o" ]]
}

@test "\`boilerplate-bash -o\` with value exits with status 0." {
  run "${_COMMAND}" -o 'short option value'
  [[ "${status}" -eq 0 ]]
}

@test "\`boilerplate-bash -o\` with value prints optional message." {
  run "${_COMMAND}" -o 'short option value'
  [[ "${lines[0]}" == "Perform a simple operation." ]]
  [[ "${lines[1]}" == "Short option parameter: short option value" ]]
}

@test "\`boilerplate-bash\` with long opt and missing required value exits with status 1." {
  run "${_COMMAND}" --long-option-with-argument
  [[ "${status}" -eq 1 ]]
}

@test "\`boilerplate-bash\` with long option and missing required value prints message." {
  run "${_COMMAND}" --long-option-with-argument
  [[ "${output}" =~ "Option requires a argument: --long-option-with-argument" ]]
}

@test "\`boilerplate-bash\` with option and required value exits with status 0." {
  run "${_COMMAND}" --long-option-with-argument 'long option value'
  [[ "${status}" -eq 0 ]]
}

@test "\`boilerplate-bash\` with option and required value prints optional message." {
  run "${_COMMAND}" --long-option-with-argument 'long option value'
  [[ "${lines[0]}" == "Perform a simple operation." ]]
  [[ "${lines[1]}" == "Long option parameter: long option value" ]]
}
