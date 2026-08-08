from machine import UART, Pin
import sys
import utime

# --- UART RX setup ---
uart = UART(0, baudrate=300, tx=Pin(0), rx=Pin(1))

# --- Debug pin setup ---
debug_pin = Pin(2, Pin.IN)

# --- Onboard LED ---
led = Pin("LED", Pin.OUT)

# Track last state to detect rising edge
last_debug = debug_pin.value()

while True:
    # --- UART data ---
    if uart.any():
        try:
            line = uart.readline()
            if line:
                sys.stdout.write(line.decode('utf-8'))
        except Exception as e:
            pass

    # --- Debug pin toggles LED ---
    current_debug = debug_pin.value()
    if current_debug == 1 and last_debug == 0:
        # Rising edge detected
        led.toggle()
    last_debug = current_debug

    utime.sleep(0.001)  # small delay
