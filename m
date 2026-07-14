Return-Path: <linux-leds+bounces-9086-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jEr5GbFBVmoy2QAAu9opvQ
	(envelope-from <linux-leds+bounces-9086-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 14 Jul 2026 16:03:29 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AABB755759
	for <lists+linux-leds@lfdr.de>; Tue, 14 Jul 2026 16:03:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=lAK2SoBn;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9086-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-leds+bounces-9086-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6AD42301D757
	for <lists+linux-leds@lfdr.de>; Tue, 14 Jul 2026 14:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D76123F9F38;
	Tue, 14 Jul 2026 14:03:20 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9395043CEFC
	for <linux-leds@vger.kernel.org>; Tue, 14 Jul 2026 14:03:16 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784037799; cv=pass; b=fUH1bSdorHMeh4eHiD/k05i68xCEzrCMrzs0R/bIeVCHTgMeQHHJB1QPmhfqxW3e6dcWBrtCuxEo6vH2sT29td9HXMqQUvYHbTB3oJm5qwge8PUSxl5XiXYwK+HgZG1i1qhWYLRWOBVCecaDCvjOVKx88AdBK9fX9Kf52FeS4cg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784037799; c=relaxed/simple;
	bh=jcfCE/0TEkTsIVfXnYBhBH66bO22mTW43lzd2mIpj78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tg2hKmDKv5xk/mEIsFnkD7jNNGfAHoVgNy4/mIhQse3BK74G2YcPeK+vOAH2A049dzN9P2VX8iS1QpnzJUIbWxREhdRjMJ16ej7Smk91TFY3K+WDAaFpDlVTknszVTt0mmQFjM4irp7r/ocIr7HqZ9uxuZxUt0/i7P8i4VbWZbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAK2SoBn; arc=pass smtp.client-ip=209.85.216.50
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso955310a91.3
        for <linux-leds@vger.kernel.org>; Tue, 14 Jul 2026 07:03:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784037795; cv=none;
        d=google.com; s=arc-20260327;
        b=OTNXjsd03Qc0RYjFke9IXZUQ70SMJhES9YBjpoHsFV4bMZOTpPtOoEK1R5fwkaXlGx
         /HOC5LXKwoIYzki9lWNfb7HFYSkkqK6vFvjGU25N4T4Pm7rS1UqAn9IQqJxBtyrrAk4/
         h2ucAT8f3M7P2kj66awK++YrZTEIPraWoZfAaw+cyp9xdPaimeIBF/e7uLSTgF3Jvyrn
         2plBeFmlWMIsrfEx6oiKPzNWugCnDK5u3ewPMdRwYMvULJKD/Z5ChLCY0/jjLlWcjN8t
         YM+75vQjtAUYLrqS7eDKurUqHrSpJqwfKEJRH0aaBNIz3aOLKWRD28Sai635BuJJ0Fcz
         M74Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=myF6T21RyLYT6/CfTBKwlhYNyiiPbXPGvaRTBJcI6ZU=;
        fh=xbpZGfA4IhfjTpNk/pwPmyZAqQKaMoL35xhOG3YHJLw=;
        b=lWqksdYTgd8t+T0AmnPHsgJ5NXBQ3SZ+D29CWGOpiNQ843OsJ4jIEn9+4tY3M+rrpc
         5jyGLHP1mTelgRXcQbj2Ltj4ZF3bDDGMJJG0WFgnShDRUYzIkSYS8/3j/eRhWaTFiV38
         1aXOP04ZcuRaVk/1wtVmBB98Il0goBWjKhJbHQ8JkiZ4EnBFE4j8mc27xDyKonOhPr46
         zTEmvAZJdQTtob9qadRpl7GmanQQyO682sYqpvMQPbuV0otNNl6+ZGY3lKtgai77FTAj
         VVcfdq7J8wbQ0s0bGGm36jxZUhqCEqUt2LyZ4kiec3a+bvxetacnlQE3f3amCOUJQZ+m
         PPvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784037795; x=1784642595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=myF6T21RyLYT6/CfTBKwlhYNyiiPbXPGvaRTBJcI6ZU=;
        b=lAK2SoBneg8a79IZxLlhDsoAc5s20dBKXYEmWxNqZbpTv1QYHuXFFTg+NoFNbGZt2D
         UEVjkRmdqrTUvXv7NUo+KyP47BDLcu4h6ndNAWy8SpgCyMfHyAHNG4l4y3KQQsVM+NfO
         y3AuDDKNqrG2ji6rSNU4GXaj318V6nIpTK5NE9HzDHEqubMliMFQ/6DYBUTv7cRfhVko
         3hLr+lBtOX3eNCTXc2oxsUbuLs3l5I4wzeDq7R6fv1ZZeVGJqY1ZEmMy5Km53CIK2+gt
         sR/h7Ue36rW6UZW3hnySs1O74EAPlLqb2jBd8DkABTJgXXntJDpmIPLfyks3ke+Fgy3h
         W7wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784037795; x=1784642595;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=myF6T21RyLYT6/CfTBKwlhYNyiiPbXPGvaRTBJcI6ZU=;
        b=tTeuZ1V8yXxvZUozeXcJDCMzoefAVWsBDRUHrZoZxUUwSNutrJ1Sv+54NgHasL0XOJ
         y6tjhjZGZRq7pXx08nfyGT3B5Nm1z4x8RblGhBmBkR084Q0DPN+qXnJ1FWP5ZxyDOyDn
         bpgvqBSSpFUEAypH2kPLqqGBxA7PSWIzaQUxr6yUzuWepp5EvzNAKzl9EORMDoG1gl7x
         f/bUUoqWAj2BaHjN+rvAlF0aqsAaHxr6iJDJw4Bf5+hXW3XaDSKYGoqkI/jMn1E7qGmf
         pHv6VzWxbO7a1r2Vsfj10IJDbNo8uBK73CVo0RvciGBCeDoM0RRIp+QTlK8/MSso4FNY
         A0UQ==
X-Forwarded-Encrypted: i=1; AHgh+RqII7M3/6MbbumjFVX0F0vvXtzqg6Y1d5C5iQQd5xjdIhhZ0ANeOUrwDmU2rWj+snLb2a8HPdwUOC/d@vger.kernel.org
X-Gm-Message-State: AOJu0YzmPg1dr+kBjzbR2uGYKY/sGXd4hBmIAZHiksDA+3eUlUqM7/IZ
	bH/wBCxlgHq4G12+H6LwUYjoA395ZG0srGQcV9D3r6mR66vzBRpkCKCFSIiUwbp4AF4edvHyC+z
	HQPBWsi9mRVhFrJeYt1FSl/j2F8mJaAs=
X-Gm-Gg: AfdE7cngQyc28Z4rsLE4fhJkD1GHomqZp3IgdIvn76ZT+HjfZ7S78pSjGA124TcEWPf
	Pqyns4XTxCAqVH4dIghlGjdxL3qxS8wXcNCUQgKyvqL5H+ustl/y+IcBLdyI03DAzJTYjumeF0P
	DOqTIUUYVdDG2u2syPS3BasKPeTMSwEkZSUjItV75vVplWEmrdW7S5u8zTIbK6ex97oDwgZGU+j
	SkbEXQSgL8gDWUdYU1sJZkho7+RBiT+XX326epohUPpOCUqR31MjV/KBZF1+UKluhyTnDycYI/d
	fGLnJSCKcAMFGmHwiaRW613TIQ3qOw==
X-Received: by 2002:a17:90b:5863:b0:36d:b424:4f17 with SMTP id
 98e67ed59e1d1-38dc73bcfdfmr12462942a91.1.1784037794156; Tue, 14 Jul 2026
 07:03:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625081529.22447-1-clamor95@gmail.com> <20260625081529.22447-5-clamor95@gmail.com>
 <CAPVz0n1o+2NRQrLfbCMT0JdeFhhD4PS4UzSt3L6-QQ2ywHL+mA@mail.gmail.com>
In-Reply-To: <CAPVz0n1o+2NRQrLfbCMT0JdeFhhD4PS4UzSt3L6-QQ2ywHL+mA@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 14 Jul 2026 17:03:02 +0300
X-Gm-Features: AUfX_myvMCwvq1yA3I4zoSr0hddrF32oflvRuyg70zCnHs7uf8DcWagE6S5UHa4
Message-ID: <CAPVz0n3FkzoXJBffsOJzd4Rq9HmA0n1oFCU-9Xt=URmpXhY2UA@mail.gmail.com>
Subject: Re: [PATCH v9 4/7] input: keyboard: Add driver for ASUS Transformer
 dock multimedia keys
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Ion Agorria <ion@agorria.com>, Sebastian Reichel <sre@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Lee Jones <lee@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:mirq-linux@rere.qmqm.pl,m:ion@agorria.com,m:sre@kernel.org,m:pavel@kernel.org,m:lee@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-pm@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RSPAMD_URIBL_FAIL(0.00)[qmqm.pl:query timed out,agorria.com:query timed out];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-9086-lists,linux-leds=lfdr.de];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4AABB755759

=D0=BF=D1=82, 3 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 11:53 Svyat=
oslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D1=87=D1=82, 25 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 11=
:16 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> >
> > Add support for multimedia top button row of ASUS Transformer's Mobile
> > Dock keyboard. Driver is made that function keys (F1-F12) are used by
> > default which suits average Linux use better and with pressing
> > ScreenLock + AltGr function keys layout is switched to multimedia keys.
> > Only Dock keyboard input events are tracked for AltGr pressing.
> >
> > Co-developed-by: Ion Agorria <ion@agorria.com>
> > Signed-off-by: Ion Agorria <ion@agorria.com>
> > Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/input/keyboard/Kconfig                |  10 +
> >  drivers/input/keyboard/Makefile               |   1 +
> >  .../input/keyboard/asus-transformer-ec-keys.c | 314 ++++++++++++++++++
> >  3 files changed, 325 insertions(+)
> >  create mode 100644 drivers/input/keyboard/asus-transformer-ec-keys.c
> >
> > diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kc=
onfig
> > index 9d1019ba0245..913cb4900565 100644
> > --- a/drivers/input/keyboard/Kconfig
> > +++ b/drivers/input/keyboard/Kconfig
> > @@ -89,6 +89,16 @@ config KEYBOARD_APPLESPI
> >           To compile this driver as a module, choose M here: the
> >           module will be called applespi.
> >
> > +config KEYBOARD_ASUS_TRANSFORMER_EC
> > +       tristate "Asus Transformer's Mobile Dock multimedia keys"
> > +       depends on MFD_ASUS_TRANSFORMER_EC
> > +       help
> > +         Say Y here if you want to use multimedia keys present on Asus
> > +         Transformer's Mobile Dock.
> > +
> > +         To compile this driver as a module, choose M here: the
> > +         module will be called asus-transformer-ec-keys.
> > +
> >  config KEYBOARD_ATARI
> >         tristate "Atari keyboard"
> >         depends on ATARI
> > diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/M=
akefile
> > index 60bb7baf802f..0d81096887ad 100644
> > --- a/drivers/input/keyboard/Makefile
> > +++ b/drivers/input/keyboard/Makefile
> > @@ -11,6 +11,7 @@ obj-$(CONFIG_KEYBOARD_ADP5585)                +=3D ad=
p5585-keys.o
> >  obj-$(CONFIG_KEYBOARD_ADP5588)         +=3D adp5588-keys.o
> >  obj-$(CONFIG_KEYBOARD_AMIGA)           +=3D amikbd.o
> >  obj-$(CONFIG_KEYBOARD_APPLESPI)                +=3D applespi.o
> > +obj-$(CONFIG_KEYBOARD_ASUS_TRANSFORMER_EC)     +=3D asus-transformer-e=
c-keys.o
> >  obj-$(CONFIG_KEYBOARD_ATARI)           +=3D atakbd.o
> >  obj-$(CONFIG_KEYBOARD_ATKBD)           +=3D atkbd.o
> >  obj-$(CONFIG_KEYBOARD_BCM)             +=3D bcm-keypad.o
> > diff --git a/drivers/input/keyboard/asus-transformer-ec-keys.c b/driver=
s/input/keyboard/asus-transformer-ec-keys.c
> > new file mode 100644
> > index 000000000000..53aff3ce7146
> > --- /dev/null
> > +++ b/drivers/input/keyboard/asus-transformer-ec-keys.c
> > @@ -0,0 +1,314 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +#include <linux/array_size.h>
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> > +#include <linux/input.h>
> > +#include <linux/mfd/asus-transformer-ec.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +
> > +#define ASUSEC_EXT_KEY_CODES           0x20
> > +
> > +struct asus_ec_keys_data {
> > +       struct notifier_block nb;
> > +       struct asusec_core *ec;
> > +       struct input_dev *xidev;
> > +       struct input_handler input_handler;
> > +       unsigned short keymap[ASUSEC_EXT_KEY_CODES * 2];
> > +       const char *kbc_phys;
> > +       bool special_key_pressed;
> > +       bool special_key_mode;
> > +};
> > +
> > +static void asus_ec_input_event(struct input_handle *handle,
> > +                               unsigned int event_type,
> > +                               unsigned int event_code, int value)
> > +{
> > +       struct asus_ec_keys_data *priv =3D handle->handler->private;
> > +
> > +       /* Store special key state */
> > +       if (event_type =3D=3D EV_KEY && event_code =3D=3D KEY_RIGHTALT)
> > +               priv->special_key_pressed =3D !!value;
> > +}
> > +
> > +static int asus_ec_input_connect(struct input_handler *handler,
> > +                                struct input_dev *dev,
> > +                                const struct input_device_id *id)
> > +{
> > +       struct asus_ec_keys_data *priv =3D handler->private;
> > +       struct input_handle *handle;
> > +       int error;
> > +
> > +       if (!dev->phys || !strstr(dev->phys, priv->kbc_phys))
> > +               return -ENODEV;
> > +
>
> Hello Dmitry!
>
> Would this approach be acceptable? Handler links strictly to asus-ec keyb=
oard.
>

Hello Dmitry! May you please take a look? ATM only ACK on input patches lef=
t.

