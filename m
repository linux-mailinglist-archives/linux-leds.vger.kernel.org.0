Return-Path: <linux-leds+bounces-4399-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6283CA7BE7F
	for <lists+linux-leds@lfdr.de>; Fri,  4 Apr 2025 15:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98679173984
	for <lists+linux-leds@lfdr.de>; Fri,  4 Apr 2025 13:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB2E1F4186;
	Fri,  4 Apr 2025 13:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b="J22En9fR"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBA81F152A
	for <linux-leds@vger.kernel.org>; Fri,  4 Apr 2025 13:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743774884; cv=none; b=VwpcAMllsLQnWXBcNEHzdLbYKJdZe+B0hC2wefQMP1jAO+sv4rhRiqUC+9qICcXG6jvQmROQCzKha8kNDzrMg61goF9WXv0eCU3CN4eay/DGkP0u4E7p/ewM4zO6an05/vOuMSiNpaTXpWGvv8+cBPnGk0SCTfifHypsou7TKQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743774884; c=relaxed/simple;
	bh=TzzAGUPZSfr3pJxORrzSYxXe5rbwSPVDubUqtayWsr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uhs1CHtbL28DA/Gv3px91DD3/TnJCbABixIvy1ZVaF54MdFqsEPdqA2K4IuUWolc3ngnrcrGkf+ULzA+YbGLNo+kP/42qzIVS2GlqQEBh2U4hXWUOLLw7SWGwNTr5Ifa/czWijymLuR0GZwhPifhtRdBXcBIhhwMS8dpdP7LvP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b=J22En9fR; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e677f59438so3268132a12.2
        for <linux-leds@vger.kernel.org>; Fri, 04 Apr 2025 06:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1743774879; x=1744379679; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mq7JkICkqN6XgL6+CNdZ3+38WtNFoa8H0helDu0w6yI=;
        b=J22En9fR1rqkKUj6eiJjtwVMhtno4mhgUWZZO9yYkXGxty5G9FLYlEdO3BYWy4s9QU
         Nc7yI6SUgXADSVP23OqlWE0NcZdhWvKaQLKtDdcEtg9ZpfFJNPgAjAnuw1ZQ+Y3Xhvnh
         7uiL1iSVpk3p3/5EhAzi9+y3YdHKnVBTumoVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743774879; x=1744379679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mq7JkICkqN6XgL6+CNdZ3+38WtNFoa8H0helDu0w6yI=;
        b=Tpaaw/1hbSlmgcP/O4pyv5F3PHN2EPnMS4l0jxoHVsariwIV7ilFu4BKmKQ1g9XHcq
         vUkRizfwUB/Hri3iJPMi/lX7aDnL6jeeaJo+JiQ9F5J5QrVywG9f74O4rxthBpNKQE20
         TvxRPT0QIGKS2FKRibofXtN2TzB+xysLHIVjIHqpDm5ci3fSQ0hTWlcE9j+v9sGWhTXx
         8OaXpRFpSAj4pbRyQ/lYScwwaUil+/QnyHTlJvf3PcmRtpyyphgCxV5DUyRbjR8pUZc2
         NRcBaHuzTv6qW/nvdoE9L+mvy4dF/4j+9WdrkPoME98z00qNa7vxbkL+a78qscll05iQ
         3Bvw==
X-Forwarded-Encrypted: i=1; AJvYcCVvICVlgIj0SSL3UtJx5VBMPIWQevLxlrHMyQR0tKxtbilmKzbZ1cNcYcqcX0zFNYTonA8HFek+7cAt@vger.kernel.org
X-Gm-Message-State: AOJu0YxnzoUIAZ7eFqpBAfJqKGFl/Bq5yCmDUR77HRuKphEjv6m+2lg0
	NCnnsdtTNrxm464coMWXZoIK7DgkvdFrJiLugvObqSAm1lI7Ypvm0GFbLag0NZq5VMvsj5alDkY
	nhEBsp7/yq3jZt2T7Q931eadMC1IokpQs+YVsyQ==
X-Gm-Gg: ASbGncsC84N7RsorHISp7a6MPTM2nuJ5qZn4FsNV7S95Qy9VlR2MIC9wT+r3Kc1fIL7
	yOzz6gIJ/46u4Qsh8KbJEeRzRYHN/Ru1n55mWdzzi/JHWJTI5kc40PNrFNY4NP3RK2Cl4ykxpir
	d7nTcWhX/beFUZ8SOOhsLoHVv9LQ==
X-Google-Smtp-Source: AGHT+IFXBMBQh84SPFA1ke6dDoxsNULs353AB4Sq132g1VTzqy7EZo9T/igMb43O4/eEIf9DuJ4q6ij914J5nItOfms=
X-Received: by 2002:a05:6402:51c7:b0:5e8:bf8b:4396 with SMTP id
 4fb4d7f45d1cf-5f0b658917cmr2341509a12.13.1743774879374; Fri, 04 Apr 2025
 06:54:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326153535.158137-1-corentin.guillevic@smile.fr> <3be3ca59-157d-4ceb-81bd-4a1acdbccb9c@wanadoo.fr>
In-Reply-To: <3be3ca59-157d-4ceb-81bd-4a1acdbccb9c@wanadoo.fr>
From: Corentin GUILLEVIC <corentin.guillevic@smile.fr>
Date: Fri, 4 Apr 2025 15:54:28 +0200
X-Gm-Features: ATxdqUHIMMxfhYog5N5EbMGu-cdJbJG577zcyhIzeQ6REUNq6nXWSs3jt6g3j5o
Message-ID: <CAMFqQmpJB4WeOM7GF1dEuJDb27rf=CBC4UuROWA+AH2+ZbJE8w@mail.gmail.com>
Subject: Re: [PATCH 1/2] leds: tlc5928: Driver for the TI 16 Channel spi LED driver
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thank you for your review! I've fixed everything (new patch is
coming), but I have issue for some of them: I can't use the suggested
functions (guard(), for_each_available_child_of_node_scoped() and
devm_mutex_init()) because the kernel version used on my device is too
old (v5.15). No way to test with a newer version...

Should I let the "old" functions because of my kernel version?

>
> Le 26/03/2025 =C3=A0 16:35, Corentin Guillevic a =C3=A9crit :
> > The TLC59928 is an SPI-connected bus controlled 16-channel LED driver.
> > A single 16-bit register handles the whole LEDs. Following a write, a
> > latch GPIO applies the new LED configuration. An "enable" GPIO (blank
> > in the TLC59928 datasheet) turns off the whole LEDs when active/high.
> >
> > This driver is able to handle a daisy-chain case, so when several
> > TLC59928 controllers are connected in serie.
> >
> > Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
> > ---
>
> ...
>
> > +static int
> > +tlc5928_set_ledout(struct tlc5928_led *led, bool val)
> > +{
> > +     struct tlc5928_chip *chip;
> > +     struct tlc5928_chip *chip_owner =3D led->chip;
> > +     struct tlc5928_priv *priv =3D chip_owner->priv;
> > +     int ret;
> > +
> > +     mutex_lock(&priv->lock);
> > +
> > +     if (val)
> > +             chip_owner->leds_state |=3D (1 << led->led_no);
> > +     else
> > +             chip_owner->leds_state &=3D ~(1 << led->led_no);
> > +
> > +     list_for_each_entry_reverse(chip, &priv->chips_list, list) {
> > +             u16 leds_state =3D cpu_to_be16(chip->leds_state);
> > +
> > +             ret =3D spi_write(priv->spi, &(leds_state), sizeof(leds_s=
tate));
> > +
> > +             if (ret)
>
> Missing unlock.
> Or use guard()?
>

Fixed! But guard() is unavailable on my kernel.

> > +                     return ret;
> > +     }
> > +
> > +     gpiod_set_value(priv->latch_gpio, 0);
> > +     udelay(1);
> > +     gpiod_set_value(priv->latch_gpio, 1);
> > +
> > +     mutex_unlock(&priv->lock);
> > +
> > +     return 0;
> > +}
> > +
> > +static int
> > +tlc5928_brightness_set(struct led_classdev *led_cdev,
> > +                     enum led_brightness brightness)
> > +{
> > +     struct tlc5928_led *led =3D ldev_to_led(led_cdev);
> > +
> > +     /* TLC5928 only allows on/off, no brightness */
> > +     return tlc5928_set_ledout(led, !!brightness);
> > +}
> > +
> > +static const struct of_device_id of_tlc5928_leds_match[] __maybe_unuse=
d =3D {
> > +     { .compatible =3D "ti,tlc5928" },
> > +     {},
>
> Unneeded trailing ,
>
> > +};
> > +MODULE_DEVICE_TABLE(of, of_tlc5928_leds_match);
> > +
> > +static int tlc5928_probe_chip_dt(struct device *dev, struct device_nod=
e *node,
> > +             struct tlc5928_chip *chip)
> > +{
> > +     struct device_node *child;
> > +     int count, err, reg;
> > +
> > +     count =3D of_get_available_child_count(node);
> > +     if (!count)
> > +             return -EINVAL;
> > +
> > +     chip->leds_state =3D 0;
> > +
> > +     for_each_available_child_of_node(node, child) {
>
> for_each_available_child_of_node_scoped()?
>

Same, not defined because my kernel is too old.

> > +             struct tlc5928_led *led;
> > +             struct led_init_data init_data =3D {};
> > +
> > +             init_data.fwnode =3D of_fwnode_handle(child);
> > +
> > +             err =3D of_property_read_u32(child, "reg", &reg);
> > +             if (err) {
> > +                     dev_err(dev, "%pOF: failed to read reg\n", child)=
;
> > +                     of_node_put(child);
> > +                     return err;
> > +             }
> > +
> > +             if (reg < 0 || reg >=3D TLC5928_MAX_LEDS ||
> > +                             chip->leds[reg].active) {
> > +                     of_node_put(child);
> > +                     return -EINVAL;
> > +             }
> > +
> > +             led =3D &chip->leds[reg];
> > +
> > +             led->active =3D true;
> > +             led->chip =3D chip;
> > +             led->led_no =3D reg;
> > +             led->ldev.brightness_set_blocking =3D tlc5928_brightness_=
set;
> > +             err =3D devm_led_classdev_register_ext(dev, &led->ldev,
> > +                                                      &init_data);
> > +             if (err < 0) {
> > +                     of_node_put(child);
> > +                     dev_err(dev, "Failed to register LED for node %pf=
w\n",
> > +                             init_data.fwnode);
> > +                     return err;
> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int tlc5928_probe(struct spi_device *spi)
> > +{
> > +     struct device_node *node, *child;
> > +     struct device *dev =3D &spi->dev;
> > +     struct list_head *pos;
> > +     struct tlc5928_chip *chip;
> > +     struct tlc5928_priv *priv;
> > +     int count, err, i;
> > +
> > +     node =3D dev_of_node(dev);
> > +     if (!node)
> > +             return -ENODEV;
> > +
> > +     count =3D of_get_available_child_count(node);
> > +     if (!count)
> > +             return -EINVAL;
> > +
> > +     priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     priv->spi =3D spi;
> > +     priv->latch_gpio =3D devm_gpiod_get(dev, "latch", GPIOD_OUT_HIGH)=
;
> > +     if (IS_ERR(priv->latch_gpio))
> > +             return dev_err_probe(dev, PTR_ERR(priv->latch_gpio),
> > +                                  "Failed to get latch GPIO\n");
> > +
> > +     mutex_init(&priv->lock);
>
> Maybe:
> err =3D devm_mutex_init(...);
> if (err)
>         return err;
>
> ?

Same.

>
> > +     INIT_LIST_HEAD(&priv->chips_list);
> > +
> > +     i =3D 0;
> > +     for_each_available_child_of_node(node, child) {
> > +             chip =3D devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> > +             if (!chip)
> > +                     return -ENOMEM;
> > +
> > +             list_add_tail(&chip->list, &priv->chips_list);
> > +             chip->priv =3D priv;
> > +             chip->enable_gpio =3D devm_gpiod_get_index_optional(dev, =
"enable", i,
> > +                             GPIOD_OUT_HIGH);
> > +             if (IS_ERR(chip->enable_gpio)) {
> > +                     dev_err(dev, "Error getting enable GPIO %i proper=
ty: %ld\n", i,
> > +                                     PTR_ERR(chip->enable_gpio));
> > +                     return PTR_ERR(chip->enable_gpio);
> > +             }
> > +
> > +             err =3D tlc5928_probe_chip_dt(dev, child, chip);
> > +             if (err)
> > +                     return err;
> > +
> > +             i++;
> > +     }
> > +
> > +     list_for_each(pos, &priv->chips_list) {
>
> list_for_each_entry()?
>
> > +             chip =3D container_of(pos, struct tlc5928_chip, list);
> > +             if (chip->enable_gpio)
> > +                     gpiod_set_value(chip->enable_gpio, 0);
> > +     }
> > +
> > +     spi_set_drvdata(spi, priv);
> > +
> > +     return 0;
> > +}
> > +
> > +static int tlc5928_remove(struct spi_device *spi)
> > +{
> > +     struct list_head *pos;
> > +     struct tlc5928_priv *priv =3D spi_get_drvdata(spi);
> > +     int i;
> > +
> > +     list_for_each(pos, &priv->chips_list) {
>
> list_for_each_entry()?
>

Fixed!

> > +             struct tlc5928_chip *chip =3D container_of(pos, struct tl=
c5928_chip,
> > +                             list);
> > +
> > +             for (i =3D 0; i < TLC5928_MAX_LEDS; i++) {
> > +                     if (chip->leds[i].active)
> > +                             devm_led_classdev_unregister(&spi->dev,
> > +                                          &chip->leds[i].ldev);
>
> Why is it needed?
> devm_led_classdev_register_ext() was used.
>

Yes, because the latch GPIO is set each time a LED is set. But during
the module removing process, devm releases before the GPIO and then
each LED (turning them off). So the kernel gets a NULL pointer after
deference.

An explicit unregister allows to free the LEDs before the GPIO.

> > +             }
> > +
> > +             if (chip->enable_gpio) {
> > +                     gpiod_set_value(chip->enable_gpio, 1);
> > +                     gpiod_put(chip->enable_gpio);
>
> Why is it needed?
> devm_gpiod_get_index_optional() was used.
>

Fixed!

> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct spi_device_id tlc5928_id[] =3D {
> > +     { "tlc5928" },
> > +     {},
>
> Unneeded trailing ,
>
> > +};
> > +MODULE_DEVICE_TABLE(spi, tlc5928_id);
>
> ...
>
> CJ
>

Corentin Guillevic

