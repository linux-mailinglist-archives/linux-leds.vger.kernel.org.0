Return-Path: <linux-leds+bounces-4309-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09323A67545
	for <lists+linux-leds@lfdr.de>; Tue, 18 Mar 2025 14:38:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26F5318920D9
	for <lists+linux-leds@lfdr.de>; Tue, 18 Mar 2025 13:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0D1820CCCC;
	Tue, 18 Mar 2025 13:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DduDLAQ5"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A571EF377;
	Tue, 18 Mar 2025 13:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742304937; cv=none; b=HhzQGi6ngp4aXmZNJeO23+VTBSfRyQjR/vbLrVBl+jE4QwnI/3teLuEhGCfaUev0EPr6d1uO0g9PJA0FCdQYHD/2mkDDJ2h0PqZHeAtTTJDv0h3TaIB4AZCp7URs81bcHvIGjhsVPpjDfwXkiQgAinyTQSsakdufxIbb60y1C4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742304937; c=relaxed/simple;
	bh=n0mEZrtPVFv7A0f1vpnE6/u5hL2PQ567Nv8eplrxmM8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dv0i9AuWQzm0XWwEJm6O7HvO23dY28K1KD9wTeqCNcod/y7I+bgPrKWY/4R2qOtjj14QX6YmqPQZajRd/r/u1KALT6N5PrvMg4CfIsOzqWf16zYmW2S5KreHyZFndA7BjZtETM+9dlRMo/b4ZCu5vjcPJqqDDfFsE4XC9VDeLyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DduDLAQ5; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-225a28a511eso94177375ad.1;
        Tue, 18 Mar 2025 06:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742304935; x=1742909735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BK9GSktXVeTBiKP4vpO7uxVUPZ8KuSXcrBlmPyGGeKc=;
        b=DduDLAQ5kiq13TGPqQiVgzR4yZFzjaDJzoJDIFLXYlJPgpWHktWa6hoZVorkgc5sR3
         dXUD2G3GzCqaa5FU014jKdhJ9X68CuJYASgqLnDNtAiBUKUbexaJW4e1uSMb0vYsDLa7
         QuhAXpQua7u/Ftvuoe50sm/EIHneXD9T0IyznsPYFSmKYR7wEbC9Pe0erFR3xQ5xKHBv
         5qKGqsA3xnxjOaerByhySZJ+655AlraUWipNjU7IWfnkiczaeEOHiU/dJXgq4RzN/3ai
         QA87+Ai4f7qk/No+NCQop0zrZtyPyA0+joxCAYLpDBZFuRpqTHKyxkn8ig9ctSTMy5qU
         L9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742304935; x=1742909735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BK9GSktXVeTBiKP4vpO7uxVUPZ8KuSXcrBlmPyGGeKc=;
        b=Pu6sok2nwk4Db3A/vhqXkpnopHBhYf2um5XPoeQQnhCOagJkHpNAJ+mkjDDEsAxxcv
         MlLS2awKsYhDmIzA2ms5PnA7MbHIDSh4lcjVl4cvqy5pNy5Pvhq/OKoUgd2bzxMr3i7P
         dBiLJJfI3ofNLs5ExP8vGeiFp99tLvHOcm4R2fWtcJdeA1YRz4NTR+n6AjniS9ux1IFh
         lfvVseTsHy27X5hPp1w3KG81hhJ6g2Nyxb+2AL04n4Looo6nNfFQZ1hb1qJ0zb4VHxJA
         mVBisVpVD6rObeON9MgQKqUAfYlOPi4JZgOf16TwU2P6c/m2Y96pRl1MNgQrJUcN+KFj
         iJKg==
X-Forwarded-Encrypted: i=1; AJvYcCUL99khsvNr+KEAw4xsjK5AlZM58hxE9/h85e6ie9YB5V51aTHpBKDf2wE62Udh2J2fk8bspeb6a8Acvg==@vger.kernel.org, AJvYcCUUPVQkLufg4ewRutAat3OQm+PAOe56QmAqgSzDzwoj2vVPaygdQ9apFHJ5vRpaYo8eMBRmKJmc3uhe@vger.kernel.org, AJvYcCXujoH7kKwdQnV2LIZ+T/33v7iPoJiWRGxxNQdJNSUtQQolmdiJrX9L/jmHf3ODqOR1GTK5cCIc3h1Mfx+U@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+K80VS7ooN7wPtvel95/khTNF+NTFhjj/OkunaLtZcNLSsq+o
	Tz3hWzsAnCU0IXU6XOUp5p6Sw+1RlkplHSvWwAAW5nR7hmVbgqpjTCBD2Svr
X-Gm-Gg: ASbGncsD5WXTIAnQCBkXqoLeZGyvOl4BT6WdbaCKR1v3TElwjKDFIc9KI4TUG+AKvJR
	6xkiBjlYsLw5FWF9E3y2CojuNKK+DhNn90M+jMxuikvNtJA+wQSC/vPsh9JER1tC/9hkKvJluHC
	J9LcZkAWHZHaqWyJESFf9QIdiDxR+p5iLUwWDJ99RPdJoXcKK8GTillqDKyDkIeCgiu41+26HCf
	jakjN+aj2KCz11RCjrgHm52dW18MK+JBcGRYSLMMsXqow9PxBrYutr+0xuX2OvnrQelYiNt5py1
	sz8X56B3Z1yUi6CgVpd+HZu6lr+rsPq4S0n4ZKpdHGKMsb+2BE5G2rkd/g==
X-Google-Smtp-Source: AGHT+IFHm3Im+gQK859PEco0vWkKn3Ewq8gNT7au017FUr9qZ/mdN2TSUWi3mM5HqrF+VpbJ8JptuA==
X-Received: by 2002:a05:6a21:6da2:b0:1f5:9393:fd4d with SMTP id adf61e73a8af0-1f5c12d7a16mr23469546637.27.1742304935172;
        Tue, 18 Mar 2025 06:35:35 -0700 (PDT)
Received: from localhost.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9ccc3bsm8917372a12.7.2025.03.18.06.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 06:35:34 -0700 (PDT)
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
Date: Tue, 18 Mar 2025 20:35:08 +0700
Message-Id: <20250318133508.4531-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250306172126.24667-4-trannamatk@gmail.com>
References: <20250306172126.24667-4-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Nam Tran <trannamatk@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org> Pavel Machek <pavel@kernel.org>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

I sincerely apologize for not addressing all of your previous comments earlier. That was not my intention, and I truly appreciate the time and effort you have put into reviewing my patch. Below, I would like to properly address your concerns.

On Fri, Mar 07, 2025 at 12:21:26AM +0700, Nam Tran wrote:
> The chip can drive LED matrix 4x3.
> This driver enables LED control via I2C.

You still did not respond to comments from v1. I don't see it being addressed.

Nam: I am sorry. This is my mistake. I think that I just need to update source code based on your comments and submit a new patch. This is the first time I try to update a new thing to the Linux Kernel. I will give answer inline your message for tracing easily.

In previous comment you have a question
 "Why none of the 10 existing drivers fit for your device?"

Nam: I have carefully reviewed the existing LED drivers in the kernel, but none of them fully support the advanced capabilities of the LP5812. Unlike basic LED controllers, the LP5812 has difference features and register
For more detail, please refer to this documentation https://www.ti.com/lit/ds/symlink/lp5812.pdf?ts=1741765622088&ref_url=https%253A%252F%252Fwww.ti.com%252Fproduct%252FLP5812

>
> The driver is implemented in two parts:
> - Core driver logic in leds-lp5812.c
> - Common support functions in leds-lp5812-common.c

Why do you make two modules? This looks really unneccessary. Just compile them into one module. No, use proper kerneldoc Missing kerneldoc. Every exported symbol must have kerneldoc. Why this is not static?

Nam: I will merge source code into a file only. Therefore, I don’t need to export symbols here.

> +{
> +     int ret;
> +     u8 tmp;
> +
> +     ret = lp5812_read(chip, reg, &tmp);
> +     if (ret)
> +             return ret;
> +
> +     tmp &= ~mask;
> +     tmp |= val & mask;
> +
> +     return lp5812_write(chip, reg, tmp);
> +}
> +
> +/*
> + * Function: lp5812_read_tsd_config_status
> + * Description: read tsd config status register
> + * Param: chip --> struct lp5812_chip itself
> + *        reg_val
> + * Return: 0 if success
> + */
> +int lp5812_read_tsd_config_status(struct lp5812_chip *chip, u8 *reg_val)

Why this is not static?

Nam: I will change it to a static function.

> +{
> +     int ret = 0;
> +
> +     if (!reg_val)
> +             return -1;
> +
> +     ret = lp5812_read(chip, chip->regs->tsd_config_status_reg, reg_val);
> +
> +     return ret;
> +}
> +
> +/*
> + * Function: lp5812_update_regs_config

Missing kerneldoc

Nam: If I merge leds-lp5812-common.c into leds-lp5812.c, the functions will no longer need to be exported, as they will only be used internally within a single compilation unit. As a result, kernel doc for these symbols will no longer be mandatory. Would you agree that this approach eliminates the need for separate kernel doc entries for these functions?

> + * Description: update reg config register
> + * Param: chip --> struct lp5812_chip itself
> + * Return: 0 if success
> + */
> +int lp5812_update_regs_config(struct lp5812_chip *chip)
> +{
> +     int ret;
> +     u8 reg_val; /* save register value */
> +

...

> +static struct drive_mode_led_map chip_leds_map[] = {
> +     {
> +             "direct_mode",
> +             (const char *[]){LED0, LED1, LED2, LED3, NULL},

Drop the cast.
Nam: I will drop them.

> +     },
> +     {
> +             "tcmscan:1:0", /* tcm 1 scan; scan order 0 out0 */
> +             (const char *[]){LED_A0, LED_A1, LED_A2, NULL},
> +     },
> +     {
> +             "tcmscan:1:1", /* tcm 1 scan; scan order 0 out1 */
> +             (const char *[]){LED_B0, LED_B1, LED_B2, NULL},
> +     },
> +     {
> +             "tcmscan:1:2", /* tcm 1 scan; scan order 0 out2 */
> +             (const char *[]){LED_C0, LED_C1, LED_C2, NULL},
> +     },
> +     {
> +             "tcmscan:1:3", /* tcm 1 scan; scan order 0 out3 */
> +             (const char *[]){LED_D0, LED_D1, LED_D2, NULL},


What is all this here?

How LED controller with so little properties have so complicated driver?

Nam: This hardware has 7 modes. Each mode has many options. My idea is to create a driver that supports all capabilities of the hardware. Therefore, when the user updates the mode of hardware, it will create specific device files.
Refer: https://dev.ti.com/gallery/view/LED/LP581x/ver/0.16.0/

> +     },
> +     { /* tcm 2 scan, scan order 0 out0; scan order 1 out1 */
> +             "tcmscan:2:0:1",
> +             (const char *[]){LED_A0, LED_A1, LED_A2, LED_B0, LED_B1, LED_B2,
> +             NULL},
> +     },
> +     { /* tcm 2 scan, scan order 0 out0; scan order 1 out2 */
> +             "tcmscan:2:0:2",
> +             (const char *[]){LED_A0, LED_A1, LED_A2, LED_C0, LED_C1, LED_C2,
> +             NULL},


> +static void led_kobj_release(struct kobject *kobj)
> +{
> +     kfree(kobj);
> +}
> +
> +static void aeu_kobj_release(struct kobject *kobj)
> +{
> +     kfree(kobj);
> +}

What is all this? Why do you create your own kobjects?

Nam: Same as previous answer, I need to create kobjects to support many interfaces.

> +
> +static const struct kobj_type led_ktype = {
> +     .release = led_kobj_release,
> +     .sysfs_ops = &kobj_sysfs_ops,
> +};
> +
> +static const struct kobj_type aeu_ktype = {
> +     .release = aeu_kobj_release,
> +     .sysfs_ops = &kobj_sysfs_ops,
> +};


> +static ssize_t device_reset_store(struct device *dev,
> +             struct device_attribute *attr,
> +             const char *buf, size_t len)

NAK.

Sorry, you just cannot create whatever interfaces you want. You must use
standard LED interfaces for normal LED operations. None of these sysfs
are needed for device control.

Respond to this comment that you understood it (you ignored all previous
comments). …

Nam: based on LP5812 datasheet, it is not normal LED operations. It supports many modes, each mode we can control specific leds (user can enable/disable leds). Each led has normal mode, autonomous mode … That is why I want to create interfaces.

Based on your concern, I think that my driver may not be compatible with normal LED operations. Given that the LP5812 driver has advanced functionality beyond basic LED control, would it be acceptable to place the driver in a different location instead of drivers/led/? If so, could you suggest a more suitable location?

I am open to discussions on how best to integrate these features while maintaining compliance with kernel standards. Please let me know your thoughts on how we can refine the approach.

> +static LP5812_KOBJ_ATTR_RW(pwm1, aeu_pwm1_show, aeu_pwm1_store);
> +static LP5812_KOBJ_ATTR_RW(pwm2, aeu_pwm2_show, aeu_pwm2_store);
> +static LP5812_KOBJ_ATTR_RW(pwm3, aeu_pwm3_show, aeu_pwm3_store);
> +static LP5812_KOBJ_ATTR_RW(pwm4, aeu_pwm4_show, aeu_pwm4_store);
> +static LP5812_KOBJ_ATTR_RW(pwm5, aeu_pwm5_show, aeu_pwm5_store);
> +static LP5812_KOBJ_ATTR_RW(slope_time_t1, aeu_slope_time_t1_show,
> +             aeu_slope_time_t1_store);
> +static LP5812_KOBJ_ATTR_RW(slope_time_t2, aeu_slope_time_t2_show,
> +             aeu_slope_time_t2_store);
> +static LP5812_KOBJ_ATTR_RW(slope_time_t3, aeu_slope_time_t3_show,
> +             aeu_slope_time_t3_store);
> +static LP5812_KOBJ_ATTR_RW(slope_time_t4, aeu_slope_time_t4_show,
> +             aeu_slope_time_t4_store);
> +static LP5812_KOBJ_ATTR_RW(playback_time, aeu_playback_time_show,
> +             aeu_playback_time_store);


What is all this?

Nam: In autonomous mode, we can blink leds with specific PWM, delay, slope …
Refer: chapter 7.3.4 from https://www.ti.com/lit/ds/symlink/lp5812.pdf?ts=1741765622088&ref_url=https%253A%252F%252Fwww.ti.com%252Fproduct%252FLP5812

> +static int lp5812_probe(struct i2c_client *client)
> +{
> +     struct lp5812_chip *chip;
> +     int i; > +             aeu_init_properties(&chip->leds[i]);
> +
> +             /* set autonomous animation config as default for all LEDs */
> +             led_set_autonomous_animation_config(&chip->leds[i]);
> +     }
> +
> +     i2c_set_clientdata(client, chip);
> +
> +     ret = sysfs_create_group(&chip->dev->kobj, &chip->attr_group);


You need sysfs ABI documentation.

Nam: I understand that since the driver creates a sysfs attribute group using sysfs_create_group(), corresponding sysfs ABI documentation is required.
I will add a new entry under Documentation/ABI/testing/ to document the exposed sysfs attributes for the LP5812 driver in the next patch.

Best regards,
Nam

