Return-Path: <linux-leds+bounces-3899-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C25A2DD17
	for <lists+linux-leds@lfdr.de>; Sun,  9 Feb 2025 12:22:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD33B188589B
	for <lists+linux-leds@lfdr.de>; Sun,  9 Feb 2025 11:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1AE19DF60;
	Sun,  9 Feb 2025 11:22:49 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9E315CD52;
	Sun,  9 Feb 2025 11:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739100169; cv=none; b=oEIqix8vgM3/wgWva9LsBduA7BCym5X5BXFD3VrZ1gv1NJpNbinYT0zXlGR6Is9fAfa4PgvgLJAZiflKX5121mhkjDPn8v+smW+jws8hwTkigiR75u7X6Go8hBrqe2HwDSav3odGBOeHUilIW5y3w2n7IKDS9Za+kutGr4qNtfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739100169; c=relaxed/simple;
	bh=fSpAlkuvzafpBDecQQKDZzLy+MX6Hjz7TRvpdMGaUmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=csWELi4k7kAtjVDQOTPy8L0f0141O3GcFS3ffKT9ozTyKrhOUqWTUk5h1zLn04DQz5RwuKuhxx89yWMUKoPU5CGUIAuNVveUGpnBfmCafke7ikk3BLTw9+5QdpJk3MDE39DJ6B/saJfkudW80AZf04xKEXlXB4SCw060Q1dxye4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab7863f9be4so346404366b.0;
        Sun, 09 Feb 2025 03:22:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739100165; x=1739704965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=czsr8ut4E1IjeGJZsPHODj7dteAs5/QBRXMGMfAcAZA=;
        b=I2SXLqbOzyC5aMhr6I7rBYcKaNyxcubopTza3dXAq8Rsm+GHGjlIZ5lGI81mc7ygxQ
         AGUCIUeEoc1gOr5hRGKx3R2YTT0hnb3oj7J8vc4QwF6yWkZmHCgUuJRbxr+bt8OIGHhI
         VTWzWgsc9fuX4uI7ja6/A6HQk4ZN/gjhI6/7JiwGPttAzcTCG38ouo3tRPX6QH9mPsFY
         9BQXMOVLPVpLEtvN+0tlYo7/pW5e8bimTjNHxMAosfUF6Ix9zID0kp6uxPOEz8j+eDH6
         qE2BtK0PSwJqh+qKED15SlYJ34DVVvZiNVphrX60Q+WXQXihYLGtXzMS93/O7K0YuX8u
         MMpw==
X-Forwarded-Encrypted: i=1; AJvYcCVcrKont0uPw9Coet6QdtkvlXXeBRVfcWSEoLHYacRRpoC2G+IuS7bdcr0XmXTv0xeKsMxYTb8oXO9/cQ==@vger.kernel.org, AJvYcCVvXBrstJyLktRjZ27jQEHR9/kS3XuNPx1rYt4uNCHJPIiri8Wcz05a3zIngUbtZAJieRnGByyIV3jZ/bA=@vger.kernel.org, AJvYcCWf/5f8A5Ok5vdDxcttnjj3fuSYEISu1N60QXGKKSVrc+3nR8dvQT98gOPvpUvmCCRl/bBZb4iEiBl+@vger.kernel.org, AJvYcCXsspjJ5/5pPstiH7dnorAky/mmT8zhAYnr5EjU1s9cIzSX5qaKYIz7LBwrmxyrRt64H43wEpao8z9jJTp6@vger.kernel.org
X-Gm-Message-State: AOJu0YyKRp8s7KYq05bsieZtkfkMOLs8Nbkeg0muOaAs/1MtZHb7g51r
	WUXn3o+yOwi0iwFS+xSdX3k34L8Jg2Y4JzaTzoPsPKHIlGrrZS00pyXJ0CVA4cw=
X-Gm-Gg: ASbGncs+ElrwNITOaL/npWaV0lINiw73uGUrxFATJO7Z43yFQ9tTUZNmKCdsT/5skcj
	bLbkLyMDbzvvOCXSUKK7Q59G7FsU6/fOQv7aIJn6G6JkGpdo/34WIggWzfG2QX790SgpFdirdqU
	Krm38Qwtb3cBujpDcGzJuBbedLmLWfIY5MK6Nqvhbw4gwqOb80e1mcQ7a9OHDmA+zlxHju2UY9+
	lB2tOq6OMKLBPgeLSUmkwzdGCz2gEWVyYXeiPZKlzeaKqSZLmZXcnrEN0WkJFh3/Ex06LtkIxmx
	/DTcLE1dfcDK89MGB00AxLLdrsRBs8RHYQuBMPF6f/VsrQ==
X-Google-Smtp-Source: AGHT+IEdB9R3spqx2SEWAobW9gJu4+fmb8vmoxtEhl6cFp/SdUHzvuAKiRTyBIEas4/dGdeZr2DQSQ==
X-Received: by 2002:a17:907:c285:b0:ab6:32d2:16d4 with SMTP id a640c23a62f3a-ab789c35448mr1039216266b.56.1739100165260;
        Sun, 09 Feb 2025 03:22:45 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bf5b8e6asm17110166b.16.2025.02.09.03.22.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 03:22:44 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5dcea56d6e2so6297700a12.1;
        Sun, 09 Feb 2025 03:22:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+BLfvHk74Jrx3i9CQ98+QUiZqPwnFgA/Dnzd+q41L/CxIRWoF+9pvqD8H/2kyWmN5wdFBZjHmRg2b9oHb@vger.kernel.org, AJvYcCUluvYc+q7qkuRndVXSZhJftfRh6lsurrjda7VVTVeki7WoI38riilHoIUn6fqiBkCfT+aDsUaTzbJWjA==@vger.kernel.org, AJvYcCXS42RSVTeYbFdwFyiAxrRNtqKjKdUgF+S6r3YC9mqDiYBhLADKO3SW6Fr+JCdy7UZapRgLGGiOkf2iF70=@vger.kernel.org, AJvYcCXeFiIqhWXMAQf8dLvVIVQKEo7cDfbnCgyd0ik0+LaFckzC1xgcBDlVSBH5ewHVUyiQuBO20TQkcNmF@vger.kernel.org
X-Received: by 2002:a05:6402:5252:b0:5db:f423:19b9 with SMTP id
 4fb4d7f45d1cf-5de450236admr7763979a12.16.1739100164505; Sun, 09 Feb 2025
 03:22:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203115156.28174-1-towinchenmi@gmail.com>
In-Reply-To: <20250203115156.28174-1-towinchenmi@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 9 Feb 2025 06:22:08 -0500
X-Gmail-Original-Message-ID: <CAEg-Je8cB==_+fNi0hc-mPqkEd-w82tWay_2Wu76hV10LV4X2g@mail.gmail.com>
X-Gm-Features: AWEUYZks2Pe6z_gT4XPe5iRvZlGve_lJKCtY1woYJMW8gNu9Xz8tZDlJPRfovXQ
Message-ID: <CAEg-Je8cB==_+fNi0hc-mPqkEd-w82tWay_2Wu76hV10LV4X2g@mail.gmail.com>
Subject: Re: [PATCH v5 RESEND 0/3] Apple DWI backlight driver
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lee Jones <lee@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Helge Deller <deller@gmx.de>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 6:52=E2=80=AFAM Nick Chan <towinchenmi@gmail.com> wr=
ote:
>
> Apple SoCs come with a 2-wire interface named DWI. On some iPhones, iPads
> and iPod touches the backlight controller is connected via this interface=
.
> This series adds a backlight driver for backlight controllers connected
> this way.
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
>  drivers/video/backlight/Kconfig               |  12 ++
>  drivers/video/backlight/Makefile              |   1 +
>  drivers/video/backlight/apple_dwi_bl.c        | 123 ++++++++++++++++++
>  5 files changed, 195 insertions(+)
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

This series looks good to me.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

