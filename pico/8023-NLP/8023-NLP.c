#include "pico/stdlib.h"

int main()
{
    const uint PIN = 2; // GPIO2 (physical pin 4)
    const uint PERIOD_MS = 16;

    // Initialize GPIO
    gpio_init(PIN);
    gpio_set_dir(PIN, true); // output
    gpio_put(PIN, 0);        // start LOW

    while (true)
    {
        // --- 100 ns HIGH pulse ---
        gpio_put(PIN, 1);

        // Busy-wait for ~100 ns using NOPs
        // Each NOP ~8 ns at 125 MHz, 12 NOPs ≈ 96 ns
        //  for (int i = 0; i < 12; i++)
        for (int i = 0; i < 5; i++)
        {
            {
                asm volatile("nop"); // 27
                asm volatile("nop"); // 33
                asm volatile("nop");
                asm volatile("nop"); // 40
                asm volatile("nop");
                asm volatile("nop");
                asm volatile("nop");
                asm volatile("nop"); // 53
                asm volatile("nop");
                asm volatile("nop");
                asm volatile("nop");
                asm volatile("nop");
                asm volatile("nop");
                asm volatile("nop");
                asm volatile("nop");
                asm volatile("nop"); // 80
                asm volatile("nop");
                asm volatile("nop");
                asm volatile("nop");
                asm volatile("nop"); // 93
            }

            asm volatile("dmb" ::: "memory");

            gpio_put(PIN, 0);

            // --- Wait remaining period (~16 ms) ---
            sleep_ms(PERIOD_MS);
        }
        sleep_ms(10000);
    }
}