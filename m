Return-Path: <linux-leds+bounces-5277-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB61CB30300
	for <lists+linux-leds@lfdr.de>; Thu, 21 Aug 2025 21:36:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3414DAE18D2
	for <lists+linux-leds@lfdr.de>; Thu, 21 Aug 2025 19:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D5092DECD2;
	Thu, 21 Aug 2025 19:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSn1vBnN"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519A7236A8B;
	Thu, 21 Aug 2025 19:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755804947; cv=none; b=nvi94/DX8dyuSXI0PzSyw0rhXgNu6sTzeRogsIszBAZgMF2Q1YKfc9pnKHSq5XPHovWUncyB8CVZ5J/jHBQFuEWGU99BobuR6WOHD8SskYChAVBoHYwYxRHvpIGCkUjvP2MMZMuH05+E6SJAfaOH/RpmGAEwp0X79Lr7z7tuTFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755804947; c=relaxed/simple;
	bh=uIgJM52VLHJ2vY/BEkOpL/7wBjUXV+GtYkx//vZoZ6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b9+UjFz4lfkFieRQWtHOaiufPHBFUNfOsmRwux4a2OvlvDesW8jrGkZzYki7I+D6zYMXkj2D6FU4dTxuzW+kugc5DpVCvtU31XMldwwIBj8d0tiM7m0femEYzDigSwsWwafTp3qiDktGwHBocy4OV0xzshFDAdCKftl1j1GiFas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSn1vBnN; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb7a7bad8so201732266b.3;
        Thu, 21 Aug 2025 12:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755804944; x=1756409744; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kuXygYFTsd4MTyujlGZXxaQQ3Fxottc44iUPk4Y23Oc=;
        b=YSn1vBnNDeFDpv9tl+JL4NbpW19asSM2Ixt5SvjrDCjQhdeMCjOs/MfI63NaU3zLmM
         B3F+0BofYGysysZXoXmGIFK5QXBHvZ2qoeVals7asyOBk61cGXXzQLcFSUD2mlC1FRLN
         4k+7XWVWWexalkb8vW66fb8JLAXmIG9Bwp2Zi/rm/AW5Jw5r0KcEVP+CMtrYLCbVaAmu
         VPMgOEfampG109UVNTWCcK3mBa4T6W4OA88v/4Z/D1zLaIlRLWLCgQUEAG17CV1OBDuK
         na1W5t6K1a8AJ6yndRiU4cv/r8wu1yXLY9N8ZHzH+i3j45LZz+kEgqy1kGTMGjGx6AIc
         aSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755804944; x=1756409744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kuXygYFTsd4MTyujlGZXxaQQ3Fxottc44iUPk4Y23Oc=;
        b=pjivOf/ilxMGvRoocApBMwlTN/FXZl4mewKQ0P2g+Ad53N9z7vfoWKRsThmBCQiqLO
         jkEPqdxNetoysNVRF0RGfwEkE1INaWd+y0xfknudrpXxKDaoYjyjzTA33n3nV4YwUtaB
         ZfUGsEcKlyaedkBPjBofTAS7NHEu/7H2/UwpZW18PVt/3tE/X38g9h73BEYVq3JpWBtE
         Pgb/PnswEBb9RFcWT5RdB8xl/BOTrl9PqdyWa4B74mR0KJ7F8wx1WkFJn6QqIhPq1G0y
         jgn2P+NXMOsH3VtnF6eddgZTz6iSDoPPMc6aB6jjt7EK22Ogukpqy7/emMMBpMa2EI75
         jdwA==
X-Forwarded-Encrypted: i=1; AJvYcCUrVEzjhtoqvHMKyDkrspz/Rxp5lVCjoDbwdrWYxH+urjezcYBP4J3BtHO8FrLjkZLfLBhleLQ8L1VI@vger.kernel.org, AJvYcCXD1kepk5r8qrYMJA1vxCN/2RM1w41EAdqCDGPq4cmOpa4A9bgv99071YzWNxCZm/y6675VPEvKYw49og==@vger.kernel.org, AJvYcCXj3s7JcxYpmWdSflqXa6LJlMLYhml1dnjFoRDK0adlvOn5O2EBNXd0bNMrfn1S2YjLuBZo2bTMkXzLgNFZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwhyTOhK+FFlH6e/vqZe9+eEq8XKOIxCmVkmnrD5PrwcS8+q6Fk
	oSgEmRYXNJ4m+mobYFuMA9flJGi7adRKl9vYREq8rapvrQSAO/uxvI8ORdOeILUvvGXsbMPstRU
	8EljP4ew1+NdLT6Nw/rOIIDazxSw5qpb0V3x9vl8=
X-Gm-Gg: ASbGncu/cGWd2bf1FPn+8RPS5BP3gRIOyZqJ/3qLgNvyZDLn5Z/kSi5GCU274jzUNc1
	HVcI7j9FEM6A1+8DSHOzsKXMvTYHOZIKOqm+yZ4yEkGYvZGuWCrum7RiPKlaeKpShWWt8CMOkVr
	r1LPr4mBTsfeoghoRzDYtW8KFdXiiMX4d2zVzcd5LHh+K2ATSQqt7cTdZP/9/9EpTqDxtK2XyVo
	lxlPDI=
X-Google-Smtp-Source: AGHT+IHu2IA+ISQn/wrtJ4Zx0tWv8MUtNtgSXglYwS+zrMF8Ol3bdoRNyeqJkF5h/qU3Rcu29vIB++HLBqNjfY8R8YM=
X-Received: by 2002:a17:906:f583:b0:ae3:c767:da11 with SMTP id
 a640c23a62f3a-afe29447760mr23861366b.50.1755804943564; Thu, 21 Aug 2025
 12:35:43 -0700 (PDT)
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
In-Reply-To: <CAHp75VcDDCjt4vTpnSCprfAzK+czJiB_PRDXuLkvtuHZg4SLEw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 21 Aug 2025 22:35:07 +0300
X-Gm-Features: Ac12FXyVcYwLBAcZxc1fGxIwC2C4mMFayshntz4o2iBiHgCekZ7ZiBnHgzCj-y8
Message-ID: <CAHp75VfVYkmYFHdQgs1+3=jy50SuOaEXcT8Q8qXS34ctxRYKbg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] MAINTAINERS: Add entry for TM16xx driver
To: Conor Dooley <conor@kernel.org>
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

On Thu, Aug 21, 2025 at 10:33=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Aug 21, 2025 at 8:40=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> > On Wed, Aug 20, 2025 at 11:29:47PM +0300, Andy Shevchenko wrote:
> > > On Wed, Aug 20, 2025 at 10:52=E2=80=AFPM Conor Dooley <conor@kernel.o=
rg> wrote:
> > > > On Wed, Aug 20, 2025 at 10:08:06PM +0300, Andy Shevchenko wrote:
> > > > > On Wed, Aug 20, 2025 at 7:31=E2=80=AFPM Jean-Fran=C3=A7ois Lessar=
d
> > > > > <jefflessard3@gmail.com> wrote:
> > > > >
> > > > > Besides the missing commit message, the main part of this patch s=
hould
> > > > > be merged with the patch 2 where the YAML file is being added.
> > > > > Otherwise it will be a dangling file. I dunno if DT tooling has i=
ts
> > > > > own concept of a maintainer database, though.
> > > >
> > > > get_maintainer.pl will pull the maintainer out of the file, so it w=
on't be
> > > > truly dangling without a way to associate Jean-Fran=C3=A7ois with t=
his file, if
> > > > that;s what you mean.
> > >
> > > Let's assume patch 2 is applied and patch 4 is not, what will be the
> > > result of get_maintainer.pl for the YAML file?
> >
> > Andy Shevchenko <andy@kernel.org> (maintainer:AUXILIARY DISPLAY DRIVERS=
)
> > Geert Uytterhoeven <geert@linux-m68k.org> (reviewer:AUXILIARY DISPLAY D=
RIVERS)
> > Rob Herring <robh@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED D=
EVICE TREE BINDINGS)
> > Krzysztof Kozlowski <krzk+dt@kernel.org> (maintainer:OPEN FIRMWARE AND =
FLATTENED DEVICE TREE BINDINGS)
> > Conor Dooley <conor+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTE=
NED DEVICE TREE BINDINGS)
> > "Jean-Fran=C3=A7ois Lessard" <jefflessard3@gmail.com> (commit_signer:1/=
1=3D100%,authored:1/1=3D100%,added_lines:471/471=3D100%,in file)
> >                                                                        =
                                             ^^^^^^^
>
> Which is a git lookup heuristics. If you disable that, there is no
> maintainer for the file. Try with --m and --no-git (IIRC the option
> name).

Actually doesn't checkpatch complain in this case?

> > devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVIC=
E TREE BINDINGS)
> > linux-kernel@vger.kernel.org (open list)
> > AUXILIARY DISPLAY DRIVERS status: Odd Fixes


--=20
With Best Regards,
Andy Shevchenko

