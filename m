Return-Path: <linux-leds+bounces-5282-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D36B30699
	for <lists+linux-leds@lfdr.de>; Thu, 21 Aug 2025 22:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 381A87AEA25
	for <lists+linux-leds@lfdr.de>; Thu, 21 Aug 2025 20:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45D235334F;
	Thu, 21 Aug 2025 20:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="koPwVTjr"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF76B393DC8;
	Thu, 21 Aug 2025 20:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807840; cv=none; b=Q/DnzdoRWFoDvWj0GQEcS33yHG7pQOU/j985p8+w3mpSK90JOh0NglXZS4dIfxZvS7eK0HPPQxyXtJsIdRbLIoPr8+kwlv2ys0VVqkA/uoI3efh2ET4EYO54XeuNtGiAL7SmOsx/KjHxFwkjbY+xMGUALCTUZ1zUk+BYOMtmKeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807840; c=relaxed/simple;
	bh=Cizxs/P2irfDlryDsjxKycybTWORDLrQ1LUKqF1th7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OoYZ68qhwtR3FX8KO2+m7nFw+VF2nTow2yil3T3pVAMHFQI8NuS+DsZvgilQQGwegdUHBGE0xTjrGscjd8coPWDdzHYwthg6DRcwqjK/xff/BK+Dtu546pEPX+j42XYr94gB8PxcmEMWI0akZiz2sA8Q3RFXTiOA2b36nmaGxTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=koPwVTjr; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-afcb78d5dcbso214566666b.1;
        Thu, 21 Aug 2025 13:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755807837; x=1756412637; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXlwtKU45Pzzd2YVoa2TN0t0WP5vR33r5koKI6Tl+Ko=;
        b=koPwVTjrTf4PRWtGi1WjhLYKOcNWt3cgx8NmVxdo7e02WG91cHeLNIKzdXwyWfzUch
         rVyZ2aaSTnPqdQx3TfcCTVmWwLUPRxWuxuDyCq3tjQfghlsa4UdtRTKCAX6zDHEaV7iS
         FhkjukcoteeMFoNgyO1mlCHLw9EWaAlEcoXlRtgGVBrSUVLVxEwuIQcASS+bzJdaj4sT
         xTERZFsZsOFsnyi59g1DPlg6AzmRCkQWEvkKjItfNfbvCk9WsDYLQQoNGGEJ9jL9FFiq
         bDCUCyEDMKNZgmfHQFsII5u+8VQJtBTOmNo/3d7/6pcuAej7RuDfXU/u0R2VlOu/NMMd
         V4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755807837; x=1756412637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXlwtKU45Pzzd2YVoa2TN0t0WP5vR33r5koKI6Tl+Ko=;
        b=C1g1tb8b+f4K7BJNj6XB1KXVwdYMm7ZgWOSc0kZ7JFErrpe9EOqzo90mcdA51M/s1N
         IBtd5BDdiPm58Bsa42jkKMrKoeVJWzHQ7ziVVHxCTqPG2pkje1pX/IGynjkEhTI3dw+6
         MSTSpkkD3Zc7KfzLM89k0MUlsRg7Ge/z+5zCrYlWIBntL/7x375XFSLE4r+kAhwj/Zqt
         e/Tm6bLeTpLA/N/3TqO72KkmJtEGlZNDlFV0IfqV8RVKmk6nyH+XpEzB009PD9Nn0RX0
         dri0vHNRMitEF56TLkFnUvCp3K4JotbVprOLVPF7fpq75pJaTu+6ZnvKtM1O3ugbU3R+
         P8hg==
X-Forwarded-Encrypted: i=1; AJvYcCU4b0jnlazX9FMLg6EVTcG+Jl+7bednHQn+QU4jysHLPtQON+bY7uPw51eqv4yvVhiHvlKlcQFxq/9a@vger.kernel.org, AJvYcCVkaTquWiqRoo+qP/feJe9sM0pNfGxj1XNv58wnQbNF2w5frPdmCL0SAO7VtDQ5VY6JOTmS145RzkLCNA==@vger.kernel.org, AJvYcCXRSPpxijEJpdbfvF7+pKFXdCAgcsilWRTQDSyI0LFrl4nLbm2IBSzgU0fHuk37/uHtGBduj9rNj4u7DyC+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2rgxyxU9ztUBUPXT16GJNvULPbiMpDZ9hrbJpsPhmPry7qQMz
	evkkDa7eIWWVBIsbN0dB+SQacneqjvExJkvy5VnLt8MHoXHycqngSXe/ngAt3EHEU9pctWwPLnX
	J3slyDTmzkv6qE7jWVJBi/Do4941CKno=
X-Gm-Gg: ASbGncvfyPUHA9pDNj6vFCCGVYssOHxpYqE4+Y06kDLjz80M5DWJH3Y48LyDaIoXClB
	RMz9zWT8s9vvcIh3gmPMmhQR3wLTXOeWYSrXU7pxQJTxaly22MJFIuoIIba4f1WE/Um+WwehDg4
	9ZEeHVs9uSiUHfPRzhZe0wyUo1vXEtrSoxl+NJ2ldXfBnF4J2L7lrVP2Sh64Qs2tfo7oBwg+mM9
	PwT6iw=
X-Google-Smtp-Source: AGHT+IHIYxAlW0wdKVqXqWGmik0VHZ23YZswPVolpElJrmrIAwK3nTUptY7Cx0xWOz0onASSV4A6nfB3jFRInlgOceI=
X-Received: by 2002:a17:907:7ea9:b0:afe:11:2141 with SMTP id
 a640c23a62f3a-afe2953815amr41949266b.31.1755807837104; Thu, 21 Aug 2025
 13:23:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820163120.24997-1-jefflessard3@gmail.com>
 <20250820163120.24997-5-jefflessard3@gmail.com> <CAHp75VfyR0cjnC6C6Xy8x9nTREdAgbjo18RLYNRzoLc6KmXnTA@mail.gmail.com>
 <20250820-clock-easiness-850342f716f3@spud> <CAHp75Ve-bM5ax3=0JkmaU-Kx1ME3VW34=Eqp2bRBA6mO6nZHmg@mail.gmail.com>
 <20250821-diminish-landlord-653a876e3cec@spud> <CAHp75VcDDCjt4vTpnSCprfAzK+czJiB_PRDXuLkvtuHZg4SLEw@mail.gmail.com>
 <CAHp75VfVYkmYFHdQgs1+3=jy50SuOaEXcT8Q8qXS34ctxRYKbg@mail.gmail.com> <20250821-hardener-underpay-e30d1eb6de6b@spud>
In-Reply-To: <20250821-hardener-underpay-e30d1eb6de6b@spud>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 21 Aug 2025 23:23:20 +0300
X-Gm-Features: Ac12FXzdR4vC2rgeo4a0VtMuzqjNviRhr0QkcdAlTAL5QGGovFj_YGB-LNhc5q8
Message-ID: <CAHp75Vf4evsVh8gDAWWpUDfLL-E1FZ2nGE1KusWhn1jAhw=Jjg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] MAINTAINERS: Add entry for TM16xx driver
To: Conor Dooley <conor@kernel.org>, Joe Perches <joe@perches.com>
Cc: =?UTF-8?Q?Jean=2DFran=C3=A7ois_Lessard?= <jefflessard3@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Boris Gjenero <boris.gjenero@gmail.com>, Christian Hewitt <christianshewitt@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Paolo Sabatino <paolo.sabatino@gmail.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 11:11=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
> On Thu, Aug 21, 2025 at 10:35:07PM +0300, Andy Shevchenko wrote:
> > On Thu, Aug 21, 2025 at 10:33=E2=80=AFPM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Thu, Aug 21, 2025 at 8:40=E2=80=AFPM Conor Dooley <conor@kernel.or=
g> wrote:
> > > > On Wed, Aug 20, 2025 at 11:29:47PM +0300, Andy Shevchenko wrote:
> > > > > On Wed, Aug 20, 2025 at 10:52=E2=80=AFPM Conor Dooley <conor@kern=
el.org> wrote:
> > > > > > On Wed, Aug 20, 2025 at 10:08:06PM +0300, Andy Shevchenko wrote=
:
> > > > > > > On Wed, Aug 20, 2025 at 7:31=E2=80=AFPM Jean-Fran=C3=A7ois Le=
ssard
> > > > > > > <jefflessard3@gmail.com> wrote:
> > > > > > >
> > > > > > > Besides the missing commit message, the main part of this pat=
ch should
> > > > > > > be merged with the patch 2 where the YAML file is being added=
.
> > > > > > > Otherwise it will be a dangling file. I dunno if DT tooling h=
as its
> > > > > > > own concept of a maintainer database, though.
> > > > > >
> > > > > > get_maintainer.pl will pull the maintainer out of the file, so =
it won't be
> > > > > > truly dangling without a way to associate Jean-Fran=C3=A7ois wi=
th this file, if
> > > > > > that;s what you mean.
> > > > >
> > > > > Let's assume patch 2 is applied and patch 4 is not, what will be =
the
> > > > > result of get_maintainer.pl for the YAML file?
> > > >
> > > > Andy Shevchenko <andy@kernel.org> (maintainer:AUXILIARY DISPLAY DRI=
VERS)
> > > > Geert Uytterhoeven <geert@linux-m68k.org> (reviewer:AUXILIARY DISPL=
AY DRIVERS)
> > > > Rob Herring <robh@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTEN=
ED DEVICE TREE BINDINGS)
> > > > Krzysztof Kozlowski <krzk+dt@kernel.org> (maintainer:OPEN FIRMWARE =
AND FLATTENED DEVICE TREE BINDINGS)
> > > > Conor Dooley <conor+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FL=
ATTENED DEVICE TREE BINDINGS)
> > > > "Jean-Fran=C3=A7ois Lessard" <jefflessard3@gmail.com> (commit_signe=
r:1/1=3D100%,authored:1/1=3D100%,added_lines:471/471=3D100%,in file)
> > > >                                                                    =
                                                 ^^^^^^^
> > >
> > > Which is a git lookup heuristics. If you disable that, there is no
> > > maintainer for the file. Try with --m and --no-git (IIRC the option
> > > name).
>
> Also, I think linewrap might done some fuckery cos it was the
> "in file" I was pointing to, pretty sure that's not coming from git.
> I tried ./scripts/get_maintainer.pl --nogit --nogit-fallback -f Documenta=
tion/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
> (I think --nogit-fallback is the salient option, --nogit is a default
> actually) and I got:
> Andy Shevchenko <andy@kernel.org> (maintainer:AUXILIARY DISPLAY DRIVERS)
> Geert Uytterhoeven <geert@linux-m68k.org> (reviewer:AUXILIARY DISPLAY DRI=
VERS)
> Rob Herring <robh@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEV=
ICE TREE BINDINGS)
> Krzysztof Kozlowski <krzk+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FL=
ATTENED DEVICE TREE BINDINGS)
> Conor Dooley <conor+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENE=
D DEVICE TREE BINDINGS)
> "Jean-Fran=C3=A7ois Lessard" <jefflessard3@gmail.com> (in file)
>                                                   ^^^^^^^
> and the in file still appears.

Cool, thanks for providing this, TIL! Is this documented somewhere? I
mean how should I know that YAML files are not orphaned by default
(assuming they are correct and have a "maintainer" field inside)?

> devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE =
TREE BINDINGS)
> linux-kernel@vger.kernel.org (open list)
> AUXILIARY DISPLAY DRIVERS status: Odd Fixes
>
> > Actually doesn't checkpatch complain in this case?
>
> The usual warning about MAINTAINERS appears ye, the one that appears
> whenever a file is moved, created or deleted. I personally don't care
> about that, as long as the end result of a series deals with it since
> the file will produce the correct maintainer list in a bisection etc
> anyway. Of course, your subsystem your prerogative.

Shouldn't checkpatch also be fixed at least for that part as
get_maintainer does?

--=20
With Best Regards,
Andy Shevchenko

