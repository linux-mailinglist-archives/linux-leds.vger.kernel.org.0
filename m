Return-Path: <linux-leds+bounces-4276-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AC1A60FF1
	for <lists+linux-leds@lfdr.de>; Fri, 14 Mar 2025 12:27:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22AA0461D80
	for <lists+linux-leds@lfdr.de>; Fri, 14 Mar 2025 11:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36961FDA63;
	Fri, 14 Mar 2025 11:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="XiQZMOOT"
X-Original-To: linux-leds@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FBF15D1;
	Fri, 14 Mar 2025 11:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741951662; cv=none; b=Ex0EB/lHFPdTTmQbA+bfIuxo1/xX866KoUU2AQ3nNYcxx5eoSzwr2Q/DzjB/VZVHiLpXml96Hkhi9tZXsPjn7Ovrxy7kdYE0Dprp6u1tq/lmw+4Cs4X3JUY+jCqgjm+xtlquU6JZBUoaZoOfy7R5W3V/E2k3r047JS+woA3QB38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741951662; c=relaxed/simple;
	bh=L7Um1I8Msluzb0uZkx3750FoiHAtd1SDuJ+0Nic5UrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YwAKPYTBGwL2NHUaTthghB1MZIwpMI6ZVuHghPtFdzjCZZsOOzIsDWtJ51CBjeBauL6pXoKtefRYQtho27WQMSxxH8GLMyTStMbJoLJYzo1qluJmTqO4CMBQ/Jl8MDMRdTzl0pdXQ1ybshztxUDEzGLcIxCVRDCIDmLQn/PpZfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=XiQZMOOT; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=IzErEEXjP9wHDpuXG5T9fNqwqhH1Bc4+cjGjLWkR/5M=; b=XiQZMOOTTiM21XqiQ85KdjwEgF
	g3KBB6kgSn0pDnHJDLRJ+fOg7n47rdilwlOGcYP/mMMod7bgoTQzt+vzVGRykyBlrIfMf3YHpkzkX
	Q7mme0qTvaS3Kd/3bjGLyYbOFfo9RyzPbZ4C5s87u1MFNpy4mE3EayZ9vWGcmsJwk0/k=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:65415 helo=[192.168.0.218])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1tt3CR-00Dg0Y-OG; Fri, 14 Mar 2025 12:27:36 +0100
Message-ID: <8a16c018-8466-4dea-8f1e-e8a65e3ed950@emfend.at>
Date: Fri, 14 Mar 2025 12:27:33 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] leds: tps6131x: add support for Texas Instruments
 TPS6131X flash LED driver
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 bsp-development.geo@leica-geosystems.com
References: <20250228-leds-tps6131x-v1-0-d1071d90f9ea@emfend.at>
 <20250228-leds-tps6131x-v1-2-d1071d90f9ea@emfend.at>
 <20250310144946.GH8350@google.com>
 <def0351b-c037-47c8-b395-d64cfca7ae25@emfend.at>
 <20250314105257.GD3890718@google.com>
Content-Language: de-DE
From: Matthias Fend <matthias.fend@emfend.at>
In-Reply-To: <20250314105257.GD3890718@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 

Hi Lee,

Am 14.03.2025 um 11:52 schrieb Lee Jones:
> On Fri, 14 Mar 2025, Matthias Fend wrote:
> 
>> Hi Lee,
>>
>> thanks a lot for your feedback!
>>
>> Am 10.03.2025 um 15:49 schrieb Lee Jones:
>>> On Fri, 28 Feb 2025, Matthias Fend wrote:
>>>
>>>> The TPS61310/TPS61311 is a flash LED driver with I2C interface. Its power
>>>> stage is capable of supplying a maximum total current of roughly 1500mA.
>>>> The TPS6131x provides three constant-current sinks, capable of sinking up
>>>> to 2 × 400mA (LED1 and LED3) and 800mA (LED2) in flash mode. In torch mode
>>>> each sink (LED1, LED2, LED3) supports currents up to 175mA.
>>>>
>>>> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
>>>> ---
>>>>    MAINTAINERS                        |   7 +
>>>>    drivers/leds/flash/Kconfig         |  11 +
>>>>    drivers/leds/flash/Makefile        |   1 +
>>>>    drivers/leds/flash/leds-tps6131x.c | 798 +++++++++++++++++++++++++++++++++++++
>>>>    4 files changed, 817 insertions(+)
> 
> [...]
> 
>>>> +static int tps6131x_led_class_setup(struct tps6131x *tps6131x)
>>>> +{
>>>> +	struct led_classdev *led_cdev;
>>>> +	struct led_flash_setting *setting;
>>>> +	struct led_init_data init_data = {};
>>>> +	static const struct tps6131x_timer_config *timer_config;
>>>> +	int ret;
>>>> +
>>>> +	tps6131x->fled_cdev.ops = &flash_ops;
>>>> +
>>>> +	setting = &tps6131x->fled_cdev.timeout;
>>>> +	timer_config = tps6131x_find_closest_timer_config(0);
>>>> +	setting->min = timer_config->time_us;
>>>> +	setting->max = tps6131x->max_timeout_us;
>>>> +	setting->step = 1; /* Only some specific time periods are supported. No fixed step size. */
>>>> +	setting->val = setting->min;
>>>> +
>>>> +	setting = &tps6131x->fled_cdev.brightness;
>>>> +	setting->min = tps6131x->step_flash_current_ma;
>>>> +	setting->max = tps6131x->max_flash_current_ma;
>>>> +	setting->step = tps6131x->step_flash_current_ma;
>>>> +	setting->val = setting->min;
>>>> +
>>>> +	led_cdev = &tps6131x->fled_cdev.led_cdev;
>>>> +	led_cdev->brightness_set_blocking = tps6131x_brightness_set;
>>>> +	led_cdev->max_brightness = tps6131x->max_torch_current_ma;
>>>> +	led_cdev->flags |= LED_DEV_CAP_FLASH;
>>>> +
>>>> +	init_data.fwnode = tps6131x->led_node;
>>>> +	init_data.devicename = NULL;
>>>> +	init_data.default_label = NULL;
>>>> +	init_data.devname_mandatory = false;
>>>> +
>>>> +	ret = devm_led_classdev_flash_register_ext(&tps6131x->client->dev, &tps6131x->fled_cdev,
>>>> +						   &init_data);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +#if IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS)
>>>
>>> Not keen on #ifery in C files.
>>>
>>> Can you use is_defined() and return early instead?
>>>
>>> I see that there is a precedent for this already. :(
>>
>> Me neither, but since it is done this way in about 9 out of 10 flash
>> controllers, I wanted to continue doing it consistently.
>> But since the required v4l2_flash_* functions are also available as dummies
>> if this option is not activated, I could do it like this:
>>
>> if (!IS_BUILTIN(CONFIG_V4L2_FLASH_LED_CLASS))
>>    return 0;
>>
>> Would you prefer this solution?
> 
> I would, yes.  Thank you.

Sure, then I'll change that.

> 
>>>> +static int tps6131x_flash_external_strobe_set(struct v4l2_flash *v4l2_flash, bool enable)
>>>> +{
>>>> +	struct led_classdev_flash *fled_cdev = v4l2_flash->fled_cdev;
>>>> +	struct tps6131x *tps6131x = fled_cdev_to_tps6131x(fled_cdev);
>>>> +
>>>> +	guard(mutex)(&tps6131x->lock);
>>>> +
>>> /> +	return tps6131x_set_mode(tps6131x, enable ? TPS6131X_MODE_FLASH : TPS6131X_MODE_SHUTDOWN,
>>>> +				 false);
>>>> +}
>>>> +
>>>> +static const struct v4l2_flash_ops tps6131x_v4l2_flash_ops = {
>>>> +	.external_strobe_set = tps6131x_flash_external_strobe_set,
>>>> +};
>>>> +
>>>> +static int tps6131x_v4l2_setup(struct tps6131x *tps6131x)
>>>> +{
>>>> +	struct v4l2_flash_config v4l2_cfg = { 0 };
>>>> +	struct led_flash_setting *intensity = &v4l2_cfg.intensity;
>>>> +
>>>> +	intensity->min = tps6131x->step_torch_current_ma;
>>>> +	intensity->max = tps6131x->max_torch_current_ma;
>>>> +	intensity->step = tps6131x->step_torch_current_ma;
>>>> +	intensity->val = intensity->min;
>>>> +
>>>> +	strscpy(v4l2_cfg.dev_name, tps6131x->fled_cdev.led_cdev.dev->kobj.name,
>>>
>>> tps6131x->client->dev?
>>
>> Do you mean the name should be taken from the I2C device?
>> The current name, for example, is 'white:flash-0', while the I2C device name
>> would be '4-0033'. So I think the current version is appropriate, don't you
>> think?
> 
> No, I'm implying that:
> 
>    tps6131x->client->dev == tps6131x->fled_cdev.led_cdev.dev
> 
> ... and that the former is shorter / neater.

Hmm. That's interesting. I thought these were two different devices, 
which seems to be actually the case for me. Hence the different names in 
the kobj.
Are the devices really supposed to be identical?

> 
>>>> +		sizeof(v4l2_cfg.dev_name));
>>>> +
>>>> +	v4l2_cfg.has_external_strobe = true;
>>>> +	v4l2_cfg.flash_faults = LED_FAULT_TIMEOUT | LED_FAULT_OVER_TEMPERATURE |
>>>> +				LED_FAULT_SHORT_CIRCUIT | LED_FAULT_UNDER_VOLTAGE |
>>>> +				LED_FAULT_LED_OVER_TEMPERATURE;
>>>> +
>>>> +	tps6131x->v4l2_flash = v4l2_flash_init(&tps6131x->client->dev, tps6131x->led_node,
>>>> +					       &tps6131x->fled_cdev, &tps6131x_v4l2_flash_ops,
>>>> +					       &v4l2_cfg);
>>>> +	if (IS_ERR(tps6131x->v4l2_flash)) {
>>>> +		dev_err(&tps6131x->client->dev, "v4l2_flash_init failed\n");
>>>
>>> "Failed to initialise V4L2 flash LED" ?
>>
>> ACK
>>
>>>
>>>> +		return PTR_ERR(tps6131x->v4l2_flash);
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +#else
>>>> +
>>>> +static int tps6131x_v4l2_setup(struct tps6131x *tps6131x)
>>>> +{
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +#endif
>>>> +
>>>> +static int tps6131x_probe(struct i2c_client *client)
>>>> +{
>>>> +	struct tps6131x *tps6131x;
>>>> +	int ret;
>>>> +
>>>> +	tps6131x = devm_kzalloc(&client->dev, sizeof(*tps6131x), GFP_KERNEL);
>>>> +	if (!tps6131x)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	tps6131x->client = client;
>>>
>>> What are you planning on using client for?
>>>
>>>> +	i2c_set_clientdata(client, tps6131x);
>>>
>>> How are you going to _get_ this without client?
>>
>> Maybe I didn't understand the question correctly, but in tps6131x_remove() I
>> get the device data via the client.
> 
> Right, which uses 'client' to obtain it, so you don't need to save 'client'.

Okay, now I understand. Since I'm now saving 'dev' instead of 'client,' 
as you suggested, that's no longer an issue.

> 
>>> Why not save dev and reduce the amount of dereferencing levels required.
>>
>> Absolutely. Good idea.
>>
>>>
>>>> +	mutex_init(&tps6131x->lock);
>>>> +	INIT_DELAYED_WORK(&tps6131x->torch_refresh_work, tps6131x_torch_refresh_handler);
>>>> +
>>>> +	ret = tps6131x_parse_node(tps6131x);
>>>> +	if (ret)
>>>> +		return -ENODEV;
>>>> +
>>>> +	tps6131x->regmap = devm_regmap_init_i2c(client, &tps6131x_regmap);
>>>> +	if (IS_ERR(tps6131x->regmap)) {
>>>> +		ret = PTR_ERR(tps6131x->regmap);
>>>> +		dev_err(&client->dev, "Failed to allocate register map\n");
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	tps6131x->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
>>>> +	ret = tps6131x_reset_chip(tps6131x);
>>>> +	if (ret)
>>>> +		return dev_err_probe(&client->dev, ret, "Failed to reset LED controller\n");
>>>
>>> How do you manage the optional part?
>>
>> If there is a reset line, then tps6131x_reset_chip() uses it to reset the
>> chip. If there is none, the software reset (via an I2C register) is used.
>> Therefore the reset pin can be optional.
> 
> Right, but didn't you just fail if one is not provided, or is that
> accounted for in tps6131x_reset_chip()?

Yes, tps6131x_reset_chip() selects the appropriate reset method 
depending on the circumstances. Something like this:

if (IS_ERR_OR_NULL(tps6131x->reset_gpio))
   sofware reset via i2c
else
   hardware reset via gpio

So there's no error just because the reset GPIO isn't present.

Thanks
  ~Matthias

> 


