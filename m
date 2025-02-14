Return-Path: <linux-leds+bounces-3985-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4129A357D6
	for <lists+linux-leds@lfdr.de>; Fri, 14 Feb 2025 08:25:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85AFB16AF4A
	for <lists+linux-leds@lfdr.de>; Fri, 14 Feb 2025 07:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6CF72080E1;
	Fri, 14 Feb 2025 07:25:15 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C4013A3EC;
	Fri, 14 Feb 2025 07:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739517915; cv=none; b=GkDMBz8ELiMU/OGRtdG142pNxlDWZYz/z9JC6kDWmd525FWO8LX1zFOXxfYmUC78AqjGssvN4kxsJcgRhw7G9nEZT9lz+2WYVMpr7ittdfUFsWReoruSIqKsfLjcnBKJ37gp5tTzFrR7U44T+FqBrjAr3XrQwmYa37bidZlGmNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739517915; c=relaxed/simple;
	bh=njhTqJEMSxRhiYF56n6lamJ5BDIWXxGYG2aaHwYf2Cs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i+Eos7n6CyZLKvpzmbjxQ6yw9VMdsSOLVVRo9Bu8UtcoSXvLiy5b+pdMjOSmvZ+w084t1IAqJPir9+Dt9PEC4ameAl5IH7OcypT3XdkIuFXAtZx9rZa1VOH4QRblOaC/s4+ttLylHv9NmOPmerUbHxhc1Y6b49d+kuQxWcLAlqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ab7483b9bf7so221528866b.3;
        Thu, 13 Feb 2025 23:25:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739517912; x=1740122712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+sv0U2cyjukGfA/ZIjsFBOYnHcPPEH2EG7bSm4QAFU=;
        b=iXl+2bkVRmwcXmw+BZ7XesSdoHQsdrfsKoFmdhpzkHsbosN79dP4M7uW2XIT2qbhoj
         kf45LvXSA/flUbu/KTuTZzy/LOMl2RqhBO4Q7sCEhq2bsgPONBW0IirnnmH+Z+1BhDwW
         7vLm//c7UqMxY8UE18JogkL1FP5JJVj5aJS6vg3L604opZVesu6D3GPLI1G7oZ5Gs4d4
         NyfhiZM9WA9BJBQ0DvNOLgJM+neTXeXlqNht+mEn5VaZZ55yc1y/0A2fhmGccpQvrYPR
         g++h+J6B5WOKHiT4cuPEtwb16LVPNc337cyuoj3B+A7jaQijEAjKb2yoL39YHqKJLKLF
         n6Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUd2HD0xpl6c1Wyhj4TdbIGilG3tZDV6rVB/aNjVKnCpb60+Re/OyTK50F+DIp5adgltZAWW7nmaMdo@vger.kernel.org, AJvYcCUugzaG9pjnwxXlr/Tj0Ccb2NpXnmO6xTjPH3/xqdafE8boBXfPi/NtMTCrx/YjF6i5fWHSrNH4Q4t1I5nf@vger.kernel.org, AJvYcCWfcybEFoOsdbrji90wA8nKQDQuR46wAMeCxGJcowHvjtK6tnBHluzXyvlfJ/v0n55SOADEM4SoZraWHQ==@vger.kernel.org, AJvYcCXY/FwjtLj7dYkzZBHUtfuyqx94kVwAnio9nRv99nTSrYf0EmI9YjxoxUuSLv8HI04/FFpA/xJ2xtaTbTY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqQUX9Lhd+5upDVN7bCVLJd10Lm8yIZU9qp8vNxK2YAM7s1NWu
	Uo9W4aylujYR/C0nKJFyUMY8hy7e6rnA7avgrkTlYIm7i0To87c9o71zLrxDrxc=
X-Gm-Gg: ASbGncs8y168NGlWUL/O25O28n14muS8qSqjt8jlKjx3t3WemXrUFHXeHf5iY7zJa71
	Ov7kSCASmggswIQCgMrTjUc3tjVtuM3C/l/9vHg8QIA+0oXfHs+7z79PjRDbuzRR1XNo/TXZPVe
	CVPfD83zbsebKw0xu+zPVrjvrsa5kPlzMlxgSowLIRSLl52HJb+kavez1RkU6dPi6oFL3/O5YPi
	arxd1Ebdjv10jssAcGFGWw4bP6Mb6Z4rXlc1DN7OWkGuSCskgOSwPaxIZa0SKY02GWrQcnemG1h
	LHlBubEl1fl+5/GsWytmPgtLLd/4FbtIRpNB4ZWHPpWgfQ==
X-Google-Smtp-Source: AGHT+IGYN5QXOKwbMA3PoZ4nlgJhwsCk9nUu8eukWyCdLmBAJzjCji3J7ZjVxS7NbsD6CtBSWBTM0Q==
X-Received: by 2002:a17:907:1909:b0:ab7:8e0d:3d3c with SMTP id a640c23a62f3a-ab7f3473720mr1066976566b.42.1739517911597;
        Thu, 13 Feb 2025 23:25:11 -0800 (PST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532575b8sm282318966b.44.2025.02.13.23.25.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 23:25:11 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab7c501bbecso253734966b.2;
        Thu, 13 Feb 2025 23:25:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU4kjCRbFIAeBlPawvEaVnCEIRc9APHHJzqs9KSGbpD2QrdxoFXZ3rLvlhRukWF54Mpsgxhhha4R9ZRMA==@vger.kernel.org, AJvYcCUhXFYeT2k59uC5sqK2dnd7hU8D9kUvCmacTCWoaLs/tY4iAw8lAHIb6BNZVPwWmP5BxD0B2/YkE6x8wcY0@vger.kernel.org, AJvYcCWTuW8Jf0YrTXECI7f87pktHVcBmwRK7ziGdkxE143Pd7dWZgWkDSOMGB2lZcR+M1Hlq/72X+/MGlIQ@vger.kernel.org, AJvYcCXLtYqw5ol7lrm0k0apAqJMD5ypJ8G3T0PSpWOPD/FAtTU945NjhbL03Ry2ADMVHg/7Dd6aXTLY4kWwE9k=@vger.kernel.org
X-Received: by 2002:a17:907:1909:b0:ab7:8e0d:3d3c with SMTP id
 a640c23a62f3a-ab7f3473720mr1066973166b.42.1739517910868; Thu, 13 Feb 2025
 23:25:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250214040306.16312-1-towinchenmi@gmail.com>
In-Reply-To: <20250214040306.16312-1-towinchenmi@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 14 Feb 2025 02:24:34 -0500
X-Gmail-Original-Message-ID: <CAEg-Je88-zfnD+Yx7GdxMaG8NZBBjDGZJJ33D0kUyYnAhMhrDA@mail.gmail.com>
X-Gm-Features: AWEUYZmee1G4NO9TTRkSGcwt1I0mLzwp9RPxwW1Z78u96Fa7SXff07gmHN3DsJ8
Message-ID: <CAEg-Je88-zfnD+Yx7GdxMaG8NZBBjDGZJJ33D0kUyYnAhMhrDA@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Apple DWI backlight driver
To: Nick Chan <towinchenmi@gmail.com>
Cc: Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lee Jones <lee@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Helge Deller <deller@gmx.de>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2025 at 11:04=E2=80=AFPM Nick Chan <towinchenmi@gmail.com> =
wrote:
>
> Apple SoCs come with a 2-wire interface named DWI. On some iPhones, iPads
> and iPod touches the backlight controller is connected via this interface=
.
> This series adds a backlight driver for backlight controllers connected
> this way.
>
> Changes since v5:
> - Remove default y from drivers/video/backlight/Kconfig
>
> v5: https://lore.kernel.org/asahi/20250203115156.28174-1-towinchenmi@gmai=
l.com/T
>
> Changes since v4:
> - Change type to BACKLIGHT_PLATFORM since the driver does not directly
> interface with the backlight controller. The actual backlight controller
> can be directly controlled via i2c and is not the same on all hardware
> that supports the dwi interface.
> - Rename file to apple_dwi_bl.c to better match config option.
> - Rename driver to apple-dwi-bl to better match config option
> - Indicate that the backlight scales linearly
>
> v4: https://lore.kernel.org/asahi/20241211113512.19009-1-towinchenmi@gmai=
l.com/T
>
> Changes since v3:
> - $ref to common.yaml in bindings
> - (and then additionalProperties is changed to unevaluatedProperties)
> - Use hex everywhere in bindings example
> - Use sizeof(*dwi_bl) instead of the type of the struct when doing
> devm_kzalloc()
> - Use devm_platform_get_and_ioremap_resource() in driver
> - Fix sorting in drivers/video/backlight/Makefile
> - In drivers/video/backlight/Kconfig, move config to right after
> BACKLIGHT_APPLE
> - Explain this driver being completely different from apple_bl
>
> v3: https://lore.kernel.org/asahi/20241209075908.140014-1-towinchenmi@gma=
il.com/T
>
> Changes since v2:
> - Add missing includes in driver
> - Fix file path in MAINTAINERS
>
> v2: https://lore.kernel.org/asahi/20241207130433.30351-1-towinchenmi@gmai=
l.com/T
>
> Changes since v1:
> - Fixed dt-bindings $id.
> - Make power-domains an optional property in dt-bindings.
> - Added missing error checking after devm_ioremap_resource() in
> dwi_bl_probe().
>
> v1: https://lore.kernel.org/asahi/20241206172735.4310-1-towinchenmi@gmail=
.com/T
>
> Nick Chan
>
> ---
> Nick Chan (3):
>   dt-bindings: leds: backlight: apple,dwi-bl: Add Apple DWI backlight
>   backlight: apple_dwi_bl: Add Apple DWI backlight driver
>   MAINTAINERS: Add entries for Apple DWI backlight controller
>
>  .../bindings/leds/backlight/apple,dwi-bl.yaml |  57 ++++++++
>  MAINTAINERS                                   |   2 +
>  drivers/video/backlight/Kconfig               |  11 ++
>  drivers/video/backlight/Makefile              |   1 +
>  drivers/video/backlight/apple_dwi_bl.c        | 123 ++++++++++++++++++
>  5 files changed, 194 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/appl=
e,dwi-bl.yaml
>  create mode 100644 drivers/video/backlight/apple_dwi_bl.c
>
>
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> --
> 2.48.1
>
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

