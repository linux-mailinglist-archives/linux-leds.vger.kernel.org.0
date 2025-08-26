Return-Path: <linux-leds+bounces-5321-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61120B37238
	for <lists+linux-leds@lfdr.de>; Tue, 26 Aug 2025 20:27:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F3731BA81E0
	for <lists+linux-leds@lfdr.de>; Tue, 26 Aug 2025 18:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C157369341;
	Tue, 26 Aug 2025 18:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmShNBCh"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC1C276025;
	Tue, 26 Aug 2025 18:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756232838; cv=none; b=R0+Yq1FlCSVeg/bVKF4hRdrngD7X7W1UHCW9/t8ylmxhyXEf8lQVgTF4SY0be0yjzv49wCnLHAoE7nIOirlyzfgepvMcC4QqXEN4UtWAzLGqkMilORtt63eu4ehXyVnc+Q0avvLGSQvqpZQF1iFqOjlMRtoiBSzZPGo4DOvqu3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756232838; c=relaxed/simple;
	bh=E789PJXmBgx1iMW6wqgstAHKJ0XRd4eGMlebjy5fP2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TW9ITxPEsPMm+j7urraaBwio1RWtXEm1fI75Jc2gtjn2BdIzWD45Dw8i2Q0SgiFTj2I3BY7/v6LHXmh03mfhN9dejDMwnI0UcOFiZUpnJshbZflhSi+TWG0glsDTtGYo+rCO3/3L4RlmAhGQSuMH/sUbpR3t6WivQN/cpX+uf5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DmShNBCh; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb7aea37cso787082166b.3;
        Tue, 26 Aug 2025 11:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756232834; x=1756837634; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E789PJXmBgx1iMW6wqgstAHKJ0XRd4eGMlebjy5fP2Q=;
        b=DmShNBChWoGXxcG2iegaQ6D5EzWNEvzmH4l4hkHIdke/4KuHrbVILXAP/HewEmVN6d
         4wJpkc5VJ2f5fEpDBai+KqTaul1G096oAqt1dY9F7U/pQqXNa8eOw+DP/esSMZqb79k7
         x5RnO/W4qbS/ZRlzE1i0QAu2xNB54ynKaKEXnKLVrXuHUYkJkDN74h/M++8+hdMazR0O
         qnV8SaQ3BxTayh8yVZ7H386CJ25lWodVwEjcNsgjCb0w6IN6oaCjukE4mKvVe+HRIDqj
         J1sq1GX2R0kAICCK+DKmwlQoxTEaQR5Dlpk9eNIeq8a67SNDh/T83qnr4uVWPHb0zLfG
         zdfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756232834; x=1756837634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E789PJXmBgx1iMW6wqgstAHKJ0XRd4eGMlebjy5fP2Q=;
        b=Mi+yQRV0+fpOvsP9Ugccu6lVPkPFUKBmXsENCHeqwpcnrAmmCmb+kTdY8FegVj0RBz
         8ZC4ZMKkYwP61s2tmR9SCTJGeHKUThhisJ/ZdKsu9F6qlVCl+yb8G0rhFd7cXRrjqmij
         M4hNI7qk457RKVh2nm9DlshoXPPRZ75lB5rx8xLRlbQ6Ih37B790iHQQFMHXWBkxj8NX
         BT4+y11Q5BsdoNGdiqwRpgGNvy2Ams8ioYceQ8Ed9Q+iz2MkhZ84zaREdp0iDdeo9iRJ
         d/Dc4DwxED8pu0PV058aW06nNTEeOCopqLwBEmhZiIfe/KQlHeVu2rynl3fGvxyWK83J
         zHUw==
X-Forwarded-Encrypted: i=1; AJvYcCUKgrBv+C9xrrQ6WR6x4x1TL0Wb16zXzksXYddFOpqKK9MU/Kn0pzYWF0JuSgiH9qONkkUQUWYg9nTrGQ==@vger.kernel.org, AJvYcCWpagcO3eqMJF94QKxncMMRK90D2JCbvXWBiEsf6Zok0eRBdW2pDll0Tl7Jm7EByfUdkyelLPVDZNs1@vger.kernel.org, AJvYcCXeguksOhyCOXX6tyVq2gjEiH4LMrNYp5su/LJJ/sef7g/bpMP5sl0zXfwxPSA1O71MIFk1xe0Vcb1icA14@vger.kernel.org
X-Gm-Message-State: AOJu0YwzQSYXe/vimWFCv42i5kE3YJl8/afM8hM8LOxUIufNpRxcfTrZ
	E2VWlno//WLRw/RkpcONSlVfbE1yRfgsI41Gj6k4pmjRCJ1N19hAgDD4hw4QzKTLw+MdGRZwkFY
	LxTZf2Lz4JvwFmzKjYMgLlJDXov2u/x8=
X-Gm-Gg: ASbGncu68tlaZBXX/DhBULcFd464X+a/tkyfW4ZqLco3ZrljYcAxr1bR/AEO9vQH2fz
	jLuIrJbrCzZeoN1A8WpfDbuQJ8BZHPJNZLPWWTZQ87MQf74KgorN0Nssuzj/YnwW4RCTY+Qz8/1
	XQRdDfC8GVQXpUijQTHlvwVWxMYMLgCyiu/hSzcHUuhDkrxrEpje95f8NfhtDM4rqhBgPTQ03Ew
	NVt2wE=
X-Google-Smtp-Source: AGHT+IHDvmUrJMHqEARruzlIdjBBChsbG3J4CXo9pSCpJkcLT89+DCf/fRwXFMMmxAKHdgn/+LIgFJFkwdhntgXlvL4=
X-Received: by 2002:a17:907:fd15:b0:af9:68d5:118d with SMTP id
 a640c23a62f3a-afe296ec584mr1580781266b.58.1756232833675; Tue, 26 Aug 2025
 11:27:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250825033237.60143-1-jefflessard3@gmail.com>
 <20250825033237.60143-6-jefflessard3@gmail.com> <aKx-w0QOOQPyy9pW@smile.fi.intel.com>
 <951E84EF-4ED7-4882-A5E2-6E3CD63E1E07@gmail.com> <aK3TIVbmFgv1ZiYs@smile.fi.intel.com>
 <A045103F-1F73-4AC7-9316-1AF906ECDC9E@gmail.com>
In-Reply-To: <A045103F-1F73-4AC7-9316-1AF906ECDC9E@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 26 Aug 2025 21:26:37 +0300
X-Gm-Features: Ac12FXwsXMmalff8QiCMJGwIjweoZtHiL4WOjJI9phDTGAQQsKxuBEV6b6ZtS8Y
Message-ID: <CAHp75Veb_tQ3QYybDqYvNDrfX36Ft_RM6LwwCie2qYdoZGZOQw@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] auxdisplay: TM16xx: Add support for I2C-based controllers
To: =?UTF-8?Q?Jean=2DFran=C3=A7ois_Lessard?= <jefflessard3@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2025 at 8:38=E2=80=AFPM Jean-Fran=C3=A7ois Lessard
<jefflessard3@gmail.com> wrote:
> Le 26 ao=C3=BBt 2025 11 h 30 min 41 s HAE, Andy Shevchenko <andriy.shevch=
enko@intel.com> a =C3=A9crit :
> >On Tue, Aug 26, 2025 at 12:01:57AM -0400, Jean-Fran=C3=A7ois Lessard wro=
te:
> >> Le 25 ao=C3=BBt 2025 11 h 18 min 27 s HAE, Andy Shevchenko <andriy.she=
vchenko@intel.com> a =C3=A9crit :
> >> >On Sun, Aug 24, 2025 at 11:32:31PM -0400, Jean-Fran=C3=A7ois Lessard =
wrote:

...

> >> >Can we use regmap for all parts of the driver? Why not?
> >>
> >> These controllers implement custom 2-wire/3-wire protocols that share
> >> sufficient commonalities with I2C/SPI to leverage those subsystems, bu=
t are not
> >> fully compliant with standard register-based access patterns.
> >>
> >> Specific regmap incompatibilities:
> >>
> >> I2C protocol:
> >> - Dynamic addressing: slave address embedded in command byte (data[0] =
>> 1)
> >
> >Isn't this called paging? Or actually we have also non-standard
> >(non-power-of-2) regmap implementations, perhaps one of them
> >(7 + 9) if exists is what you need?
> >
> >> - Custom message flags: requires I2C_M_NO_RD_ACK for reads
> >
> >Hmm... If we have more than one device like this, we might implement the
> >support in regmap. Or, perhaps, the custom regmap IO accessors can solve=
 this.
> >
> >> SPI protocol:
> >> - Inter-transfer timing: mandatory TM16XX_SPI_TWAIT_US delay between
> >> command/data
> >
> >One may implement custom regmap IO accessors.
> >
> >> - CS control: requires cs_change =3D 0 to maintain assertion across ph=
ases
> >>
> >> Regmap's I2C/SPI bus implementations use fixed addressing and standard=
 transfer
> >> patterns without support for these protocol-specific requirements. A c=
ustom
> >> regmap bus would internally call these same helper functions without p=
roviding
> >> practical benefit.
> >
> >regmap provides a few benefits on top of the raw implementations. First =
of all,
> >it takes care about synchronisation (and as a side effect enables
> >configurations of the multi-functional HW, if ever needed in this case).=
 It also
> >gives a debugfs implementation, and paging support (if it's what we need=
).
> >And many more...
> >
> >> The explicit transfer approach better reflects the actual hardware pro=
tocol
> >> requirements.
> >
> >That said, please, try to look into it closer.
> >
>
> I investigated your regmap suggestions thoroughly:
>
> Custom IO accessors:
> While technically possible, TM16xx protocols create significant implement=
ation
> challenges:
>
> - TM1650: Commands 0x48 (control) and 0x4F (key read) appear as I2C addre=
sses
> but represent completely different operations with different data structu=
res.
> Custom accessors would need complex command routing logic.

So, to me it sounds like mutli-functional I=C2=B2C device with two clients,
hence would be two drivers under the same umbrella.

> - TM1628: Requires coordinated command sequences (mode -> write command -=
>
> control command -> data transfers). A single regmap_write() call can't ex=
press
> this multi-step initialization.

I believe we have something like that done in a few cases in the
kernel, but I don't remember for sure.

> Paging/non-standard addressing:
> TM1650's 0x68-0x6E digit commands could theoretically map to regmap pages=
, but
> the 0x48/0x4F control/read commands break the model since they're fundame=
ntally
> different operations, not register variants.

Paging can be partial.

> You're correct that regmap provides valuable synchronization, debugfs, an=
d
> abstraction benefits. However, implementing custom accessors for TM16xx w=
ould
> essentially recreate the existing controller functions while forcing them=
 into
> register semantics they don't naturally fit.
>
> Custom regmap implementation is possible but would add significant comple=
xity
> to achieve register abstraction over inherently command-based protocols, =
while
> the current approach directly expresses the hardware's actual command str=
ucture.

Okay, if you still think regmap doesn't fit this case, please provide
a summary in the cover letter to describe all your discoveries and
thoughts.

--=20
With Best Regards,
Andy Shevchenko

