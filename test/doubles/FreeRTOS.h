#ifndef INC_FREERTOS_H
#define INC_FREERTOS_H


/* Application specific configuration options. */

#define pdFALSE			( 0 )
#define pdTRUE			( 1 )
#define configMINIMAL_STACK_SIZE                                                  ( 60 )

typedef int TickType_t;
typedef int UBaseType_t;
typedef int*TaskHandle_t;
typedef int*TimerHandle_t;

#define vTaskDelay(d)
#define xTaskCreate(pvTaskCode, pcName, usStackDepth, pvParameters, uxPriority,pxCreatedTask )
#define xTimerCreate(pcTimerName, xTimerPeriodInTicks, uxAutoReload, pvTimerID, pxCallbackFunction) NULL
#define xTimerStart( xTimer, xTicksToWait )

#endif