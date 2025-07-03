Return-Path: <linux-leds+bounces-4977-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0422FAF6C90
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 10:13:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A94D4A33DD
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 08:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504662C08DD;
	Thu,  3 Jul 2025 08:13:41 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED8928D831;
	Thu,  3 Jul 2025 08:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751530421; cv=none; b=mCC6L6lOnOx+Nxn3BK1LwOvCm09dPMdKCbx9tIWuI/xaTe4gC/yY4APYBvTzEXqCvOTSvGfBjWbjpLlKRPxyHLEQutj/aO31WECT07ADDkj98uJ8dR/WqryhwIBRyqUf9Dr/QSxCdvwlLgT4bOOohql4l/mFV/7GobTZTMwnilg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751530421; c=relaxed/simple;
	bh=K1T8vb+AjiMkMK0OBwAXZhpQTBL6kAj4yhM6KNlYMs8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ISPOZG7mrlRIjPmRQy+jtr+c/1sOFA7JYLkVaQPrBA+pNMC3ZPA2O4rUPp/sjrW+K4RCSCToy6EfR5+3k33A7LyVQGM6txUuTZkhg3wGdZYY1qNgZrBh72wlHolBpiYBH44r0ZBG2mgsvsGrLndkPQFFPSiAa7cwwRKSbeDxvow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4e8110ac0f5so2064585137.0;
        Thu, 03 Jul 2025 01:13:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751530418; x=1752135218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGhvyf8wT5HmuLOSsA0GtGDTrw0TlszsoZtMsCcHoeA=;
        b=srYnCHvNBKhJSfl64SUU1Qj+9SKMtaFTn9mdRqKN0aDF1JOI46ABKr4iKD+H4F1sdx
         1iQTc3BTd5YgFApdIFLUdaEw7l4uya5aMlZoRDcdtx3UL8fvP4njN/5UevTC5RwP848M
         INhrDTN6S/U1UDlowQaXlbwW3DWWjbLVvYmNqCN45g1tzYW19dcGoln+/f9BChVgJoAU
         qy1+97mpxxL6n0jM1eEdfDWDUvAuWpP0yu7Ee4iL0KPxVm3TRI6nimK45z+xa5DdGu8P
         xqWMXWrdfuWvChh86jgycOWtwVSS6HsQR41b5tvrqKZJKRfb43V1csWJh2vj6G7XKSip
         Rfww==
X-Forwarded-Encrypted: i=1; AJvYcCVcofvFQDIjV3e2A/toJ0k2bBS1Utl1z27PN4CFwRQbSbWdIYmeB6g8851/EMK5AWRseYSycmr0jkDxVg==@vger.kernel.org, AJvYcCWZiz0i8JWuSHrtsKyh9XDHBx8JpMVNlP1I6uVPIU2203FWw0qafE4xJezr/8me0Qu/V3oycDe05Ny9Qc8u@vger.kernel.org, AJvYcCXova0TZsLy0NHb8CS3zklGjqkTFUSXCKA9r6L4sR2Q6HaKceMXsYCoue3CV1uhA375qEqTYxyM7rXa@vger.kernel.org
X-Gm-Message-State: AOJu0YxBl83hrc0sczxZpn+EOAeASq51t0z1bS07dYI8QMOUGPN8zOKi
	2AXdsSwDCxR4NrrhvyslmQvtl7VgK8VicoxdIgd94NKk/FRi38yx9jVDSrtjysNu
X-Gm-Gg: ASbGnctaLcUqfFG+AfXes85NrttPqyYKh6xnvKNV62BGOkknr8iu6TednjNTzRd+mRo
	eaNfEqRUR+kmeV6tOf+YQCBiFDElVNdqOeHmB/3ej5gbmqOoInFZgtls4EJe8HHj2jOpwhjDxOR
	q/q+8gTuAvdU6BdRZRQRGVPhOz2D43/5zLfXzBS+7VGf7LEQIT/1BErPv/+Y5eX+wSWr8mIMAwJ
	wSF6cWBoaUWnwKVvdxjQr1IJ5HLKIhK1XqpedrZS8rmptMZToKsxT1DPC5CzetWKtKXgVh7ovAZ
	t3A6De9W1t2oUfv2r/1uEQeWfCbZC+QYmdG5cjH5YkdE1XWlqdKF8ZYfdr8t2Jrup2So6mOSgSj
	4QI1sZes5fndamRS0m+M+MlWzWHZNZnorGJg=
X-Google-Smtp-Source: AGHT+IG+w6NdoIRo+v0uxoA/BB5/mvW7bdBfi9HA9cy1H5e9Qa816qHiU5pzRBl8w0uNd/7HTyOWNQ==
X-Received: by 2002:a05:6102:689a:b0:4e7:e5b2:f651 with SMTP id ada2fe7eead31-4f175efeae2mr1674868137.0.1751530418123;
        Thu, 03 Jul 2025 01:13:38 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ee4cc0a4basm1993280137.28.2025.07.03.01.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 01:13:37 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-87ec9aee6dbso1672310241.0;
        Thu, 03 Jul 2025 01:13:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDtGgb/znrBhazW0iEP1BbV9lFYLvBHLURn65iRgZ/qbslut/a8YAmwUJVA0tuyjSXEGcaAwcVKtrNvbkc@vger.kernel.org, AJvYcCUav+iM/+uecNzIJeu3iXXjlK9vhjBH8idpX0dN1mMh3GeM1YZeJ8aOKZ7dvg7i9hV/u2n1bxucT5dD@vger.kernel.org, AJvYcCUtyxXKAvZePRqJ6/NUmux40Nl+oOyRfHFPCAF8hTke6WJwuLU1d+jUvuj9U0SwDqFRXqhfIruuiTkpsA==@vger.kernel.org
X-Received: by 2002:a05:6102:8024:b0:4eb:502c:569a with SMTP id
 ada2fe7eead31-4f1762483edmr1620003137.9.1751530417648; Thu, 03 Jul 2025
 01:13:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629130002.49842-1-jefflessard3@gmail.com>
 <20250629130002.49842-5-jefflessard3@gmail.com> <20250703-truthful-warm-bobcat-b03e55@krzk-bin>
In-Reply-To: <20250703-truthful-warm-bobcat-b03e55@krzk-bin>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Jul 2025 10:13:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUJ2RdBdCC6tHckKPo4a_0hhBO65Ks2vtQu_OKtXNQNVQ@mail.gmail.com>
X-Gm-Features: Ac12FXxJblwTVL0eKCxRbF4IXSVeVpDFQhudH161Hqfo6ILjyGpc8CaHcJ0YTvQ
Message-ID: <CAMuHMdUJ2RdBdCC6tHckKPo4a_0hhBO65Ks2vtQu_OKtXNQNVQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: vendor-prefixes: Add Princeton
 Technology Corp
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?UTF-8?Q?Jean=2DFran=C3=A7ois_Lessard?= <jefflessard3@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Boris Gjenero <boris.gjenero@gmail.com>, Christian Hewitt <christianshewitt@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Paolo Sabatino <paolo.sabatino@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Thu, 3 Jul 2025 at 09:32, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Sun, Jun 29, 2025 at 08:59:53AM -0400, Jean-Fran=C3=A7ois Lessard wrot=
e:
> > Assign vendor prefix "princeton", based on their domain name.
>
> princeton.com gives me consultants, although I expected known
> university, so same questions or problem in commit msg as in other
> cases.

US universities are under .edu ;-)

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

