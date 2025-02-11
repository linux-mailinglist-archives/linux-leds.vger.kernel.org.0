Return-Path: <linux-leds+bounces-3917-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBD8A30522
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2025 09:03:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5362E16141A
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2025 08:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3550F1EE006;
	Tue, 11 Feb 2025 08:02:56 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A64E1EBA14;
	Tue, 11 Feb 2025 08:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739260976; cv=none; b=I/1gCfc6cFyI1b5hKU3NtUAr8CyIi+BWngCNNC3iUmnPX+wp9VIwOXUAg73pXVD7xv1tbQ5NoSweTlv6cTOXZGlLkhTyD4f7ugn8paHmY1BWt4iNzLb0OVAZTwlqowJh1cuaR1Vg3TeIk9xdFtvETqQedwBhPxGkJ7Ua7rTpl6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739260976; c=relaxed/simple;
	bh=Kh9Ogk7+x0yP4Ukzvfr+odHFDe4F2iECj/j/BUEk5eU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pY6GYRD3CXJ6Pq5av06eoRylAnnoMNNxmtOkXCo2HjQDxBWA+zm2cxd4KgxwB6cuwp6svRWpxK9TNApV/x7nqMevc3tRbxp8s2+753nxxI//E/dcHy7lzKlyGFB5C2oXNF6OOlFF5Xr55I21+BYXbgg9sAB2rBvkBDt3ISEUvZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5de63846e56so5247125a12.1;
        Tue, 11 Feb 2025 00:02:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739260971; x=1739865771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kOS/9voZO7vapVv46CaqegmZFfcgz3O52bGNQXQxQY0=;
        b=GRFpQqe5V6HIxmOvzgbseJyIJShWE/ZLf8YD3w/OYFoh49MhjrAcrAbfoKLm0cDWaA
         lNcHLVFJiuopbl4X1i6IencjIvb6y90Ovi49Auz4+9ls6xN/qUwQSkwbMSo5owh8PLm6
         Jw8YobXoSWTp3B2yGwG31yKbmFXmxl9hsZJA8dA2gOAbOdALPAj3ftcmTBDgGGeUT29u
         tJelRUGBPY0KElwhsomw8UQTNkOIE2hF3tqOAXR95ZynrxVON7LkWWmb0394L9P9Vkws
         z2lASMvauCT8QA8EHp5HB58p2QaKh4sPKagN4ALKXJx3cZmqU+ysuwT81LpipgQDqIop
         RrIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8JpY9y4Sk2IraOXKlRSbNobTGTmYhtnFPe9WEjkzMYsVXJ/FTzkkOraei8IXBRmf5JpEdA5ym8/8T@vger.kernel.org, AJvYcCVo8pEDjbOop8xS37obh73bdw7uZoVJVaPPUL4ynCbW/iqtiIkpkt1grn18tBbmhvYT81qUim6wilBS@vger.kernel.org, AJvYcCWcd/oYy3DIQDVquYxhs+sUB/HZZZK7vxWXGoI2COwbueQNeaDJz/N9lkiwnT6vnvMrglyd1Uqpz0eaHA==@vger.kernel.org, AJvYcCX3KnmpyGCjGqbh/JCkfnJ7JW776K9DbKOrH2G0z9vvlaGH1XkySfIFYkS4GduQJy4IWDv87jr9TxQTZLYv@vger.kernel.org
X-Gm-Message-State: AOJu0YxD40NeCTph+F1U8RI73+RO1oIVjB+I5MsIPpimlF40GcFVYV6U
	co8bmHGJagNBVSJCwiKXyWRjNEyGUWpR7ij4onmqP1NSPNDkOMBwYCmSdvl45+U=
X-Gm-Gg: ASbGncsxmqB2zHz4J8nIo/0c/p1dfmqNO2NfHR+RetjQs937uahLpPRMb83rg17nYs/
	umMUQimSShEJsE1Dmndzp0HxtxTcWJV5vDhhS++sFXeLkfmAlQlZjVT7Hfm0Gq6EproSVaAc7m6
	EHFmv9fHGDwItmk480fiIHJ2vyebEH8vBN7/QKntMRyUZlQ2s4yIm994bj8rgGFbd8o07EawEyf
	JR/7R5zAn2OgKqOzLbxiC01bsb9VoeFhBHpPoqNfuH4r1/2DxGwAqgdho+RejOzFaiB8UUjPw7i
	/0Au6iUqiOSGN7bW3brvwVz4jqBfpZrS5gYO89Zj6lrummqB6GY3BQ==
X-Google-Smtp-Source: AGHT+IFRG5cIyHTv3cauXEI/Kd8qR+4CxBI786yt8N+Ncxe7HAhstmZ+lX6C8DOVTLDH5iKCHgdCtA==
X-Received: by 2002:aa7:dbd4:0:b0:5de:4add:d52f with SMTP id 4fb4d7f45d1cf-5de9a4c860fmr1898377a12.32.1739260970380;
        Tue, 11 Feb 2025 00:02:50 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de51587da6sm7206462a12.64.2025.02.11.00.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 00:02:49 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5de63846e56so5247040a12.1;
        Tue, 11 Feb 2025 00:02:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU/w0nkz9IrREk8CtPoj/2A7yBdu69Ohb2uPBdXRBve9OcHrdkCcPjOH8ROkKy8MJSXelob3P7WxxVE@vger.kernel.org, AJvYcCUShqoiq0iGwZXjTB0R3Ax0aQHIMxu80bnhK6m2ZEdDB6nBth/n6FxI4JqXbFqcAHjapZQyjpedwF9kJA==@vger.kernel.org, AJvYcCUhOXrq19R+OCgjFDcqqQ1k+QC9ipv6CMRWcgsvLwqfFQs1TmjIwojrjA6B7OWAEbeTe1AzcYGgwnws+PEJ@vger.kernel.org, AJvYcCVXAGJp3lDDs6hb5a5IIQ0VjHxF8g/NPivZ6C0SsSdv+rCp3y+4LrygaCgCq+yxNJ/twPFbkXLdVRJG@vger.kernel.org
X-Received: by 2002:a05:6402:3485:b0:5d0:ed71:3ce4 with SMTP id
 4fb4d7f45d1cf-5de9a394509mr2832636a12.6.1739260969034; Tue, 11 Feb 2025
 00:02:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218183401.41687-1-vicentiu.galanopulo@remote-tech.co.uk>
 <20241218183401.41687-4-vicentiu.galanopulo@remote-tech.co.uk>
 <173641864745.2570436.6359371577917683428.b4-ty@kernel.org>
 <CAMuHMdXNOEXuEADeSGGHw88Tse+QjSkknKYGH-kk02jSpiuNiQ@mail.gmail.com>
 <20250210165923.GC1868108@google.com> <20250210170136.GD1868108@google.com>
In-Reply-To: <20250210170136.GD1868108@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Feb 2025 09:02:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXtDd-KSeX_8nhj_J0X33WRT47_v3m01qdBN01-p4xVjA@mail.gmail.com>
X-Gm-Features: AWEUYZkd6jwi31R-cWUTztcZCNox7Hslq-Hkz90mfjEROmdjN3FG73ZPmUY9Y1I
Message-ID: <CAMuHMdXtDd-KSeX_8nhj_J0X33WRT47_v3m01qdBN01-p4xVjA@mail.gmail.com>
Subject: Re: (subset) [PATCH v11 3/3] leds: Add LED1202 I2C driver
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lee,

On Mon, 10 Feb 2025 at 18:01, Lee Jones <lee@kernel.org> wrote:
> On Mon, 10 Feb 2025, Lee Jones wrote:
> > On Tue, 21 Jan 2025, Geert Uytterhoeven wrote:
> >
> > > Hi Lee,
> > >
> > > On Thu, Jan 9, 2025 at 11:31=E2=80=AFAM Lee Jones <lee@kernel.org> wr=
ote:
> > > > On Wed, 18 Dec 2024 18:33:59 +0000, Vicentiu Galanopulo wrote:
> > > > > The output current can be adjusted separately for each channel by=
 8-bit
> > > > > analog (current sink input) and 12-bit digital (PWM) dimming cont=
rol. The
> > > > > LED1202 implements 12 low-side current generators with independen=
t dimming
> > > > > control.
> > > > > Internal volatile memory allows the user to store up to 8 differe=
nt patterns,
> > > > > each pattern is a particular output configuration in terms of PWM
> > > > > duty-cycle (on 4096 steps). Analog dimming (on 256 steps) is per =
channel but
> > > > > common to all patterns. Each device tree LED node will have a cor=
responding
> > > > > entry in /sys/class/leds with the label name. The brightness prop=
erty
> > > > > corresponds to the per channel analog dimming, while the patterns=
[1-8] to the
> > > > > PWM dimming control.
> > > > >
> > > > > [...]
> > > >
> > > > Applied, thanks!
> > > >
> > > > [3/3] leds: Add LED1202 I2C driver
> > > >       commit: 939757aafeb9c266dda37657ee5f7a73ffd35ae2
> > >
> > > You also have commit 259230378c65ebb6 ("leds: Add LED1202 I2C driver"=
)
> > > in mfd/for-mfd-next, which dropped the change to drivers/leds/Makefil=
e,
> > > and changed the Link:-tag to point to the older version v10?
> >
> > Interesting.  Not sure I noticed and if I did, I must have fixed it.
> >
> > This is the commit that made it in:
> >
> >   939757aafeb9 ("leds: Add LED1202 I2C driver")
>
> Scratch that - looks like:
>
>   259230378c65 ("leds: Add LED1202 I2C driver")
>
> ... also made it in.  However the Makefile line survived:
>
>   drivers/leds/Makefile:obj-$(CONFIG_LEDS_ST1202)         +=3D leds-st120=
2.o
>
> Did anything break or is all as expected?

The end result is fine.  History might confuse people (the (un)happy
few who care about history ;-), as "git log -p v6.14-rc1 --
drivers/leds/Makefile" shows 939757aafeb9, while "git log -p v6.14-rc1
-- drivers/leds/leds-st1202.c" shows 259230378c65, linking to the
older version.

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

