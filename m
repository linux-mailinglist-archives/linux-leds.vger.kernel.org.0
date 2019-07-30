Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42D6D7B4F3
	for <lists+linux-leds@lfdr.de>; Tue, 30 Jul 2019 23:25:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387719AbfG3VYq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 30 Jul 2019 17:24:46 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39808 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387649AbfG3VYq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 Jul 2019 17:24:46 -0400
Received: by mail-wm1-f65.google.com with SMTP id u25so47545651wmc.4;
        Tue, 30 Jul 2019 14:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nJsBGR+ALYgqMG2TrnaFS6K04dLow26SkqecBCKk0bY=;
        b=A02xuumaVCwWQrUE8VXhI+wMXBqKMAvWmIhgQOE5l1BEH+2n+1fta9LVzigPQlfcEp
         AVCbWKk1k9BTko5RuxiyMjrnIXTLkHJDaZopHybKSe6i7M89YDKWj5u9SpfqDuC44X9M
         sgvbCnO3gtSuovgkyns7wG4eHFsL/DvXiHra1Rb0mJA0t7lmYjRfG/iyngpqTKLUXpof
         P8zAopVQXujuQJsKlLdAA8xXe+f+V0QlxvkD5NhbmawLK0u+bfqGi4yH7y3wV55Kh/lf
         Z/qSbpgFlMUnq8dn3RjCWESin1eFZrqVhwog71PjhwHuW8ILKerH/Dj5U06bKkb+Dwad
         GrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=nJsBGR+ALYgqMG2TrnaFS6K04dLow26SkqecBCKk0bY=;
        b=Ib/cYOME0U9sBW62XIjjBe8CDZndhcSUK8M2tmmMNxzUf1u2tbFDL+F9RPmNxwYzNH
         maDm/tlJ4O+0LLdPNCgZF3ETZOxjQ+uHsczeiWStDDN3dfWwV4OhObNHOvWEUH6AXT6S
         JTl47/T59NAzq5p427YJiTAYuRqncl/oxFJovlXvSaFaMO17ywHGdGlBWjypyZO+p8E9
         kSXcrfCqQD2qXwoUKtEZ4Fsgm6GiIDqetH38UX7BVHiHCf3PpOyGWnfjqfj5SAp8izQz
         Owt28YnZRkVtSgqgwJ6IAwyByJD0fCYWjn8hQ4GKiI0fu8vCLfalk3w6J50b+v64zzIN
         L39w==
X-Gm-Message-State: APjAAAWC5C3mD9l+93Zm/fLTh7pgpxO1iNDd+sQE14K1WNJcHf6N02mH
        3m52RJVMVWfNhgO4rVLgo5IHAEyp
X-Google-Smtp-Source: APXvYqzrdqicbxZ9uCYRpAYGplvf4D621FpNtEsSvjZ8uPzFkY2Qt3c9LE/ROwgvvCBo3d0CIwQZtA==
X-Received: by 2002:a1c:cfc3:: with SMTP id f186mr100136971wmg.134.1564521882335;
        Tue, 30 Jul 2019 14:24:42 -0700 (PDT)
Received: from [192.168.1.19] (bkv20.neoplus.adsl.tpnet.pl. [83.28.189.20])
        by smtp.gmail.com with ESMTPSA id c30sm124987994wrb.15.2019.07.30.14.24.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jul 2019 14:24:41 -0700 (PDT)
Subject: Re: [PATCH v4 8/9] leds: lp50xx: Add the LP50XX family of the RGB LED
 driver
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190725182818.29556-1-dmurphy@ti.com>
 <20190725182818.29556-9-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <3cbb6e22-c71d-ad10-1976-216bd557ccd5@gmail.com>
Date:   Tue, 30 Jul 2019 23:24:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725182818.29556-9-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Dan,

Thank you for the patch  I see few things to improve.

On 7/25/19 8:28 PM, Dan Murphy wrote:
> Introduce the LP5036/30/24/18 RGB LED driver.
> The difference in these parts are the number of
> LED outputs where the:
> 
> LP5036 can control 36 LEDs
> LP5030 can control 30 LEDs
> LP5024 can control 24 LEDs
> LP5018 can control 18 LEDs
> 
> The device has the ability to group LED output into control banks
> so that multiple LED banks can be controlled with the same mixing and
> brightness.  Inversely the LEDs can also be controlled independently.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  drivers/leds/Kconfig       |   7 +
>  drivers/leds/Makefile      |   1 +
>  drivers/leds/leds-lp50xx.c | 789 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 797 insertions(+)
>  create mode 100644 drivers/leds/leds-lp50xx.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 7f780d5b8490..69c037020f6b 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -350,6 +350,13 @@ config LEDS_LP3952
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called leds-lp3952.
>  
> +config LEDS_LP50XX
> +	tristate "LED Support for TI LP5036/30/24/18 LED driver chip"
> +	depends on LEDS_CLASS && REGMAP_I2C
> +	help
> +	  If you say yes here you get support for the Texas Instruments
> +	  LP5036, LP5030, LP5024 and LP5018 LED driver.
> +
>  config LEDS_LP55XX_COMMON
>  	tristate "Common Driver for TI/National LP5521/5523/55231/5562/8501"
>  	depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 || LEDS_LP8501
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 897b810257dd..438a5499f3ee 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -34,6 +34,7 @@ obj-$(CONFIG_LEDS_GPIO_REGISTER)	+= leds-gpio-register.o
>  obj-$(CONFIG_LEDS_GPIO)			+= leds-gpio.o
>  obj-$(CONFIG_LEDS_LP3944)		+= leds-lp3944.o
>  obj-$(CONFIG_LEDS_LP3952)		+= leds-lp3952.o
> +obj-$(CONFIG_LEDS_LP50XX)		+= leds-lp50xx.o
>  obj-$(CONFIG_LEDS_LP55XX_COMMON)	+= leds-lp55xx-common.o
>  obj-$(CONFIG_LEDS_LP5521)		+= leds-lp5521.o
>  obj-$(CONFIG_LEDS_LP5523)		+= leds-lp5523.o
> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> new file mode 100644
> index 000000000000..5a32410e4f34
[...]
> +static int lp50xx_probe_dt(struct lp50xx *priv)
> +{
> +	u32 led_strings[LP5036_MAX_LED_MODULES];
> +	struct fwnode_handle *child = NULL;
> +	struct fwnode_handle *led_node = NULL;
> +	struct led_init_data init_data;
> +	struct lp50xx_led *led;
> +	int num_colors;
> +	u32 color_id;
> +	int led_number;
> +	size_t i = 0;
> +	int ret;
> +
> +	priv->enable_gpio = devm_gpiod_get_optional(&priv->client->dev,
> +						   "enable", GPIOD_OUT_LOW);
> +	if (IS_ERR(priv->enable_gpio)) {
> +		ret = PTR_ERR(priv->enable_gpio);
> +		dev_err(&priv->client->dev, "Failed to get enable gpio: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	priv->regulator = devm_regulator_get(&priv->client->dev, "vled");
> +	if (IS_ERR(priv->regulator))
> +		priv->regulator = NULL;
> +
> +	if (priv->model_id == LP5009)
> +		priv->max_leds = LP5009_MAX_LED_MODULES;
> +	else if (priv->model_id == LP5012)
> +		priv->max_leds = LP5012_MAX_LED_MODULES;
> +	else if (priv->model_id == LP5018)
> +		priv->max_leds = LP5018_MAX_LED_MODULES;
> +	else if (priv->model_id == LP5024)
> +		priv->max_leds = LP5024_MAX_LED_MODULES;
> +	else if (priv->model_id == LP5030)
> +		priv->max_leds = LP5030_MAX_LED_MODULES;
> +	else
> +		priv->max_leds = LP5036_MAX_LED_MODULES;

You could simplify that by initializing data property of
lp50xx_leds_match array elements and then call of_match_device.
You can compare e.g. drivers/leds/leds-pca9532.c

> +	device_for_each_child_node(&priv->client->dev, child) {
> +		led = &priv->leds[i];
> +		if (fwnode_property_present(child, "ti,led-bank")) {
> +			ret = fwnode_property_read_u32_array(child,
> +							     "ti,led-bank",
> +							     NULL, 0);
> +			ret = fwnode_property_read_u32_array(child,
> +							     "ti,led-bank",
> +							     led_strings,
> +							     ret);
> +
> +			priv->num_of_banked_leds = ARRAY_SIZE(led_strings);
> +
> +			ret = lp50xx_set_banks(priv, led_strings);
> +			if (ret) {
> +				dev_err(&priv->client->dev,
> +					"Cannot setup banked LEDs\n");
> +				fwnode_handle_put(child);
> +				goto child_out;
> +			}
> +			led->ctrl_bank_enabled = 1;
> +
> +		} else {
> +			ret = fwnode_property_read_u32(child, "reg",
> +					       &led_number);
> +
> +			led->led_number = led_number;
> +		}
> +		if (ret) {
> +			dev_err(&priv->client->dev,
> +				"led sourcing property missing\n");
> +			fwnode_handle_put(child);
> +			goto child_out;
> +		}
> +
> +		if (led_number > priv->max_leds) {
> +			dev_err(&priv->client->dev,
> +				"led-sources property is invalid\n");
> +			ret = -EINVAL;
> +			fwnode_handle_put(child);
> +			goto child_out;
> +		}
> +
> +		init_data.fwnode = child;
> +		init_data.devicename = priv->client->name;

We'd rather not have devicename in the name of this LED class device
according to the new LED naming convention. It's not a hot-pluggable
device, so for properly designed DT we should not encounter name
clash.

> +		init_data.default_label = ":";

default_label should not be set for new drivers. See the comment in
the include/linux/leds.h:

        /*
         * string to be used for devicename section of LED class device
         * either for label based LED name composition path or for fwnode
         * based when devname_mandatory is true
         */

This is new driver and we should not add any convenience fallbacks
for label based DT bindings. Label DT property has been marked
deprecated, so for new drivers it should be deemed non-existent.


> +
> +		fwnode_property_read_string(child, "linux,default-trigger",
> +				    &led->led_dev.default_trigger);
> +		num_colors = 0;
> +
> +		fwnode_for_each_child_node(child, led_node) {
> +			ret = fwnode_property_read_u32(led_node, "color",
> +						       &color_id);
> +			if (ret)
> +				dev_err(&priv->client->dev,
> +				"Cannot read color\n");
> +
> +			led->mc_cdev.available_colors |= (1 << color_id);
> +			num_colors++;
> +
> +		}
> +
> +		led->priv = priv;
> +		led->mc_cdev.ops = &lp50xx_mc_ops;
> +		led->mc_cdev.num_leds = num_colors;
> +		led->mc_cdev.led_cdev = &led->led_dev;
> +		led->led_dev.brightness_set_blocking = lp50xx_brightness_set;
> +		led->led_dev.brightness_get = lp50xx_brightness_get;
> +		ret = led_classdev_multicolor_register_ext(&priv->client->dev,
> +						       &led->mc_cdev,
> +						       &init_data);

Why not devm_* prefixed version?

[...]

-- 
Best regards,
Jacek Anaszewski
