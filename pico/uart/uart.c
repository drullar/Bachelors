#include <stdio.h>
#include "pico/stdlib.h"
#include "hardware/uart.h"
#include "hardware/gpio.h"

// UART0: TX = GPIO0, RX = GPIO1
#define UART_ID uart0
#define BAUD_RATE 9600

#define UART_TX_PIN 0
#define UART_RX_PIN 1

int main() {
    // Initialize USB serial
    stdio_usb_init();

    // Initialize UART
    uart_init(UART_ID, BAUD_RATE);

    // Set the TX and RX pins by function
    gpio_set_function(UART_TX_PIN, GPIO_FUNC_UART);
    gpio_set_function(UART_RX_PIN, GPIO_FUNC_UART);

    // Optional: configure UART format
    uart_set_format(UART_ID, 8, 1, UART_PARITY_NONE);

    // Optional: Enable FIFO
    uart_set_fifo_enabled(UART_ID, true);

    printf("UART to USB bridge started\n");

    while (true) {
        // Wait for UART data
        if (uart_is_readable(UART_ID)) {
            uint8_t ch = uart_getc(UART_ID);  // Read one byte from UART

            // Echo to USB serial (stdio_usb)
            printf("UART Received: %c\n", ch);
        }
    }

    return 0;
}
