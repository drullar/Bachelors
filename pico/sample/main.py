import machine
import utime

# UART Configuration (must match FPGA settings)
UART_BAUDRATE = 9600
UART_RX_PIN = 1  # GP1 (physical pin 2)
UART_TX_PIN = 0  # GP0 (physical pin 1) - not used but initialized

# LED for visual feedback
LED_PIN = 25  # Pico onboard LED

# Initialize UART
uart = machine.UART(0, baudrate=UART_BAUDRATE, tx=machine.Pin(UART_TX_PIN), rx=machine.Pin(UART_RX_PIN))
uart.init(bits=8, parity=None, stop=1)  # Explicit 8N1 configuration

# Initialize LED
led = machine.Pin(LED_PIN, machine.Pin.OUT)

# Buffer to store incomplete lines
buffer = bytearray()

def blink_led(times=1, duration=0.1):
    """Visual feedback for debugging"""
    for _ in range(times):
        led.on()
        utime.sleep(duration)
        led.off()
        utime.sleep(duration)

def decode_uart_data(data):
    """Format received data for display"""
    decoded = {
        'raw': data,
        'hex': '0x' + ''.join(['{:02x}'.format(b) for b in data]),
        'ascii': ''.join([chr(b) if 32 <= b <= 126 else '.' for b in data]),
        'binary': ' '.join(['{:08b}'.format(b) for b in data])
    }
    return decoded

print("UART Monitor Ready - Waiting for FPGA data...")
blink_led(3)  # Startup confirmation

while True:
    try:
        # Check for incoming data
        if uart.any():
            # Read all available bytes
            new_data = uart.read()
            
            if new_data:
                # Add to buffer
                buffer.extend(new_data)
                
                # Process complete messages (assuming each transmission ends with newline)
                while b'\n' in buffer:
                    line, _, buffer = buffer.partition(b'\n')
                    if line:
                        decoded = decode_uart_data(line)
                        print("\n=== Received Data ===")
                        print(f"Raw: {decoded['raw']}")
                        print(f"Hex: {decoded['hex']}")
                        print(f"ASCII: {decoded['ascii']}")
                        print(f"Binary: {decoded['binary']}")
                        blink_led(1)  # Visual feedback on reception
                
        # Small delay to prevent CPU overload
        utime.sleep_ms(10)
        
    except Exception as e:
        print(f"Error: {e}")
        blink_led(5, 0.2)  # Error pattern
        utime.sleep(1)