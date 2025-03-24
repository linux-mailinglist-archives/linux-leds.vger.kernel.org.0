Return-Path: <linux-leds+bounces-4359-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C06A6D3A0
	for <lists+linux-leds@lfdr.de>; Mon, 24 Mar 2025 05:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D6CE188D060
	for <lists+linux-leds@lfdr.de>; Mon, 24 Mar 2025 04:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 229941581F8;
	Mon, 24 Mar 2025 04:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBoXjg0Y"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E692CA9;
	Mon, 24 Mar 2025 04:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742791522; cv=none; b=X+9CyurLwLi7nMJFMtnO2c2UJFuSvfpVHJIGS3gly1dQd8NT4kXMSOBh6Ior44VCnJR1TS456RKFwqQSZfslDAZY1Ms4CuIFWQTYYsgtmCe4iMIw7uarO3tYkrfOj86ckWDQtOGTw55VS8K/Sz3XBT06FJP+wCKfkv/Qd158TLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742791522; c=relaxed/simple;
	bh=q93L+drxsLpfZjrZcXVnNP2qNQ8Qcx/8cFTqrztrPK0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jod2F2Ye61KuZzZ920JTHOpg/HI3nIhwOgXUYEmj2obFfCGjClBNLRwcH11d4QpkzEnmbvZLRuDGCCrHhcXmNUTy5FV21iK8w3oeTobQ6hx0TUYqnH5D8l27iv9UafHLyM9Rxq/MyVE7sx+lY8L2xYXQ0BsnR/BF9Jb2cX5Gz7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBoXjg0Y; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22398e09e39so76609825ad.3;
        Sun, 23 Mar 2025 21:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742791519; x=1743396319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8VSf68qz1Og+Oisf3rEC8L8+VawmdCnjtgfsglJT2M=;
        b=CBoXjg0YU2YfrAkU2scOZH90BClwJg69RcEzn6APYqJeCTkUVvWWfhwm1Q3QFUI8xX
         IjDFlg/tkqIuWDHN/EARPC5kAky0NOvTD0YioiD62eFRisUdYBzDU8weS5Bf0/1a7GEu
         PdHyS+tW0xVeLsQy8tyLf+poQb61AJhqPYo65gpLIkXuLPY4yOXJwpqesQXshV4EOb42
         KcB1Vb0XhL1b2XHQueoltLJpnPuo8cMr+vE6AWK1PSl2R9Y7/lE8s8uW7Yr7J0rHDN5a
         2bAZSJ7aOVOWyf9tHXcDZZOCyremT2B4FJjkj0U0nH4vrqj9g6O3PWD/y/V2BhOITvZ3
         zFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742791519; x=1743396319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8VSf68qz1Og+Oisf3rEC8L8+VawmdCnjtgfsglJT2M=;
        b=PUKHJQCTCEBi52f/DKK6Fh9xsdVKKfoi0Mk1RABDm/37trYP9020SlgAIO1/FZxVzI
         FJhubNr1aYT1fEx2p+u1LnjysurmpiF6Uxagvlrl4809BVmKwSP9FWAkYMyaSMMFpv85
         1GkQvsDTFP6EcdOBC5Avmbl+eR3DTiED8txDpGcv9YnnxcRccGBPTBNN53cJHD1n5/i+
         /+Jqqf3f6nii9fOJ5AnZGiAwDHDc+DRsigLA+kBmveGNc6+Ly7X8SYrzOkNsZzg8N/uF
         l7Rs4fOmMxi4/LA5Ghzr8hwwrTMK2pXnU2/99g/3lfLjKerbfNQtmXtcItPcvVkhzuyF
         YFjg==
X-Forwarded-Encrypted: i=1; AJvYcCU/bcYyi9S20QMfKdcJ0jOg2rQa9tQNq900FZwKF2AAdMMKTlxWW2vpAc1BrIgP5mLyENw2UbVwKRTyf515@vger.kernel.org, AJvYcCXZ/a2SlrESnJodPcYS2DGWrA/QhrWkU7audxnM9TLzA4T4YVNQGVfY6AURO42nobYRXsCVHgeafUB3Vw==@vger.kernel.org, AJvYcCXspfEjcueGzpbpxQdm8YywLocf0mQ/gqYg9sCJc1BPIXpeuc01Z9FylNCNWBFRKDmIH2WOB3L/GS24@vger.kernel.org
X-Gm-Message-State: AOJu0YxoieAa1eY8pMxj1CW1/ZAPmMDJ7qRDpvk/HtQuZ716EKHFeD0i
	jmiVzh3vc5768ZvA/75ppuCd0MAYwqFH7Y8PKH2j9wUwT9gnTnF41ddNMj0D
X-Gm-Gg: ASbGnct78BUG/qxkYKxNElMJj3fj3Q7ALfN6g1WZoKxE1r7Cs3hGKUes4RZ/NbgiHK6
	5DSmh63sX0Lh8LOEJrgJIhmMQB3czjsYWIicDUeVm5gWDWME6p8UhNDfXMTVN6nK5Xpv5Ul6GEG
	eQaqBTgXvOyBRfVUJiroiDWIGJISv0Nc9Tv7loTZXcfWNe6THMgH5do5TYGWPCeYNhWpN09Spu6
	v3UvT9nh1lCtCZzbbckkoFDa+A/1sk2lep41356cOBjYkle5CZu52Aa2GylJHJ1PQrApafcEiFd
	skvvo6sgXMJnBvbG2lr3etWhwy9op3rSEKbKFCukFnjL6zR8cnb6n2pwhg==
X-Google-Smtp-Source: AGHT+IH3A9UtwMu96EbWL5yeWOTw6800q6K1G95AaBBgHpsH13eXS0A/T84tQVVl3O+ZQC07hS1xgw==
X-Received: by 2002:a05:6a00:391c:b0:736:4d44:8b77 with SMTP id d2e1a72fcca58-739059b3e94mr21827628b3a.8.1742791518976;
        Sun, 23 Mar 2025 21:45:18 -0700 (PDT)
Received: from localhost.localdomain ([27.70.184.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fd5639sm7099458b3a.53.2025.03.23.21.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 21:45:18 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: krzk+dt@kernel.org
Cc: pavel@kernel.org,
	lee@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] leds: add new LED driver for TI LP5812
Date: Mon, 24 Mar 2025 11:44:52 +0700
Message-Id: <20250324044452.16590-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250307-classic-nostalgic-ibex-f03c32@krzk-bin>
References: <20250307-classic-nostalgic-ibex-f03c32@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Below, I will properly address your remaining concerns in a better format.

On 7 Mar 2025 09:52:21, Krzysztof Kozlowski wrote:

>> 
>> The driver is implemented in two parts:
>> - Core driver logic in leds-lp5812.c
>> - Common support functions in leds-lp5812-common.c
>
>Why do you make two modules? This looks really unneccessary. Just
>compile them into one module.

I will merge source code into a file only.

>> +#include "leds-lp5812-common.h"
>> +
>> +/*
>> + * Function: lp5812_write
>> + * Params:
>> + * Return: 0 if success
>
>No, use proper kerneldoc
>
>> + */
>> +int lp5812_write(struct lp5812_chip *chip, u16 reg, u8 val)
>> +{
>> +	int ret;
>> +	u8 extracted_bits; /* save 9th and 8th bit of reg address */
>> +	struct i2c_msg msg;
>> +	u8 buf[2] = {(u8)(reg & 0xFF), val};
>> +
>> +	extracted_bits = (reg >> 8) & 0x03;
>> +	msg.addr = (chip->i2c_cl->addr << 2) | extracted_bits;
>> +	msg.flags = 0;
>> +	msg.len = sizeof(buf);
>> +	msg.buf = buf;
>> +
>> +	ret = i2c_transfer(chip->i2c_cl->adapter, &msg, 1);
>> +	if (ret != 1) {
>> +		dev_err(chip->dev, "i2c write error, register 0x%02X, ret=%d\n", reg, ret);
>> +		ret = ret < 0 ? ret : -EIO;
>> +	} else {
>> +		ret = 0;
>> +	}
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(lp5812_write);
>> +
>
>Missing kerneldoc. Every exported symbol must have kerneldoc.

If I merge leds-lp5812-common.c into leds-lp5812.c, the functions will no longer need to be exported, as they will only be used internally within a single compilation unit.
As a result, kernel doc for these symbols will no longer be mandatory.
Would you agree that this approach eliminates the need for separate kernel doc entries for these functions?

>> +int lp5812_read(struct lp5812_chip *chip, u16 reg, u8 *val)
>> +{
>> +	int ret;
>> +	u8 ret_val;  /* lp5812_chip return value */
>> +	u8 extracted_bits; /* save 9th and 8th bit of reg address */
>> +	u8 converted_reg;  /* extracted 8bit from reg */
>> +	struct i2c_msg msgs[2];
>> +
>> +	extracted_bits = (reg >> 8) & 0x03;
>> +	converted_reg = (u8)(reg & 0xFF);
>> +
>> +	msgs[0].addr = (chip->i2c_cl->addr << 2) | extracted_bits;
>> +	msgs[0].flags = 0;
>> +	msgs[0].len = 1;
>> +	msgs[0].buf = &converted_reg;
>> +
>> +	msgs[1].addr = (chip->i2c_cl->addr << 2) | extracted_bits;
>> +	msgs[1].flags = I2C_M_RD;
>> +	msgs[1].len = 1;
>> +	msgs[1].buf = &ret_val;
>> +
>> +	ret = i2c_transfer(chip->i2c_cl->adapter, msgs, 2);
>> +	if (ret != 2) {
>> +		dev_err(chip->dev, "Read register 0x%02X error, ret=%d\n", reg, ret);
>> +		*val = 0;
>> +		ret = ret < 0 ? ret : -EIO;
>> +	} else {
>> +		*val = ret_val;
>> +		ret = 0;
>> +	}
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(lp5812_read);
>> +
>> +int lp5812_update_bit(struct lp5812_chip *chip, u16 reg, u8 mask, u8 val)
>
>Why this is not static?

I will change it to a static function.

>> +{
>> +	int ret;
>> +	u8 tmp;
>> +
>> +	ret = lp5812_read(chip, reg, &tmp);
>> +	if (ret)
>> +		return ret;
>> +
>> +	tmp &= ~mask;
>> +	tmp |= val & mask;
>> +
>> +	return lp5812_write(chip, reg, tmp);
>> +}
>> +
>> +/*
>> + * Function: lp5812_read_tsd_config_status
>> + * Description: read tsd config status register
>> + * Param: chip --> struct lp5812_chip itself
>> + *        reg_val
>> + * Return: 0 if success
>> + */
>> +int lp5812_read_tsd_config_status(struct lp5812_chip *chip, u8 *reg_val)
>
>Why this is not static?

I will change it to a static function.

>> +{
>> +	int ret = 0;
>> +
>> +	if (!reg_val)
>> +		return -1;
>> +
>> +	ret = lp5812_read(chip, chip->regs->tsd_config_status_reg, reg_val);
>> +
>> +	return ret;
>> +}
>> +
>> +/*
>> + * Function: lp5812_update_regs_config
>
>Missing kerneldoc

As mentioned above, I won't use EXPORT_SYMBOL_GPL for this function.

>> + * Description: update reg config register
>> + * Param: chip --> struct lp5812_chip itself
>> + * Return: 0 if success
>> + */
>> +int lp5812_update_regs_config(struct lp5812_chip *chip)
>> +{
>> +	int ret;
>> +	u8 reg_val; /* save register value */
>> +
>
>...

As mentioned above, I won't use EXPORT_SYMBOL_GPL for this function.

>
>> +static struct drive_mode_led_map chip_leds_map[] = {
>> +	{
>> +		"direct_mode",
>> +		(const char *[]){LED0, LED1, LED2, LED3, NULL},
>
>Drop the cast.

I will drop them.

>> +	},
>> +	{
>> +		"tcmscan:1:0", /* tcm 1 scan; scan order 0 out0 */
>> +		(const char *[]){LED_A0, LED_A1, LED_A2, NULL},
>> +	},
>> +	{
>> +		"tcmscan:1:1", /* tcm 1 scan; scan order 0 out1 */
>> +		(const char *[]){LED_B0, LED_B1, LED_B2, NULL},
>> +	},
>> +	{
>> +		"tcmscan:1:2", /* tcm 1 scan; scan order 0 out2 */
>> +		(const char *[]){LED_C0, LED_C1, LED_C2, NULL},
>> +	},
>> +	{
>> +		"tcmscan:1:3", /* tcm 1 scan; scan order 0 out3 */
>> +		(const char *[]){LED_D0, LED_D1, LED_D2, NULL},
>
>
>What is all this here?
>
>How LED controller with so little properties have so complicated driver?

This hardware has 3 main modes. Each mode has many options. My idea is to create a driver that supports all capabilities of the hardware.
Therefore, when the user updates the mode of hardware, it will create specific device files.
Refer: https://dev.ti.com/gallery/view/LED/LP581x/ver/0.16.0/

>> +	},
>> +	{ /* tcm 2 scan, scan order 0 out0; scan order 1 out1 */
>> +		"tcmscan:2:0:1",
>> +		(const char *[]){LED_A0, LED_A1, LED_A2, LED_B0, LED_B1, LED_B2,
>> +		NULL},
>> +	},
>> +	{ /* tcm 2 scan, scan order 0 out0; scan order 1 out2 */
>> +		"tcmscan:2:0:2",
>> +		(const char *[]){LED_A0, LED_A1, LED_A2, LED_C0, LED_C1, LED_C2,
>> +		NULL},
>
>
>> +static void led_kobj_release(struct kobject *kobj)
>> +{
>> +	kfree(kobj);
>> +}
>> +
>> +static void aeu_kobj_release(struct kobject *kobj)
>> +{
>> +	kfree(kobj);
>> +}
>
>What is all this? Why do you create your own kobjects?

Same as previous answer, I need to create kobjects to support many interfaces.

>> +
>> +static const struct kobj_type led_ktype = {
>> +	.release = led_kobj_release,
>> +	.sysfs_ops = &kobj_sysfs_ops,
>> +};
>> +
>> +static const struct kobj_type aeu_ktype = {
>> +	.release = aeu_kobj_release,
>> +	.sysfs_ops = &kobj_sysfs_ops,
>> +};
>
>
>> +static ssize_t device_reset_store(struct device *dev,
>> +		struct device_attribute *attr,
>> +		const char *buf, size_t len)
>
>NAK.
>
>Sorry, you just cannot create whatever interfaces you want. You must use
>standard LED interfaces for normal LED operations. None of these sysfs
>are needed for device control.
>
>Respond to this comment that you understood it (you ignored all previous
>comments).

Based on LP5812 datasheet, it is not normal LED operations. It supports many modes, each mode we can control specific leds (user can enable/disable leds). Each led has normal mode, autonomous mode,… That is why I want to create interfaces.
Based on your concern, I think that my driver may not be compatible with normal LED operations. Given that the LP5812 driver has advanced functionality beyond basic LED control, would it be acceptable to place the driver in a different location instead of drivers/led/? If so, could you suggest a more suitable location?
I am open to discussions on how best to integrate these features while maintaining compliance with kernel standards. Please let me know your thoughts on how we can refine the approach.

>> +static LP5812_KOBJ_ATTR_RW(pwm1, aeu_pwm1_show, aeu_pwm1_store);
>> +static LP5812_KOBJ_ATTR_RW(pwm2, aeu_pwm2_show, aeu_pwm2_store);
>> +static LP5812_KOBJ_ATTR_RW(pwm3, aeu_pwm3_show, aeu_pwm3_store);
>> +static LP5812_KOBJ_ATTR_RW(pwm4, aeu_pwm4_show, aeu_pwm4_store);
>> +static LP5812_KOBJ_ATTR_RW(pwm5, aeu_pwm5_show, aeu_pwm5_store);
>> +static LP5812_KOBJ_ATTR_RW(slope_time_t1, aeu_slope_time_t1_show,
>> +		aeu_slope_time_t1_store);
>> +static LP5812_KOBJ_ATTR_RW(slope_time_t2, aeu_slope_time_t2_show,
>> +		aeu_slope_time_t2_store);
>> +static LP5812_KOBJ_ATTR_RW(slope_time_t3, aeu_slope_time_t3_show,
>> +		aeu_slope_time_t3_store);
>> +static LP5812_KOBJ_ATTR_RW(slope_time_t4, aeu_slope_time_t4_show,
>> +		aeu_slope_time_t4_store);
>> +static LP5812_KOBJ_ATTR_RW(playback_time, aeu_playback_time_show,
>> +		aeu_playback_time_store);
>
>
>What is all this?

In autonomous mode, we can blink leds with specific PWM, delay, slope …
Refer: chapter 7.3.4 from https://www.ti.com/lit/ds/symlink/lp5812.pdf?ts=1741765622088&ref_url=https%253A%252F%252Fwww.ti.com%252Fproduct%252FLP5812

>> +static int lp5812_probe(struct i2c_client *client)
>> +{
>> +	struct lp5812_chip *chip;
>> +	int i;
>> +	int ret;
>> +	u8 val;
>> +
>> +	chip = devm_kzalloc(&client->dev, sizeof(struct lp5812_chip),
>> +			GFP_KERNEL);
>> +	if (!chip)
>> +		return -ENOMEM;
>> +	mutex_init(&chip->lock);
>> +	chip->i2c_cl = client;
>> +	chip->dev = &client->dev;
>> +	chip->regs = &regs;
>> +	chip->command = NONE;
>> +	chip->total_leds = MAX_LEDS;
>> +	chip->attr_group.name = "lp5812_chip_setup";
>> +	chip->attr_group.attrs = lp5812_chip_attributes;
>> +	chip->chip_leds_map = chip_leds_map;
>> +	chip->u_drive_mode.drive_mode_val = 0x10;
>> +	chip->u_scan_order.scan_order_val = 0x00;
>> +
>> +	/* initialize property for each led */
>> +	for (i = 0; i < MAX_LEDS; i++) {
>> +		chip->leds[i].led_name = led_name_array[i];
>> +		chip->leds[i].led_number = i;
>> +		chip->leds[i].anim_base_addr = anim_base_addr_array[i];
>> +		chip->leds[i].enable = 0; /* LED disable as default */
>> +		chip->leds[i].mode = MANUAL; /* manual mode as default */
>> +		chip->leds[i].priv = chip;
>> +		chip->leds[i].total_aeu = MAX_AEU;
>> +		chip->leds[i].led_playback.led_playback_val = 0;
>> +		chip->leds[i].start_stop_pause_time.time_val = 0;
>> +		/* sysfs for this led not be created */
>> +		chip->leds[i].is_sysfs_created = 0;
>> +		chip->leds[i].attr_group.attrs = led_kobj_attributes;
>> +		kobject_init(&chip->leds[i].kobj, &led_ktype);
>> +
>> +		/* init animation engine unit properties */
>> +		aeu_init_properties(&chip->leds[i]);
>> +
>> +		/* set autonomous animation config as default for all LEDs */
>> +		led_set_autonomous_animation_config(&chip->leds[i]);
>> +	}
>> +
>> +	i2c_set_clientdata(client, chip);
>> +
>> +	ret = sysfs_create_group(&chip->dev->kobj, &chip->attr_group);
>
>
>You need sysfs ABI documentation.

I will add a new entry under Documentation/ABI/testing/ to document the exposed sysfs attributes for the LP5812 driver in the next patch.

Best regards,
Nam Tran

