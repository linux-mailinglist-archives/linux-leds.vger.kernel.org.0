Return-Path: <linux-leds+bounces-4935-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF74AED786
	for <lists+linux-leds@lfdr.de>; Mon, 30 Jun 2025 10:39:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75D533B83A6
	for <lists+linux-leds@lfdr.de>; Mon, 30 Jun 2025 08:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7F23244186;
	Mon, 30 Jun 2025 08:38:56 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B197C24418E;
	Mon, 30 Jun 2025 08:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751272736; cv=none; b=h/oxAygwjPDaKU/g/tRpVBbTkkiyrY4frFqPRR0qA87T53yv/IpN3uGCJgEv13Ax0pScGRrp5cw02Ctf7QfGFORE/7S/hYHC+dwlrc1saUJ3fkwDewrltchdbtnzzcFgIeu1ynqYbtei3mGnEF5qYCNP1QwGEOylpXh9ZI8azWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751272736; c=relaxed/simple;
	bh=+4yjQWAsZkfU8NsCh7RM+iBUGBH14NL/rn43HsII/dM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fQX6TT3ZG4GSeIYOybB3Vn+DEYrpX7X51tQoWAlAfKTgOxktips8+eO3ZGlOJXxG1vdhccHfd3N8ZQhAWd8PMbV+KB+4Ytso3bVpMoceEB1rl8l/Hgchr7IyE8hIencw/wPU6ciTaHLD8keQKlWd6WiPvK5y4hy5dE9pDr8jZFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-87f13aba2ccso442812241.3;
        Mon, 30 Jun 2025 01:38:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751272733; x=1751877533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HyReJn5zseFX3ZIz/ns2toxwkOANwmqgOiT1aGJ1WH0=;
        b=sTzx9er62KZMNRfKuqL93f35g0vb0xFGM7aA9ae4BQbQg5Q6+rwusTcznFpcdVkju9
         a5CkYYdAfAWgpziDw8mlT0CQPK0AdJSDPmvZUDizcnkCf5D7c1NsoSv3EzVivPtbmp+H
         cBS2bTnzuFpd6B6J8zCyEwC9VCeqWfetErzumJszOK+KmreQEacJYQ0ugFlmsyIHJ4/L
         azOOQtOvTUe/HjQQD9+t6kdIBa9XvlilFAf/TbBJPBCaphRzc5o4N0ukwRWRE81lS9RT
         Kbm+wtB4EO2tDww+b2SPXx6yzkVhDTe9oVM8FEp2ELlCeAZHqKVxTpP36m2v4JjONEYo
         CeKw==
X-Forwarded-Encrypted: i=1; AJvYcCUZQhneiEfM6mnRumeSnRFWJj0ozDfHZaRVxDL2lXaYHQKXZ6W25fjjejAP9WbnbDMUu148tacfjBRl@vger.kernel.org, AJvYcCVl27+o6Jhg4Nznv0fjZ5j2kdESfe/ky7lUIgfukNvu83TV4sU8zvxrQvGDudsXNZxg8HrvmwIpy/R7RQ==@vger.kernel.org, AJvYcCXl5s0IjjAWjRNKLW1mP13BSP97bh9s+BxFwaAZCkadIoufuaC9sIqTU+MkWtSf+XWo2ldMoZJzYWe2N0u1@vger.kernel.org
X-Gm-Message-State: AOJu0Yza/quryKxfbMOV+vZnWg2CZ8fG5wt7gi618CEVs9Jh/5XEtFPO
	Xvd1bErMuPPE712wtyEYS27Z7vQP22AGXh/4XUbOaaSmTCCvzgil3p7taT5Zal4/
X-Gm-Gg: ASbGnctVertFYXwfW8vBdZdq28vJDuR+Cns0obrN496/f5JqxphhhkP/Y83Gv8VUWsT
	Q9BLV/JFQwQnj0i072p4IPZLsB1b3Q+azEHLpWoxUq6vZhOFO/MCawkWlDbR4S6rfN2Mto/i6Q4
	4QCa+f8oZrSegYYApyTgFq2amIyV/keC98ZJocTyRjrNq6oAnxsOloCpsSyjhc3zNJ+BHvPFSx9
	9k9umkdaeTQb68njCdwS9cD9xMWwk7jfQNGmjbilgbLee+1b5CvB/5n+sqzvNTgmUh8rKity3D0
	tJnN0nSLXwD6xSCg2g77o1z7IyCWUea7LE/pZ/YL4hUbIBq7qr21skRG36RdcDgibQ2wc4DFxAr
	2OYty3YuSKkFbW0g/3xLlbcbfqlZ1tnd9eitv0Dc=
X-Google-Smtp-Source: AGHT+IHebGfBWUO28zQZivFnlHzXC8tyy8rrbZiBc9Yu7JBp2vheur66LWIJedPc57truLBaQ3Fbkw==
X-Received: by 2002:a05:6102:3708:b0:4e6:a33d:9925 with SMTP id ada2fe7eead31-4ee4f480368mr7144099137.5.1751272732739;
        Mon, 30 Jun 2025 01:38:52 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ee4c7e774csm1178130137.8.2025.06.30.01.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 01:38:52 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5313ea766d8so1405296e0c.0;
        Mon, 30 Jun 2025 01:38:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUc8Z6ufWGVO2xXxZEYI+aXIkFiNQX0pPJ63r7rtSDfI7YhIzcT2Z4PFY5Ec6shBx4lpcvdCaEoFjsjYg==@vger.kernel.org, AJvYcCVSy1gjSMu546ZxGlXPwKP1tnJWcme0goK/pV9oWyTFLdnwzbDgDsKmw1gHmlDj0wN7LAsZWflcxHGJ2466@vger.kernel.org, AJvYcCWnVxOjEVcbEhQsgwUKahfek0o/+7JCizMn2xCE3kUUajJ5n+35XT5herT/WiNcuB54jjrMtEra3g67@vger.kernel.org
X-Received: by 2002:a05:6122:2526:b0:530:720b:abe9 with SMTP id
 71dfb90a1353d-5330bfbe262mr7226304e0c.7.1751272732090; Mon, 30 Jun 2025
 01:38:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629130002.49842-1-jefflessard3@gmail.com>
 <20250629130002.49842-7-jefflessard3@gmail.com> <CAMuHMdW+vGr-KyvPr84qr_k1sJV88SFn+oF_oi8_MKJkbyHXbg@mail.gmail.com>
 <760A6F11-6783-4B24-9A99-E043297CF039@gmail.com>
In-Reply-To: <760A6F11-6783-4B24-9A99-E043297CF039@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Jun 2025 10:38:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVgEbbOh9t+k5eBoGTD1OTLrC7btgb8O6yZ5f0_y5Q2rw@mail.gmail.com>
X-Gm-Features: Ac12FXyXU4uC2yPcHJkd5_O4blSGBeChGO91bmJOYDCnSyDkJYaozuzebbF_Dl0
Message-ID: <CAMuHMdVgEbbOh9t+k5eBoGTD1OTLrC7btgb8O6yZ5f0_y5Q2rw@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] dt-bindings: vendor-prefixes: Add Wuxi i-Core Electronics
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: =?UTF-8?Q?Jean=2DFran=C3=A7ois_Lessard?= <jefflessard3@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Boris Gjenero <boris.gjenero@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Paolo Sabatino <paolo.sabatino@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

On Mon, 30 Jun 2025 at 10:31, Christian Hewitt
<christianshewitt@gmail.com> wrote:
> > On 30 Jun 2025, at 12:19=E2=80=AFpm, Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
> > On Sun, 29 Jun 2025 at 15:00, Jean-Fran=C3=A7ois Lessard
> > <jefflessard3@gmail.com> wrote:
> >> Assign vendor prefix "icore", based on their domain name.
> >>
> >> Signed-off-by: Jean-Fran=C3=A7ois Lessard <jefflessard3@gmail.com>
> >
> > Thanks for your patch!
> >
> >> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> >> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> >> @@ -694,6 +694,8 @@ patternProperties:
> >>     description: International Business Machines (IBM)
> >>   "^ibm,.*":
> >>     description: International Business Machines (IBM)
> >> +  "^icore,.*":
> >> +    description: Wuxi i-Core Electronics Co., Ltd.
> >
> > This sounds a bit too generic to me.  What is the domain name?
>
> Their domain/website is http://www.i-core.cn/en/ and i-Core is used
> as the watermark in their datasheets [0]. We=E2=80=99ve thought to drop t=
he
> hyphen and use plain =E2=80=98icore=E2=80=99 to avoid future typos.

OK (i-core.com seems to be unused, and parked).

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

