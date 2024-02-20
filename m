Return-Path: <linux-leds+bounces-866-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C54285B1E9
	for <lists+linux-leds@lfdr.de>; Tue, 20 Feb 2024 05:22:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9524B2279B
	for <lists+linux-leds@lfdr.de>; Tue, 20 Feb 2024 04:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3730B53819;
	Tue, 20 Feb 2024 04:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DGu0LvUh"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3084945942
	for <linux-leds@vger.kernel.org>; Tue, 20 Feb 2024 04:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708402924; cv=none; b=tJ7UpwI9ofe7A/wBIJYRsa4vyhzCUjkd2ydRQzvR5oKXHakeCjwphG/YD3M+L4lIbJ7/sVBsRW3MYG2Xr0LvqKRC4dR4VA7H59kWhClJcnj8IovpiT2vEPYgCwu2mt/7QGyKq7KCogA+pjS6inSs6qwjnGQaPkB4r0GRCOXBFuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708402924; c=relaxed/simple;
	bh=WCF3OZVpoufQtSdhHx8MAVju0Q3mt+t5ASQcnqHlCbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QMNSahtHAucoZDlJ1bTgNFxuDbS4da/gHO9g779Dr7TL+uJiEcZn1HCIhQFLcOPm1+Q/RXsadYx3U00HV9vBELgxGY6F/dFczZuiSklVSZU7sxhmkVLFpnaI4QhpiJ1j5ikmlR+L2Lq3XLxidIAeAlne7kJiXWYid4S/2SMHgxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DGu0LvUh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708402921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CfGjHs5cw+qF5geyKfNUFgoxhPNZKodQX0gjR3G+0Mg=;
	b=DGu0LvUhcA2Dp6xP594WL9SSxRVlZ5n7eg4hC9UDsRcrIoAz2xBs7vTEfhvcHOfXAK/J+5
	BNQQfv3uSDDluobeGpdYXGy/QuUT8coU49iB2+s2HksspCbR4BREDWqWdOupd0kS8Fwve3
	oRpHY+QxzJIFutWr80Egy396fMUk1J4=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-oeGNBqimNrmc7Jh4KztaAw-1; Mon, 19 Feb 2024 23:21:58 -0500
X-MC-Unique: oeGNBqimNrmc7Jh4KztaAw-1
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-5cfda2f4716so2765356a12.3
        for <linux-leds@vger.kernel.org>; Mon, 19 Feb 2024 20:21:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708402918; x=1709007718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CfGjHs5cw+qF5geyKfNUFgoxhPNZKodQX0gjR3G+0Mg=;
        b=kTGTQHPKaxHfZ81yDzhUlk00KVO7DsgTzKEDO1RsbmPSNHYC9som8cAWLMe/3/E5o+
         /dSrh2TOjoMaoulFYcp/tjt0g+8YARCiZc5aOzZEwqCp42LsDmdxORd2Ok3Q1jIupiyc
         Ifxi2SxkpqxlmTitDe3ACHFsDcnuoeeM1885R5ZqMu4eQppKHYhw8zLjrWGaKAeotol1
         ddqqda1n+PVXIF/KODc77s1pZ22YN++KUFkfaq41Nyoc5yeGzu0ZC58W44LmnZgs8wk2
         oXVOhgtPy3tKojm/VURpL0iatM+EfyJ1EA+lO7FPqQzdrc1qgFs0LpCpabE/XmjeLeEu
         1sjg==
X-Forwarded-Encrypted: i=1; AJvYcCVUz5ct3lJeyAZ8P+7sMYIoE7hJi1pkgQzOLd1hDsvWdi7WI2SsZJBotL7vWb/8zDOi/1LvqLppNT0/EoGKLlZtjo1d1pOMX2Odug==
X-Gm-Message-State: AOJu0Yzo5b9GtHMY3BXj3KurUC7pI0mrh07zgmRWFsBiO27x2v143QcN
	1Nq81qrpxbAAuitz2p6fgZaNd5YaS3czm3f+CD+FJoZeiDWu6b7YKYxFEsVEnD9Mv2Bh4SuixFb
	q709WyFBAgr96d/iMYzHmq1mXTg+RB0px6BPE9R+pxUkIXjQLX5G2qzUrEfEe8uK7Q8pZ3qcqMX
	G0C247xRWM4GgdSS98UQvHfqBxtescq7RLyg==
X-Received: by 2002:a05:6a20:c90a:b0:19c:ad6b:e1c2 with SMTP id gx10-20020a056a20c90a00b0019cad6be1c2mr14711094pzb.12.1708402917744;
        Mon, 19 Feb 2024 20:21:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjSmgKfDkK7CmA/GoLkRJItd6noEkfl0ZZc8q2VOSMOWv+3K43EV9Wt9UnRWUBOY0zexbwEiUG8xydJZvAXCU=
X-Received: by 2002:a05:6a20:c90a:b0:19c:ad6b:e1c2 with SMTP id
 gx10-20020a056a20c90a00b0019cad6be1c2mr14711081pzb.12.1708402917413; Mon, 19
 Feb 2024 20:21:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216160526.235594-1-hpa@redhat.com> <20240216160526.235594-4-hpa@redhat.com>
 <9f2d02ff-5a8a-4c11-a1a3-bea43d7b6454@linux.intel.com> <5c5840f6-35fe-4581-a275-ab1b2b6a1cf3@redhat.com>
In-Reply-To: <5c5840f6-35fe-4581-a275-ab1b2b6a1cf3@redhat.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Tue, 20 Feb 2024 12:21:46 +0800
Message-ID: <CAEth8oE=Ev15oHp2gvReXtvK_zGufu1EGhKak_v4BMK2_LhMAw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] leds: rgb: leds-ktd202x: Skip regulator settings
 for Xiaomi pad2
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans and llpo,

On Mon, Feb 19, 2024 at 10:04=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> Hi Kate, Ilpo,
>
> On 2/19/24 14:28, Ilpo J=C3=A4rvinen wrote:
> > On Sat, 17 Feb 2024, Kate Hsuan wrote:
> >
> >> The controller is already powered by BP25890RTWR on Xiaomi Pad2 so the
> >> regulator settings can be ignored.
> >>
> >> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> >> ---
> >>  drivers/leds/rgb/leds-ktd202x.c | 15 +++++++++++++++
> >>  1 file changed, 15 insertions(+)
> >>
> >> diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-k=
td202x.c
> >> index 8eb79c342fb6..6fd0794988e9 100644
> >> --- a/drivers/leds/rgb/leds-ktd202x.c
> >> +++ b/drivers/leds/rgb/leds-ktd202x.c
> >> @@ -14,7 +14,9 @@
> >>  #include <linux/of.h>
> >>  #include <linux/of_device.h>
> >>  #include <linux/regmap.h>
> >> +#ifndef CONFIG_ACPI
> >>  #include <linux/regulator/consumer.h>
> >> +#endif
> >
> > Why you need #ifndef here?
> >
> >>  #define KTD2026_NUM_LEDS 3
> >>  #define KTD2027_NUM_LEDS 4
> >> @@ -105,18 +107,22 @@ struct ktd202x {
> >>
> >>  static int ktd202x_chip_disable(struct ktd202x *chip)
> >>  {
> >> +#ifndef CONFIG_ACPI
> >>      int ret;
> >> +#endif
> >>
> >>      if (!chip->enabled)
> >>              return 0;
> >>
> >>      regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL, KTD202X_ENA=
BLE_CTRL_SLEEP);
> >>
> >> +#ifndef CONFIG_ACPI
> >>      ret =3D regulator_bulk_disable(ARRAY_SIZE(chip->regulators), chip=
->regulators);
> >>      if (ret) {
> >>              dev_err(chip->dev, "Failed to disable regulators: %d\n", =
ret);
> >>              return ret;
> >>      }
> >> +#endif
> >>
> >>      chip->enabled =3D false;
> >>      return 0;
> >> @@ -129,11 +135,13 @@ static int ktd202x_chip_enable(struct ktd202x *c=
hip)
> >>      if (chip->enabled)
> >>              return 0;
> >>
> >> +#ifndef CONFIG_ACPI
> >>      ret =3D regulator_bulk_enable(ARRAY_SIZE(chip->regulators), chip-=
>regulators);
> >>      if (ret) {
> >>              dev_err(chip->dev, "Failed to enable regulators: %d\n", r=
et);
> >>              return ret;
> >>      }
> >> +#endif
> >>      chip->enabled =3D true;
> >>
> >>      ret =3D regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL, KTD=
202X_ENABLE_CTRL_WAKE);
> >> @@ -560,6 +568,7 @@ static int ktd202x_probe(struct i2c_client *client=
)
> >>              return ret;
> >>      }
> >>
> >> +#ifndef CONFIG_ACPI
> >>      chip->regulators[0].supply =3D "vin";
> >>      chip->regulators[1].supply =3D "vio";
> >>      ret =3D devm_regulator_bulk_get(dev, ARRAY_SIZE(chip->regulators)=
, chip->regulators);
> >> @@ -573,10 +582,12 @@ static int ktd202x_probe(struct i2c_client *clie=
nt)
> >>              dev_err_probe(dev, ret, "Failed to enable regulators.\n")=
;
> >>              return ret;
> >>      }
> >> +#endif
> >>
> >>      chip->num_leds =3D (int) (unsigned long)i2c_get_match_data(client=
);
> >>
> >>      ret =3D ktd202x_probe_dt(chip);
> >> +#ifndef CONFIG_ACPI
> >>      if (ret < 0) {
> >>              regulator_bulk_disable(ARRAY_SIZE(chip->regulators), chip=
->regulators);
> >>              return ret;
> >> @@ -587,6 +598,10 @@ static int ktd202x_probe(struct i2c_client *clien=
t)
> >>              dev_err_probe(dev, ret, "Failed to disable regulators.\n"=
);
> >>              return ret;
> >>      }
> >> +#else
> >> +    if (ret < 0)
> >> +            return ret;
> >> +#endif
> >>
> >>      mutex_init(&chip->mutex);
> >
> > To me this entire approach looks quite ugly. It would be much cleaner t=
o
> > have something along these lines:
> >
> > #ifndef CONFIG_ACPI
> > static int ktd202x_regulators_disable(struct ktd202x *chip)
> > {
> >       int ret;
> >
> >       ret =3D regulator_bulk_disable(ARRAY_SIZE(chip->regulators), chip=
->regulators);
> >       if (ret)
> >               dev_err(chip->dev, "Failed to disable regulators: %d\n", =
ret);
> >
> >       return ret;
> > }
> > ...
> > #else
> > static inline int ktd202x_regulators_disable(struct ktd202x *chip) { re=
turn 0; }
> > ...
> > #endif
> >
> > And call that function without any #ifdefs from the other code.
>
> I believe that skipping the regulator stuff in the ACPI case is not
> the right solution here.
>
> There likely is some underlying issue which also happens on non ACPI
> hw, but I guess no-one has ever tried to remove the module there.
>
> I have the same tablet as on which Kate is testing this. So I plan
> to make some time to reproduce this and see if I can come up with
> a proper fix.
>
> Regards,
>
> Hans
>

Thank you for reviewing it.

This patch is used to prevent the WARN_ON() shown in the following URL.
https://elixir.bootlin.com/linux/latest/source/drivers/regulator/core.c#L23=
96

I'll drop this patch in the v3 patch. And I can also try to
investigate the issue of the regulator.


--
BR,
Kate


