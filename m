Return-Path: <linux-leds+bounces-8908-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x2FkI3d8R2o4ZQAAu9opvQ
	(envelope-from <linux-leds+bounces-8908-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 11:10:15 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C771C7007BB
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 11:10:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bR6QHRiX;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8908-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8908-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D671A3044520
	for <lists+linux-leds@lfdr.de>; Fri,  3 Jul 2026 08:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F4037E30F;
	Fri,  3 Jul 2026 08:53:19 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2941F37DE9F
	for <linux-leds@vger.kernel.org>; Fri,  3 Jul 2026 08:53:15 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068798; cv=pass; b=qpy6tbHINOWo/UobZK+6KTcXQaPMWMrgPLIZf28FJXlLEjYAh4lJeRn06oKtX9Uny1SZn7Bo9pKvryysbk79WI+VCWp6c6QokRtP1Kj73KJMzSRfCfLAJuYzdul6AQRDzLmnKROoD7GGFWER6EZbVpWuCovdwBP73rlhvn3zMv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068798; c=relaxed/simple;
	bh=NMtIEom2SZBGmd0O4htPL4R0QRdei8ZXZ03eydoxcfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BEEuLl2r0hGccA/kftSDYNFCgzbs2ZnMdTkw65YvpDZvS+hLOwVSlUCbkSvMFlFf7ku/RxmgKUBJYklSN8ky6qTqvKXOBuC/Yt3deMHAtv91LKNUQKcKw3MKNYUB0Ic//t+X3Jq5kHj0OUHNchJY9+gim3/NB+pc5A8F9lug/ck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bR6QHRiX; arc=pass smtp.client-ip=209.85.210.179
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84347ad88edso420507b3a.1
        for <linux-leds@vger.kernel.org>; Fri, 03 Jul 2026 01:53:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783068795; cv=none;
        d=google.com; s=arc-20260327;
        b=TMXnPwwwdScZ/2tf1g0xwiNUYEdpCGY87u8IlQdRUxaPcbwnMF3m/JE5COs+Ji/fb4
         0p7WoAjNor/ndE0JI01pyvHxeJhyB4jFdtlFYOpMh1qzPx5iyOy5+hFvn7UHJWA3kyZE
         BSmwlLvJ+MxzI+HJzj5GHXp8Ln/Z55YyLAi4iZokn51kQFzPAy6NKSTQefwXIgbuqS+W
         8c9ScOvclkF3xwacQRDPHKXGAskGCBp5O4NhhsWfWSP2T9Qpd0cuwkRyiZabj5Fj9INe
         7pagiMz2hP6viWrmugLt7CbxAH8yrGkFiAN26R64vdbSPv31+2yzTDEUZW5yCX8P4m/5
         dImw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=07kvPdrj7HmE3gN8Sr/OQh7e6VQDwZMqtEyLfjUbEbI=;
        fh=l9WgSgTEN/Slo+CYdc1a0G8wFaq2BDbvLBRPl3LdDBU=;
        b=ovGzAZnYrPC4veACH+eXEi19g+eNyl8x70qCXgjxWyWZzPUNMMqXCds4aFiWQ7Q6JH
         NCASvy8X8VEhYMrU5amAZjhoMuSTuAT6wJ3fYUrhJ0QGUJCeJbIAs+yqpbunopGMgUOG
         To77dvknn0RACtVm85DtYOJ+gSMzB39sqZKkhUfAKC5PTmizG5JOS7JtLalUruuUhaI0
         z7c8LJyqum6N0yKNFevuxLOWKGhOyg3xjqKD1iEjvU1r+JjtqvlE2y9PWNdSq7bP6Q0O
         Ic7eDjbS/BU1VYjXXr/5BGZjkBnrvn68xImtJVEdKuUAi0pdH9eZvBtnijXdjERM5AAX
         2K1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068795; x=1783673595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07kvPdrj7HmE3gN8Sr/OQh7e6VQDwZMqtEyLfjUbEbI=;
        b=bR6QHRiXA2PJNPcTzP+FNuhGN9gBXr5uiFzrVCAAE4DVWcLLrI9/6+tTkXLEVG7Gth
         d0g1FTYSVBHtMiGrbED24LIGgjJ7zaRYLjdHeIVVNBuj25lw4yR4jhCb1bRokhCktb/N
         +LpDawN67Ar4Yuww8n7Nsf/i2Kk8TE0HOxOqfOBGL/Zb8W6VUbKVGQMr34wyComhA5nO
         KPAUK54eYchryKOqvquU+aeM9fCy2XMH/zqa63tk4trXEp5oANHXNVUvgizkAW3wmq2n
         iXynf7zYqLTSEYCO2BUDxWVtWexBVuoosQrF82216ddqf7M0/b7Y6keygECmVpnsgUmi
         d1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068795; x=1783673595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=07kvPdrj7HmE3gN8Sr/OQh7e6VQDwZMqtEyLfjUbEbI=;
        b=Yi4vNgp18Vck/dzcmvpCGBGG8ykmF41wDDdrnEEtE7G6MInho8QFLo1ez4J+L1bgI5
         vXq7xrJvpvLg+VofFyiBwUX9NbhGBGwXvQyZHL/rbURF3e9QEGzZsjAadDco0k9xK9ga
         lvi0OhBkP+wi5Tj4P6ylCF+V8oXMDvfeyotK73cjkCCQpB2gaKvgLOo0jp3tAopKGtfr
         21syE8r2pxCHI3LbS5Ctx158pZGB+bH5pCed/6uYGbmTq+CLs+bAZSZr2Z8eGyXEBT4D
         5r6ie0ApsRR+ag5pJGeo/zLq/F1SUSl4UrjGcaeMsraX6Vg+RRCTC/HucV7Ti9sGymb9
         LBwQ==
X-Forwarded-Encrypted: i=1; AFNElJ98Lutc42XU1iYg6J9HFSrsKADNEz8MRf3cphx4Ui5BMHANdv4WLOrhKkyGxJT0iWFqqbt2gOaGIQet@vger.kernel.org
X-Gm-Message-State: AOJu0YwAVahrrRdOgBmL8kSZ+dVg/SgoiO77EVxTOjcyrO+InnJ9xQSN
	PC3M3QRR/DasOwddSQ9xYvhWH4RZ/HV3/nPmY5p2JTH0t4OtfLeKK9Ejb9bnizyWjaPjmhAgaA6
	4Q7/oEJ6arUHfz7+XJqEzTwNcTaccQiU=
X-Gm-Gg: AfdE7cl3UXxWhlQXZotc6vIXIS6Tc5TasAYPPMOzuEBKCstZqM+5N37DGJ6OMcI7SiI
	l0uUcY1Lwmb0gGBfoZfXfjxxS8jB+LAphEv1XjIodIit8fOyAtM8JwlmK/R34vvi9kJMEl/1vT9
	YyWgrrK7gJu7i6BiqrP8fUmtuO3QKoWA6dAGZjHTn7bscHoupUb1IhgA6bbm8CPII8la19jsKzc
	TwwExKHBwzugno5kT8w5iIRoIx0iryOnVuNdHpmU3J7JTAckufPjCLLoqXqLrDSEyU1kJ5E3CJ3
	wqc+i3V0R/irHFWT6ctvkzPqu92dEA==
X-Received: by 2002:a05:6a20:6f93:b0:3b3:be05:2b73 with SMTP id
 adf61e73a8af0-3bff4090a6bmr11381876637.18.1783068794902; Fri, 03 Jul 2026
 01:53:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625081529.22447-1-clamor95@gmail.com> <20260625081529.22447-5-clamor95@gmail.com>
In-Reply-To: <20260625081529.22447-5-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 3 Jul 2026 11:53:03 +0300
X-Gm-Features: AVVi8CckPfKKiHXTZ5KHqAmPJpyh86Z25jhjOQ1SQqISYsKn2TyfJksUQ18DUYk
Message-ID: <CAPVz0n1o+2NRQrLfbCMT0JdeFhhD4PS4UzSt3L6-QQ2ywHL+mA@mail.gmail.com>
Subject: Re: [PATCH v9 4/7] input: keyboard: Add driver for ASUS Transformer
 dock multimedia keys
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Ion Agorria <ion@agorria.com>, Svyatoslav Ryhel <clamor95@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Lee Jones <lee@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8908-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:mirq-linux@rere.qmqm.pl,m:ion@agorria.com,m:clamor95@gmail.com,m:sre@kernel.org,m:pavel@kernel.org,m:lee@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-pm@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,rere.qmqm.pl,agorria.com,gmail.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,qmqm.pl:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C771C7007BB

=D1=87=D1=82, 25 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 11:1=
6 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
>
> Add support for multimedia top button row of ASUS Transformer's Mobile
> Dock keyboard. Driver is made that function keys (F1-F12) are used by
> default which suits average Linux use better and with pressing
> ScreenLock + AltGr function keys layout is switched to multimedia keys.
> Only Dock keyboard input events are tracked for AltGr pressing.
>
> Co-developed-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/input/keyboard/Kconfig                |  10 +
>  drivers/input/keyboard/Makefile               |   1 +
>  .../input/keyboard/asus-transformer-ec-keys.c | 314 ++++++++++++++++++
>  3 files changed, 325 insertions(+)
>  create mode 100644 drivers/input/keyboard/asus-transformer-ec-keys.c
>
> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kcon=
fig
> index 9d1019ba0245..913cb4900565 100644
> --- a/drivers/input/keyboard/Kconfig
> +++ b/drivers/input/keyboard/Kconfig
> @@ -89,6 +89,16 @@ config KEYBOARD_APPLESPI
>           To compile this driver as a module, choose M here: the
>           module will be called applespi.
>
> +config KEYBOARD_ASUS_TRANSFORMER_EC
> +       tristate "Asus Transformer's Mobile Dock multimedia keys"
> +       depends on MFD_ASUS_TRANSFORMER_EC
> +       help
> +         Say Y here if you want to use multimedia keys present on Asus
> +         Transformer's Mobile Dock.
> +
> +         To compile this driver as a module, choose M here: the
> +         module will be called asus-transformer-ec-keys.
> +
>  config KEYBOARD_ATARI
>         tristate "Atari keyboard"
>         depends on ATARI
> diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Mak=
efile
> index 60bb7baf802f..0d81096887ad 100644
> --- a/drivers/input/keyboard/Makefile
> +++ b/drivers/input/keyboard/Makefile
> @@ -11,6 +11,7 @@ obj-$(CONFIG_KEYBOARD_ADP5585)                +=3D adp5=
585-keys.o
>  obj-$(CONFIG_KEYBOARD_ADP5588)         +=3D adp5588-keys.o
>  obj-$(CONFIG_KEYBOARD_AMIGA)           +=3D amikbd.o
>  obj-$(CONFIG_KEYBOARD_APPLESPI)                +=3D applespi.o
> +obj-$(CONFIG_KEYBOARD_ASUS_TRANSFORMER_EC)     +=3D asus-transformer-ec-=
keys.o
>  obj-$(CONFIG_KEYBOARD_ATARI)           +=3D atakbd.o
>  obj-$(CONFIG_KEYBOARD_ATKBD)           +=3D atkbd.o
>  obj-$(CONFIG_KEYBOARD_BCM)             +=3D bcm-keypad.o
> diff --git a/drivers/input/keyboard/asus-transformer-ec-keys.c b/drivers/=
input/keyboard/asus-transformer-ec-keys.c
> new file mode 100644
> index 000000000000..53aff3ce7146
> --- /dev/null
> +++ b/drivers/input/keyboard/asus-transformer-ec-keys.c
> @@ -0,0 +1,314 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include <linux/array_size.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>
> +#include <linux/mfd/asus-transformer-ec.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#define ASUSEC_EXT_KEY_CODES           0x20
> +
> +struct asus_ec_keys_data {
> +       struct notifier_block nb;
> +       struct asusec_core *ec;
> +       struct input_dev *xidev;
> +       struct input_handler input_handler;
> +       unsigned short keymap[ASUSEC_EXT_KEY_CODES * 2];
> +       const char *kbc_phys;
> +       bool special_key_pressed;
> +       bool special_key_mode;
> +};
> +
> +static void asus_ec_input_event(struct input_handle *handle,
> +                               unsigned int event_type,
> +                               unsigned int event_code, int value)
> +{
> +       struct asus_ec_keys_data *priv =3D handle->handler->private;
> +
> +       /* Store special key state */
> +       if (event_type =3D=3D EV_KEY && event_code =3D=3D KEY_RIGHTALT)
> +               priv->special_key_pressed =3D !!value;
> +}
> +
> +static int asus_ec_input_connect(struct input_handler *handler,
> +                                struct input_dev *dev,
> +                                const struct input_device_id *id)
> +{
> +       struct asus_ec_keys_data *priv =3D handler->private;
> +       struct input_handle *handle;
> +       int error;
> +
> +       if (!dev->phys || !strstr(dev->phys, priv->kbc_phys))
> +               return -ENODEV;
> +

Hello Dmitry!

Would this approach be acceptable? Handler links strictly to asus-ec keyboa=
rd.

> +       handle =3D kzalloc_obj(*handle);
> +       if (!handle)
> +               return -ENOMEM;
> +
> +       handle->dev =3D dev;
> +       handle->handler =3D handler;
> +       handle->name =3D handler->name;
> +
> +       error =3D input_register_handle(handle);
> +       if (error)
> +               goto err_free_handle;
> +
> +       error =3D input_open_device(handle);
> +       if (error)
> +               goto err_unregister_handle;
> +
> +       return 0;
> +
> + err_unregister_handle:
> +       input_unregister_handle(handle);
> + err_free_handle:
> +       kfree(handle);
> +
> +       return error;
> +}
> +
> +static void asus_ec_input_disconnect(struct input_handle *handle)
> +{
> +       input_close_device(handle);
> +       input_unregister_handle(handle);
> +       kfree(handle);
> +}
> +
> +static const struct input_device_id asus_ec_input_ids[] =3D {
> +       {
> +               .flags =3D INPUT_DEVICE_ID_MATCH_EVBIT,
> +               .evbit =3D { BIT_MASK(EV_KEY) },
> +       },
> +       { }
> +};
> +
> +static const unsigned short asus_ec_dock_ext_keys[] =3D {
> +       /* Function keys [0x00 - 0x19] */
> +       [0x01] =3D KEY_DELETE,
> +       [0x02] =3D KEY_F1,
> +       [0x03] =3D KEY_F2,
> +       [0x04] =3D KEY_F3,
> +       [0x05] =3D KEY_F4,
> +       [0x06] =3D KEY_F5,
> +       [0x07] =3D KEY_F6,
> +       [0x08] =3D KEY_F7,
> +       [0x10] =3D KEY_F8,
> +       [0x11] =3D KEY_F9,
> +       [0x12] =3D KEY_F10,
> +       [0x13] =3D KEY_F11,
> +       [0x14] =3D KEY_F12,
> +       [0x15] =3D KEY_MUTE,
> +       [0x16] =3D KEY_VOLUMEDOWN,
> +       [0x17] =3D KEY_VOLUMEUP,
> +       /* Multimedia keys [0x20 - 0x39] */
> +       [0x21] =3D KEY_SCREENLOCK,
> +       [0x22] =3D KEY_WLAN,
> +       [0x23] =3D KEY_BLUETOOTH,
> +       [0x24] =3D KEY_TOUCHPAD_TOGGLE,
> +       [0x25] =3D KEY_BRIGHTNESSDOWN,
> +       [0x26] =3D KEY_BRIGHTNESSUP,
> +       [0x27] =3D KEY_BRIGHTNESS_AUTO,
> +       [0x28] =3D KEY_PRINT,
> +       [0x30] =3D KEY_WWW,
> +       [0x31] =3D KEY_CONFIG,
> +       [0x32] =3D KEY_PREVIOUSSONG,
> +       [0x33] =3D KEY_PLAYPAUSE,
> +       [0x34] =3D KEY_NEXTSONG,
> +       [0x35] =3D KEY_MUTE,
> +       [0x36] =3D KEY_VOLUMEDOWN,
> +       [0x37] =3D KEY_VOLUMEUP,
> +};
> +
> +static void asus_ec_keys_report_key(struct input_dev *dev, unsigned int =
code,
> +                                   unsigned int key, bool value)
> +{
> +       input_event(dev, EV_MSC, MSC_SCAN, code);
> +       input_report_key(dev, key, value);
> +       input_sync(dev);
> +}
> +
> +static int asus_ec_keys_process_key(struct input_dev *dev, u8 code)
> +{
> +       struct asus_ec_keys_data *priv =3D dev_get_drvdata(dev->dev.paren=
t);
> +       unsigned int key =3D 0;
> +
> +       if (code =3D=3D 0)
> +               return NOTIFY_DONE;
> +
> +       /* Flip special key mode state when pressing SCREEN LOCK + R ALT =
*/
> +       if (priv->special_key_pressed && code =3D=3D 1) {
> +               priv->special_key_mode =3D !priv->special_key_mode;
> +               return NOTIFY_DONE;
> +       }
> +
> +       /*
> +        * Relocate code to second "page" if pressed state XOR's mode sta=
te
> +        * This way special key will invert the current mode
> +        */
> +       if (priv->special_key_mode ^ priv->special_key_pressed)
> +               code +=3D ASUSEC_EXT_KEY_CODES;
> +
> +       if (code < dev->keycodemax) {
> +               unsigned short *map =3D dev->keycode;
> +
> +               key =3D map[code];
> +       }
> +
> +       if (!key)
> +               key =3D KEY_UNKNOWN;
> +
> +       asus_ec_keys_report_key(dev, code, key, 1);
> +       asus_ec_keys_report_key(dev, code, key, 0);
> +
> +       return NOTIFY_OK;
> +}
> +
> +static int asus_ec_keys_notify(struct notifier_block *nb,
> +                              unsigned long action, void *data_)
> +{
> +       struct asus_ec_keys_data *priv =3D
> +               container_of(nb, struct asus_ec_keys_data, nb);
> +       u8 *data =3D data_;
> +
> +       if (action & ASUSEC_SMI_MASK)
> +               return NOTIFY_DONE;
> +
> +       if (action & ASUSEC_SCI_MASK)
> +               return asus_ec_keys_process_key(priv->xidev, data[2]);
> +
> +       return NOTIFY_DONE;
> +}
> +
> +static void asus_ec_keys_setup_keymap(struct asus_ec_keys_data *priv)
> +{
> +       struct input_dev *dev =3D priv->xidev;
> +       unsigned int i;
> +
> +       BUILD_BUG_ON(ARRAY_SIZE(priv->keymap) < ARRAY_SIZE(asus_ec_dock_e=
xt_keys));
> +
> +       dev->keycode =3D priv->keymap;
> +       dev->keycodesize =3D sizeof(*priv->keymap);
> +       dev->keycodemax =3D ARRAY_SIZE(priv->keymap);
> +
> +       input_set_capability(dev, EV_MSC, MSC_SCAN);
> +       input_set_capability(dev, EV_KEY, KEY_UNKNOWN);
> +
> +       for (i =3D 0; i < ARRAY_SIZE(asus_ec_dock_ext_keys); i++) {
> +               unsigned int code =3D asus_ec_dock_ext_keys[i];
> +
> +               if (!code)
> +                       continue;
> +
> +               __set_bit(code, dev->keybit);
> +               priv->keymap[i] =3D code;
> +       }
> +}
> +
> +static int asus_ec_keys_register_handler(struct device *dev,
> +                                        struct asus_ec_keys_data *priv)
> +{
> +       struct i2c_client *parent =3D to_i2c_client(dev->parent);
> +       int error;
> +
> +       priv->input_handler.event =3D asus_ec_input_event;
> +       priv->input_handler.connect =3D asus_ec_input_connect;
> +       priv->input_handler.disconnect =3D asus_ec_input_disconnect;
> +       priv->input_handler.id_table =3D asus_ec_input_ids;
> +       priv->input_handler.passive_observer =3D true;
> +       priv->input_handler.private =3D priv;
> +       priv->input_handler.name =3D devm_kasprintf(dev, GFP_KERNEL,
> +                                                 "%s-media-handler",
> +                                                 priv->ec->name);
> +       if (!priv->input_handler.name)
> +               return -ENOMEM;
> +
> +       priv->kbc_phys =3D devm_kasprintf(dev, GFP_KERNEL, "i2c-%u-%04x/s=
erio0",
> +                                       i2c_adapter_id(parent->adapter),
> +                                       parent->addr);
> +       if (!priv->kbc_phys)
> +               return -ENOMEM;
> +
> +       error =3D input_register_handler(&priv->input_handler);
> +       if (error)
> +               return error;
> +
> +       return 0;
> +}
> +
> +static int asus_ec_keys_probe(struct platform_device *pdev)
> +{
> +       struct i2c_client *parent =3D to_i2c_client(pdev->dev.parent);
> +       struct asusec_core *ec =3D dev_get_drvdata(pdev->dev.parent);
> +       struct device *dev =3D &pdev->dev;
> +       struct asus_ec_keys_data *priv;
> +       int error;
> +
> +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       platform_set_drvdata(pdev, priv);
> +       priv->ec =3D ec;
> +
> +       priv->xidev =3D devm_input_allocate_device(dev);
> +       if (!priv->xidev)
> +               return -ENOMEM;
> +
> +       priv->xidev->name =3D devm_kasprintf(dev, GFP_KERNEL, "%s Keyboar=
d Ext",
> +                                          ec->model);
> +       priv->xidev->phys =3D devm_kasprintf(dev, GFP_KERNEL, "i2c-%u-%04=
x",
> +                                          i2c_adapter_id(parent->adapter=
),
> +                                          parent->addr);
> +
> +       if (!priv->xidev->name || !priv->xidev->phys)
> +               return -ENOMEM;
> +
> +       asus_ec_keys_setup_keymap(priv);
> +
> +       error =3D input_register_device(priv->xidev);
> +       if (error)
> +               return dev_err_probe(dev, error,
> +                                    "failed to register extension keys\n=
");
> +
> +       error =3D asus_ec_keys_register_handler(dev, priv);
> +       if (error) {
> +               input_unregister_device(priv->xidev);
> +               return error;
> +       }
> +
> +       priv->nb.notifier_call =3D asus_ec_keys_notify;
> +
> +       error =3D blocking_notifier_chain_register(&ec->notify_list, &pri=
v->nb);
> +       if (error) {
> +               input_unregister_device(priv->xidev);
> +               input_unregister_handler(&priv->input_handler);
> +               return error;
> +       }
> +
> +       return 0;
> +}
> +
> +static void asus_ec_keys_remove(struct platform_device *pdev)
> +{
> +       struct asus_ec_keys_data *priv =3D platform_get_drvdata(pdev);
> +       struct asusec_core *ec =3D priv->ec;
> +
> +       blocking_notifier_chain_unregister(&ec->notify_list, &priv->nb);
> +       input_unregister_handler(&priv->input_handler);
> +       input_unregister_device(priv->xidev);
> +}
> +
> +static struct platform_driver asus_ec_keys_driver =3D {
> +       .driver.name =3D "asus-transformer-ec-keys",
> +       .probe =3D asus_ec_keys_probe,
> +       .remove =3D asus_ec_keys_remove,
> +};
> +module_platform_driver(asus_ec_keys_driver);
> +
> +MODULE_ALIAS("platform:asus-transformer-ec-keys");
> +MODULE_AUTHOR("Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>");
> +MODULE_DESCRIPTION("ASUS Transformer's multimedia keys driver");
> +MODULE_LICENSE("GPL");
> --
> 2.53.0
>

