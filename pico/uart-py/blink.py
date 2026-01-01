import machine
import utime

# Configure UART
uart = machine.UART(0, baudrate=9600, tx=machine.Pin(0), rx=machine.Pin(1))

# Constant byte to transmit (0x55 is 85 in decimal, binary 01010101 - good test pattern)
TX_BYTE = b'\x55'  # You can change this to any byte value you want

# Transmission delay in seconds (0.1 = 100ms)
DELAY = 5

print("Starting UART transmitter...")
print(f"Will transmit byte {TX_BYTE} every {DELAY} seconds")

while True:
    uart.write(TX_BYTE)
    print(f"Transmitted: {TX_BYTE}")  # Optional debug print
    utime.sleep(DELAY)