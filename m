Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3FF4F19B1
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2019 16:15:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727685AbfKFPPj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 6 Nov 2019 10:15:39 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35670 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727427AbfKFPPj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 6 Nov 2019 10:15:39 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id CC15028E8C8
Subject: Re: [PATCH v8 1/2] platform/chrome: wilco_ec: Add keyboard backlight
 LED support
To:     Nick Crews <ncrews@chromium.org>, bleung@chromium.org,
        linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz
Cc:     linux-kernel@vger.kernel.org, arnd@arndb.de,
        weiyongjun1@huawei.com, dlaurie@chromium.org, djkurtz@chromium.org,
        dtor@google.com, sjg@chromium.org, groeck@chromium.com,
        Daniel Campello <campello@chromium.org>
References: <20191024222805.183642-1-ncrews@chromium.org>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <62e9a2cd-d450-ef03-ca3a-f549322232d8@collabora.com>
Date:   Wed, 6 Nov 2019 16:15:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191024222805.183642-1-ncrews@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Daniel,

On 25/10/19 0:28, Nick Crews wrote:
> The EC is in charge of controlling the keyboard backlight on
> the Wilco platform. We expose a standard LED class device
> named platform::kbd_backlight.
> 
> Since the EC will never change the backlight level of its own accord,
> we don't need to implement a brightness_get() method.
> 
> Signed-off-by: Nick Crews <ncrews@chromium.org>
> Signed-off-by: Daniel Campello <campello@chromium.org>

As you know 0day reported an issue that needs to be solved, waiting for a new
version.

Thanks,
 Enric

> ---
> v8 changes:
>  -Removed unneeded #includes from keyboard_leds.h
> 
> v7 changes:
>  -Merged the LED stuff into the core wilco_ec module. This allows
>   us to de-duplicate a lot of code, hide a lot of the LED internals
>   from the core driver, and generally simplify things.
>  -Follow reverse xmas tree variable declaration
>  -Remove unneeded warning about BIOS not initializing the LEDs
>  -Fix and standardize some comments and log messages.
>  -Document all fields of wilco_keyboard_leds_msg
>  -rm outdated and useless comment at top of core file.
> 
> v6 changes:
>  -Rebased patch
>  -Fixed bug related to request/response buffer pointers on
>  send_kbbl_mesg()
>  -Now sends WILCO_KBBL_SUBCMD_SET_STATE instead of
>  WILCO_KBBL_SUBCMD_GET_STATE command for keyboard_led_set_brightness()
> 
> v5 changes:
>  -Rename the LED device to "platform::kbd_backlight", to
>  denote that this is the built-in system keyboard.
> 
> v4 changes:
>  -Call keyboard_led_set_brightness() directly within
>   initialize_brightness(), instead of calling the library function.
> 
> v3 changes:
>  -Since this behaves the same as the standard Chrome OS keyboard
>   backlight, rename the led device to "chromeos::kbd_backlight"
>  -Move wilco_ec_keyboard_backlight_exists() into core module, so
>   that the core does not depend upon the keyboard backlight driver.
>  -This required moving some code into wilco-ec.h
>  -Refactor out some common code in set_brightness() and
>   initialize_brightness()
> 
> v2 changes:
>  -Remove and fix uses of led vs LED in kconfig
>  -Assume BIOS initializes brightness, but double check in probe()
>  -Remove get_brightness() callback, as EC never changes brightness
>   by itself.
>  -Use a __packed struct as message instead of opaque array
>  -Add exported wilco_ec_keyboard_leds_exist() so the core driver
>   now only creates a platform _device if relevant
>  -Fix use of keyboard_led_set_brightness() since it can sleep
> 
> BUG=b:141952530
> TEST=Built and tested on a Wilco, including rmmod and modprobe of
> wilco-ec.
> 
>  drivers/platform/chrome/wilco_ec/Makefile     |   3 +-
>  drivers/platform/chrome/wilco_ec/core.c       |  13 +-
>  .../platform/chrome/wilco_ec/keyboard_leds.c  | 191 ++++++++++++++++++
>  include/linux/platform_data/wilco-ec.h        |  13 ++
>  4 files changed, 215 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/platform/chrome/wilco_ec/keyboard_leds.c
> 
> diff --git a/drivers/platform/chrome/wilco_ec/Makefile b/drivers/platform/chrome/wilco_ec/Makefile
> index bc817164596e..ecb3145cab18 100644
> --- a/drivers/platform/chrome/wilco_ec/Makefile
> +++ b/drivers/platform/chrome/wilco_ec/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> -wilco_ec-objs				:= core.o mailbox.o properties.o sysfs.o
> +wilco_ec-objs				:= core.o keyboard_leds.o mailbox.o \
> +					   properties.o sysfs.o
>  obj-$(CONFIG_WILCO_EC)			+= wilco_ec.o
>  wilco_ec_debugfs-objs			:= debugfs.o
>  obj-$(CONFIG_WILCO_EC_DEBUGFS)		+= wilco_ec_debugfs.o
> diff --git a/drivers/platform/chrome/wilco_ec/core.c b/drivers/platform/chrome/wilco_ec/core.c
> index 3724bf4b77c6..36c78e52ff3c 100644
> --- a/drivers/platform/chrome/wilco_ec/core.c
> +++ b/drivers/platform/chrome/wilco_ec/core.c
> @@ -5,10 +5,6 @@
>   * Copyright 2018 Google LLC
>   *
>   * This is the entry point for the drivers that control the Wilco EC.
> - * This driver is responsible for several tasks:
> - * - Initialize the register interface that is used by wilco_ec_mailbox()
> - * - Create a platform device which is picked up by the debugfs driver
> - * - Create a platform device which is picked up by the RTC driver
>   */
>  
>  #include <linux/acpi.h>
> @@ -87,6 +83,15 @@ static int wilco_ec_probe(struct platform_device *pdev)
>  		goto unregister_debugfs;
>  	}
>  
> +	/* Set up the keyboard backlight LEDs. */
> +	ret = wilco_keyboard_leds_init(ec);
> +	if (ret < 0) {
> +		dev_err(dev,
> +			"Failed to initialize keyboard LEDs: %d\n",
> +			ret);
> +		goto unregister_rtc;
> +	}
> +
>  	ret = wilco_ec_add_sysfs(ec);
>  	if (ret < 0) {
>  		dev_err(dev, "Failed to create sysfs entries: %d", ret);
> diff --git a/drivers/platform/chrome/wilco_ec/keyboard_leds.c b/drivers/platform/chrome/wilco_ec/keyboard_leds.c
> new file mode 100644
> index 000000000000..bb0edf51dfda
> --- /dev/null
> +++ b/drivers/platform/chrome/wilco_ec/keyboard_leds.c
> @@ -0,0 +1,191 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Keyboard backlight LED driver for the Wilco Embedded Controller
> + *
> + * Copyright 2019 Google LLC
> + *
> + * Since the EC will never change the backlight level of its own accord,
> + * we don't need to implement a brightness_get() method.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/leds.h>
> +#include <linux/platform_data/wilco-ec.h>
> +#include <linux/slab.h>
> +
> +#define WILCO_EC_COMMAND_KBBL		0x75
> +#define WILCO_KBBL_MODE_FLAG_PWM	BIT(1)	/* Set brightness by percent. */
> +#define WILCO_KBBL_DEFAULT_BRIGHTNESS   0
> +
> +struct wilco_keyboard_leds {
> +	struct wilco_ec_device *ec;
> +	struct led_classdev keyboard;
> +};
> +
> +enum wilco_kbbl_subcommand {
> +	WILCO_KBBL_SUBCMD_GET_FEATURES = 0x00,
> +	WILCO_KBBL_SUBCMD_GET_STATE    = 0x01,
> +	WILCO_KBBL_SUBCMD_SET_STATE    = 0x02,
> +};
> +
> +/**
> + * struct wilco_keyboard_leds_msg - Message to/from EC for keyboard LED control.
> + * @command: Always WILCO_EC_COMMAND_KBBL.
> + * @status: Set by EC to 0 on success, 0xFF on failure.
> + * @subcmd: One of enum wilco_kbbl_subcommand.
> + * @reserved3: Should be 0.
> + * @mode: Bit flags for used mode, we want to use WILCO_KBBL_MODE_FLAG_PWM.
> + * @reserved5to8: Should be 0.
> + * @percent: Brightness in 0-100. Only meaningful in PWM mode.
> + * @reserved10to15: Should be 0.
> + */
> +struct wilco_keyboard_leds_msg {
> +	u8 command;
> +	u8 status;
> +	u8 subcmd;
> +	u8 reserved3;
> +	u8 mode;
> +	u8 reserved5to8[4];
> +	u8 percent;
> +	u8 reserved10to15[6];
> +} __packed;
> +
> +/* Send a request, get a response, and check that the response is good. */
> +static int send_kbbl_msg(struct wilco_ec_device *ec,
> +			 struct wilco_keyboard_leds_msg *request,
> +			 struct wilco_keyboard_leds_msg *response)
> +{
> +	struct wilco_ec_message msg;
> +	int ret;
> +
> +	memset(&msg, 0, sizeof(msg));
> +	msg.type = WILCO_EC_MSG_LEGACY;
> +	msg.request_data = request;
> +	msg.request_size = sizeof(*request);
> +	msg.response_data = response;
> +	msg.response_size = sizeof(*response);
> +
> +	ret = wilco_ec_mailbox(ec, &msg);
> +	if (ret < 0) {
> +		dev_err(ec->dev,
> +			"Failed sending keyboard LEDs command: %d", ret);
> +		return ret;
> +	}
> +
> +	if (response->status) {
> +		dev_err(ec->dev,
> +			"EC reported failure sending keyboard LEDs command: %d",
> +			response->status);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static int set_kbbl(struct wilco_ec_device *ec, enum led_brightness brightness)
> +{
> +	struct wilco_keyboard_leds_msg request;
> +	struct wilco_keyboard_leds_msg response;
> +
> +	memset(&request, 0, sizeof(request));
> +	request.command = WILCO_EC_COMMAND_KBBL;
> +	request.subcmd  = WILCO_KBBL_SUBCMD_SET_STATE;
> +	request.mode    = WILCO_KBBL_MODE_FLAG_PWM;
> +	request.percent = brightness;
> +
> +	return send_kbbl_msg(ec, &request, &response);
> +}
> +
> +static int kbbl_exist(struct wilco_ec_device *ec, bool *exists)
> +{
> +	struct wilco_keyboard_leds_msg request;
> +	struct wilco_keyboard_leds_msg response;
> +	int ret;
> +
> +	memset(&request, 0, sizeof(request));
> +	request.command = WILCO_EC_COMMAND_KBBL;
> +	request.subcmd  = WILCO_KBBL_SUBCMD_GET_FEATURES;
> +
> +	ret = send_kbbl_msg(ec, &request, &response);
> +	if (ret < 0)
> +		return ret;
> +
> +	*exists = response.status != 0xFF;
> +
> +	return 0;
> +}
> +
> +/**
> + * kbbl_init() - Initialize the state of the keyboard backlight.
> + * @ec: EC device to talk to.
> + *
> + * Gets the current brightness, ensuring that the BIOS already initialized the
> + * backlight to PWM mode. If not in PWM mode, then the current brightness is
> + * meaningless, so set the brightness to WILCO_KBBL_DEFAULT_BRIGHTNESS.
> + *
> + * Return: Final brightness of the keyboard, or negative error code on failure.
> + */
> +static int kbbl_init(struct wilco_ec_device *ec)
> +{
> +	struct wilco_keyboard_leds_msg request;
> +	struct wilco_keyboard_leds_msg response;
> +	int ret;
> +
> +	memset(&request, 0, sizeof(request));
> +	request.command = WILCO_EC_COMMAND_KBBL;
> +	request.subcmd  = WILCO_KBBL_SUBCMD_GET_STATE;
> +
> +	ret = send_kbbl_msg(ec, &request, &response);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (response.mode & WILCO_KBBL_MODE_FLAG_PWM)
> +		return response.percent;
> +
> +	ret = set_kbbl(ec, WILCO_KBBL_DEFAULT_BRIGHTNESS);
> +	if (ret < 0)
> +		return ret;
> +
> +	return WILCO_KBBL_DEFAULT_BRIGHTNESS;
> +}
> +
> +static int wilco_keyboard_leds_set(struct led_classdev *cdev,
> +				   enum led_brightness brightness)
> +{
> +	struct wilco_keyboard_leds *wkl =
> +		container_of(cdev, struct wilco_keyboard_leds, keyboard);
> +	return set_kbbl(wkl->ec, brightness);
> +}
> +
> +int wilco_keyboard_leds_init(struct wilco_ec_device *ec)
> +{
> +	struct wilco_keyboard_leds *wkl;
> +	bool leds_exist;
> +	int ret;
> +
> +	ret = kbbl_exist(ec, &leds_exist);
> +	if (ret < 0) {
> +		dev_err(ec->dev,
> +			"Failed checking keyboard LEDs support: %d", ret);
> +		return ret;
> +	}
> +	if (!leds_exist)
> +		return 0;
> +
> +	wkl = devm_kzalloc(ec->dev, sizeof(*wkl), GFP_KERNEL);
> +	if (!wkl)
> +		return -ENOMEM;
> +
> +	wkl->ec = ec;
> +	wkl->keyboard.name = "platform::kbd_backlight";
> +	wkl->keyboard.max_brightness = 100;
> +	wkl->keyboard.flags = LED_CORE_SUSPENDRESUME;
> +	wkl->keyboard.brightness_set_blocking = wilco_keyboard_leds_set;
> +	ret = kbbl_init(ec);
> +	if (ret < 0)
> +		return ret;
> +	wkl->keyboard.brightness = ret;
> +
> +	return devm_led_classdev_register(ec->dev, &wkl->keyboard);
> +}
> diff --git a/include/linux/platform_data/wilco-ec.h b/include/linux/platform_data/wilco-ec.h
> index ad03b586a095..0f7df3498a24 100644
> --- a/include/linux/platform_data/wilco-ec.h
> +++ b/include/linux/platform_data/wilco-ec.h
> @@ -120,6 +120,19 @@ struct wilco_ec_message {
>   */
>  int wilco_ec_mailbox(struct wilco_ec_device *ec, struct wilco_ec_message *msg);
>  
> +/**
> + * wilco_keyboard_leds_init() - Set up the keyboard backlight LEDs.
> + * @ec: EC device to query.
> + *
> + * After this call, the keyboard backlight will be exposed through a an LED
> + * device at /sys/class/leds.
> + *
> + * This may sleep because it uses wilco_ec_mailbox().
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int wilco_keyboard_leds_init(struct wilco_ec_device *ec);
> +
>  /*
>   * A Property is typically a data item that is stored to NVRAM
>   * by the EC. Each of these data items has an index associated
> 
