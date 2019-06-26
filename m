Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1D9457150
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2019 21:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbfFZTFy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Jun 2019 15:05:54 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44201 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbfFZTFx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Jun 2019 15:05:53 -0400
Received: by mail-wr1-f65.google.com with SMTP id r16so3964651wrl.11;
        Wed, 26 Jun 2019 12:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k58z1xDoDuUedKLxDZQQjZfULZhmw5rOezNF2uh55bE=;
        b=qFVXMlh2mPx50/opI5D8Yzpl4qr58ygvZezKVrJw6DPrIOsgqEsRxbO+EtxrKfcsLo
         2mgfUjfvYBmxNr9zQxKuwyV+dn6TwwVjnvU9w2CN59ezdqUWKRaANIym0uHB4J/Yjc+6
         1Bu2tz1uxS8y/AqCrsiFePNLwJ5D9h6oohCi5tFD+FzNLDPd9Ju4Z5cgu0klN+Yd3fZn
         MQdgZ7egjWDmDhtpl3x3Le14JIAPWXSns08arhg9vfoYadu2khLR3Y6AkHjE0NhKI/Sr
         i6Fb1eEyHfGbzxF6fCWRTmbX1q3lJn5apFBwXX+Yh4uuQwF3ZZocbTkQz79Ofe8oZCfv
         zvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=k58z1xDoDuUedKLxDZQQjZfULZhmw5rOezNF2uh55bE=;
        b=g9rJn4D84/OnOey9SFCsKC42NbeYkwQvXczzSxbgfisX0zw+tPnfSoZOBlEepfo+2L
         TNmZRyv/+fm5eZMstWLk3TmKpd4LJOSx44ams5ESEQAgQ8M6/Zn/h38nclSa22LT5U8c
         95ouBBg9hWOKjVEeGyVhj79g6gwpBpsq2zdQ08ZZjxpVJTstfr6Oie1hKODSNzNdDMhm
         i8pTe98qa8DNiot9OFzUoO7oz+XYKUsOOvdgfJ0IG9u0oXAmsw5eZoET4tZOn+YJAgRV
         1ATOlnjQSB/RxjrnP50MOd3nzTn+PC8uBoex82FTCu6ZFUxJl6JSX8jvw7FwKZ3joUys
         d7tQ==
X-Gm-Message-State: APjAAAXEb4O7Q2qNrJzqQ6e/wAWQRkXEXWTWUCb5YRMFCbqIGWFfv96l
        Xv6sGqQdrc1pEQerWkgECIo=
X-Google-Smtp-Source: APXvYqw2aHqYCrmYnVUesorq93yrn3NIiryyhD9fL2T9l7sjsmdDNVMQSOi8Ej4qtBdwykF4TnEKvw==
X-Received: by 2002:adf:e9c6:: with SMTP id l6mr5145015wrn.216.1561575948508;
        Wed, 26 Jun 2019 12:05:48 -0700 (PDT)
Received: from [192.168.1.17] (drs100.neoplus.adsl.tpnet.pl. [83.24.204.100])
        by smtp.gmail.com with ESMTPSA id 18sm1774639wmg.43.2019.06.26.12.05.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 12:05:47 -0700 (PDT)
Subject: Re: [PATCH v5 05/26] leds: core: Add support for composing LED class
 device names
To:     linux-leds@vger.kernel.org, pavel@ucw.cz, dmurphy@ti.com
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org, dtor@google.com, linux@roeck-us.net,
        Baolin Wang <baolin.wang@linaro.org>,
        Daniel Mack <daniel@zonque.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Oleh Kravchenko <oleg@kaa.org.ua>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Simon Shields <simon@lineageos.org>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
 <20190609190803.14815-6-jacek.anaszewski@gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 mQINBFWjfaEBEADd66EQbd6yd8YjG0kbEDT2QIkx8C7BqMXR8AdmA1OMApbfSvEZFT1D/ECR
 eWFBS8XtApKQx1xAs1j5z70k3zebk2eeNs5ahxi6vM4Qh89vBM46biSKeeX5fLcv7asmGb/a
 FnHPAfQaKFyG/Bj9V+//ef67hpjJWR3s74C6LZCFLcbZM0z/wTH+baA5Jwcnqr4h/ygosvhP
 X3gkRzJLSFYekmEv+WHieeKXLrJdsUPUvPJTZtvi3ELUxHNOZwX2oRJStWpmL2QGMwPokRNQ
 29GvnueQdQrIl2ylhul6TSrClMrKZqOajDFng7TLgvNfyVZE8WQwmrkTrdzBLfu3kScjE14Q
 Volq8OtQpTsw5570D4plVKh2ahlhrwXdneSot0STk9Dh1grEB/Jfw8dknvqkdjALUrrM45eF
 FM4FSMxIlNV8WxueHDss9vXRbCUxzGw37Ck9JWYo0EpcpcvwPf33yntYCbnt+RQRjv7vy3w5
 osVwRR4hpbL/fWt1AnZ+RvbP4kYSptOCPQ+Pp1tCw16BOaPjtlqSTcrlD2fo2IbaB5D21SUa
 IsdZ/XkD+V2S9jCrN1yyK2iKgxtDoUkWiqlfRgH2Ep1tZtb4NLF/S0oCr7rNLO7WbqLZQh1q
 ShfZR16h7YW//1/NFwnyCVaG1CP/L/io719dPWgEd/sVSKT2TwARAQABtC1KYWNlayBBbmFz
 emV3c2tpIDxqYWNlay5hbmFzemV3c2tpQGdtYWlsLmNvbT6JAj4EEwEIACgCGwMHCwkIBwMC
 AQYVCAIJCgsDFgIBAh4BAheABQJVo39tBQkJZgNMAAoJEL1qUBy3i3wmxLQQAK8QEQ0JqZEv
 5hrxiwT+Qtkx1TULYriK9sYcY9zbi18YxbKB0C4Znh5iP5o7k26WnPGLM+w4qWvTAkHjuAI7
 aBrvb4nGRvE5s14PQ9IHgL7iL3zAAHT1azIZng9dUCCSontB+vQZu1x/Un0lVlVCvsvO7QVt
 hAZUlT3iucNMO0jpCiS3raZkNfab8M+JWP/iplaV0Kn+O7LX3A/RdLmx5ZhuT+zvyHwl2c3K
 T56UHaQnjkuHB2Ytk8HtOjNXGNYnm4nLx3ok3jEN1nWDRV/DeiPn8zz4Zebsp686OH9vvX/0
 R4dk2YEjUCY/S7CbJxXzUnLjboUAGmtTVOu/uJ7y11iS9XEoJ09HEzijQwWctJXLojcTXCFw
 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
 eGGiEQ==
Message-ID: <66811b33-c643-679e-344c-e293f03cc2fb@gmail.com>
Date:   Wed, 26 Jun 2019 21:05:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190609190803.14815-6-jacek.anaszewski@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Gentle reminder.

Pavel, Dan - any conclusions?

This patch is the main part of the proposed changes,
so it would be good to spot any remaining issues.

What needs a consensus is also a new
Documentation/leds/led-functions.txt file I introduce
in the patch 26/26.

Best regards,
Jacek Anaszewski

On 6/9/19 9:07 PM, Jacek Anaszewski wrote:
> Add generic support for composing LED class device name. The newly
> introduced led_compose_name() function composes device name according
> to either <color:function> or <devicename:color:function> pattern,
> depending on the configuration of initialization data.
> 
> Backward compatibility with in-driver hard-coded LED class device
> names is assured thanks to the default_label and devicename properties
> of newly introduced struct led_init_data.
> 
> In case none of the aforementioned properties was found, then, for OF
> nodes, the node name is adopted for LED class device name.
> 
> At the occassion of amending the Documentation/leds/leds-class.txt
> unify spelling: colour -> color.
> 
> Alongside these changes added is a new tool - tools/leds/get_led_device_info.sh.
> The tool allows retrieving details of a LED class device's parent device,
> which proves that using vendor or product name for devicename part
> of LED name doesn't convey any added value since that information had been
> already available in sysfs. The script performs also basic validation
> of a LED class device name.
> 
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Baolin Wang <baolin.wang@linaro.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: Daniel Mack <daniel@zonque.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Oleh Kravchenko <oleg@kaa.org.ua>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Simon Shields <simon@lineageos.org>
> ---
>  Documentation/leds/leds-class.txt |  67 ++++++++++++-
>  drivers/leds/led-class.c          |  20 +++-
>  drivers/leds/led-core.c           | 127 ++++++++++++++++++++++++
>  drivers/leds/leds.h               |   1 +
>  include/linux/leds.h              |  45 +++++++++
>  tools/leds/get_led_device_info.sh | 201 ++++++++++++++++++++++++++++++++++++++
>  6 files changed, 455 insertions(+), 6 deletions(-)
>  create mode 100755 tools/leds/get_led_device_info.sh
> 
> diff --git a/Documentation/leds/leds-class.txt b/Documentation/leds/leds-class.txt
> index 8b39cc6b03ee..e7316e37b57d 100644
> --- a/Documentation/leds/leds-class.txt
> +++ b/Documentation/leds/leds-class.txt
> @@ -43,9 +43,70 @@ LED Device Naming
>  
>  Is currently of the form:
>  
> -"devicename:colour:function"
> -
> -There have been calls for LED properties such as colour to be exported as
> +"devicename:color:function"
> +
> +devicename: It should refer to a unique identifier created by the kernel,
> +            like e.g. phyN for network devices or inputN for input devices,
> +            rather than to the hardware. The information related to the product
> +            and the bus to which given device is hooked is available in the
> +            sysfs and can be retrieved using get_led_device_info.sh script
> +            from tools/leds. Generally this section is expected mostly for
> +            LEDs that are somehow associated with other devices.
> +
> +color: one of the color strings from led_colors array defined
> +       in drivers/leds/led-core.c.
> +
> +function: one of the LED_FUNCTION* definitions from the header
> +          include/dt-bindings/leds/common.h.
> +
> +If required color or function is missing, please submit a patch
> +to linux-leds@vger.kernel.org, adding required entries.
> +
> +It is possible that more than one LED with the same color and function will
> +be required for given platform, differing only with an ordinal number.
> +In this case it is preferable to just concatenate the predefined LED_FUNCTION*
> +name with required "-N" suffix in the driver. fwnode based drivers can use
> +function-enumerator property for that and then the concatenation will be handled
> +automatically by the LED core upon LED class device registration.
> +
> +LED subsystem has also a protection against name clash, that may occur
> +when LED class device is created by a driver of hot-pluggable device and
> +it doesn't provide unique devicename section. In this case numerical
> +suffix (e.g. "_1", "_2", "_3" etc.) is added to the requested LED class
> +device name.
> +
> +There might be still LED class drivers around using vendor or product name
> +for devicename, but this approach is now deprecated as it doesn't convey
> +any added value. Product information can be found in other places in sysfs
> +(see tools/leds/get_led_device_info.sh).
> +
> +Examples of proper LED names:
> +
> +"red:disk"
> +"white:flash"
> +"red:indicator"
> +"phy1:green:wlan"
> +"phy3::wlan"
> +":kbd_backlight"
> +"input5::kbd_backlight"
> +"input3::numlock"
> +"input3::scrolllock"
> +"input3::capslock"
> +"mmc1::status"
> +"white:status"
> +
> +get_led_device_info.sh script can be used for verifying if the LED name
> +meets the requirements pointed out here. It performs validation of the LED class
> +devicename sections and gives hints on expected value for a section in case
> +the validation fails for it. So far the script supports validation
> +of associations between LEDs and following types of devices:
> +
> +- input devices
> +- ieee80211 compliant USB devices
> +
> +The script is open to extensions.
> +
> +There have been calls for LED properties such as color to be exported as
>  individual led class attributes. As a solution which doesn't incur as much
>  overhead, I suggest these become part of the device name. The naming scheme
>  above leaves scope for further attributes should they be needed. If sections
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index a564948e5f53..e3af0b71c9a9 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -257,17 +257,31 @@ int led_classdev_register_ext(struct device *parent,
>  			      struct led_classdev *led_cdev,
>  			      struct led_init_data *init_data)
>  {
> -	char name[LED_MAX_NAME_SIZE];
> +	char composed_name[LED_MAX_NAME_SIZE];
> +	char final_name[LED_MAX_NAME_SIZE];
> +	const char *proposed_name = composed_name;
>  	int ret;
>  
> -	ret = led_classdev_next_name(led_cdev->name, name, sizeof(name));
> +	if (init_data) {
> +		if (init_data->devname_mandatory && !init_data->devicename) {
> +			dev_err(parent, "Mandatory device name is missing");
> +			return -EINVAL;
> +		}
> +		ret = led_compose_name(parent, init_data, composed_name);
> +		if (ret < 0)
> +			return ret;
> +	} else {
> +		proposed_name = led_cdev->name;
> +	}
> +
> +	ret = led_classdev_next_name(proposed_name, final_name, sizeof(final_name));
>  	if (ret < 0)
>  		return ret;
>  
>  	mutex_init(&led_cdev->led_access);
>  	mutex_lock(&led_cdev->led_access);
>  	led_cdev->dev = device_create_with_groups(leds_class, parent, 0,
> -				led_cdev, led_cdev->groups, "%s", name);
> +				led_cdev, led_cdev->groups, "%s", final_name);
>  	if (IS_ERR(led_cdev->dev)) {
>  		mutex_unlock(&led_cdev->led_access);
>  		return PTR_ERR(led_cdev->dev);
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index e3da7c03da1b..dcd14ea40687 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -17,8 +17,10 @@
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/of.h>
> +#include <linux/property.h>
>  #include <linux/rwsem.h>
>  #include <linux/slab.h>
> +#include <uapi/linux/uleds.h>
>  #include "leds.h"
>  
>  DECLARE_RWSEM(leds_list_lock);
> @@ -27,6 +29,18 @@ EXPORT_SYMBOL_GPL(leds_list_lock);
>  LIST_HEAD(leds_list);
>  EXPORT_SYMBOL_GPL(leds_list);
>  
> +const char *led_colors[LED_COLOR_ID_MAX] = {
> +	[LED_COLOR_ID_WHITE] = "white",
> +	[LED_COLOR_ID_RED] = "red",
> +	[LED_COLOR_ID_GREEN] = "green",
> +	[LED_COLOR_ID_BLUE] = "blue",
> +	[LED_COLOR_ID_AMBER] = "amber",
> +	[LED_COLOR_ID_VIOLET] = "violet",
> +	[LED_COLOR_ID_YELLOW] = "yellow",
> +	[LED_COLOR_ID_IR] = "ir",
> +};
> +EXPORT_SYMBOL_GPL(led_colors);
> +
>  static int __led_set_brightness(struct led_classdev *led_cdev,
>  				enum led_brightness value)
>  {
> @@ -357,3 +371,116 @@ void led_sysfs_enable(struct led_classdev *led_cdev)
>  	led_cdev->flags &= ~LED_SYSFS_DISABLE;
>  }
>  EXPORT_SYMBOL_GPL(led_sysfs_enable);
> +
> +static void led_parse_fwnode_props(struct device *dev,
> +				   struct fwnode_handle *fwnode,
> +				   struct led_properties *props)
> +{
> +	int ret;
> +
> +	if (!fwnode)
> +		return;
> +
> +	if (fwnode_property_present(fwnode, "label")) {
> +		ret = fwnode_property_read_string(fwnode, "label", &props->label);
> +		if (ret)
> +			dev_err(dev, "Error parsing \'label\' property (%d)\n", ret);
> +		return;
> +	}
> +
> +	if (fwnode_property_present(fwnode, "color")) {
> +		ret = fwnode_property_read_u32(fwnode, "color", &props->color);
> +		if (ret)
> +			dev_err(dev, "Error parsing \'color\' property (%d)\n", ret);
> +		else if (props->color >= LED_COLOR_ID_MAX)
> +			dev_err(dev, "LED color identifier out of range\n");
> +		else
> +			props->color_present = true;
> +	}
> +
> +
> +	if (fwnode_property_present(fwnode, "function")) {
> +		ret = fwnode_property_read_string(fwnode, "function", &props->function);
> +		if (ret) {
> +			dev_err(dev,
> +				"Error parsing \'function\' property (%d)\n",
> +				ret);
> +		}
> +	} else {
> +		return;
> +	}
> +
> +	if (fwnode_property_present(fwnode, "function-enumerator")) {
> +		ret = fwnode_property_read_u32(fwnode, "function-enumerator",
> +					       &props->func_enum);
> +		if (ret) {
> +			dev_err(dev,
> +				"Error parsing \'function-enumerator\' property (%d)\n",
> +				ret);
> +		} else {
> +			props->func_enum_present = true;
> +		}
> +	}
> +}
> +
> +int led_compose_name(struct device *dev, struct led_init_data *init_data,
> +		     char *led_classdev_name)
> +{
> +	struct led_properties props = {};
> +	struct fwnode_handle *fwnode = init_data->fwnode;
> +	const char *devicename = init_data->devicename;
> +
> +	if (!led_classdev_name)
> +		return -EINVAL;
> +
> +	led_parse_fwnode_props(dev, fwnode, &props);
> +
> +	if (props.label) {
> +		/*
> +		 * If init_data.devicename is NULL, then it indicates that
> +		 * DT label should be used as-is for LED class device name.
> +		 * Otherwise the label is prepended with devicename to compose
> +		 * the final LED class device name.
> +		 */
> +		if (!devicename) {
> +			strncpy(led_classdev_name, props.label,
> +				LED_MAX_NAME_SIZE);
> +		} else {
> +			snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s",
> +				 devicename, props.label);
> +		}
> +	} else if (props.function || props.color_present) {
> +		char tmp_buf[LED_MAX_NAME_SIZE];
> +
> +		if (props.func_enum_present) {
> +			snprintf(tmp_buf, LED_MAX_NAME_SIZE, "%s:%s-%d",
> +				 props.color_present ? led_colors[props.color] : "",
> +				 props.function ?: "", props.func_enum);
> +		} else {
> +			snprintf(tmp_buf, LED_MAX_NAME_SIZE, "%s:%s",
> +				 props.color_present ? led_colors[props.color] : "",
> +				 props.function ?: "");
> +		}
> +		if (init_data->devname_mandatory) {
> +			snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s",
> +				 devicename, tmp_buf);
> +		} else {
> +			strncpy(led_classdev_name, tmp_buf, LED_MAX_NAME_SIZE);
> +
> +		}
> +	} else if (init_data->default_label) {
> +		if (!devicename) {
> +			dev_err(dev, "Legacy LED naming requires devicename segment");
> +			return -EINVAL;
> +		}
> +		snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s",
> +			 devicename, init_data->default_label);
> +	} else if (is_of_node(fwnode)) {
> +		strncpy(led_classdev_name, to_of_node(fwnode)->name,
> +			LED_MAX_NAME_SIZE);
> +	} else
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(led_compose_name);
> diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
> index 7d38e6b9a740..0d223c1f93b2 100644
> --- a/drivers/leds/leds.h
> +++ b/drivers/leds/leds.h
> @@ -31,5 +31,6 @@ void led_set_brightness_nosleep(struct led_classdev *led_cdev,
>  extern struct rw_semaphore leds_list_lock;
>  extern struct list_head leds_list;
>  extern struct list_head trigger_list;
> +extern const char *led_colors[LED_COLOR_ID_MAX];
>  
>  #endif	/* __LEDS_H_INCLUDED */
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index fab83a2d7bff..03e9795fa23b 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -12,6 +12,7 @@
>  #ifndef __LINUX_LEDS_H_INCLUDED
>  #define __LINUX_LEDS_H_INCLUDED
>  
> +#include <dt-bindings/leds/common.h>
>  #include <linux/device.h>
>  #include <linux/kernfs.h>
>  #include <linux/list.h>
> @@ -37,6 +38,25 @@ enum led_brightness {
>  struct led_init_data {
>  	/* device fwnode handle */
>  	struct fwnode_handle *fwnode;
> +	/*
> +	 * default <color:function> tuple, for backward compatibility
> +	 * with in-driver hard-coded LED names used as a fallback when
> +	 * DT "label" property is absent; it should be set to NULL
> +	 * in new LED class drivers.
> +	 */
> +	const char *default_label;
> +	/*
> +	 * string to be used for devicename section of LED class device
> +	 * either for label based LED name composition path or for fwnode
> +	 * based when devname_mandatory is true
> +	 */
> +	const char *devicename;
> +	/*
> +	 * indicates if LED name should always comprise devicename section;
> +	 * only LEDs exposed by drivers of hot-pluggable devices should
> +	 * set it to true
> +	 */
> +	bool devname_mandatory;
>  };
>  
>  struct led_classdev {
> @@ -262,6 +282,22 @@ extern void led_sysfs_disable(struct led_classdev *led_cdev);
>  extern void led_sysfs_enable(struct led_classdev *led_cdev);
>  
>  /**
> + * led_compose_name - compose LED class device name
> + * @dev: LED controller device object
> + * @child: child fwnode_handle describing a LED or a group of synchronized LEDs;
> + *	   it must be provided only for fwnode based LEDs
> + * @led_classdev_name: composed LED class device name
> + *
> + * Create LED class device name basing on the provided init_data argument.
> + * The name can have <devicename:color:function> or <color:function>.
> + * form, depending on the init_data configuration.
> + *
> + * Returns: 0 on success or negative error value on failure
> + */
> +extern int led_compose_name(struct device *dev, struct led_init_data *init_data,
> +			    char *led_classdev_name);
> +
> +/**
>   * led_sysfs_is_disabled - check if LED sysfs interface is disabled
>   * @led_cdev: the LED to query
>   *
> @@ -438,6 +474,15 @@ struct led_platform_data {
>  	struct led_info	*leds;
>  };
>  
> +struct led_properties {
> +	u32		color;
> +	bool		color_present;
> +	const char	*function;
> +	u32		func_enum;
> +	bool		func_enum_present;
> +	const char	*label;
> +};
> +
>  struct gpio_desc;
>  typedef int (*gpio_blink_set_t)(struct gpio_desc *desc, int state,
>  				unsigned long *delay_on,
> diff --git a/tools/leds/get_led_device_info.sh b/tools/leds/get_led_device_info.sh
> new file mode 100755
> index 000000000000..ccfa442db5fe
> --- /dev/null
> +++ b/tools/leds/get_led_device_info.sh
> @@ -0,0 +1,201 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +
> +led_common_defs_path="include/dt-bindings/leds/common.h"
> +
> +num_args=$#
> +if [ $num_args -eq 1 ]; then
> +        linux_top=$(dirname `realpath $0` | awk -F/     \
> +                        '{                              \
> +                                i=1;                    \
> +                                while (i <= NF - 2) {   \
> +                                        printf $i"/";   \
> +                                        i++;            \
> +                                };                      \
> +                        }')
> +	led_defs_path=$linux_top/$led_common_defs_path
> +elif [ $num_args -eq 2 ]; then
> +        led_defs_path=`realpath $2`
> +else
> +	echo "Usage: get_led_device_info.sh LED_CDEV_PATH [LED_COMMON_DEFS_PATH]"
> +	exit 1
> +fi
> +
> +if [ ! -f $led_defs_path ]; then
> +	echo "$led_defs_path doesn't exist"
> +	exit 1
> +fi
> +
> +led_cdev_path=`echo $1 | sed s'/\/$//'`
> +
> +ls "$led_cdev_path/brightness" > /dev/null 2>&1
> +if [ $? -ne 0 ]; then
> +	echo "Device \"$led_cdev_path\" does not exist."
> +	exit 1
> +fi
> +
> +bus=`readlink $led_cdev_path/device/subsystem | sed s'/.*\///'`
> +usb_subdev=`readlink $led_cdev_path | grep usb | sed s'/\(.*usb[0-9]*\/[0-9]*-[0-9]*\)\/.*/\1/'`
> +ls "$led_cdev_path/device/of_node/compatible" > /dev/null 2>&1
> +of_node_missing=$?
> +
> +if [ "$bus" = "input" ]; then
> +	input_node=`readlink $led_cdev_path/device | sed s'/.*\///'`
> +	if [ ! -z "$usb_subdev" ]; then
> +		bus="usb"
> +	fi
> +fi
> +
> +if [ "$bus" = "usb" ]; then
> +	usb_interface=`readlink $led_cdev_path | sed s'/.*\(usb[0-9]*\)/\1/' | cut -d\/ -f3`
> +	cd $led_cdev_path/../$usb_subdev
> +	driver=`readlink $usb_interface/driver | sed s'/.*\///'`
> +	if [ -d "$usb_interface/ieee80211" ]; then
> +		wifi_phy=`ls -l $usb_interface/ieee80211 | grep phy | awk '{print $9}'`
> +	fi
> +	idVendor=`cat idVendor`
> +	idProduct=`cat idProduct`
> +	manufacturer=`cat manufacturer`
> +	product=`cat product`
> +elif [ "$bus" = "input" ]; then
> +	cd $led_cdev_path
> +	product=`cat device/name`
> +	driver=`cat device/device/driver/description`
> +elif [ $of_node_missing -eq 0 ]; then
> +	cd $led_cdev_path
> +	compatible=`cat device/of_node/compatible`
> +	if [ "$compatible" = "gpio-leds" ]; then
> +		driver="leds-gpio"
> +	elif [ "$compatible" = "pwm-leds" ]; then
> +		driver="leds-pwm"
> +	else
> +		manufacturer=`echo $compatible | awk -F, '{print $1}'`
> +		product=`echo $compatible | awk -F, '{print $2}'`
> +	fi
> +else
> +	echo "Unknown device type."
> +	exit 1
> +fi
> +
> +printf "\n#####################################\n"
> +printf "# LED class device hardware details #\n"
> +printf "#####################################\n\n"
> +
> +printf "bus:\t\t\t$bus\n"
> +
> +if [ ! -z "$idVendor" ]; then
> +	printf "idVendor:\t\t$idVendor\n"
> +fi
> +
> +if [ ! -z "$idProduct" ]; then
> +	printf "idProduct:\t\t$idProduct\n"
> +fi
> +
> +if [ ! -z "$manufacturer" ]; then
> +	printf "manufacturer:\t\t$manufacturer\n"
> +fi
> +
> +if [ ! -z "$product" ]; then
> +	printf "product:\t\t$product\n"
> +fi
> +
> +if [ ! -z "$driver" ]; then
> +	printf "driver:\t\t\t$driver\n"
> +fi
> +
> +if [ ! -z "$input_node" ]; then
> +	printf "associated input node:\t$input_node\n"
> +fi
> +
> +printf "\n####################################\n"
> +printf "# LED class device name validation #\n"
> +printf "####################################\n\n"
> +
> +led_name=`echo $led_cdev_path | sed s'/.*\///'`
> +
> +num_sections=`echo $led_name | awk -F: '{print NF}'`
> +
> +if [ $num_sections -eq 1 ]; then
> +	printf "\":\" delimiter not detected.\t[ FAILED ]\n"
> +	exit 1
> +elif [ $num_sections -eq 2 ]; then
> +	color=`echo $led_name | cut -d: -f1`
> +	function=`echo $led_name | cut -d: -f2`
> +elif [ $num_sections -eq 3 ]; then
> +	devicename=`echo $led_name | cut -d: -f1`
> +	color=`echo $led_name | cut -d: -f2`
> +	function=`echo $led_name | cut -d: -f3`
> +else
> +	printf "Detected %d sections in the LED class device name - should the script be updated?\n" $num_sections
> +	exit 1
> +fi
> +
> +S_DEV="devicename"
> +S_CLR="color     "
> +S_FUN="function  "
> +status_tab=20
> +
> +print_msg_ok()
> +{
> +	local section_name="$1"
> +	local section_val="$2"
> +	local msg="$3"
> +	printf "$section_name :\t%-${status_tab}.${status_tab}s %s %s\n" "$section_val" "[ OK ]    " "$msg"
> +}
> +
> +print_msg_failed()
> +{
> +	local section_name="$1"
> +	local section_val="$2"
> +	local msg="$3"
> +	printf "$section_name :\t%-${status_tab}.${status_tab}s %s %s\n" "$section_val" "[ FAILED ]" "$msg"
> +}
> +
> +if [ ! -z "$input_node" ]; then
> +	expected_devname=$input_node
> +elif [ ! -z "$wifi_phy" ]; then
> +	expected_devname=$wifi_phy
> +fi
> +
> +if [ ! -z "$devicename" ]; then
> +	if [ ! -z "$expected_devname" ]; then
> +		if [ "$devicename" = "$expected_devname" ]; then
> +			print_msg_ok "$S_DEV" "$devicename"
> +		else
> +			print_msg_failed "$S_DEV" "$devicename" "Expected: $expected_devname"
> +		fi
> +	else
> +		if [ "$devicename" = "$manufacturer" ]; then
> +			print_msg_failed "$S_DEV" "$devicename" "Redundant: use of vendor name is discouraged"
> +		elif [ "$devicename" = "$product" ]; then
> +			print_msg_failed "$S_DEV" "$devicename" "Redundant: use of product name is discouraged"
> +		else
> +			print_msg_failed "$S_DEV" "$devicename" "Unknown devicename - should the script be updated?"
> +		fi
> +	fi
> +elif [ ! -z "$expected_devname" ]; then
> +	print_msg_failed "$S_DEV" "blank" "Expected: $expected_devname"
> +fi
> +
> +if [ ! -z "$color" ]; then
> +	color_upper=`echo $color | tr [:lower:] [:upper:]`
> +	color_id_definition=$(cat $led_defs_path | grep "_$color_upper\s" | awk '{print $2}')
> +	if [ ! -z "$color_id_definition" ]; then
> +		print_msg_ok "$S_CLR" "$color" "Matching definition: $color_id_definition"
> +	else
> +		print_msg_failed "$S_CLR" "$color" "Definition not found in $led_defs_path"
> +	fi
> +
> +fi
> +
> +if [ ! -z "$function" ]; then
> +	# strip optional enumerator
> +	function=`echo $function | sed s'/\(.*\)-[0-9]*$/\1/'`
> +	fun_definition=$(cat $led_defs_path | grep "\"$function\"" | awk '{print $2}')
> +	if [ ! -z "$fun_definition" ]; then
> +		print_msg_ok "$S_FUN" "$function" "Matching definition: $fun_definition"
> +	else
> +		print_msg_failed "$S_FUN" "$function" "Definition not found in $led_defs_path"
> +	fi
> +
> +fi
> 
