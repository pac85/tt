tt_exe_src = [
    'options.d',
]

tt_exe = executable(
    'tt',
    [tt_exe_src, 'main.d'],
    dependencies: libtt_dep,
)

tt_test_exe = executable(
    'tt-test-exe',
    [tt_exe_src],
    dependencies: libtt_dep,
    d_unittest: true,
    link_args: [link_runtime_shared_arg, '-main'],
    native: true,
)

test('tt-test', tt_test_exe)
