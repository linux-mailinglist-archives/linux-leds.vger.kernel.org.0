Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD1517C6F4
	for <lists+linux-leds@lfdr.de>; Fri,  6 Mar 2020 21:20:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgCFUUJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 6 Mar 2020 15:20:09 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54736 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbgCFUUJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 6 Mar 2020 15:20:09 -0500
Received: by mail-wm1-f65.google.com with SMTP id i9so3838263wml.4;
        Fri, 06 Mar 2020 12:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QzKvN+9IbHmBPUW7akKmG4skQDl5njrTfKbXUB+8crA=;
        b=m1dTd9gaL4pW10v0itvl5vbHKuA2h7XnhrIQW0ZZhwOUY7xvWlQu04p6QP6Ej1et72
         mSJx7HIvmdgm5UK7zZeOYHJRIvKFrQZs0exJOnViGGJwL5NTdbvcIz87DLtYP4luLzfw
         3CJCTeJ0N1NKloUPqQTGnhHXcjSyhH42rA1lN5MWtnsz9Gtn4BZdT8ksgRDW5yPxVBdC
         NQI9eEddB4eMMlvhUoWLuno+diTe/1JUl+YWM/A6klDvvoIknr3XSCPf5cmwbDmd7zUg
         /ME5W1j3mzCk+1Xfc4oBolScmEloi8rACk73pGqduDi98bjre+ZDLugrq4HUUJMFV+xk
         O1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=QzKvN+9IbHmBPUW7akKmG4skQDl5njrTfKbXUB+8crA=;
        b=kdGDNMY7emv6raW/LQcN+WmCKnsdySstY7zvsah6z8J8mLoP5q5vgmXDaJTPbCpqt5
         2JwI6blpPeqphYO58E06vPULLoh6Abq2yaXapuzIdSVUef9/WDSTHmyz85kYZQGWZVxv
         oEvy2cnwu1k0w911gepFrqww2p7WORJOy70v+DMUfxfFea0VeQyw05Rhfka8jsimUSfe
         rTECwUDY5JgjCGkYgL21yWk5OxlCRUxDV3djdTPd9iCydTc+r7X+UJaJTzxJr1rE4drU
         rRyblu3GEH3K7J8hjRC3oDCpfPo3vYl7L7+zmywBrcEDQuQiNWaFTNCJ+DaX9s0kaj9g
         rvew==
X-Gm-Message-State: ANhLgQ3LP+fFXQSjKs6vYabFXFQ5CquuRHSEK9ch+wUUTHmWwd+VWOUx
        3XjOXJLbhuX50xkncHbadCY=
X-Google-Smtp-Source: ADFU+vsiRTZAYSDoT8QEMrM6Cr8mQXV+5UHtbVF43lzk8FP+OZwYcNuTqF92SToSDr3EoDUQ/c4rLg==
X-Received: by 2002:a1c:a78a:: with SMTP id q132mr903659wme.107.1583526005460;
        Fri, 06 Mar 2020 12:20:05 -0800 (PST)
Received: from [192.168.1.23] (affp20.neoplus.adsl.tpnet.pl. [95.49.145.20])
        by smtp.gmail.com with ESMTPSA id j15sm10502832wrp.85.2020.03.06.12.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2020 12:20:04 -0800 (PST)
Subject: Re: [PATCH v3 3/3] drivers: leds: add support for apa102c leds
To:     Nicolas Belin <nbelin@baylibre.com>, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, pavel@ucw.cz, dmurphy@ti.com,
        devicetree@vger.kernel.org
Cc:     baylibre-upstreaming@groups.io
References: <1583502010-16210-1-git-send-email-nbelin@baylibre.com>
 <1583502010-16210-4-git-send-email-nbelin@baylibre.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 xsFNBFWjfaEBEADd66EQbd6yd8YjG0kbEDT2QIkx8C7BqMXR8AdmA1OMApbfSvEZFT1D/ECR
 eWFBS8XtApKQx1xAs1j5z70k3zebk2eeNs5ahxi6vM4Qh89vBM46biSKeeX5fLcv7asmGb/a
 FnHPAfQaKFyG/Bj9V+//ef67hpjJWR3s74C6LZCFLcbZM0z/wTH+baA5Jwcnqr4h/ygosvhP
 X3gkRzJLSFYekmEv+WHieeKXLrJdsUPUvPJTZtvi3ELUxHNOZwX2oRJStWpmL2QGMwPokRNQ
 29GvnueQdQrIl2ylhul6TSrClMrKZqOajDFng7TLgvNfyVZE8WQwmrkTrdzBLfu3kScjE14Q
 Volq8OtQpTsw5570D4plVKh2ahlhrwXdneSot0STk9Dh1grEB/Jfw8dknvqkdjALUrrM45eF
 FM4FSMxIlNV8WxueHDss9vXRbCUxzGw37Ck9JWYo0EpcpcvwPf33yntYCbnt+RQRjv7vy3w5
 osVwRR4hpbL/fWt1AnZ+RvbP4kYSptOCPQ+Pp1tCw16BOaPjtlqSTcrlD2fo2IbaB5D21SUa
 IsdZ/XkD+V2S9jCrN1yyK2iKgxtDoUkWiqlfRgH2Ep1tZtb4NLF/S0oCr7rNLO7WbqLZQh1q
 ShfZR16h7YW//1/NFwnyCVaG1CP/L/io719dPWgEd/sVSKT2TwARAQABzS1KYWNlayBBbmFz
 emV3c2tpIDxqYWNlay5hbmFzemV3c2tpQGdtYWlsLmNvbT7Cwa8EEwEIAEICGwMHCwkIBwMC
 AQYVCAIJCgsDFgIBAh4BAheAAhkBFiEEvx38ClaPBfeVdXCQvWpQHLeLfCYFAl5O5twFCRIR
 arsAIQkQvWpQHLeLfCYWIQS/HfwKVo8F95V1cJC9alAct4t8JhIgEACtWz3zR5uxaU/GozHh
 iZfiyUTomQpGNvAtjjZE6UKO/cKusCcvOv0FZbfGDajcMIU8f3FUxJdybrY86KJ9a3tOddal
 KtB2of3/Ot/EIQjpQb28iLoY8AWnf9G4LQZtoXHiUcOAVPkKgCFnz1IENK3uvyCB9c9//KhE
 cRZkeAIE2sTmcI4k7/dNHpRI4nha/ZytPwTdM3BjAfxxQI5nMLptm1ksEBI7W1SDOnY3dG2J
 QWmqpxIefjgyiy0aU+jAw1x3RdZrokVD8OCJiJM8+Z36imarEzqIRQLh+sDNLfV3wEaBn/HU
 0Vj6VrRyW2K0jAYToRFD3Ay/eGSfOOAEr/LoMr3NBTDkRLEWdOozllOwADEY9wH0BLHMp2WI
 hXGOStNiroIEhW2/E0udFJo9b3VoOWKWl+zcUP/keLxVUCXhpmeS7VpSkqsrCVqTVkEc8AXq
 xhJXeIQJC/XRpCYFc3pFUlVCFViF1ZU2OzE8TndRzzD8e/9ETrJ1GAYa78tNopYhY6AbGlv4
 U01nIC93bK07O4IhtBAKsiUz3JPX/KA/dXJOC86qP373cVWVYPvZW+KOya9/7rz0MGR1az9G
 HqJB7q7DVcCQKt9Egae/goznnXbET6ivCNKbqkH3n/JpiPIxkaXVrbn3QlVtzYpROsS/pCOp
 5Evig7kql5L0aYJIZs4zBFsKioYWCSsGAQQB2kcPAQEHQFCKEG5pCgebryz66pTa9eAo+r8y
 TkMEEnG8UR5oWFt3wsIbBBgBCAAgFiEEvx38ClaPBfeVdXCQvWpQHLeLfCYFAlsKioYCGwIA
 rwkQvWpQHLeLfCaNIAQZFggAHRYhBBTDHErITmX+em3wBGIQbFEb9KXbBQJbCoqGACEJEGIQ
 bFEb9KXbFiEEFMMcSshOZf56bfAEYhBsURv0pdvELgD/U+y3/hsz0bIjMQJY0LLxM/rFY9Vz
 1L43+lQHXjL3MPsA/1lNm5sailsY7aFBVJxAzTa8ZAGWBdVaGo6KCvimDB8GFiEEvx38ClaP
 BfeVdXCQvWpQHLeLfCbuOg/+PH6gY6Z1GiCzuYb/8f7D0NOcF8+md+R6KKiQZij/6G5Y7lXQ
 Bz21Opl4Vz/+39i5gmfBa9LRHH4ovR9Pd6H0FCjju4XjIOJkiJYs2HgCCm6nUxRJWzPgyMPS
 VbqCG2ctwaUiChUdbS+09bWb2MBNjIlI4b8wLWIOtxhyn25Vifm0p+QR5A2ym4bqJJ9LSre1
 qM8qdPWcnExPFU4PZFYQgZ9pX1Jyui73ZUP94L7/wg1GyJZL3ePeE4ogBXldE0g0Wq3ORqA9
 gA/yvrCSyNKOHTV9JMGnnPGN+wjBYMPMOuqDPC/zcK+stdFXc6UbUM1QNgDnaomvjuloflAx
 aYdblM26gFfypvpFb8czcPM+BP6X6vWk+Mw9+8vW3tyK9lSg+43OjIWlBGPpO9aLZsYYxAqv
 J5iSxcbbOLb5q8wWct6U7EZ1RnuOfVInoBttrlYvdWtcI/5NQTptkuB/DyRhrxBJc/fKzJ4w
 jS2ikcWe0FnxrQpcE2yqoUIFaZMdd/Cx9bRWAGZG087t5dUHJuMnVVcpHZFnHBKr8ag1eH/K
 tFdDFtyln5A/f9O22xsV0pyJni7e2z7lTBitrQFG69vnVGJlHbBE2dR4GddZqAlVOUbtEcE7
 /aMk4TrCtx0IyOzQiLA81aaJWhkD3fRO8cDlR4YQ3F0aqjYy8x1EnnhhohHOwU0EVaN9oQEQ
 AMPNymBNoCWc13U6qOztXrIKBVsLGZXq/yOaR2n7gFbFACD0TU7XuH2UcnwvNR+uQFwSrRqa
 EczX2V6iIy2CITXKg5Yvg12yn09gTmafuoIyKoU16XvC3aZQQ2Bn3LO2sRP0j/NuMD9GlO37
 pHCVRpI2DPxFE39TMm1PLbHnDG8+lZql+dpNwWw8dDaRgyXx2Le542CcTBT52VCeeWDtqd2M
 wOr4LioYlfGfAqmwcwucBdTEBUxklQaOR3VbJQx6ntI2oDOBlNGvjnVDzZe+iREd5l40l+Oj
 TaiWvBGXkv6OI+wx5TFPp+BM6ATU+6UzFRTUWbj+LqVA/JMqYHQp04Y4H5GtjbHCa8abRvBw
 IKEvpwTyWZlfXPtp8gRlNmxYn6gQlTyEZAWodXwE7CE+KxNnq7bPHeLvrSn8bLNK682PoTGr
 0Y00bguYLfyvEwuDYek1/h9YSXtHaCR3CEj4LU1B561G1j7FVaeYbX9bKBAoy/GxAW8J5O1n
 mmw7FnkSHuwO/QDe0COoO0QZ620Cf9IBWYHW4m2M2yh5981lUaiMcNM2kPgsJFYloFo2XGn6
 lWU9BrWjEoNDhHZtF+yaPEuwjZo6x/3E2Tu3E5Jj0VpVcE9U1Zq/fquDY79l2RJn5ENogOs5
 +Pi0GjVpEYQVWfm0PTCxNPOzOzGR4QB3BNFvABEBAAHCwZMEGAEIACYCGwwWIQS/HfwKVo8F
 95V1cJC9alAct4t8JgUCXk7nGAUJEhFq9wAhCRC9alAct4t8JhYhBL8d/ApWjwX3lXVwkL1q
 UBy3i3wmVBwP/RNNux3dC513quZ0hFyU6ZDTxbiafprLN2PXhmLslxPktJgW/xO5xp16OXkW
 YgNI/TKxj3+oSu+MhEAhAFA2urFWHyqedfqdndQTzbv4yqNuyhGupzPBWNSqqJ2NwKJc9f2R
 wqYTXVYIO+6KLa32rpl7xvJISkx06s70lItFJjyOf6Hn1y5RBMwQN9hP2YxLhYNO3rmlNSVy
 7Z/r95lZTDnnUCuxBZxnjx/pMHJ8LZtKY0t7D0esA+zYGUrmoAGUpNWEBP+uSL+f8rhjSAL0
 HgoRL39ixg5Bm0MzJn9z3or++Pl5bRnSvHy6OKh7rzTjCwaGoZD+6LHBwPFPlmInX1H+yHrX
 lu1uPAdqG5xcsZAZFTxBRMEnYu1yYebDSA9x+iulggMZQcWC2GvHCaKIpKcFY8XCxk7Hbl5c
 8hcPKWOy16NLO6Y66Ws4kMedXuNUHe4zBLVlRbcYUdgT9Brw8nxmxu3KhEVsJkwOpXLUDuzo
 hQNfg9em95lpAK+VOTocke8PSESy3GbEtmoMueW3caSeDHb5dRP6WrndaYhEOzAA/KjuPU7J
 LMXOABOMIq+R38y7e2B3TnVDCrccdZDseFPUWmH0cGCGihH/j2UZG+PImrSDCh3h5MedVHGo
 sI62tmWm0q6lrljwSZmMZ30w1QaGmdFpI3Q6V+nZ7TZldI3x
Message-ID: <f599f5f7-4023-10c0-a582-4dce2a601b95@gmail.com>
Date:   Fri, 6 Mar 2020 21:20:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1583502010-16210-4-git-send-email-nbelin@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Nicolas,

On 3/6/20 2:40 PM, Nicolas Belin wrote:
> Initilial commit in order to support the apa102c RGB leds. The
> RGB and global brightness management is done by creating 4 leds
> from the Led Framework per apa102c led.
> 
> Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
> ---
>  drivers/leds/Kconfig        |  11 ++
>  drivers/leds/Makefile       |   1 +
>  drivers/leds/leds-apa102c.c | 306 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 318 insertions(+)
>  create mode 100644 drivers/leds/leds-apa102c.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index d82f1dea3711..28fa6c4f65cc 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -69,6 +69,17 @@ config LEDS_AN30259A
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called leds-an30259a.
>  
> +config LEDS_APA102C
> +	tristate "LED Support for Shiji APA102C"
> +	depends on SPI
> +	depends on LEDS_CLASS
> +	help
> +	  This option enables support for the APA102C RGB LEDs
> +	  from Shiji Lighting.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called leds-apa102c.
> +
>  config LEDS_APU
>  	tristate "Front panel LED support for PC Engines APU/APU2/APU3 boards"
>  	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index d7e1107753fb..28dfe82900c5 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -88,6 +88,7 @@ obj-$(CONFIG_LEDS_LM36274)		+= leds-lm36274.o
>  obj-$(CONFIG_LEDS_TPS6105X)		+= leds-tps6105x.o
>  
>  # LED SPI Drivers
> +obj-$(CONFIG_LEDS_APA102C)		+= leds-apa102c.o
>  obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
>  obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
>  obj-$(CONFIG_LEDS_EL15203000)		+= leds-el15203000.o
> diff --git a/drivers/leds/leds-apa102c.c b/drivers/leds/leds-apa102c.c
> new file mode 100644
> index 000000000000..0043e7a6235b
> --- /dev/null
> +++ b/drivers/leds/leds-apa102c.c
> @@ -0,0 +1,306 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/spi/spi.h>
> +#include <uapi/linux/uleds.h>
> +#include "leds.h"
> +
> +/*
> + * Copyright (C) 2020 BayLibre, SAS
> + * Author: Nicolas Belin <nbelin@baylibre.com>
> + */
> +
> +/*
> + *  APA102C SPI protocol description:
> + *  +------+----------------------------------------+------+
> + *  |START |               DATA FIELD:              | END  |
> + *  |FRAME |               N LED FRAMES             |FRAME |
> + *  +------+------+------+------+------+-----+------+------+
> + *  | 0*32 | LED1 | LED2 | LED3 | LED4 | --- | LEDN | 1*32 |
> + *  +------+------+------+------+------+-----+------+------+
> + *
> + *  +-----------------------------------+
> + *  |START FRAME 32bits                 |
> + *  +--------+--------+--------+--------+
> + *  |00000000|00000000|00000000|00000000|
> + *  +--------+--------+--------+--------+
> + *
> + *  +------------------------------------+
> + *  |LED  FRAME 32bits                   |
> + *  +---+-----+--------+--------+--------+
> + *  |111|LUMA |  BLUE  | GREEN  |  RED   |
> + *  +---+-----+--------+--------+--------+
> + *  |3b |5bits| 8bits  | 8bits  | 8bits  |
> + *  +---+-----+--------+--------+--------+
> + *  |MSB   LSB|MSB  LSB|MSB  LSB|MSB  LSB|
> + *  +---+-----+--------+--------+--------+
> + *
> + *  +-----------------------------------+
> + *  |END FRAME 32bits                   |
> + *  +--------+--------+--------+--------+
> + *  |11111111|11111111|11111111|11111111|
> + *  +--------+--------+--------+--------+
> + */
> +
> +/* apa102c default settings */
> +#define GLOBAL_MAX_BRIGHTNESS	GENMASK(4, 0)
> +#define RGB_MAX_BRIGHTNESS	GENMASK(7, 0)
> +#define START_BYTE		0
> +#define END_BYTE		GENMASK(7, 0)
> +#define LED_FRAME_HEADER	GENMASK(7, 5)
> +
> +struct apa102c_led {
> +	struct apa102c		*priv;
> +	char			name[LED_MAX_NAME_SIZE];

This is not needed, LED core takes care of parsing LED name.

> +	int			color_id;
> +	struct led_classdev	cdev;
> +};
> +
> +struct apa102c_rgbled {
> +	/* the 4 components of the apa102c rgb led:
> +	 * global brightness, blue, green and red in that order
> +	 */
> +	struct apa102c_led	component[4];
> +};
> +
> +struct apa102c {
> +	size_t			led_count;
> +	struct device		*dev;
> +	struct mutex		lock;
> +	struct spi_device	*spi;
> +	u8			*spi_buf;
> +	struct apa102c_rgbled	rgb_leds[];
> +};
> +
> +static int apa102c_sync(struct apa102c *priv)
> +{
> +	int	ret;
> +	size_t	i;
> +	struct apa102c_rgbled *leds = priv->rgb_leds;
> +	u8	*buf = priv->spi_buf;
> +
> +	/* creating the data that will be sent to all the leds at once */
> +	for (i = 0; i < 4; i++)
> +		*buf++ = START_BYTE;
> +
> +	/* looping on each RGB led component, getting the global brightness
> +	 * then B, G and R values
> +	 */
> +	for (i = 0; i < priv->led_count; i++) {
> +		*buf++ = LED_FRAME_HEADER |
> +			 leds[i].component[0].cdev.brightness;
> +		*buf++ = leds[i].component[1].cdev.brightness;
> +		*buf++ = leds[i].component[2].cdev.brightness;
> +		*buf++ = leds[i].component[3].cdev.brightness;
> +	}

The problem is that in the monochrome LED approach (i.e. the only
available one) you have to alter the state of only one LED - that
on behalf of which the call is made.

And anyway, you're doing here much too much, taking into account
that this function is called from brightness_set op.

Isn't it possible to update only one LED ?

> +
> +	for (i = 0; i < 4; i++)
> +		*buf++ = END_BYTE;
> +
> +	ret = spi_write(priv->spi, priv->spi_buf,
> +			(priv->led_count + 2) * sizeof(u32));
> +
> +	return ret;
> +}
> +
> +static int apa102c_brightness_set(struct led_classdev *cdev,
> +			   enum led_brightness brightness)
> +{
> +	int			ret;
> +	struct apa102c_led	*led = container_of(cdev,
> +						    struct apa102c_led,
> +						    cdev);
> +
> +	mutex_lock(&led->priv->lock);
> +	/* updating the brightness then synching all the leds */
> +	cdev->brightness = brightness;

LED core handles that. Please drop this assignment.

> +	ret = apa102c_sync(led->priv);
> +	mutex_unlock(&led->priv->lock);
> +
> +	return ret;
> +}
> +
> +static int apa102c_probe_dt(struct apa102c *priv)
> +{
> +	int			ret = 0;
> +	u32			i;
> +	struct apa102c_rgbled	*rgb_led;
> +	struct apa102c_led	*led;
> +	struct fwnode_handle	*child;
> +	const char		*rgb_led_name;
> +	const char		*led_component_name;
> +
> +	/* each node corresponds to an rgb led */
> +	device_for_each_child_node(priv->dev, child) {
> +
> +		ret = fwnode_property_read_u32(child, "reg", &i);
> +		if (ret) {
> +			dev_err(priv->dev, "coudld not read reg %d\n", ret);
> +			goto child_out;
> +		}
> +
> +		if (i >= priv->led_count) {
> +			ret = -EINVAL;
> +			dev_err(priv->dev, "reg value too big\n");
> +			goto child_out;
> +		}
> +
> +		rgb_led = &priv->rgb_leds[i];
> +		/* checking if this led config is already used by checking if
> +		 * the priv member of the global_brightness led as already
> +		 * been set
> +		 */
> +		if (rgb_led->component[0].priv) {
> +			ret = -EINVAL;
> +			dev_err(priv->dev, "using the same reg value twice\n");
> +			goto child_out;
> +		}
> +
> +		ret = fwnode_property_read_string(child, "label",
> +						  &rgb_led_name);
> +		if (ret) {
> +			ret = -EINVAL;
> +			dev_err(priv->dev, "missing rgb led name\n");
> +			goto child_out;
> +		}
> +
> +		/* setting a color_id value for each of the 4 components of the
> +		 * apa102c RGB led. The first component is the global brightness
> +		 * of the led and thus has no color. The order of the colors
> +		 * after the global brightness is then blue, green and red
> +		 * in that order. It corresponds to the order in which the
> +		 * values are sent using spi
> +		 */
> +		rgb_led->component[0].color_id = -1; //no color
> +		rgb_led->component[1].color_id = LED_COLOR_ID_BLUE;
> +		rgb_led->component[2].color_id = LED_COLOR_ID_GREEN;
> +		rgb_led->component[3].color_id = LED_COLOR_ID_RED;

Each LED has to have separate DT node. We haven't had so far use case
with global brightness but I think it would be OK to add
LED_COLOR_ID_LUMA for that. But please hold on with making any changes
until Pavel will express his opinion on that.

> +
> +		/* now looping on each component and registering a corresponding
> +		 * led
> +		 */
> +		for (i = 0; i < 4; i++) {
> +			led = &rgb_led->component[i];
> +			if (led->color_id == -1) {
> +				/* the global brightness has no defined name
> +				 * so setting it to "brightness". It also has
> +				 * a different MAX_BRIGHTNESS value.
> +				 * If a trigger is present, setting it on this
> +				 * component
> +				 */
> +				led->cdev.max_brightness =
> +					GLOBAL_MAX_BRIGHTNESS;
> +				led_component_name = "brightness";
> +				fwnode_property_read_string(child,
> +					"linux,default-trigger",
> +					&led->cdev.default_trigger);
> +			} else {
> +				/* using the color name defined by the framework
> +				 * for the B, G and R components
> +				 */
> +				led->cdev.max_brightness = RGB_MAX_BRIGHTNESS;
> +				led_component_name = led_colors[led->color_id];
> +			}
> +
> +			/* the rest is common to all the components */
> +			led->priv = priv;
> +			led->cdev.brightness_set_blocking =
> +				apa102c_brightness_set;
> +			/* creating our own led name to differentiate the 4
> +			 * components
> +			 */
> +			snprintf(led->name, sizeof(led->name),
> +				 "%s_%s", rgb_led_name, led_component_name);
> +			led->cdev.name = led->name;
> +

LED core can do the above for you, if only you provide it with LED
fwnode.

> +			ret = devm_led_classdev_register_ext(priv->dev,
> +							     &led->cdev,
> +							     NULL);

There is no point in using *ext API and not passing led_init_data to it.
Please pass struct led_init_data in the third argument, with initialized
only its fwnode property.

> +			if (ret) {
> +				dev_err(priv->dev, "led register err: %d\n",
> +					ret);
> +				goto child_out;
> +			}
> +		}
> +	}
> +
> +child_out:
> +	return ret;
> +}
> +
> +static int apa102c_probe(struct spi_device *spi)
> +{
> +	struct apa102c	*priv;
> +	size_t		led_count;
> +	int		ret;
> +
> +	led_count = device_get_child_node_count(&spi->dev);
> +	if (!led_count) {
> +		dev_err(&spi->dev, "No LEDs defined in device tree!");
> +		return -ENODEV;
> +	}
> +
> +	priv = devm_kzalloc(&spi->dev,
> +			    struct_size(priv, rgb_leds, led_count),
> +			    GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->spi_buf = devm_kzalloc(&spi->dev,
> +				     (led_count + 2) * sizeof(u32),
> +				      GFP_KERNEL);
> +	if (!priv->spi_buf)
> +		return -ENOMEM;
> +
> +	mutex_init(&priv->lock);
> +	priv->led_count	= led_count;
> +	priv->dev	= &spi->dev;
> +	priv->spi	= spi;
> +
> +	ret = apa102c_probe_dt(priv);
> +	if (ret)
> +		return ret;
> +
> +	/* Set the LEDs with default values at start */
> +	apa102c_sync(priv);
> +	if (ret)
> +		return ret;
> +
> +	spi_set_drvdata(spi, priv);
> +
> +	return 0;
> +}
> +
> +static int apa102c_remove(struct spi_device *spi)
> +{
> +	struct apa102c *priv = spi_get_drvdata(spi);
> +
> +	mutex_destroy(&priv->lock);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id apa102c_dt_ids[] = {
> +	{ .compatible = "shiji,apa102c", },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, apa102c_dt_ids);
> +
> +static struct spi_driver apa102c_driver = {
> +	.probe		= apa102c_probe,
> +	.remove		= apa102c_remove,
> +	.driver = {
> +		.name		= KBUILD_MODNAME,
> +		.of_match_table	= apa102c_dt_ids,
> +	},
> +};
> +
> +module_spi_driver(apa102c_driver);
> +
> +MODULE_AUTHOR("Nicolas Belin <nbelin@baylibre.com>");
> +MODULE_DESCRIPTION("apa102c LED driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("spi:apa102c");
> 

-- 
Best regards,
Jacek Anaszewski
