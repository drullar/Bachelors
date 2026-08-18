from machine import UART, Pin
import time

# Initialize UART
uart = UART(0, baudrate=115200, tx=Pin(0), rx=Pin(1))

print("Listening for raw bytes (printing as HEX)...")

while True:
    if uart.any():
        raw_bytes = uart.read()  # Keeps data as a raw bytes object
        
        # Option A: Continuous hex string (e.g., "414243ff")
        hex_string = raw_bytes.hex()
        
        # Option B: Clean, space-separated hex pairs (e.g., "41 42 43 FF")
        hex_spaced = " ".join(f"{b:02X}" for b in raw_bytes)
        
        print(f"HEX: {hex_spaced}")
        
    time.sleep(0.05) 