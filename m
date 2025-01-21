Return-Path: <linux-leds+bounces-3834-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F01CA17D5F
	for <lists+linux-leds@lfdr.de>; Tue, 21 Jan 2025 12:57:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5BB13AB51C
	for <lists+linux-leds@lfdr.de>; Tue, 21 Jan 2025 11:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD08E1F1523;
	Tue, 21 Jan 2025 11:56:48 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E561F1516;
	Tue, 21 Jan 2025 11:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737460608; cv=none; b=OFeO5FAF7RDrJa16PS1r4FWw37jm9eVMNyJsFUNWtNwJP4iCMBlSXoehF5P9K/SQaz7K76VnFTqNWUGiTOTZWbGzq2hFhUfQTIWkH9mdWtrb7FBY43NB85qILbVakHUvD15qdAfk/Ipck764F4RcQcl3fCv3wQN045ITkDp8uog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737460608; c=relaxed/simple;
	bh=K0/AjDFGBBdMW11wkHaFw7h814RS+ZCwNh/M/FIL7xU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hqi3BDeNf49k0E+mWpQ28IH+aJn/J1lGQmJ7J/uAOxttmaQsaZLN9p9miHLVz3hnjuyl3K+agnBUO/NmXPSKAJtpX1xBDLdRaq1Mvj/Eo6Jii+gcMYlaIrckzVY0q3z8Dq64GNzYJ9yP4J1H4AZf2Mkau485e4+Zym1rJ7qQVp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-860f0e91121so3511121241.0;
        Tue, 21 Jan 2025 03:56:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737460605; x=1738065405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TqtHU/R3kSgV3SxrlRx5UmzaTSmbxvnJE3LFzs/ekRI=;
        b=Hkd30H7utjGSe540vu3BDm5TJbwjvuJ+jPX3gXVNyvienaGi4HjiRjH8OTcNEUUMYm
         Jts9nTxgI4QxUvO06z1VCN23fS9Zy7wrS4Jrb6s4vE0h3/+TT5yelsbafdL4QsTAxmB+
         tWP7IXg+fPE19oQwggSQI4oOMwnsO1UWdQM0pax/MGXlePNypAsc1vRV74JUSEbA2Vlt
         G4PaACOugUAUHQLRkKH9HO17sYK+0VIoJXi8MXe6gacbJ/4RwTV7uMPtKWQffC9J394p
         ICv6iyhXVtPAX7f/Ri9oyFAevCC6LGELN4ZmDIk19w9jioGaGlQd1k5jWJ5AgNd2MIjU
         Wd4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1XQh/kVnqdB2d38D71vUtdS3MgZ78BnrloyWf8XAECHPUgN1h7tHBQN/uTy2QpZut0UabEYnnhHjq@vger.kernel.org, AJvYcCUmfiivoxtGlDpJ92jGdZgReNzO5JqALs+fRR37nwiZ0x7PQQPWQ1hYrTHV62Q3tdzds0Rh2t1xNQWVTq31@vger.kernel.org, AJvYcCWFxkPEllPOrYbdzMVexKiRs18EJSeL3QudasYcpAyDJ6lZqHAjGr8LuplXWfSI6S0VX8dnAYdSAxOa@vger.kernel.org, AJvYcCXsW0m1kQEZho7A8e0HNmvGgwTeEG+xQZzCjGMGIcUwVjWTz0LplMBifWP4cKMqjenv4oD9hBI4z050hA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaUvjS37oSTgWmRVovz5cGQcjxTukyiZJsvCX/jSRZIJKF2ErF
	m3bq5FTxwCniuKuwH6kQsquaIVq3pwIAPFVm4PHT3tXKAqcahL+fgUKkFp7H
X-Gm-Gg: ASbGnctAmKD3EOL9GNW6aulMYsOG72XUYwmRRNCvZgMV2TzlluP+dnVEwDDfX7CpOHq
	BQHTyawEyUzDI1rbXRUZ1sp89K5zKOSLZpk0wBQwrEmRr/jLHJuDlu3k+g/wPmwr48HLM2imwtD
	acoLf76+I5ahFVztvb1psnkQvvMfi+8zRbJ9JZR3l/Ka5a4eKjQNV6cfTnc6/GX0UrU1b3H72Cw
	CmRSnZWWxGbHpgs/wA3fCP/98+FqbBtCIxzAhKeWs5CavU89bWVE6O2zOZHwyu7MYm87vFK/833
	fJrhE9JQFOMMQ3V973NkI7O55U/LXX4iOk4M
X-Google-Smtp-Source: AGHT+IGCXf/J3iOtXAmeT6F4XIyPxbsqx+SfQR/pYvUe9iuyc2N0P559UVUGE8BoCLeJqyPm772lxw==
X-Received: by 2002:a05:6122:4f96:b0:518:7bc4:fcc0 with SMTP id 71dfb90a1353d-51d763559admr12398492e0c.2.1737460604927;
        Tue, 21 Jan 2025 03:56:44 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51cf55775aasm1719455e0c.1.2025.01.21.03.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 03:56:44 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5174db4e34eso3810904e0c.0;
        Tue, 21 Jan 2025 03:56:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUpbn20QGozAvwnCFTdl8hmY3s7S/CC+CwPsNwuw1BYufNsYkAYuielkx+apiTUr9dNr+kmjge65gjw@vger.kernel.org, AJvYcCVC4sWeoYCxQsuqB4phPiMmWSLBONxF6DrUaAtWV/84rSCwP3PTlc5eCpF/XW5jF3BdkHYn//4eiQ1UFQ==@vger.kernel.org, AJvYcCVKDkcjd01U0jvAmaoqpmsyw4AgccLZJpXCOqkAhicK+MKYQ1X6Ruldy6J++UwR3VAmQlDaUNxD+VqafiUz@vger.kernel.org, AJvYcCWjc9FM089huu/QzohvUNwsgaS9T9f2EplqcTZHOMGnJre0eIoqwfFE1qBF148w99zPaQFbFYzvnJZt@vger.kernel.org
X-Received: by 2002:a05:6122:918:b0:516:dc0f:c925 with SMTP id
 71dfb90a1353d-51cd983a309mr19736115e0c.6.1737460604451; Tue, 21 Jan 2025
 03:56:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218183401.41687-1-vicentiu.galanopulo@remote-tech.co.uk>
 <20241218183401.41687-4-vicentiu.galanopulo@remote-tech.co.uk> <173641864745.2570436.6359371577917683428.b4-ty@kernel.org>
In-Reply-To: <173641864745.2570436.6359371577917683428.b4-ty@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Jan 2025 12:56:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXNOEXuEADeSGGHw88Tse+QjSkknKYGH-kk02jSpiuNiQ@mail.gmail.com>
X-Gm-Features: AbW1kvbP8VBj9TGhqL-IeQM6ZcZK-ooOHR3y80pnUD5QE8N4oMpIvwl3ey59IxQ
Message-ID: <CAMuHMdXNOEXuEADeSGGHw88Tse+QjSkknKYGH-kk02jSpiuNiQ@mail.gmail.com>
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

On Thu, Jan 9, 2025 at 11:31=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
> On Wed, 18 Dec 2024 18:33:59 +0000, Vicentiu Galanopulo wrote:
> > The output current can be adjusted separately for each channel by 8-bit
> > analog (current sink input) and 12-bit digital (PWM) dimming control. T=
he
> > LED1202 implements 12 low-side current generators with independent dimm=
ing
> > control.
> > Internal volatile memory allows the user to store up to 8 different pat=
terns,
> > each pattern is a particular output configuration in terms of PWM
> > duty-cycle (on 4096 steps). Analog dimming (on 256 steps) is per channe=
l but
> > common to all patterns. Each device tree LED node will have a correspon=
ding
> > entry in /sys/class/leds with the label name. The brightness property
> > corresponds to the per channel analog dimming, while the patterns[1-8] =
to the
> > PWM dimming control.
> >
> > [...]
>
> Applied, thanks!
>
> [3/3] leds: Add LED1202 I2C driver
>       commit: 939757aafeb9c266dda37657ee5f7a73ffd35ae2

You also have commit 259230378c65ebb6 ("leds: Add LED1202 I2C driver")
in mfd/for-mfd-next, which dropped the change to drivers/leds/Makefile,
and changed the Link:-tag to point to the older version v10?

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

