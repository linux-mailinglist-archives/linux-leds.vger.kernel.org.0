Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3A2780A31
	for <lists+linux-leds@lfdr.de>; Fri, 18 Aug 2023 12:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358818AbjHRKcF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Aug 2023 06:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376309AbjHRKak (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Aug 2023 06:30:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88056448F
        for <linux-leds@vger.kernel.org>; Fri, 18 Aug 2023 03:30:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3807867919
        for <linux-leds@vger.kernel.org>; Fri, 18 Aug 2023 10:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C58E0C433CB;
        Fri, 18 Aug 2023 10:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692354607;
        bh=rWhS8C5lIvHPIs1NyCe7wD8bfze3TEmb3dfUIr0C5Ew=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XYvai6iX8I235rCY0ChvgnN2jROizG3qQhzkk5v6pi5p1eXWJlLOaOWbF1c+zSw9L
         W7aw1iOcZldbMAjpGpXI4b/n/cVj5GNQcJIIYHueOG5Zz3mlT/aAQhDXIe759JyzT3
         MuOwbaPm61f2K0psxPU0Hky+ONw08aUNQVQ6JWB/Bbc5YDypLoU0i2q3pLIIm7QTGk
         pme3K0HAJNwx1oNy6LT2Xkg/lFR9yhpLLS7x04OVn3N7o5C7g1Qpxaxo8dTLqo1Izv
         3C+H4bJGtTrKoOOMCqsS5jfc+cWUFij73a2s1X/T6Uv92b2SL4yRBQBmoSky6RFpWQ
         nt66cEI8h9w7Q==
Date:   Fri, 18 Aug 2023 11:30:03 +0100
From:   Lee Jones <lee@kernel.org>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 6/6] leds: turris-omnia: add support for
 enabling/disabling HW gamma correction
Message-ID: <20230818103003.GS986605@google.com>
References: <20230802160748.11208-1-kabel@kernel.org>
 <20230802160748.11208-7-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230802160748.11208-7-kabel@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 02 Aug 2023, Marek Behún wrote:

> If the MCU on Turris Omnia is running newer firmware versions, the LED
> controller supports RGB gamma correction (and enables it by default for
> newer boards).
> 
> Determine whether the gamma correction setting feature is supported and
> add the ability to set it via sysfs attribute file.
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>  .../sysfs-class-led-driver-turris-omnia       |  14 ++
>  drivers/leds/leds-turris-omnia.c              | 135 +++++++++++++++---
>  2 files changed, 132 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led-driver-turris-omnia b/Documentation/ABI/testing/sysfs-class-led-driver-turris-omnia
> index c4d46970c1cf..369b4ae8be5f 100644
> --- a/Documentation/ABI/testing/sysfs-class-led-driver-turris-omnia
> +++ b/Documentation/ABI/testing/sysfs-class-led-driver-turris-omnia
> @@ -12,3 +12,17 @@ Description:	(RW) On the front panel of the Turris Omnia router there is also
>  		able to change this setting from software.
>  
>  		Format: %i
> +
> +What:		/sys/class/leds/<led>/device/gamma_correction
> +Date:		August 2023
> +KernelVersion:	6.6
> +Contact:	Marek Behún <kabel@kernel.org>
> +Description:	(RW) Newer versions of the microcontroller firmware of the
> +		Turris Omnia router support gamma correction for the RGB LEDs.
> +		This feature can be enabled/disabled by writing to this file.
> +
> +		If the feature is not supported because the MCU firmware is too
> +		old, the file always reads as 0, and writing to the file results
> +		in the EOPNOTSUPP error.
> +
> +		Format: %i
> diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
> index 180b0cbeb92e..75cc7d2cf6d1 100644
> --- a/drivers/leds/leds-turris-omnia.c
> +++ b/drivers/leds/leds-turris-omnia.c
> @@ -15,17 +15,30 @@
>  #define OMNIA_BOARD_LEDS	12
>  #define OMNIA_LED_NUM_CHANNELS	3
>  
> -#define CMD_LED_MODE		3
> -#define CMD_LED_MODE_LED(l)	((l) & 0x0f)
> -#define CMD_LED_MODE_USER	0x10
> +/* MCU controller commands at I2C address 0x2a */
> +#define OMNIA_MCU_I2C_ADDR		0x2a
>  
> -#define CMD_LED_STATE		4
> -#define CMD_LED_STATE_LED(l)	((l) & 0x0f)
> -#define CMD_LED_STATE_ON	0x10
> +#define CMD_GET_STATUS_WORD		0x01
> +#define STS_FEATURES_SUPPORTED		BIT(2)
>  
> -#define CMD_LED_COLOR		5
> -#define CMD_LED_SET_BRIGHTNESS	7
> -#define CMD_LED_GET_BRIGHTNESS	8
> +#define CMD_GET_FEATURES		0x10
> +#define FEAT_LED_GAMMA_CORRECTION	BIT(5)
> +
> +/* LED controller commands at I2C address 0x2b */
> +#define CMD_LED_MODE			0x03
> +#define CMD_LED_MODE_LED(l)		((l) & 0x0f)
> +#define CMD_LED_MODE_USER		0x10
> +
> +#define CMD_LED_STATE			0x04
> +#define CMD_LED_STATE_LED(l)		((l) & 0x0f)
> +#define CMD_LED_STATE_ON		0x10
> +
> +#define CMD_LED_COLOR			0x05
> +#define CMD_LED_SET_BRIGHTNESS		0x07
> +#define CMD_LED_GET_BRIGHTNESS		0x08
> +
> +#define CMD_SET_GAMMA_CORRECTION	0x30
> +#define CMD_GET_GAMMA_CORRECTION	0x31
>  
>  struct omnia_led {
>  	struct led_classdev_mc mc_cdev;
> @@ -40,6 +53,7 @@ struct omnia_led {
>  struct omnia_leds {
>  	struct i2c_client *client;
>  	struct mutex lock;
> +	bool has_gamma_correction;
>  	struct omnia_led leds[];
>  };
>  
> @@ -53,30 +67,42 @@ static int omnia_cmd_write(const struct i2c_client *client, u8 cmd, u8 val)
>  	return ret < 0 ? ret : 0;
>  }
>  
> -static int omnia_cmd_read(const struct i2c_client *client, u8 cmd)
> +static int omnia_cmd_read_raw(struct i2c_adapter *adapter, u8 addr, u8 cmd,
> +			      void *reply, size_t len)
>  {
>  	struct i2c_msg msgs[2];
> -	u8 reply;
>  	int ret;
>  
> -	msgs[0].addr = client->addr;
> +	msgs[0].addr = addr;
>  	msgs[0].flags = 0;
>  	msgs[0].len = 1;
>  	msgs[0].buf = &cmd;
> -	msgs[1].addr = client->addr;
> +	msgs[1].addr = addr;
>  	msgs[1].flags = I2C_M_RD;
> -	msgs[1].len = 1;
> -	msgs[1].buf = &reply;
> +	msgs[1].len = len;
> +	msgs[1].buf = reply;
>  
> -	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> +	ret = i2c_transfer(adapter, msgs, ARRAY_SIZE(msgs));
>  	if (likely(ret == ARRAY_SIZE(msgs)))
> -		return reply;
> +		return 0;

Why not return ret and use that throughout?

>  	else if (ret < 0)
>  		return ret;
>  	else
>  		return -EIO;
>  }

[...]

-- 
Lee Jones [李琼斯]
