from machine import UART, Pin
import time

# Initialize UART
uart = UART(0, baudrate=115200, tx=Pin(0), rx=Pin(1))

# ── FFTP v1 frame builder ─────────────────────────────────────────────────────
# Frame layout: [SIZE 2B big-endian] [DST_MAC 6B] [EtherType 2B] [Payload N bytes]
# SIZE = payload-only byte count.

DST_MAC    = bytes([0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF])  # broadcast
ETHER_TYPE = bytes([0x08, 0x00])                           # IPv4
NUM_PACKETS = 10
IPG_MS      = 5   # inter-packet gap in milliseconds (>> 1 ms FPGA timeout)

def build_frame(payload: bytes) -> bytes:
    size = len(payload)
    header = bytes([(size >> 8) & 0xFF, size & 0xFF]) + DST_MAC + ETHER_TYPE
    return header + payload

print("Transmitting 10 broadcast IPv4 packets...")

for seq in range(1, NUM_PACKETS + 1):
    # Payload is a single byte equal to the packet sequence number (1-10)
    payload = bytes([seq])
    frame   = build_frame(payload)

    uart.write(frame)

    hex_str = " ".join(f"{b:02X}" for b in frame)
    print(f"Packet {seq:>2}/{NUM_PACKETS}  ({len(frame)} bytes): {hex_str}")

    # Mandatory inter-packet gap so the FPGA parser resets between frames
    time.sleep_ms(IPG_MS)

print("Done.")

# ── Optional: keep listening for any response from the FPGA ──────────────────
print("Listening for FPGA response (HEX)...")
while True:
    if uart.any():
        raw_bytes = uart.read()
        hex_spaced = " ".join(f"{b:02X}" for b in raw_bytes)
        print(f"RX: {hex_spaced}")
    time.sleep(0.05)