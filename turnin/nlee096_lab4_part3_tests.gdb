# Test file for "Lab4_SMs" exercise 3


# commands.gdb provides the following functions for ease:
#   test "<message>"
#       Where <message> is the message to print. Must call this at the beginning of every test
#       Example: test "PINA: 0x00 => expect PORTC: 0x01"
#   checkResult
#       Verify if the test passed or failed. Prints "passed." or "failed." accordingly, 
#       Must call this at the end of every test.
#   expectPORTx <val>
#       With x as the port (A,B,C,D)
#       The value the port is epected to have. If not it will print the erroneous actual value
#   setPINx <val>
#       With x as the port or pin (A,B,C,D)
#       The value to set the pin to (can be decimal or hexidecimal
#       Example: setPINA 0x01
#   printPORTx f OR printPINx f 
#       With x as the port or pin (A,B,C,D)
#       With f as a format option which can be: [d] decimal, [x] hexadecmial (default), [t] binary 
#       Example: printPORTC d
#   printDDRx
#       With x as the DDR (A,B,C,D)
#       Example: printDDRB

echo ======================================================\n
echo Running all tests..."\n\n

test "PINA: 0x00 =>  PORTB: 0x00"
# Set inputs
set state = Start
setPINA 0x00
continue 1
# Set expect values
expectPORTB 0x00
# Check pass/fail
checkResult
expect state LOCK

test "PINA: 0x00 0x01 =>  PORTB: 0x00"
set state = Start
setPINA 0x00
continue 1
setPINA 0x01
continue 1
# Set expect values
expectPORTB 0x00
# Check pass/fail
checkResult
expect state LOCK

test "PINA: 0x00 0x02 =>  PORTB: 0x00"
set state = Start
setPINA 0x00
continue 1
setPINA 0x02
continue 1
# Set expect values
expectPORTB 0x00
# Check pass/fail
checkResult
expect state LOCK

test "PINA: 0x00 0x80 =>  PORTB: 0x00"
set state = Start
setPINA 0x00
continue 1
setPINA 0x80
continue 1
# Set expect values
expectPORTB 0x00
# Check pass/fail
checkResult
expect state LOCK

test "PINA: 0x00 0x03 =>  PORTB: 0x00"
set state = Start
setPINA 0x00
continue 1
setPINA 0x03
continue 1
# Set expect values
expectPORTB 0x00
# Check pass/fail
checkResult
expect state LOCK

test "PINA: 0x00 0x04 =>  PORTB: 0x00"
set state = Start
setPINA 0x00
continue 1
setPINA 0x04
continue 1
# Set expect values
expectPORTB 0x00
# Check pass/fail
checkResult
expect state LOCK_A2

test "PINA: 0x00 0x05 =>  PORTB: 0x00"
set state = Start
setPINA 0x00
continue 1
setPINA 0x05
continue 1
# Set expect values
expectPORTB 0x00
# Check pass/fail
checkResult
expect state LOCK

test "PINA: 0x00 0x06 =>  PORTB: 0x00"
set state = Start
setPINA 0x00
continue 1
setPINA 0x06
continue 1
# Set expect values
expectPORTB 0x00
# Check pass/fail
checkResult
expect state LOCK

test "PINA: 0x00 0x07 =>  PORTB: 0x00"
set state = Start
setPINA 0x00
continue 1
setPINA 0x07
continue 1
# Set expect values
expectPORTB 0x00
# Check pass/fail
checkResult
expect state LOCK

test "PINA: 0x00 0x04 0x00 =>  PORTB: 0x00"
set state = Start
setPINA 0x00
continue 1
setPINA 0x04
continue 1
setPINA 0x00
continue 1
# Set expect values
expectPORTB 0x00
# Check pass/fail
checkResult
expect state LOCK_READY

test "PINA: 0x00 0x04 0x01 =>  PORTB: 0x00"
set state = Start
setPINA 0x00
continue 1
setPINA 0x04
continue 1
setPINA 0x01
continue 1
# Set expect values
expectPORTB 0x00
# Check pass/fail
checkResult
expect state LOCK

test "PINA: 0x00 0x04 0x02 =>  PORTB: 0x00"
set state = Start
setPINA 0x00
continue 1
setPINA 0x04
continue 1
setPINA 0x02
continue 1
# Set expect values
expectPORTB 0x00
# Check pass/fail
checkResult
expect state LOCK

test "PINA: 0x00 0x04 0x03 =>  PORTB: 0x00"
set state = Start
setPINA 0x00
continue 1
setPINA 0x03
continue 1
setPINA 0x02
continue 1
# Set expect values
expectPORTB 0x00
# Check pass/fail
checkResult
expect state LOCK

test "PINA: 0x00 0x04 0x04 0x04 0x04=>  PORTB: 0x00"
set state = Start
setPINA 0x00
continue 1
setPINA 0x04
continue 1
setPINA 0x04
continue 1
setPINA 0x04
continue 1
setPINA 0x04
continue 1
# Set expect values
expectPORTB 0x00
# Check pass/fail
checkResult
expect state LOCK_A2

test "PINA: 0x00 0x04 0x80 =>  PORTB: 0x00"
set state = Start
setPINA 0x00
continue 1
setPINA 0x04
continue 1
setPINA 0x80
continue 1
# Set expect values
expectPORTB 0x00
# Check pass/fail
checkResult
expect state LOCK

test "PINA: 0x00 0x04 0x00 0x00 =>  PORTB: 0x00"
set state = Start
setPINA 0x00
continue 1
setPINA 0x04
continue 1
setPINA 0x00
continue 1
setPINA 0x00
continue 1
# Set expect values
expectPORTB 0x00
# Check pass/fail
checkResult
expect state LOCK_READY

test "PINA: 0x00 0x04 0x00 0x01 =>  PORTB: 0x00"
set state = Start
setPINA 0x00
continue 1
setPINA 0x04
continue 1
setPINA 0x00
continue 1
setPINA 0x01
continue 1
# Set expect values
expectPORTB 0x00
# Check pass/fail
checkResult
expect state LOCK

test "PINA: 0x00 0x04 0x00 0x02 =>  PORTB: 0x00"
set state = Start
setPINA 0x00
continue 1
setPINA 0x04
continue 1
setPINA 0x00
continue 1
setPINA 0x02
continue 1
# Set expect values
expectPORTB 0x01
# Check pass/fail
checkResult
expect state UNLOCK

test "PINA: 0x00 0x04 0x00 0x03 =>  PORTB: 0x00"
set state = Start
setPINA 0x00
continue 1
setPINA 0x04
continue 1
setPINA 0x00
continue 1
setPINA 0x03
continue 1
# Set expect values
expectPORTB 0x00
# Check pass/fail
checkResult
expect state LOCK

#==========================================================================================================
test "PINA: 0x00 0x04 0x00 0x04 =>  PORTB: 0x00"
set state = Start
setPINA 0x00
continue 1
setPINA 0x04
continue 1
setPINA 0x00
continue 1
setPINA 0x04
continue 1
# Set expect values
expectPORTB 0x00
# Check pass/fail
checkResult
expect state LOCK
#==========================================================================================================

test "PINA: 0x00 0x04 0x00 0x80 =>  PORTB: 0x00"
set state = Start
setPINA 0x00
continue 1
setPINA 0x04
continue 1
setPINA 0x00
continue 1
setPINA 0x80
continue 1
# Set expect values
expectPORTB 0x00
# Check pass/fail
checkResult
expect state LOCK

test "PINA: 0x00 0x04 0x00 0x02 0x00=>  PORTB: 0x01"
set state = Start
setPINA 0x00
continue 1
setPINA 0x04
continue 1
setPINA 0x00
continue 1
setPINA 0x02
continue 1
setPINA 0x00
continue 1
# Set expect values
expectPORTB 0x01
# Check pass/fail
checkResult
expect state UNLOCK

test "PINA: 0x00 0x04 0x00 0x02 0x01=>  PORTB: 0x01"
set state = Start
setPINA 0x00
continue 1
setPINA 0x04
continue 1
setPINA 0x00
continue 1
setPINA 0x02
continue 1
setPINA 0x01
continue 1
# Set expect values
expectPORTB 0x01
# Check pass/fail
checkResult
expect state UNLOCK

test "PINA: 0x00 0x04 0x00 0x02 0x02=>  PORTB: 0x01"
set state = Start
setPINA 0x00
continue 1
setPINA 0x04
continue 1
setPINA 0x00
continue 1
setPINA 0x02
continue 1
setPINA 0x02
continue 1
# Set expect values
expectPORTB 0x01
# Check pass/fail
checkResult
expect state UNLOCK

test "PINA: 0x00 0x04 0x00 0x02 0x03=>  PORTB: 0x01"
set state = Start
setPINA 0x00
continue 1
setPINA 0x04
continue 1
setPINA 0x00
continue 1
setPINA 0x02
continue 1
setPINA 0x03
continue 1
# Set expect values
expectPORTB 0x01
# Check pass/fail
checkResult
expect state UNLOCK

test "PINA: 0x00 0x04 0x00 0x02 0x04=>  PORTB: 0x01"
set state = Start
setPINA 0x00
continue 1
setPINA 0x04
continue 1
setPINA 0x00
continue 1
setPINA 0x02
continue 1
setPINA 0x04
continue 1
# Set expect values
expectPORTB 0x01
# Check pass/fail
checkResult
expect state UNLOCK

test "PINA: 0x00 0x04 0x00 0x02 0x07=>  PORTB: 0x01"
set state = Start
setPINA 0x00
continue 1
setPINA 0x04
continue 1
setPINA 0x00
continue 1
setPINA 0x02
continue 1
setPINA 0x07
continue 1
# Set expect values
expectPORTB 0x01
# Check pass/fail
checkResult
expect state UNLOCK

test "PINA: 0x00 0x04 0x00 0x02 0x80=>  PORTB: 0x00"
set state = Start
setPINA 0x00
continue 1
setPINA 0x04
continue 1
setPINA 0x00
continue 1
setPINA 0x02
continue 1
setPINA 0x80
continue 1
# Set expect values
expectPORTB 0x00
# Check pass/fail
checkResult
expect state LOCK


# Report on how many tests passed/tests ran
set $passed=$tests-$failed
eval "shell echo Passed %d/%d tests.\n",$passed,$tests
echo ======================================================\n
