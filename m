Return-Path: <linux-leds+bounces-7129-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPtZCXrOqml4XQEAu9opvQ
	(envelope-from <linux-leds+bounces-7129-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 06 Mar 2026 13:54:18 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFE8221143
	for <lists+linux-leds@lfdr.de>; Fri, 06 Mar 2026 13:54:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FF8030859D5
	for <lists+linux-leds@lfdr.de>; Fri,  6 Mar 2026 12:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3B72D0C98;
	Fri,  6 Mar 2026 12:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NnWMBrBr"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77D333D4E4
	for <linux-leds@vger.kernel.org>; Fri,  6 Mar 2026 12:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772801125; cv=pass; b=O3ogSkh28aX3VWieP3KyRvn7p1f03NUu6Gc4helLKOoe29WX/J6U9+zgcF0ldjouC0JTAYQo6+R0DapZXnXui3an8h7YfeTa9rbd8ep4v2tR5Va6jZxJ+6uqgTxWSziHvMTDKJ9kAXKR95m3VB79gQ/HmS4pnKyScxsyNyusJeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772801125; c=relaxed/simple;
	bh=d4+yHnqqrag21e5l+zlyKxbPtZdeRMS/eu8jTZJiNPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h/eCmQjkNhSAbY8a0Je06qzhy5fN+HkyVFUAtDWMMuGnguoYzWTYhCrpHINVBL0fgE/7uucP4puQCcK+4yvhcrFrT3Vr8Bhq1FdI7dzJOETQqU2GScYqCv1AstC1mKxwfoLJqXIqBJvT/GbfAcDxmahNjncMJZJoPjGFQcFtiHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NnWMBrBr; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439afc58ac7so6235143f8f.0
        for <linux-leds@vger.kernel.org>; Fri, 06 Mar 2026 04:45:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772801119; cv=none;
        d=google.com; s=arc-20240605;
        b=QrmJBGCHyel5btENJQDSidH5xpju+dpvwOh2aJuF7PWCNKiTchIck44KRBQbDmkp/9
         U+nsQR0FW48Q/9liniCIj2hTUw3cOYNGK0W5up+b6tjcSU1+7J2GpLXJAE1VXqvAigHd
         1NjgwpHT0Eb/4Bp8qesuK284TrXo34mu2jp1pM3QUOJwFN5gJl05eSVrdnH6i49cyA3B
         tCUwdQnNCazFRhWB/d01FjYcOYRWBwWiETgofkj3nlrmgDPP0dpEWWLKWEeDjRdS5gn2
         f9oT9inTTX6jkv9Xd0XhPaV7ypE52ywjxsFKQptMCK1hqzkjx6o4+FRdbaSqyxXjGOlP
         klcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O9taYqzLoINgFyYur740XSP0g3dcwW79M5LNhuZRVTQ=;
        fh=DSgKNA8cPqzHmW3FEuQiiJTlYPp8HoNJFvloQCll9WQ=;
        b=WzU+gpXkopBA1zJ7erawNnk9XSbXpSWsPJG9a2EFCEoncqGSC7JU7pIEqc3Gwq98zs
         Y5DyZEl7rAGkpN1zangaQ/6yF5xgNGpz68t9Bh4b+m+xC3yOrDXJ9Pz2O6Zo+WEPa8cs
         3HH/lhW1xpUBw0NKgCh2sDJHGyPtMpF73XTQOR41iqetudRV/FxqqWqV+QAPu7hBXK4X
         B7dqFlnDIqCg0LYC7DCFPSlH/jZZo8vMLwKRzoM12XAopU/9wuh638DVMe9axWJs6DGS
         FJL+ss1k4Uoet8F1JfxRIc0gaLYWc/eWE60j7BuzNLVklcCt3yFXNNIESuEsBZZxbJji
         i5nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772801119; x=1773405919; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9taYqzLoINgFyYur740XSP0g3dcwW79M5LNhuZRVTQ=;
        b=NnWMBrBrgbDwZgWxE9kj9+jShrldnAQYtjg/tq0jH5FpEzN6RRZ71jnEuVGHG+VaAk
         XpnH/PhuRKHCeJBJ+PQDPQp9VkdMN45YFqre4hesuzaHED0GNzkF0yryaooRg3EWWzWu
         q+kp8zye3xCmftmeM5KQRtdL5+YYu/zdyaGNceUYSWIp50oyk5dKTBtE8Ouv2M+PWLkT
         LhOYf8OZv1efjqxgXuxiNuXsgBEmfqcyvxx3miZmv0fvg++kmNc5QRWkL7zU+JJgEtMK
         BL7hioyeWlkaq6KHittHRggg8ClQFVxTIBfZSpAXpixMrLEd30XSKqRpKA1zhqVrv9xp
         jqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772801119; x=1773405919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O9taYqzLoINgFyYur740XSP0g3dcwW79M5LNhuZRVTQ=;
        b=efdWjDeKsWaqREwlcfAaFF6HJ6kox1vqoZopXNoSx1lEn2rbYhzAEf8VvIecOBQL4K
         gbP6Jh5/GCy1iJmPWvftZWu8XQeSU10N7HiO4icwCCvH14JgcmTO1daRDj5Df3iKImEI
         aVy1NtCjeHJUPj3ON2ohaHw8r30j9A2QOxSGm4si1wevKhnwEpqPEI8grrOnoqTXNYUE
         aPogITkW+EbLQOl2HWvY+8i+ttF5DPrztiK6AFXpHIyrzUXZNQtaE9nqA4rORZOCHGLA
         Uxg1H8/LMGUu4okUaWheVQrw+J5lj3OJyLuBYvrqw8ZcNQ4r7s8SF+wxT6PI9NfhedyK
         LbeA==
X-Forwarded-Encrypted: i=1; AJvYcCWoO6jq7sjRcTDFdNxzaHHozVwvIX72yHQoUI6G0sys+ru6xs6TU1/yiTryeSTiqt7FaEYLg03kJlL5@vger.kernel.org
X-Gm-Message-State: AOJu0YwB2AGNaiSbO/UNOf0St6QvtpgW9MsBiHuTKujmYvMeX2oxVhzH
	iweg8db0g4QTAhWYbHB1FUHTyUFUrbdC4At4iTy8K9HBIab/7eBQ9Eyl5jj58y5YYh7FfVRCZtM
	ZjlyKXrSGSHy+WCxQyt4QbSL8r5iNUNI=
X-Gm-Gg: ATEYQzz5shje7GYKP7rBaKCvTnqtXOflHGGCGn8YkwU86CCoTXv0m8u5kXyEI0k3S3y
	aXJ6U3ar/t/ZLkQ+jKE/lV4yc3gP6ZPOiJ2wCWyCOp5E4xTLyjHLqW4rZn/b6neh0YeJBSmtZyK
	N16GnVMVcqYZW2+rDhZQWkMxxtpwqE3fvwLMhQOFmOaK7jBl00z0tlWAR9avn8Ku7Fg+b/PKVME
	W/N8MQ+buQwcRLPoyQkTA1PzfqDl9sZl7uZJVBHaQOZ9U7AxxMn+HNDWLIHQp8r2Xlf2YZLr6nD
	zXiWWofkjzn9imdWDdk=
X-Received: by 2002:a05:6000:290d:b0:439:b6ae:5d5f with SMTP id
 ffacd0b85a97d-439da882118mr3606908f8f.36.1772801118465; Fri, 06 Mar 2026
 04:45:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209104407.116426-1-clamor95@gmail.com> <20260209104407.116426-8-clamor95@gmail.com>
 <20260306100406.GE183676@google.com>
In-Reply-To: <20260306100406.GE183676@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 6 Mar 2026 14:45:07 +0200
X-Gm-Features: AaiRm51NBymZ6EonP39IyTLl3AORXQ6isOvT7w3F168jzatW4GJkZM3l_t1FQ3I
Message-ID: <CAPVz0n0jnuhmvsSPckfFOQ0NZ3VMe6W2p_Bb5a9pdVZYhVSJhQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] leds: Add driver for Asus Transformer LEDs
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Pavel Machek <pavel@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Ion Agorria <ion@agorria.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 7BFE8221143
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7129-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,arndb.de,linuxfoundation.org,rere.qmqm.pl,agorria.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,qmqm.pl:email]
X-Rspamd-Action: no action

=D0=BF=D1=82, 6 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 12:04 Lee J=
ones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, 09 Feb 2026, Svyatoslav Ryhel wrote:
>
> > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> >
> > Asus Transformer tablets have a green and an amber LED on both the Pad
> > and the Dock. If both LEDs are enabled simultaneously, the emitted ligh=
t
> > will be yellow.
> >
> > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > ---
> >  drivers/leds/Kconfig        |  11 ++++
> >  drivers/leds/Makefile       |   1 +
> >  drivers/leds/leds-asus-ec.c | 104 ++++++++++++++++++++++++++++++++++++
> >  3 files changed, 116 insertions(+)
> >  create mode 100644 drivers/leds/leds-asus-ec.c
> >
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > index 597d7a79c988..96dab210f6ca 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -120,6 +120,17 @@ config LEDS_OSRAM_AMS_AS3668
> >         To compile this driver as a module, choose M here: the module
> >         will be called leds-as3668.
> >
> > +config LEDS_ASUSEC
> > +     tristate "LED Support for Asus Transformer charging LED"
> > +     depends on LEDS_CLASS
> > +     depends on MFD_ASUSEC
> > +     help
> > +       This option enables support for charging indicator on
> > +       Asus Transformer's Pad and it's Dock.
> > +
> > +       To compile this driver as a module, choose M here: the module
> > +       will be called leds-asus-ec.
> > +
> >  config LEDS_AW200XX
> >       tristate "LED support for Awinic AW20036/AW20054/AW20072/AW20108"
> >       depends on LEDS_CLASS
> > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > index 8fdb45d5b439..1117304dfdf4 100644
> > --- a/drivers/leds/Makefile
> > +++ b/drivers/leds/Makefile
> > @@ -16,6 +16,7 @@ obj-$(CONFIG_LEDS_AN30259A)         +=3D leds-an30259=
a.o
> >  obj-$(CONFIG_LEDS_APU)                       +=3D leds-apu.o
> >  obj-$(CONFIG_LEDS_ARIEL)             +=3D leds-ariel.o
> >  obj-$(CONFIG_LEDS_AS3668)            +=3D leds-as3668.o
> > +obj-$(CONFIG_LEDS_ASUSEC)            +=3D leds-asus-ec.o
> >  obj-$(CONFIG_LEDS_AW200XX)           +=3D leds-aw200xx.o
> >  obj-$(CONFIG_LEDS_AW2013)            +=3D leds-aw2013.o
> >  obj-$(CONFIG_LEDS_BCM6328)           +=3D leds-bcm6328.o
> > diff --git a/drivers/leds/leds-asus-ec.c b/drivers/leds/leds-asus-ec.c
> > new file mode 100644
> > index 000000000000..5dd76c9247ee
> > --- /dev/null
> > +++ b/drivers/leds/leds-asus-ec.c
> > @@ -0,0 +1,104 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * ASUS EC driver - battery LED
> > + */
> > +
> > +#include <linux/err.h>
> > +#include <linux/leds.h>
> > +#include <linux/mfd/asus-ec.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +
> > +/*
> > + * F[5] & 0x07
> > + *  auto: brightness =3D=3D 0
> > + *  bit 0: blink / charger on
> > + *  bit 1: amber on
> > + *  bit 2: green on
> > + */
> > +
> > +#define ASUSEC_CTL_LED_BLINK         BIT_ULL(40)
> > +#define ASUSEC_CTL_LED_AMBER         BIT_ULL(41)
> > +#define ASUSEC_CTL_LED_GREEN         BIT_ULL(42)
> > +
> > +static void asus_ec_led_set_brightness_amber(struct led_classdev *led,
> > +                                          enum led_brightness brightne=
ss)
> > +{
> > +     const struct asusec_info *ec =3D dev_get_drvdata(led->dev->parent=
);
> > +
> > +     if (brightness)
> > +             asus_ec_set_ctl_bits(ec, ASUSEC_CTL_LED_AMBER);
> > +     else
> > +             asus_ec_clear_ctl_bits(ec, ASUSEC_CTL_LED_AMBER);
> > +}
> > +
> > +static void asus_ec_led_set_brightness_green(struct led_classdev *led,
> > +                                          enum led_brightness brightne=
ss)
> > +{
> > +     const struct asusec_info *ec =3D dev_get_drvdata(led->dev->parent=
);
> > +
> > +     if (brightness)
> > +             asus_ec_set_ctl_bits(ec, ASUSEC_CTL_LED_GREEN);
> > +     else
> > +             asus_ec_clear_ctl_bits(ec, ASUSEC_CTL_LED_GREEN);
> > +}
> > +
> > +static int asus_ec_led_probe(struct platform_device *pdev)
> > +{
> > +     struct asusec_info *ec =3D cell_to_ec(pdev);
>
> Please remove all of your abstraction layers.  They serve little purpose
> other than to complicate things.  Just use dev_get_drvdata() here.
>
> Remove the "_info" part and change "ec" to "ddata".
>

Controller exposes only required stuff, exposing controllers internal
parts is not desired. Is there any written convention that driver
private data pointer MUST be named "ddata"? "priv" is pretty well
fitting to. You are just nitpicking.

> > +     struct device *dev =3D &pdev->dev;
> > +     struct led_classdev *amber_led, *green_led;
> > +     int ret;
> > +
> > +     platform_set_drvdata(pdev, ec);
>
> Wait, what?
>
> Why are you doing that?
>

This is redundant, yes.

> > +     amber_led =3D devm_kzalloc(dev, sizeof(*amber_led), GFP_KERNEL);
> > +     if (!amber_led)
> > +             return -ENOMEM;
> > +
> > +     amber_led->name =3D devm_kasprintf(dev, GFP_KERNEL, "%s::amber", =
ec->name);
> > +     amber_led->max_brightness =3D 1;
> > +     amber_led->flags =3D LED_CORE_SUSPENDRESUME | LED_RETAIN_AT_SHUTD=
OWN;
> > +     amber_led->brightness_set =3D asus_ec_led_set_brightness_amber;
> > +
> > +     ret =3D devm_led_classdev_register(dev, amber_led);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to register amber =
LED\n");
> > +
> > +     green_led =3D devm_kzalloc(dev, sizeof(*green_led), GFP_KERNEL);
> > +     if (!green_led)
> > +             return -ENOMEM;
> > +
> > +     green_led->name =3D devm_kasprintf(dev, GFP_KERNEL, "%s::green", =
ec->name);
> > +     green_led->max_brightness =3D 1;
> > +     green_led->flags =3D LED_CORE_SUSPENDRESUME | LED_RETAIN_AT_SHUTD=
OWN;
> > +     green_led->brightness_set =3D asus_ec_led_set_brightness_green;
> > +
> > +     ret =3D devm_led_classdev_register(dev, green_led);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to register green =
LED\n");
>
> Lots of repetition here.
>
> I'd make a sub-function that takes the differences.
>
> Same with the set brightness functions.
>
> Think to yourself - what if I had to support 16 different LEDs?
>

That is not of my concern what you would do. I have 2 LEDs and I see
no point in "abstraction for he sake of abstraction".

> > +
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id asus_ec_led_match[] =3D {
> > +     { .compatible =3D "asus,ec-led" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, asus_ec_led_match);
> > +
> > +static struct platform_driver asus_ec_led_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "asus-ec-led",
> > +             .of_match_table =3D asus_ec_led_match,
> > +     },
> > +     .probe =3D asus_ec_led_probe,
> > +};
> > +module_platform_driver(asus_ec_led_driver);
> > +
> > +MODULE_AUTHOR("Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>");
> > +MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
> > +MODULE_DESCRIPTION("ASUS Transformer's charging LED driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.51.0
> >
> >
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

