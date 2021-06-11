///////////////////////////////////////////////////////
// Assembler X   Codigo 1 (Encendido de Led)         //
///////////////////////////////////////////////////////

PROCESSOR 16F887             // Seleccionamos el pic con el que trabajaremos
#include <xc.inc>            // Permite acceder a registros de funciones especiales y otras características del dispositivo
    
// Configuracion del PIC Fusses/////////////////////////////////////////////////////////////////////////////////////////////////////
CONFIG FOSC=INTRC_NOCLKOUT       // Bits de seleccion del Oscillator  ()
CONFIG WDTE=OFF                  // Bits de Activador de temporizador de watchdog 
CONFIG PWRTE=ON                  // Bits para habilitar el Power up
CONFIG MCLRE=OFF                 // El pin Master Clear es un reinicio externo opcional que se activa tirando del pin hacia abajo
CONFIG CP=OFF                    // Bit para la proteccion del codigo
CONFIG CPD=OFF                   // Data Code Protection bit 
CONFIG BOREN=OFF                 // Brown Out Reset Selection bits
CONFIG IESO=OFF                  // Internal External Switchover bit 
CONFIG FCMEN=ON                  // Fail-Safe Clock Monitor Enabled bit
CONFIG DEBUG=ON                  // In-Circuit Debugger Mode bit

CONFIG BOR4V=BOR40V
CONFIG WRT=OFF                   // Flash Program Memory Self Write Enable bits (Write protection off.)
 
///////variiables////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    PSECT code                      // Variables permite almacenar en RAM
 
 
/////Configuracion de puertos y registros/////////////////////////////////////////////////////////////////////////////////////////////////////
//Nota: Banksel nos permite seleccionar un registro especifico en cualquier  banco de memoria
 BANKSEL ANSEL                   // En el registro Ansel cambiamos su comportamiento de analogico a digital
 clrf ANSEL                      // Nota: la funcion clrf nos permite poner en 0 todos los bits del registro seleccionado
 BANKSEL PORTA                   // El PORTA es el registro que controla las entradas y salidas del puerto A
 clrf PORTA
 BANKSEL TRISA                   // El registro TRISA permite que el puerto A se utilice como entrada cuando sus bits son 1 y salida cuando sus bits son 0
 clrf TRISA
 BANKSEL PORTA                   // Volvemos a seleccionar el PORTA para trabajar en el
 // En esta parte del codigo colocamos los puertos como comportamiento digital, seleccionamos el puerto A y limpiamos su contenido y empleando el registro TRIS colocamos los pines del puerto A como salida
 
 bsf PORTA,0                     // Pone a Uno el Bit correspondiente del Registro especificado
 NOP                             // En esta instruccion esperamos un momento, que nos permite ver el estado de nuestros registros en la  
 END                             // Fin de programa
    
  

