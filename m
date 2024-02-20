Return-Path: <linux-leds+bounces-865-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9F085B13C
	for <lists+linux-leds@lfdr.de>; Tue, 20 Feb 2024 04:22:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 584541C203B3
	for <lists+linux-leds@lfdr.de>; Tue, 20 Feb 2024 03:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24AAD433CA;
	Tue, 20 Feb 2024 03:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P+ynqv4e"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD6D42A91
	for <linux-leds@vger.kernel.org>; Tue, 20 Feb 2024 03:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708399352; cv=none; b=DDSBM7gFnbcpF42v0n8FKFFTkX+niaiOMala9IJttQwYQfnIF/JEtkQfN/PpOR3C/Ax1Lx0FZ/2At2OzwQeVVGoNcB/0F4+8Xf4kqtfIfaAVQAwrLc0KgkIgjA3iKR/2b8I3S7/H2wMOGAIjC0+OmRfQCiw+L6VFbkfPZsGDn+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708399352; c=relaxed/simple;
	bh=rfzvkOhB9n0o92OjX4KVr3WKohjSPYI1immR2QTUzzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D0uB2sAl9dswdiWVr+5zJLUN7kwXIM/rO8H2TEffeFzp45R4n0zVsR+cIASCwoIgxdvW9pHJeE2tS+Uakm0GixdYFHOND4ZxuSPPZduTPwGeOMZGR3NmDABVQvsIAObXAajbY3J2F+4HeMA7Y3KHeoPMl8NtbWiVuqqsCOecKUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P+ynqv4e; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708399348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cgZ3DZJH6yJf4Z505nsD03xy3EYWtnd7biAaT8oFQxQ=;
	b=P+ynqv4eJczFGnvUhLwpqMMjXTOWTPl+GMksY2lHy+At1CJ/S/eWP8D+Ckj4mAxx8QBaGW
	RahRtBKSs546lIr7xr9ZBWLK0vBrLGVrAuJ74tBDNtSTChLeSbXFNDYn1db4lqS6x5mMCF
	mP12f99WsKF9voIeLDGcqzoQAWrOwCc=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-VfpetyyZNrCyoOiZnjqCVg-1; Mon, 19 Feb 2024 22:22:27 -0500
X-MC-Unique: VfpetyyZNrCyoOiZnjqCVg-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-29935047600so3508812a91.0
        for <linux-leds@vger.kernel.org>; Mon, 19 Feb 2024 19:22:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708399346; x=1709004146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgZ3DZJH6yJf4Z505nsD03xy3EYWtnd7biAaT8oFQxQ=;
        b=NuVHrUsUSRh655ZDL6XWfmbedp0lOphRQ9DaLszpyR7Kf1gUzForHQWukKAXzbdFFs
         c+8jbfbtoMgnPluGU0pnaax66AT96a3u96M8H5uE0me3oUykPgFifjKjHHxy0PPLaCAv
         yAbV16oZSN4egp/UKwdW9X4QNjoO+FIIvhE+EoPuSUhFJ405W2fdcWNEnIovq/FxCZIx
         R85+jUp0gg9AzX8zgpHQjxI1lykqmLeNGbwWCF0qD2iU6qNGUYtWKtHETzlGtTkirgAh
         CyerYAMSIx8ibAt/OhxM2kH3mNYJSzrxWsJvTswvwrOK+KkPx9GSZCQNq3ltWM7kQdJn
         45hw==
X-Forwarded-Encrypted: i=1; AJvYcCUDeJalNoY0UdDdRI71ZjweJPEVXPYGXAyKYswfXo3BvJM7JP9DOOB+lhmcOe7wgW10vgK0hP2PFYifgwRh393ylTA7LXi0qncwkg==
X-Gm-Message-State: AOJu0YxMFJfHH8fL56qYBG3dFV2bCApi3IKsFsgVB1N3ljjeUd0szN5C
	44PIKs1SP8nObc2BL8zuKG3IRL+YNjw7tA5/5Cv/oTTZtiRG8Z3QmgxrTzxz3becUWGCJf5V4cf
	h2bK2ec7wALnNKlD5oKeig2FMOU4xYeJEWDAcSvuUoFNmyr26OkASG4EGdruvRT1QrbzUTPSFxl
	r2TBX5932t73R/3EA4LRVj8UsPKOND07keHA==
X-Received: by 2002:a17:90a:e010:b0:299:24a6:1345 with SMTP id u16-20020a17090ae01000b0029924a61345mr10416901pjy.43.1708399346043;
        Mon, 19 Feb 2024 19:22:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJn8WOloMjV6gvuqKoLn4qySk/Bd6ceru9E0EPfES9GwATAvvxLWnFRT8XZMJvH6ANwk3LY0y8zZGaS+pb+AM=
X-Received: by 2002:a17:90a:e010:b0:299:24a6:1345 with SMTP id
 u16-20020a17090ae01000b0029924a61345mr10416882pjy.43.1708399345625; Mon, 19
 Feb 2024 19:22:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216160526.235594-1-hpa@redhat.com> <20240216160526.235594-2-hpa@redhat.com>
 <a62e3df9-b111-4093-a9de-cc7897f1b306@redhat.com>
In-Reply-To: <a62e3df9-b111-4093-a9de-cc7897f1b306@redhat.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Tue, 20 Feb 2024 11:22:14 +0800
Message-ID: <CAEth8oGN6pwWxjsHb25cnU_wvCKhLYJWogJj-zPOke1vHrkm8w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] platform: x86-android-tablets: other: Add swnode
 for Xiaomi pad2 indicator LED
To: Hans de Goede <hdegoede@redhat.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Mon, Feb 19, 2024 at 10:07=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> Hi Kate,
>
> On 2/16/24 17:05, Kate Hsuan wrote:
> > There is a KTD2026 LED controller to manage the indicator LED for Xiaom=
i
> > pad2. The ACPI for it is not properly made so the kernel can't get
> > a correct description of it.
> >
> > This work add a description for this RGB LED controller and also set a
> > trigger to indicate the chaging event (bq27520-0-charging). When it is
> > charging, the indicator LED will be turn on.
> >
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > ---
> >  .../platform/x86/x86-android-tablets/other.c  | 85 +++++++++++++++++++
> >  .../x86/x86-android-tablets/shared-psy-info.h |  2 +
> >  2 files changed, 87 insertions(+)
> >
> > diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers=
/platform/x86/x86-android-tablets/other.c
> > index bc6bbf7ec6ea..542ef6667b7b 100644
> > --- a/drivers/platform/x86/x86-android-tablets/other.c
> > +++ b/drivers/platform/x86/x86-android-tablets/other.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/gpio/machine.h>
> >  #include <linux/input.h>
> >  #include <linux/platform_device.h>
> > +#include <dt-bindings/leds/common.h>
> >
> >  #include "shared-psy-info.h"
> >  #include "x86-android-tablets.h"
> > @@ -593,6 +594,87 @@ const struct x86_dev_info whitelabel_tm800a550l_in=
fo __initconst =3D {
> >       .gpiod_lookup_tables =3D whitelabel_tm800a550l_gpios,
> >  };
> >
> > +/*
> > + * The fwnode for ktd2026 on Xaomi pad2. It composed of a RGB LED node
> > + * with three subnodes for each color (B/G/R). The RGB LED node is nam=
ed
> > + * "multi-led" to align with the name in the device tree.
> > + */
> > +
> > +/* main fwnode for ktd2026 */
> > +static const struct software_node ktd2026_node =3D {
> > +};
> > +
> > +static const struct property_entry ktd2026_rgb_led_props[] =3D {
> > +     PROPERTY_ENTRY_U32("reg", 0),
> > +     PROPERTY_ENTRY_U32("color", LED_COLOR_ID_RGB),
> > +     PROPERTY_ENTRY_STRING("function", "indicator"),
> > +     PROPERTY_ENTRY_STRING("linux,default-trigger",
> > +                           "bq27520-0-charging"),
> > +
> > +     { }
> > +};
>
> What is the result of setting this default trigger on
> the multi-color LED class device ?

Thank you for reviewing it.

>
> Will the LED now turn on at whatever color it was last
> set (presumably white?)

You are right. It is white.

> when charging and turn off
> again when charging is complete, or the charger is plugged out ?

The behavior is simple. It is lit up when the charger is connected. It
is turned off when the charger is disconnected.
Many triggers can be used.
bq27520-0-charging-or-full
[bq27520-0-charging]
bq27520-0-full
bq27520-0-charging-blink-full-solid

I think bq27520-0-charging-or-full or
bq27520-0-charging-blink-full-solid can be used in the v3 patch.
(The battery status is always "charging" for my Xiaomi pad2. Even the
battery is 100%. When the pad is off and then connect the charger, it
will be turned on immediately. The LED will be lit up after the kernel
module is loaded)

>
> Regards,
>
> Hans
>
>
>
>
> > +
> > +static const struct software_node ktd2026_rgb_led_node =3D {
> > +     .name =3D "multi-led",
> > +     .properties =3D ktd2026_rgb_led_props,
> > +     .parent =3D &ktd2026_node,
> > +};
> > +
> > +/* B */
> > +static const struct property_entry ktd2026_red_led_props[] =3D {
> > +     PROPERTY_ENTRY_U32("reg", 0),
> > +     PROPERTY_ENTRY_U32("color", LED_COLOR_ID_BLUE),
> > +     { }
> > +};
> > +
> > +static const struct software_node ktd2026_red_led_node =3D {
> > +     .properties =3D ktd2026_red_led_props,
> > +     .parent =3D &ktd2026_rgb_led_node,
> > +};
> > +
> > +/* G */
> > +static const struct property_entry ktd2026_green_led_props[] =3D {
> > +     PROPERTY_ENTRY_U32("reg", 1),
> > +     PROPERTY_ENTRY_U32("color", LED_COLOR_ID_GREEN),
> > +     { }
> > +};
> > +
> > +static const struct software_node ktd2026_green_led_node =3D {
> > +     .properties =3D ktd2026_green_led_props,
> > +     .parent =3D &ktd2026_rgb_led_node,
> > +};
> > +
> > +/* R */
> > +static const struct property_entry ktd2026_blue_led_props[] =3D {
> > +     PROPERTY_ENTRY_U32("reg", 2),
> > +     PROPERTY_ENTRY_U32("color", LED_COLOR_ID_RED),
> > +     { }
> > +};
> > +
> > +static const struct software_node ktd2026_blue_led_node =3D {
> > +     .properties =3D ktd2026_blue_led_props,
> > +     .parent =3D &ktd2026_rgb_led_node,
> > +};
> > +
> > +static const struct software_node *ktd2026_node_group[] =3D {
> > +     &ktd2026_node,
> > +     &ktd2026_rgb_led_node,
> > +     &ktd2026_red_led_node,
> > +     &ktd2026_green_led_node,
> > +     &ktd2026_blue_led_node,
> > +     NULL
> > +};
> > +
> > +static int __init xiaomi_mipad2_init(void)
> > +{
> > +     return software_node_register_node_group(ktd2026_node_group);
> > +}
> > +
> > +static void xiaomi_mipad2_exit(void)
> > +{
> > +     software_node_unregister_node_group(ktd2026_node_group);
> > +}
> > +
> >  /*
> >   * If the EFI bootloader is not Xiaomi's own signed Android loader, th=
en the
> >   * Xiaomi Mi Pad 2 X86 tablet sets OSID in the DSDT to 1 (Windows), ca=
using
> > @@ -616,6 +698,7 @@ static const struct x86_i2c_client_info xiaomi_mipa=
d2_i2c_clients[] __initconst
> >                       .type =3D "ktd2026",
> >                       .addr =3D 0x30,
> >                       .dev_name =3D "ktd2026",
> > +                     .swnode =3D &ktd2026_node,
> >               },
> >               .adapter_path =3D "\\_SB_.PCI0.I2C3",
> >       },
> > @@ -624,4 +707,6 @@ static const struct x86_i2c_client_info xiaomi_mipa=
d2_i2c_clients[] __initconst
> >  const struct x86_dev_info xiaomi_mipad2_info __initconst =3D {
> >       .i2c_client_info =3D xiaomi_mipad2_i2c_clients,
> >       .i2c_client_count =3D ARRAY_SIZE(xiaomi_mipad2_i2c_clients),
> > +     .init =3D xiaomi_mipad2_init,
> > +     .exit =3D xiaomi_mipad2_exit,
> >  };
> > diff --git a/drivers/platform/x86/x86-android-tablets/shared-psy-info.h=
 b/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
> > index c2d2968cddc2..8c33ec47ee12 100644
> > --- a/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
> > +++ b/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
> > @@ -29,4 +29,6 @@ extern const char * const bq24190_modules[];
> >  extern const struct platform_device_info int3496_pdevs[];
> >  extern struct gpiod_lookup_table int3496_reference_gpios;
> >
> > +extern const struct software_node ktd2026_leds_node;
> > +
> >  #endif
>


--=20
BR,
Kate


