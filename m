Return-Path: <linux-leds+bounces-4933-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B985BAED6F7
	for <lists+linux-leds@lfdr.de>; Mon, 30 Jun 2025 10:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEE01189413A
	for <lists+linux-leds@lfdr.de>; Mon, 30 Jun 2025 08:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07CB9241689;
	Mon, 30 Jun 2025 08:19:32 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D00C23B60F;
	Mon, 30 Jun 2025 08:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751271571; cv=none; b=PDcaEbQqAk+TJopArpiZ6A7GX2g/Dl3DfHuyeIUVCar7HVkE2MN/AzV/I5eOreTBKTVY+4YvOjANeu3/J8h0va1oQY+bmjVmKAlTZqIwxc+CsQdvygCbTLyjJJQSYHN+g9gEAuhgAACpumo89+asHjMC+BSZk4mxioQZc9P8svs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751271571; c=relaxed/simple;
	bh=8mu+9mrG8fbc52P8ap2hrOS1o7RTOgBxnNoPch182uA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WBqErLcPfE8T+xWO0vvyNZkJaSIq7D9dZeatglCo0OCG8TQmqdlM6qOEmHKVeAFLfukhgQr90jfms/ttVueV0yUMRgmY8oUqH3kdZrPVgnZI4hglK2+BMV6ItFn/p86VKIhqC+IR7YfBklAAGLLeGZ19vmqmLrVZkbMVzEJYP7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4e7feaae0e1so1293344137.2;
        Mon, 30 Jun 2025 01:19:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751271568; x=1751876368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5tNTj8lEyQNEJ3YJFdcWXx4WbQz6UeCUORHQkXmhv9g=;
        b=WVywyr4/WwIwqa1Sra+PvnH9JwC6vw9IC2paa2cX4hp+tEOoSJV73P67yjpGXg8Bqy
         Imj3sJvZ55vCd6b/WMDYPSbl4QNSD8pYBYN7I2OR6kQlIR81Z7jo1Frp2syhlRUkFfjj
         ypTjNBIvjJNTtZlmUl4jWqvUbnucdPC7KSGwlO2C9HzR24BhzGqSMPxbnl6oCyFVWsFj
         CAZ1VT5mOPt8/cwTXyE6S4M8PeHZ8tKGU9xIP8J0rsZqnonhqIf/7azSlF2GaUBd4fyx
         EjSZ3Y/pNM4Xzy0E6ybHm+MDTFxF7zPa2fchCdcTEpFR0i+Um3Jvx5urNWzC7hKqyjOa
         mW3g==
X-Forwarded-Encrypted: i=1; AJvYcCVkySwoRxUmOYOQc/yEnhyy2ydFG314zCUtbE2+LO7Tejji1Su8LyQ8fCyCXb+AfO3WmKDlBQo0fl8mVXju@vger.kernel.org, AJvYcCXFhbnPE22aeEJQP0wS2AWa6rELXaWZelfN87vIGjUtRce3+cR+L4RYktF4N6Fe8UwSImUigGS2OlFB@vger.kernel.org, AJvYcCXgOSkk2/7jfTFWNRAxztyTRbfrko/927VhBaq4xH+mfQC9yl/sAX3M/SHABhfJISn3+JyYO90sSZFlDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNuEgZM3hF7SAMds+oYVPP/lJyChzpQ8Xb5or8D1p0QzQtNvsI
	ntIMmzetrY6cGIMeayHBS0RLBXiwvQp/Vj6wCRfpoQMaDFJH1u2Tdy/HJNEwGtID
X-Gm-Gg: ASbGnctg5Ql3OS1YEXc9bU+Irwv5iD7uPY3mywV0WnuXJ52VQPs0siOOPZKES5S0axx
	ms+BQfnu3AN5rXbtPQxzyhtdbXV3Q/TkmXWbr/4kdlpTf1/gTzt2BJyz49XZi5AQTGxxW7lmzQo
	V/sfbBtaA1Obj9KgRaMHJG974cae1yr5qw7R67oh4XQxuLIFhez91yRKZNqerfoh/Xe+TvqOeH8
	Br+3rnRatDggVAKUIdpVlGhN2QJOqP9+oYjLqoWZ9P/57xSppJ3PCx1oJIY/VsurHwrMdkhNtDi
	YrNeTGIk7Ki1zeGMVDQO/+9bDeGV4hwkKQTT5REsRfkBVxtXvzPvw/0/xRDWk39pVPaxpiUpxAL
	oBnLORzUwII3Y6T4Om7T0H2k7
X-Google-Smtp-Source: AGHT+IFqhb4X36LfoLM5RkTjmqlQbM4GBWiMxXjosDsPzub9XZvLI5PIbWJkJvxA4pOrLR0wRpUiwA==
X-Received: by 2002:a05:6102:a51:b0:4e5:8eb6:e8dd with SMTP id ada2fe7eead31-4ee4f4f3528mr7580802137.5.1751271567969;
        Mon, 30 Jun 2025 01:19:27 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ee4cc0a4basm1092492137.28.2025.06.30.01.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 01:19:27 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4e9c6b44477so1417911137.3;
        Mon, 30 Jun 2025 01:19:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVFwBHg4kB9NOg2UO3tY4vAVugbG1q/wNwpnNt8Zf+B1Bw+q3B3G9vVph27FDNQUengmbsg3+LPoeVh@vger.kernel.org, AJvYcCVUnbkNyJzzuJWV+3abM5kMIiRxvX/l4mowelhhavhc7kYj88RvVp6bDrX8r+sgQV4jP4d/ADsGoVcLCCMF@vger.kernel.org, AJvYcCXahULS2L9ZYdwGtpIVY2HvugRK/gHyJf9y96XhlNMjmjlnbABvK+na+yPlUvG4TheX0yX3F1tUPSV6ZQ==@vger.kernel.org
X-Received: by 2002:a05:6102:6cf:b0:4ec:c4fa:c24a with SMTP id
 ada2fe7eead31-4ee4f7bc92fmr7134003137.15.1751271567340; Mon, 30 Jun 2025
 01:19:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629130002.49842-1-jefflessard3@gmail.com> <20250629130002.49842-7-jefflessard3@gmail.com>
In-Reply-To: <20250629130002.49842-7-jefflessard3@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Jun 2025 10:19:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW+vGr-KyvPr84qr_k1sJV88SFn+oF_oi8_MKJkbyHXbg@mail.gmail.com>
X-Gm-Features: Ac12FXw_JnBXYaY9lHD9VrOXp42EFa-H5J6LtalPcBD80klAl5hA03zEenRfCss
Message-ID: <CAMuHMdW+vGr-KyvPr84qr_k1sJV88SFn+oF_oi8_MKJkbyHXbg@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] dt-bindings: vendor-prefixes: Add Wuxi i-Core Electronics
To: =?UTF-8?Q?Jean=2DFran=C3=A7ois_Lessard?= <jefflessard3@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Boris Gjenero <boris.gjenero@gmail.com>, Christian Hewitt <christianshewitt@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Paolo Sabatino <paolo.sabatino@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jean-Fran=C3=A7ois,

On Sun, 29 Jun 2025 at 15:00, Jean-Fran=C3=A7ois Lessard
<jefflessard3@gmail.com> wrote:
> Assign vendor prefix "icore", based on their domain name.
>
> Signed-off-by: Jean-Fran=C3=A7ois Lessard <jefflessard3@gmail.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -694,6 +694,8 @@ patternProperties:
>      description: International Business Machines (IBM)
>    "^ibm,.*":
>      description: International Business Machines (IBM)
> +  "^icore,.*":
> +    description: Wuxi i-Core Electronics Co., Ltd.

This sounds a bit too generic to me.  What is the domain name?

>    "^icplus,.*":
>      description: IC Plus Corp.
>    "^idt,.*":
> --

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

