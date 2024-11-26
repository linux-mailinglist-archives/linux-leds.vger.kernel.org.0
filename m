Return-Path: <linux-leds+bounces-3441-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FD29D9DC9
	for <lists+linux-leds@lfdr.de>; Tue, 26 Nov 2024 20:04:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E3A5287692
	for <lists+linux-leds@lfdr.de>; Tue, 26 Nov 2024 19:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C31E1DE2DB;
	Tue, 26 Nov 2024 19:04:52 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E362616F0E8;
	Tue, 26 Nov 2024 19:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732647892; cv=none; b=EYMkum2ELajZ1ysItKua6fu76j3lBIrBAeDz6c8t9COmtnXqsAp+qP7PO2hqPjxaOLt+FQ37s0yZLCt2uAwUcJZR50EgC2crF4gonen21FzoEiUgoB0tMsq2GJEnLC1eJZG/ITvoxqzbvUSE+OYta/jjmW2Cg1YxLsBUmf5s0Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732647892; c=relaxed/simple;
	bh=qQCWd6U/ZoiKaGO0HuHoCIeIwfRD/cI8nHIsSGT4F1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EIjHxfif1NI6bl6BcRjy6x4mmaqoDtZaYKdAnKdkQuzPM9LQgJ6hqHIbDIp8beHX7sLpB0o0T6AO6afguEOrJ0nduQmEBgoYX89Qb+2l2yRYzGWxzkhYfk7ysAZuhmdRZyt1kLD5wi9HgS743Cbt0S6KkHXuACb9uL2Qqg7MfA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-841a9366b5eso61979739f.2;
        Tue, 26 Nov 2024 11:04:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732647890; x=1733252690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQCWd6U/ZoiKaGO0HuHoCIeIwfRD/cI8nHIsSGT4F1g=;
        b=Bsjc7kzn/yVrUj0k8vS2FD58R7gVh/PxNW/ed5/u3rkyLolcmtUb1eXFUhvlf/qoJy
         uRZ5S7AjxlDPP0F6lP7cAcX/b/K67iyLgxJG31qGdcl5NOw98UxrthPeqckJg4MMp/KX
         NL2VURXILW2iDNJWEJc/GyhbfcqIUdIUWYgG58pM+hsdzMgeoyHdAUuGOITYm9Dn/fRq
         xsKtTBY3kW52GbTr8aLNiEeB2fBD8S2i+qS/by5iB6QmBx6Rjn3c4pqzh0cbCE9CwFBy
         5qzAaKnWoRuitdlDWrKjv7knLgm8o4VQMJIW7i+qkOfvV5HI86j7kkx7xy77EPFiPAdP
         h2ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWteDnrdtjieQ50XbPcLhje1KPk9957SOv07H3wrofPZbOcuEDtmQO5q3pTrmsRfKG/mo3Kt6j3VyoA4BUI/9ssu5OSoQ==@vger.kernel.org, AJvYcCXvYLjyXsdOrMVgWDNOuJWw5n31nOxCzE4l420svUAIF9rrRaHJODB8+RUUrxvwCKXB7j5HqOjS+2Q8@vger.kernel.org
X-Gm-Message-State: AOJu0YwwmE1qtkkJOmk1wCPk6oaY886pNF5z1FmLhxgSWy+nhu3vnwE8
	dHw03FHRwcnsI7LmZL1k6yBJ++FJqKUq429fDYkeNqDQaCoUbXMZtD1wRf93
X-Gm-Gg: ASbGncvm/ZuUItVNgRVf1yJwPSIZUiGaBJQzn3JgPQDbUgRmKsI7hFxp7znGf15W7M5
	J2IYkhJTZ1uwYMGiLUWHCTBLmmLpghpvSUI/DXsbCygFv/clDc+X5erTwHS1iJprxHWRAZvJoqY
	g8i0TLjsYagA3CWQH8lY0+u/p6UnYI4TiFIBfB7PjZTGYBUOLPNOW4Vd0qQTkzJAjhopZ+MHKuO
	ia376lvYq9jqYO3eXZDROP4GERCvCyzEib06TcemIiy6U+Ru0Ye/p38aziw2p/gRG0x3DGhUs4l
	BamTaaJ5e72U+Q0=
X-Google-Smtp-Source: AGHT+IGrAS9pDNjIPqv/mfH1/REslEJKPch7BJNdQDUn0XI4hjYjEc4GpQatR/sqjkHats1NI52XZA==
X-Received: by 2002:a05:6602:1695:b0:83d:e526:fde7 with SMTP id ca18e2360f4ac-843ecf19b45mr73460739f.6.1732647889855;
        Tue, 26 Nov 2024 11:04:49 -0800 (PST)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com. [209.85.166.41])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e209f3a06asm919561173.48.2024.11.26.11.04.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 11:04:49 -0800 (PST)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-84198253281so89016439f.0;
        Tue, 26 Nov 2024 11:04:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV65Bf8PENr6P6l7BX73Ybij+jNRf+a10j4VTDwZSujc31D7ARIE5NHQ2fAFpwNdNhfVhqa5XoNuVALxnRmqeCIOsMIew==@vger.kernel.org, AJvYcCW/nFbwy3vAgHd1ZbLjmYH6xHBDhS0BfMePG7vEO+Ir/m3m4APz63kaoKcxpurttlC44tWOCBhbg9Hm@vger.kernel.org
X-Received: by 2002:a05:6602:140f:b0:843:e8d0:a728 with SMTP id
 ca18e2360f4ac-843ececc316mr79491139f.4.1732647889274; Tue, 26 Nov 2024
 11:04:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMF+KeYus9dW00WNJMLVxLLHdG9JgCfrGJ491fu7NM8GAEqqCg@mail.gmail.com>
 <fd4a30e0-b5bb-47d7-8173-312417dce215@gmx.de> <CAMF+KeZkqwnBNT4vVNLEC03zZqSTSAE-Z=8j9ZLACf3yBeun8A@mail.gmail.com>
 <qsdbzbvpwlrnx2sqhrjfg3rukbm3z5gjkyjwlwoc3jnd3vre36@72py3mfwwsse>
 <CAMF+KeYGCZuc5DSCf4S+oZZgp5E4hwowJ+HqOy=ijjPZwv+zpQ@mail.gmail.com>
 <e46b4d6d-16f0-47d9-a680-c1ac90c52a97@gmx.de> <CAMF+KeaSarRT3weYhiCFO=Th5ZWMf=nvi53A+ggKYq2wBYAJpw@mail.gmail.com>
 <b531a5a7-d96a-4840-9831-d01a2b77c000@gmx.de>
In-Reply-To: <b531a5a7-d96a-4840-9831-d01a2b77c000@gmx.de>
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Tue, 26 Nov 2024 20:04:38 +0100
X-Gmail-Original-Message-ID: <CAMF+Kear1ZhaM1Jry=SS=xPa17+DNUQusOiR_rrYpcpW1YFhFw@mail.gmail.com>
Message-ID: <CAMF+Kear1ZhaM1Jry=SS=xPa17+DNUQusOiR_rrYpcpW1YFhFw@mail.gmail.com>
Subject: Re: Adding a new platform driver samsung-galaxybook
To: Armin Wolf <W_Armin@gmx.de>
Cc: Kurt Borja <kuurtb@gmail.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
	Pavel Machek <pavel@ucw.cz>, lee@kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Den m=C3=A5n 25 nov. 2024 kl 18:20 skrev Armin Wolf <W_Armin@gmx.de>:
>
> For the LED class device: you can use led_init_data to set default_label =
and
> devicename (just copy the platform device name for devicename). By settin=
g
> devname_mandatory to true the resulting led class device should have a un=
ique
> name.
>

Thank you, this was excellent guidance as usual! I tested a few
variations and found that it is possible to match existing platform
drivers with the format of <name>::kbd_backlight and here is how this
change looks in the branch I am using to make these adjustments in:

https://github.com/joshuagrisham/samsung-galaxybook-extras/commit/20f28efed=
07fb04b7c5397e709bbd00772bdf4fb

As a summary I am basically setting the following:

init_data.devicename =3D "samsung-galaxybook";
init_data.default_label =3D ":kbd_backlight";
init_data.devname_mandatory =3D true;

This results in the name of the first added LED device to still be
"samsung-galaxybook::kbd_backlight" which also matches the pattern
that exists in basically every other currently existing x86 Platform
driver.

I "mocked" having multiple existing by temporarily removing the
unregister step and then removing and re-probing the module several
times. What happens is that the string is just appended with a rolling
number like this: samsung-galaxybook::kbd_backlight_1,
samsung-galaxybook::kbd_backlight_2, etc.

I then checked in the code of both udev and upower to ensure that
these names would still work with the features in those services, and
in both places they are looking for the existence of the string
"kbd_backlight" anywhere within the name, so it should still work with
this implementation as well.. To be sure that it does in fact work, I
forced the name to be exactly samsung-galaxybook::kbd_backlight_1 and
rebooted, and everything seemed to be working fine / automatically
within GNOME and otherwise--so far, so good, there!

I am quite pleased with this solution as it should give the originally
intended name in all existing known cases and additional names would
be added only in super weird circumstances, yet will still handle
multiple names in a graceful way.

> I am CCing the LED maintainers so they can give us some advise on how to =
handle
> this the best way.
>

Amazing, thank you! How does it look with the change I mentioned
here--does it seem like this is matching the desired outcome, or is
there anything that should be changed?

Thank you again!

Best,
Joshua

> [...]

