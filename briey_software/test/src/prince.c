#include "briey.h"
void prince_write(uint32_t iData, uint32_t iAddress)
{
	PRINCE_BASE->ADDRESS		= iAddress;
	PRINCE_BASE->WRITE_ENABLE 	= 1;
	PRINCE_BASE->IDATA			= iData;
	PRINCE_BASE->CHIP_SELECT	= 1;
	PRINCE_BASE->CHIP_SELECT	= 0;
}
uint32_t prince_read(uint32_t iAddress)
{
	PRINCE_BASE->ADDRESS		= iAddress;
	PRINCE_BASE->WRITE_ENABLE	= 0;
	PRINCE_BASE->CHIP_SELECT	= 1;
	uint32_t res 				= PRINCE_BASE->ODATA;
	PRINCE_BASE->CHIP_SELECT	= 0;
	return res;
}

void prince_cipher(uint32_t mode, uint32_t *key, uint32_t *block, uint32_t *res)
{
		//EN-OR-DE---
		prince_write(mode,PRINCE_ADDR_CONFIG);

		//BLOCK----
		prince_write(block[1],PRINCE_ADDR_BLOCK_BASE +1);
		prince_write(block[0],PRINCE_ADDR_BLOCK_BASE);

		//KEY----

		prince_write(key[3],PRINCE_ADDR_KEY_BASE +3);
		prince_write(key[2],PRINCE_ADDR_KEY_BASE +2);
		prince_write(key[1],PRINCE_ADDR_KEY_BASE +1);
		prince_write(key[0],PRINCE_ADDR_KEY_BASE);

		//START----
		prince_write(0x1,PRINCE_ADDR_CTRL);

		//wait result----
		while(prince_read(PRINCE_ADDR_STATUS)==0);
		res[1] = prince_read(PRINCE_ADDR_RESULT_BASE +1);
		res[0] = prince_read(PRINCE_ADDR_RESULT_BASE);

		//print result to terminal
		if(mode == PRINCE_OP_EN)
			print("\r\t=============================PRINCE ENCRYPTTION=============================\r\n");
		else
			print("\r\t=============================PRINCE DECRYPTTION=============================\r\n");
		print("\r\n");
		print64bit("PLAIN_TEXT (64-bit) : ", block);
		print128bit("KEY (128-bit) : ", key);
		print64bit("RESULT (64-bit) : ", res);
		//print("\r\n============================================================================\r\n");

}

