Return-Path: <linux-leds+bounces-8571-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yy8TLs2pKmp9ugMAu9opvQ
	(envelope-from <linux-leds+bounces-8571-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jun 2026 14:27:57 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C06671D2E
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jun 2026 14:27:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=d9AJ5LF9;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8571-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8571-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2EDAC3036E62
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jun 2026 12:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 911423F4111;
	Thu, 11 Jun 2026 12:27:55 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B433EFD03
	for <linux-leds@vger.kernel.org>; Thu, 11 Jun 2026 12:27:53 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781180875; cv=pass; b=BDXmWCL6NFznGvwKWcQp7EpU3VA/+W+c9L6tMLseGiSFqx+lDN8kq7lfE1ZwsMIOtXI5LETMOF1OV2L06V2i4uN5q2DOOBMiLtvKBmriqQUeDheqxPP5EUENI7LTAR7LMlVuD/Tf6rnmBYSURCfdCWBmmjuvWMrSkjrSrwSvvZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781180875; c=relaxed/simple;
	bh=DbatO3kAOT4OZzRTOJ/NG/Vi7OILBleIVrZsVOdwbf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k6tzF1MwAfZA8LrKz1LYsUsyG6upXKI1mPMbfFgF5IHyWZ1TPbZllq78Ul9RR4LL2ucvbGXkfTguTk/2uHwYqEjFdxHIVwxLlUmr3ISgES5t4nRR+kCzfYqtTHi/fk5ttbjqfcliAY4ZSAoA97G3JbH1mSnKZRhtcybCTx5zI40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9AJ5LF9; arc=pass smtp.client-ip=74.125.82.171
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-304df7ff4c2so547042eec.0
        for <linux-leds@vger.kernel.org>; Thu, 11 Jun 2026 05:27:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781180873; cv=none;
        d=google.com; s=arc-20240605;
        b=INCLG74w313IlLmdNdJnp4fFdIIpjJCbzOxNskjGa1BV28zEgP97C6xq2fWIDJHFZy
         RXVGpz1Yeek3rn5DwUnjg8JGTBftnPqOhoWU3KiE3Bbsvnih3ruqEpF4B/h3MLanii55
         lAWY6bRtPXriRwJXI/K/leB+N20vRT/Fm6MFnPpTtfKLwXg6u1VP+xvQVNEEONLMvQfC
         AjGDjTCweFxAaBBaX2aPCeN6aT+vP4Rle7xWwqbCqvsHcuHSdlSmsk46cKlDGG7hh/8l
         Pz7zL4s/LS1g/S5z3X3r2YjAf+fQgpSvuu0NgP5GcOmCwOrN4ThUugzR7fW+IZEzUWLF
         NNfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VYIWRtJIPzHv3oaDGDHQXtoN5dERb3wNaaEqhAk4Y7Q=;
        fh=/VuyHxZ0/EXRLh6ih434EuhDfXtd5tmTisrUlA/PeCs=;
        b=g30aESDPxGeb3p/+hFZdCnMIIXxs3Ha4mlmtrj7IPXfSSeTB/CBUlGIJefolLiaXT9
         PEG+OJh4FUr3NPIfCq2uO544ACKUuPsvxlwk0w9NNLlhYRBXzqVYIIrbEFVW3iVUqWu3
         O1h3iN9WEUN0ssZKIXAFi+gc14oTHzM6xLPhgKZPf1uurtUTmRYGETBng2QzyyeS/S9z
         Q19V1Y4IvSF83io8HmqSTiF+MIv1BUm0GhBBxHPUMaWx7oDrSvFjyM23tXYcBOOztGky
         3zm190OkFQRLNawafS/O4PlX0eevfBCuJ9iQ+1MxLDTKELiWifPYBSsMUUfv9K7ySWj9
         jBJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781180873; x=1781785673; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYIWRtJIPzHv3oaDGDHQXtoN5dERb3wNaaEqhAk4Y7Q=;
        b=d9AJ5LF9EIdwT3BlrvbbKREeouKdaMRZaqkzAHsFKbQ2uklncxnjThQf+7pY2iTtvh
         1egL+FlKMTFAaFYqn1Q88drLa7gdtSw9LbRB9iI6YCzZ2IShW5jX2W++HN5juPYJOMH4
         ryd4SyMMAdfiFsLlhSPYC75qsKUAmcDUdbtbqJeGKWrLUQOoi6aVzqxuMPruf8UHVog5
         mecNXUvH5hj9Bk2g1RhQssloTizZbK21tMmHo5Ag9/071qwWt4aTLfulNVibf1qZW2lw
         RJVn05h9kX9ywZPZTi0MWZBxA2OWwllf9guYeOFWv6hfptp96YHEjtf544I73GQTdwVq
         D1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781180873; x=1781785673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VYIWRtJIPzHv3oaDGDHQXtoN5dERb3wNaaEqhAk4Y7Q=;
        b=GFuAoagaQUY3sVH4YJiB0sKlwtXt2joUm/lH1N/yZeDABl+xxElHANZdEn1BySV/4j
         Nh02zPnatutZudWSGXenyCgg0OCLUCU0GUgz2zOCqfLBEy/iyx5/YsFoV45l4GTTOwy2
         +Ms9ZEPZ041HEBm2LXIoxAQRpuPJ3zUzuDYCprvsYhz55PcHUOzL7yS5o18XmtI+fOuv
         cgFKf8udBgGhaebyWU8YLWS30BPT1k0qWIG1JaGd7z9r780S+hDXyLp1OckZ82ms/vYH
         udOEbKJ/Ook28N++3dcjsFbQw6k3fVOlGNZy412oS5tZICN9+wI3ce9POEpoy3lfjcCj
         Wo+g==
X-Forwarded-Encrypted: i=1; AFNElJ96pJ/fjTzLy31NUWPUuT2dJv4Egxa8kgEK4zGFY0/0WunIvvL8byhjAkQqslSEDYp1cGUvifdyu7us@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6XZakj0wqthQTFilkfoa3QvbQr24Uq9SML2xPKwrcMj8GKj6O
	7GEK8aYHBhY3LvZf5GqUV6l4xdlkMtIMlb+L8DvX2wGbVLzKaiEXKsVqPlNCMGkyuI2+YylnBin
	vWk8yx4efxXzeoLEWPO19AwuhNo0D1zAPQiJi5QQ=
X-Gm-Gg: Acq92OHkNQLx4ErRKPLPZmSS9CWaueTeuBKXRYAdkDws6Eec6s3+H4XZ1QPOSTWKmov
	Cc4k21XhtT9xrhRrKbuqsYV7BklTSRmw8dv5MqKbHCwi+vWmmN8AeeaCDJSUHJEMf/nb50Jb093
	WXsn3Tod05LeKVts5ERqgVqYznpsVUtJSzm+Do5LYtdv8pIcH8yJSmkOHMmWRmGxsG88k1hVvxH
	Cef1MjB1D2MAqA7kOQ7/Q48kNng0+xWeawSwcppvcu+CMMWh2fmc42VKLGhT7xNvWlqFsFWfEZE
	F/GxsQJDRk2f3lU9Hqx6VpwXAa6bIg==
X-Received: by 2002:a05:7300:371e:b0:304:ddc3:2c35 with SMTP id
 5a478bee46e88-30805e289c5mr1512358eec.10.1781180873014; Thu, 11 Jun 2026
 05:27:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528053203.9339-1-clamor95@gmail.com> <20260528053203.9339-6-clamor95@gmail.com>
 <20260611113037.GO4151951@google.com>
In-Reply-To: <20260611113037.GO4151951@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 11 Jun 2026 15:27:41 +0300
X-Gm-Features: AVVi8CdJMWQJsV5RMfNy0VFbQwyfBDL1gbx8-gP-GKQ2UQnPvXxuEkIVsCd47h4
Message-ID: <CAPVz0n3sn7pmw8S7=q3Tp3=UmMJqapKt_55Nu75xoUw21skU8w@mail.gmail.com>
Subject: Re: [PATCH v8 5/7] leds: Add driver for ASUS Transformer LEDs
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8571-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.torokhov@gmail.com,m:pavel@kernel.org,m:sre@kernel.org,m:ion@agorria.com,m:mirq-linux@rere.qmqm.pl,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,agorria.com,rere.qmqm.pl,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29C06671D2E

=D1=87=D1=82, 11 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 14:3=
0 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, 28 May 2026, Svyatoslav Ryhel wrote:
>
> > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> >
> > ASUS Transformer tablets have a green and an amber LED on both the Pad
> > and the Dock. If both LEDs are enabled simultaneously, the emitted ligh=
t
> > will be yellow.
> >
> > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > ---
> >  drivers/leds/Kconfig                    |  11 +++
> >  drivers/leds/Makefile                   |   1 +
> >  drivers/leds/leds-asus-transformer-ec.c | 125 ++++++++++++++++++++++++
> >  3 files changed, 137 insertions(+)
> >  create mode 100644 drivers/leds/leds-asus-transformer-ec.c
> >
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > index f4a0a3c8c870..f637d23400a8 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -120,6 +120,17 @@ config LEDS_OSRAM_AMS_AS3668
> >         To compile this driver as a module, choose M here: the module
> >         will be called leds-as3668.
> >
> > +config LEDS_ASUS_TRANSFORMER_EC
> > +     tristate "LED Support for Asus Transformer charging LED"
> > +     depends on LEDS_CLASS
> > +     depends on MFD_ASUS_TRANSFORMER_EC
> > +     help
> > +       This option enables support for charging indicator on
> > +       Asus Transformer's Pad and it's Dock.
> > +
> > +       To compile this driver as a module, choose M here: the module
> > +       will be called leds-asus-transformer-ec.
> > +
> >  config LEDS_AW200XX
> >       tristate "LED support for Awinic AW20036/AW20054/AW20072/AW20108"
> >       depends on LEDS_CLASS
> > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > index 8fdb45d5b439..d5395c3f1124 100644
> > --- a/drivers/leds/Makefile
> > +++ b/drivers/leds/Makefile
> > @@ -16,6 +16,7 @@ obj-$(CONFIG_LEDS_AN30259A)         +=3D leds-an30259=
a.o
> >  obj-$(CONFIG_LEDS_APU)                       +=3D leds-apu.o
> >  obj-$(CONFIG_LEDS_ARIEL)             +=3D leds-ariel.o
> >  obj-$(CONFIG_LEDS_AS3668)            +=3D leds-as3668.o
> > +obj-$(CONFIG_LEDS_ASUS_TRANSFORMER_EC)       +=3D leds-asus-transforme=
r-ec.o
> >  obj-$(CONFIG_LEDS_AW200XX)           +=3D leds-aw200xx.o
> >  obj-$(CONFIG_LEDS_AW2013)            +=3D leds-aw2013.o
> >  obj-$(CONFIG_LEDS_BCM6328)           +=3D leds-bcm6328.o
> > diff --git a/drivers/leds/leds-asus-transformer-ec.c b/drivers/leds/led=
s-asus-transformer-ec.c
> > new file mode 100644
> > index 000000000000..09503e76331c
> > --- /dev/null
> > +++ b/drivers/leds/leds-asus-transformer-ec.c
> > @@ -0,0 +1,125 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +#include <linux/err.h>
> > +#include <linux/leds.h>
> > +#include <linux/mfd/asus-transformer-ec.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +
> > +enum {
> > +     ASUSEC_LED_AMBER,
> > +     ASUSEC_LED_GREEN,
> > +     ASUSEC_LED_MAX
> > +};
> > +
> > +struct asus_ec_led_config {
> > +     const char *name;
> > +     unsigned int color;
> > +     unsigned long long ctrl_bit;
>
> Should we use 'u64' here instead of 'unsigned long long' to align with st=
andard
> kernel integer types?
>

sure

> > +};
> > +
> > +struct asus_ec_led {
> > +     struct asus_ec_leds_data *ddata;
> > +     struct led_classdev cdev;
> > +     unsigned long long ctrl_bit;
>
> Should we use 'u64' here as well to keep it consistent?
>

sure

> > +};
> > +
> > +struct asus_ec_leds_data {
> > +     const struct asusec_core *ec;
> > +     struct asus_ec_led leds[ASUSEC_LED_MAX];
> > +};
> > +
> > +static const struct asus_ec_led_config asus_ec_leds[] =3D {
> > +     [ASUSEC_LED_AMBER] =3D {
> > +             .name =3D "amber",
> > +             .color =3D LED_COLOR_ID_AMBER,
> > +             .ctrl_bit =3D ASUSEC_CTL_LED_AMBER,
> > +     },
> > +     [ASUSEC_LED_GREEN] =3D {
> > +             .name =3D "green",
> > +             .color =3D LED_COLOR_ID_GREEN,
> > +             .ctrl_bit =3D ASUSEC_CTL_LED_GREEN,
> > +     },
> > +};
> > +
> > +static enum led_brightness asus_ec_led_get_brightness(struct led_class=
dev *cdev)
> > +{
> > +     struct asus_ec_led *led =3D container_of(cdev, struct asus_ec_led=
, cdev);
> > +     const struct asusec_core *ec =3D led->ddata->ec;
>
> I'm getting confused here.
>
> ddata is what I'd be calling the device data struct passed by the parent?
>
> In fact, ddata is a little known concept in Leds.  Any reason to go for
> this over the standard nomenclature?
>

How then it should be named? It holds each LED's control bit.

> > +     u64 ctl;
> > +     int ret;
> > +
> > +     ret =3D asus_dockram_access_ctl(ec->dockram, &ctl, 0, 0);
>
> Did we discuss preferring regmap already?
>

Yes, you were fine with all and even said that you will merge
everything with Dmitry Ack for input

HERE https://lore.kernel.org/lkml/20260527144619.GA671544@google.com/

Yet now I get a new pile of complaints and nits.

> > +     if (ret)
> > +             return LED_OFF;
> > +
> > +     return ctl & led->ctrl_bit ? LED_ON : LED_OFF;
> > +}
> > +
> > +static int asus_ec_led_set_brightness(struct led_classdev *cdev,
> > +                                   enum led_brightness brightness)
> > +{
> > +     struct asus_ec_led *led =3D container_of(cdev, struct asus_ec_led=
, cdev);
> > +     const struct asusec_core *ec =3D led->ddata->ec;
> > +
> > +     if (brightness)
> > +             return asus_dockram_access_ctl(ec->dockram, NULL,
> > +                                            led->ctrl_bit, led->ctrl_b=
it);
> > +
> > +     return asus_dockram_access_ctl(ec->dockram, NULL, led->ctrl_bit, =
0);
> > +}
> > +
> > +static int asus_ec_led_probe(struct platform_device *pdev)
> > +{
> > +     const struct asusec_core *ec =3D dev_get_drvdata(pdev->dev.parent=
);
> > +     struct asus_ec_leds_data *ddata;
> > +     struct device *dev =3D &pdev->dev;
> > +     int i, ret;
>
> Could we declare the loop counter 'i' directly within the 'for' statement=
's
> scope to keep its scope limited? For example, 'for (int i =3D 0; ...)'.
>
> > +
> > +     ddata =3D devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> > +     if (!ddata)
> > +             return -ENOMEM;
> > +
> > +     platform_set_drvdata(pdev, ddata);
> > +     ddata->ec =3D ec;
> > +
> > +     for (i =3D 0; i < ASUSEC_LED_MAX; i++) {
>
> Nit: for (int i =3D ...
>
> > +             const struct asus_ec_led_config *cfg =3D &asus_ec_leds[i]=
;
> > +             struct asus_ec_led *led =3D &ddata->leds[i];
> > +
> > +             led->cdev.name =3D devm_kasprintf(dev, GFP_KERNEL, "%s::%=
s",
> > +                                             ddata->ec->name, cfg->nam=
e);
> > +             if (!led->cdev.name)
> > +                     return -ENOMEM;
> > +
> > +             led->cdev.max_brightness =3D 1;
> > +             led->cdev.color =3D cfg->color;
> > +             led->cdev.flags =3D LED_CORE_SUSPENDRESUME | LED_RETAIN_A=
T_SHUTDOWN;
> > +             led->cdev.brightness_get =3D asus_ec_led_get_brightness;
> > +             led->cdev.brightness_set_blocking =3D asus_ec_led_set_bri=
ghtness;
> > +
> > +             led->ddata =3D ddata;
> > +             led->ctrl_bit =3D cfg->ctrl_bit;
> > +
> > +             ret =3D devm_led_classdev_register(dev, &led->cdev);
> > +             if (ret)
> > +                     return dev_err_probe(dev, ret,
> > +                                          "failed to register %s LED\n=
",
> > +                                          cfg->name);
>
> Should we capitalise the error message here to match our style guidelines
> (e.g. 'Failed to register...')?
>

dev messages end with ":" so it should continue with lower case. You
want cap, I don't mind

> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static struct platform_driver asus_ec_led_driver =3D {
> > +     .driver.name =3D "asus-transformer-ec-led",
> > +     .probe =3D asus_ec_led_probe,
> > +};
> > +module_platform_driver(asus_ec_led_driver);
> > +
> > +MODULE_ALIAS("platform:asus-transformer-ec-led");
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
> Lee Jones

