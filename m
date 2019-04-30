Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E072A10248
	for <lists+linux-leds@lfdr.de>; Wed,  1 May 2019 00:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfD3WWG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 30 Apr 2019 18:22:06 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37457 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbfD3WWF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 Apr 2019 18:22:05 -0400
Received: by mail-lf1-f68.google.com with SMTP id h126so12064473lfh.4
        for <linux-leds@vger.kernel.org>; Tue, 30 Apr 2019 15:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=Xn6PPPBimUZYZ7WzVjvqvz9I0W0uWAQcgUE2uBXZLxs=;
        b=P5MFXPpfEO33qofmDIZ5EKZXQg8/T9n6TjpRmnPOzLKiH02SxQ0vmbtgK2bf/fFR1r
         TNCZbsGc7W+13btSszKZhw8NGad2BUFcYs+fUtLbeGkCcAuw9zzcyCWEQFMjkU8T1yJp
         btny+wkN6MA76nevwL8ueFy7Wvlwo6l7FvOPl6XC27SCtBQWrRDoP8BbLaXqMORgyzpw
         YPgR5ItyEjCLXlppzzyxD7qSIm7HTCYIKeROlS8Af97h+glSghpehuBnES+NH1DKvMcm
         ESdQURSBrFy8hwlE4mNK8bWQSghDNEPcmooNWfwgrKu9kQ1hvWAt2EejE4Fxalw/dE26
         k5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Xn6PPPBimUZYZ7WzVjvqvz9I0W0uWAQcgUE2uBXZLxs=;
        b=QnY38a8X1myNTItUDQM9qVLtVXsP001mr2JlxJQ8bVxbo20o3E7WnNmpOLhYgM3S6c
         eEQ26PEv7E478K3fHx8N+vHg9r2H+rqgSVvRQAKEonswU8SbB4aE0M21ON23zr4m8tca
         X2jTZbI4/dRuV2JSrM8vFDD3BPMqUTxaiHUnFsgzers+Qcb5jsLKCeyqtxBYQD2npsu2
         oOaIicgwymv1a75ZvtC0ffGHyCZyCr7FYgguy/cGpBZ2UvPAhOjimsC4bfSkATUAHVwj
         G6pq1UVCIhNvhGLcLnXvnQIjfpeu1/clMqcYLqpBMIeDYcjd3PL8TtvwtPZRrS5XSZgU
         t03Q==
X-Gm-Message-State: APjAAAW1pyOgteX9PLT28EhRH41VEl/JLHCo3cQA6+/ze3CRyYli3hMt
        tFmIbMm9zk83h+enXKfJ3clOXlJH
X-Google-Smtp-Source: APXvYqyG6JCnQGu/qP7KLvnf9pFDj1qUOl6xBdo3DNqst5JoWSRilnlwaCILUj9iAa2FjJkYqu/DAQ==
X-Received: by 2002:a19:f703:: with SMTP id z3mr37051619lfe.119.1556662923245;
        Tue, 30 Apr 2019 15:22:03 -0700 (PDT)
Received: from [192.168.1.19] (chf176.neoplus.adsl.tpnet.pl. [83.31.3.176])
        by smtp.gmail.com with ESMTPSA id b25sm2917859lji.50.2019.04.30.15.22.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 15:22:02 -0700 (PDT)
Subject: Re: [PATCH leds/for-next v2 2/2] leds: turris-omnia: Add support for
 256 brightness values
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
        linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>
References: <20190429212944.15643-1-marek.behun@nic.cz>
 <20190429212944.15643-3-marek.behun@nic.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <d2a11183-896c-679f-27c9-4abbba1cb087@gmail.com>
Date:   Wed, 1 May 2019 00:22:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429212944.15643-3-marek.behun@nic.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Marek, Pavel,

On 4/29/19 11:29 PM, Marek Behún wrote:
> The controller supports setting brightness of each channel of the RGB
> LEDs to values 0-255. We do not support RGB LED class yet, but we can
> use this to be able to have 256 brightness levels for each LED, instead
> of just on/off state.
> 
> Also add code to set all LEDs color to [255, 255, 255] on driver unbind.
> 
> Signed-off-by: Marek Behún <marek.behun@nic.cz>
> ---
>   drivers/leds/Kconfig             |  4 ++--
>   drivers/leds/leds-turris-omnia.c | 21 +++++++++++++++++++--
>   2 files changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 3747cbd0de2c..62d17c2f4878 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -139,8 +139,8 @@ config LEDS_TURRIS_OMNIA
>   	  side of CZ.NIC's Turris Omnia router. There are 12 RGB LEDs on the
>   	  front panel.
>   	  This driver does not currently support setting LED colors, only
> -	  on/off state. Also HW triggering is disabled when the controller
> -	  is probed by this driver.
> +	  brightness. Also HW triggering is disabled when the controller is
> +	  probed by this driver.
>   
>   config LEDS_LM3530
>   	tristate "LCD Backlight driver for LM3530"
> diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
> index dc9fac56b13a..0e805d94f298 100644
> --- a/drivers/leds/leds-turris-omnia.c
> +++ b/drivers/leds/leds-turris-omnia.c
> @@ -54,7 +54,7 @@ static int omnia_led_brightness_set_blocking(struct led_classdev *led,
>   	struct omnia_leds *leds = dev_get_drvdata(led->dev->parent);
>   	int idx = omnia_led_idx(leds, led);
>   	int ret;
> -	u8 state;
> +	u8 buf[5], state;
>   
>   	if (idx < 0)
>   		return idx;
> @@ -63,8 +63,16 @@ static int omnia_led_brightness_set_blocking(struct led_classdev *led,
>   	if (brightness)
>   		state |= CMD_LED_STATE_ON;
>   
> +	buf[0] = CMD_LED_COLOR;
> +	buf[1] = idx;
> +	buf[2] = buf[3] = buf[4] = brightness;
> +
>   	mutex_lock(&leds->lock);
> +
>   	ret = i2c_smbus_write_byte_data(leds->client, CMD_LED_STATE, state);
> +	if (ret >= 0 && brightness)
> +		ret = i2c_master_send(leds->client, buf, 5);
> +
>   	mutex_unlock(&leds->lock);
>   
>   	return ret;
> @@ -97,7 +105,7 @@ static int omnia_led_register(struct omnia_leds *leds,
>   	ret = fwnode_property_read_string(node, "label", &str);
>   	snprintf(led->name, sizeof(led->name), "omnia::%s", ret ? "" : str);
>   
> -	led->cdev.max_brightness = 1;
> +	led->cdev.max_brightness = 255;
>   	led->cdev.brightness_set_blocking = omnia_led_brightness_set_blocking;
>   	led->cdev.name = led->name;
>   
> @@ -166,10 +174,19 @@ static int omnia_leds_probe(struct i2c_client *client,
>   
>   static int omnia_leds_remove(struct i2c_client *client)
>   {
> +	u8 buf[5];
> +
>   	/* put all LEDs into default (HW triggered) mode */
>   	i2c_smbus_write_byte_data(client, CMD_LED_MODE,
>   				  CMD_LED_MODE_LED(OMNIA_BOARD_LEDS));
>   
> +	/* set all LEDs color to [255, 255, 255] */
> +	buf[0] = CMD_LED_COLOR;
> +	buf[1] = OMNIA_BOARD_LEDS;
> +	buf[2] = buf[3] = buf[4] = 255;
> +
> +	i2c_master_send(client, buf, 5);
> +
>   	return 0;
>   }

I wonder if we're doing right merging this driver in this form.
We break the rule one-led-class-device-per-one-channel.
We don't have LED multi color support yet, so this should support
RGB LEDs in the old manner. Or switch to using LED multi color class.

Once we will have LED multi color class, we will be able to add
the support for it to the driver and make the driver configurable
to be able to expose old interface or the LED multi color one.

Moreover, the bindings should use led-sources property for grouping
three channels under single LED class device. This is certainly
to be fixed.

-- 
Best regards,
Jacek Anaszewski
