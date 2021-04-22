/**********************************************************************************/
/* Copyright by @bkozdras <b.kozdras@gmail.com>                                   */
/* Version: 1.0                                                                   */
/* Licence: MIT                                                                   */
/**********************************************************************************/

#include <stdint.h>
#include <stdio.h>

#include <boards/pico.h>
#include <hardware/flash.h>
#include <pico/stdlib.h>

void readAndPrintFlash(void);
void printData(const uint8_t* data, const size_t size);

int main()
{
    stdio_init_all();
    gpio_init(PICO_DEFAULT_LED_PIN);
    gpio_set_dir(PICO_DEFAULT_LED_PIN, GPIO_OUT);
    gpio_put(PICO_DEFAULT_LED_PIN, 1);
    sleep_ms(10000);
    printf("PRE readAndPrintFlash\n");
    readAndPrintFlash();
    printf("POST readAndPrintFlash\n");
    while (true)
    {
        printf("Idle...\n");
        gpio_put(PICO_DEFAULT_LED_PIN, 1);
        sleep_ms(500);
        gpio_put(PICO_DEFAULT_LED_PIN, 0);
        sleep_ms(500);
    }
    return 0;
}

void readAndPrintFlash(void)
{
    for (uint16_t iter = 0u; iter < 5u; ++iter)
    {
        const uint16_t currentOffset = (iter * FLASH_PAGE_SIZE);
        printf("SECTION - Offset: %u\n", currentOffset);
        sleep_ms(1000);
        const uint8_t* flashData = (const uint8_t*)(XIP_BASE + currentOffset);
        printData(flashData, FLASH_PAGE_SIZE);
    }
}

void printData(const uint8_t* data, const size_t size)
{
    for (size_t iter = 0; iter < size; ++iter)
    {
        printf("%02X", data[iter]);
        if (iter % 16 == 15)
            printf("\n");
        else
            printf(" ");
    }
    printf("\n");
}
