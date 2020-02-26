Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39838170946
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2020 21:14:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727503AbgBZUOF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Feb 2020 15:14:05 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39966 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727500AbgBZUOF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Feb 2020 15:14:05 -0500
Received: by mail-wm1-f65.google.com with SMTP id t14so678202wmi.5;
        Wed, 26 Feb 2020 12:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=R1RxSH3g/mT+61xYTA0dLToBIuwzhhNEDqxhKTD80ng=;
        b=ttTr57oXaV6IqDe0Vgk4r3I2+d12h4R+gDRx7ixa+FHBl4xIz+gWLY1P0BxHmwUzS8
         oHVDyKDdRLstO8Q2mar6Z8jkQ21MLohVT9z/h/791pQuuyudm/f/WllYZ2H166kDi3gB
         /Nx5TC8/rZQi4gvgyCdZbh5VcK7SOt3H++8E3kcqUTmpN74CKvyjI3sRlrVz/c+O4G9b
         DJC8mMMlx8w8BhbbEBPpLtDz/vQRj6Hvl8YTEizptz08YXbnEz0P6H0lPc2VqkakW5iC
         aLfB8XbOqd1yT+GNQPz3XfyBOVvyPNl45AlYxaedg/aWpu3V5e7Cr6LZPpIFOifZmsYt
         I23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=R1RxSH3g/mT+61xYTA0dLToBIuwzhhNEDqxhKTD80ng=;
        b=uOFn2gjTwu1QhKjTlzdIDSUf/cRPJQSSBi7+UuQyFJkbf+Ki2cOYT7Pz7nKNuiPMMO
         LzmgJzfxTPSwdMNur6hV81TKV3Dw6IuSDxQTZLhwbIFUSh1HxEl/7ykx2Pxc42bkIe7B
         pl4kTOvpIImbnW6daBgWUpqCM1wFSt3eKMwX1gZb9bd8XagpAcZa7naIDPPNa5Lni1Zz
         CoQiqm0axr/+Y0i70wr4s+wFm9BxECAwlg1g1Nph1VZo4vtwz5n+aENNpJYcVIkoVVab
         Rj/6aVcUaI51aAV4lMYqMxi4ze6lUw8rTItMu+G0/7bq47kVN+1jQH3uZ8LKSa18mqb3
         802g==
X-Gm-Message-State: APjAAAXPy3rAuM2fdaDYvXZwAVp5cpXTmfvii0ahYZjW4bHYOGdhiHPz
        VB3WaTQfSx6E98r/QNEUhSo/UqgQ
X-Google-Smtp-Source: APXvYqyr5qGbbakxWAxhLS07+m5tUowuEEOGzBao/OslaTkp49BlF/eMQb6npmjyN568s4gWx6E7+A==
X-Received: by 2002:a05:600c:2942:: with SMTP id n2mr549465wmd.87.1582748040604;
        Wed, 26 Feb 2020 12:14:00 -0800 (PST)
Received: from [192.168.1.23] (affz246.neoplus.adsl.tpnet.pl. [95.49.155.246])
        by smtp.gmail.com with ESMTPSA id w19sm4027148wmc.22.2020.02.26.12.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2020 12:14:00 -0800 (PST)
Subject: Re: [PATCH RFC v2 3/3] drivers: leds: add support for apa102c leds
To:     Nicolas Belin <nbelin@baylibre.com>, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, pavel@ucw.cz, dmurphy@ti.com,
        devicetree@vger.kernel.org
Cc:     baylibre-upstreaming@groups.io
References: <1582727592-4510-1-git-send-email-nbelin@baylibre.com>
 <1582727592-4510-4-git-send-email-nbelin@baylibre.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <85f536f0-0078-08a5-5eeb-e401d1ed8782@gmail.com>
Date:   Wed, 26 Feb 2020 21:13:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1582727592-4510-4-git-send-email-nbelin@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Nicolas,

Regardless of the fact that LED mc framework in current shape
will probably not materialize in mainline, I have single
remark regarding LED initialization. Please take a look below.

On 2/26/20 3:33 PM, Nicolas Belin wrote:
> Initilial commit in order to support the apa102c RGB leds. This
> is based on the Multicolor Framework.
> 
> Reviewed-by: Corentin Labbe <clabbe@baylibre.com>
> Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
> ---
>  drivers/leds/Kconfig        |   7 ++
>  drivers/leds/Makefile       |   1 +
>  drivers/leds/leds-apa102c.c | 291 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 299 insertions(+)
>  create mode 100644 drivers/leds/leds-apa102c.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 5dc6535a88ef..71e29727c6ec 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -79,6 +79,13 @@ config LEDS_AN30259A
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called leds-an30259a.
>  
> +config LEDS_APA102C
> +	tristate "LED Support for Shiji APA102C"
> +	depends on SPI
> +	depends on LEDS_CLASS_MULTI_COLOR
> +	help
> +	  This option enables support for APA102C LEDs.
> +
>  config LEDS_APU
>  	tristate "Front panel LED support for PC Engines APU/APU2/APU3 boards"
>  	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index b5305b7d43fb..8334cb6dc7e8 100644
[...]
> +
> +		led->priv			= priv;
> +		led->ldev.max_brightness	= MAX_BRIGHTNESS;
> +		fwnode_property_read_string(child, "linux,default-trigger",
> +					    &led->ldev.default_trigger);
> +
> +		init_data.fwnode = child;
> +		init_data.devicename = APA_DEV_NAME;
> +		init_data.default_label = ":";

devicename property should be filled in new drivers only in case
devname_mandatory is set to true.
default_label property is for legacy drivers, for backward compatibility
with old LED naming convention.

For more information please refer to:
- Documentation/leds/leds-class.rst, "LED Device Naming" section
- struct led_init_data documention in linux/leds.h

In effect you need only fwnode here,

> +
> +		num_colors = 0;
> +		fwnode_for_each_child_node(child, grandchild) {
> +			ret = fwnode_property_read_u32(grandchild, "color",
> +						       &color_id);
> +			if (ret) {
> +				dev_err(priv->dev, "Cannot read color\n");
> +				goto child_out;
> +			}
> +
> +			set_bit(color_id, &led->mc_cdev.available_colors);
> +			num_colors++;
> +		}
> +
> +		if (num_colors != 3) {
> +			ret = -EINVAL;
> +			dev_err(priv->dev, "There should be 3 colors\n");
> +			goto child_out;
> +		}
> +
> +		if (led->mc_cdev.available_colors != IS_RGB) {
> +			ret = -EINVAL;
> +			dev_err(priv->dev, "The led is expected to be RGB\n");
> +			goto child_out;
> +		}
> +
> +		led->mc_cdev.num_leds = num_colors;
> +		led->mc_cdev.led_cdev = &led->ldev;
> +		led->ldev.brightness_set_blocking = apa102c_brightness_set;
> +		ret = devm_led_classdev_multicolor_register_ext(priv->dev,

-- 
Best regards,
Jacek Anaszewski
