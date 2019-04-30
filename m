Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAA9510066
	for <lists+linux-leds@lfdr.de>; Tue, 30 Apr 2019 21:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726006AbfD3TqS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 30 Apr 2019 15:46:18 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55780 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbfD3TqS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 Apr 2019 15:46:18 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3UJk6mp078600;
        Tue, 30 Apr 2019 14:46:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1556653566;
        bh=SfuygtMjHlFQN9FLctx4IJLSFx3lZnSA0tMJSjriQHU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=mzwYkMqD/vd+KDGbyLjbAXootNzF1F3G1L+R5j2hTWV9MzhKSm+MSuhb4JnrZvSlx
         e+eHV7jBxpj/8gmVnCDX/gK3ArapomZgf3RUroTVb9XFKy0mhcgH6CD3weAazw248e
         c9Lj5xqnyWD419Nzu82hDn50+eAHHz/hhgNIsv6s=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3UJk63Q120271
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 30 Apr 2019 14:46:06 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 30
 Apr 2019 14:46:06 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 30 Apr 2019 14:46:06 -0500
Received: from [10.250.90.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3UJk6PV046656;
        Tue, 30 Apr 2019 14:46:06 -0500
Subject: Re: [PATCH leds/for-next v2 2/2] leds: turris-omnia: Add support for
 256 brightness values
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
        <linux-leds@vger.kernel.org>
CC:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
References: <20190429212944.15643-1-marek.behun@nic.cz>
 <20190429212944.15643-3-marek.behun@nic.cz>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <87eafec0-b074-689d-20b6-171a866745ea@ti.com>
Date:   Tue, 30 Apr 2019 14:46:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429212944.15643-3-marek.behun@nic.cz>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Marek

On 4/29/19 4:29 PM, Marek Behún wrote:
> The controller supports setting brightness of each channel of the RGB
> LEDs to values 0-255. We do not support RGB LED class yet, but we can
> use this to be able to have 256 brightness levels for each LED, instead
> of just on/off state.
> 
> Also add code to set all LEDs color to [255, 255, 255] on driver unbind.
> 
> Signed-off-by: Marek Behún <marek.behun@nic.cz>
> ---
>  drivers/leds/Kconfig             |  4 ++--
>  drivers/leds/leds-turris-omnia.c | 21 +++++++++++++++++++--
>  2 files changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 3747cbd0de2c..62d17c2f4878 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -139,8 +139,8 @@ config LEDS_TURRIS_OMNIA
>  	  side of CZ.NIC's Turris Omnia router. There are 12 RGB LEDs on the
>  	  front panel.
>  	  This driver does not currently support setting LED colors, only
> -	  on/off state. Also HW triggering is disabled when the controller
> -	  is probed by this driver.
> +	  brightness. Also HW triggering is disabled when the controller is
> +	  probed by this driver.
>  

I am not seeing where or how this is done in the driver on probe.

>  config LEDS_LM3530
>  	tristate "LCD Backlight driver for LM3530"
> diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
> index dc9fac56b13a..0e805d94f298 100644
> --- a/drivers/leds/leds-turris-omnia.c
> +++ b/drivers/leds/leds-turris-omnia.c
> @@ -54,7 +54,7 @@ static int omnia_led_brightness_set_blocking(struct led_classdev *led,
>  	struct omnia_leds *leds = dev_get_drvdata(led->dev->parent);
>  	int idx = omnia_led_idx(leds, led);
>  	int ret;
> -	u8 state;
> +	u8 buf[5], state;

Magic numbers

>  
>  	if (idx < 0)
>  		return idx;
> @@ -63,8 +63,16 @@ static int omnia_led_brightness_set_blocking(struct led_classdev *led,
>  	if (brightness)
>  		state |= CMD_LED_STATE_ON;
>  
> +	buf[0] = CMD_LED_COLOR;
> +	buf[1] = idx;
> +	buf[2] = buf[3] = buf[4] = brightness;
> +
>  	mutex_lock(&leds->lock);
> +
>  	ret = i2c_smbus_write_byte_data(leds->client, CMD_LED_STATE, state);
> +	if (ret >= 0 && brightness)
> +		ret = i2c_master_send(leds->client, buf, 5);
> +

What happens if the LEDs are in HW triggered mode already?
Should this not be checked especially if the driver is removed and re-installed the uP has
this configured as HW mode.  Unless you reset the uP as well.

>  	mutex_unlock(&leds->lock);
>  
>  	return ret;
> @@ -97,7 +105,7 @@ static int omnia_led_register(struct omnia_leds *leds,
>  	ret = fwnode_property_read_string(node, "label", &str);
>  	snprintf(led->name, sizeof(led->name), "omnia::%s", ret ? "" : str);
>  
> -	led->cdev.max_brightness = 1;
> +	led->cdev.max_brightness = 255;

How about LED_FULL?

>  	led->cdev.brightness_set_blocking = omnia_led_brightness_set_blocking;
>  	led->cdev.name = led->name;
>  
> @@ -166,10 +174,19 @@ static int omnia_leds_probe(struct i2c_client *client,
>  
>  static int omnia_leds_remove(struct i2c_client *client)
>  {
> +	u8 buf[5];
> +
>  	/* put all LEDs into default (HW triggered) mode */
>  	i2c_smbus_write_byte_data(client, CMD_LED_MODE,
>  				  CMD_LED_MODE_LED(OMNIA_BOARD_LEDS));
>  
> +	/* set all LEDs color to [255, 255, 255] */
> +	buf[0] = CMD_LED_COLOR;
> +	buf[1] = OMNIA_BOARD_LEDS;
> +	buf[2] = buf[3] = buf[4] = 255;
> +

LED_FULL for this as above.

Dan

> +	i2c_master_send(client, buf, 5);
> +
>  	return 0;
>  }
>  
> 
