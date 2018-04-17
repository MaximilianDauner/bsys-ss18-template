#!/usr/bin/env bats

@test "task1: Check that we have a debug output" {
    run stat "$BATS_TEST_DIRNAME/../target/debug/task1"
    echo "Got status '$status', expected status '0'"
    [ "$status" -eq 0 ]
}

# wc output with white spaces is trimmed by xargs
@test "task1: Output with no param must be exact 5 line long" {
    run bash -c "'$BATS_TEST_DIRNAME/../target/debug/task1' 2>&1 | wc -l | xargs"
    echo "Got '$output' line(s), expected '5' lines"
    [ "$output" = "5" ]
}

# wc output with white spaces is trimmed by xargs
@test "task1: Output with to many paras must be exact 1 line long" {
    run bash -c "'$BATS_TEST_DIRNAME/../target/debug/task1' 2 3 2>&1 | wc -l | xargs"
    echo "Got '$output' line(s), expected '1' line"
    [ "$output" = "1" ]
}

# wc output with white spaces is trimmed by xargs
@test "task1: Output with wrong para must be exact 1 line long" {
    run bash -c "'$BATS_TEST_DIRNAME/../target/debug/task1' b 2>&1 | wc -l | xargs"
    echo "Got '$output' line(s), expected '1' line"
    [ "$output" = "1" ]
}

@test "task1: Output with wrong PID does not crash" {
    run bash -c "'$BATS_TEST_DIRNAME/../target/debug/task1' 2 "
    echo "Got status '$status', expected status '1'"
    [ "$status" = 1 ]
}

@test "task1: Output with wrong PARAM does not crash" {
    run bash -c "'$BATS_TEST_DIRNAME/../target/debug/task1' a "
    echo "Got status '$status', expected status '1'"
    [ "$status" = 1 ]
}

@test "task1: Output with to many para does not crash" {
    run bash -c "'$BATS_TEST_DIRNAME/../target/debug/task1' 2 3 "
    echo "Got status '$status', expected status '1'"
    [ "$status" = 1 ]
}
