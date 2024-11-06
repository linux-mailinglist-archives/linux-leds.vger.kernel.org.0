Return-Path: <linux-leds+bounces-3321-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9209BF8CD
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 23:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6D1B28432C
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 22:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44FFB1D6DB7;
	Wed,  6 Nov 2024 22:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJsGY8/n"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F961D0E23;
	Wed,  6 Nov 2024 22:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730930620; cv=none; b=bbys8lGqjXDCLrKAqn3RxkfUEiKMJ7Tu31d/aBBNUIpEIebvhP6xc/6fSRyQh4jmXsmmEyxyqNIuTcMWcaUiI1QX1fEzJSLImUJ//BXoJHSPnDASMNXCT0TaVWmCelkb31IpKqKFkwI1/U+zRCBm+UIrMODcrGmtkxzfODzRx3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730930620; c=relaxed/simple;
	bh=YJWjwpYXHiV2SY6PkifU5htAknhaTr+41+oZ8yNDjec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N8R+hjtSxZ3fJSXXTVFjFOa1SD0Bu3YacxCybU5OcPzaUuEZJrYH+uosc9LCWMzuSrkB7gXWwvhE3K07b40t08kZaFtBmRCgYmj+plFm+hFx88zVXnTSiPvSvK54x5Pbyy5gzcZqN/lPNCydXMX1GWA1Ac1Uo9TgZF6QWFosf9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJsGY8/n; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso4149941fa.3;
        Wed, 06 Nov 2024 14:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730930616; x=1731535416; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qIj8QYqUkzDrkpjYMB5/jbWypSblXkiBacZ+ENgTse8=;
        b=bJsGY8/n3VleB9mlZF6zSaDj7+seQpLOB1ophK1eXg7hQXnzV/y9JOgTCn1ZOSwFDy
         T+LJCcLG2XTFl+dON8j85bRIW7vrJDmq0UXoKF1T9SI8wf+3a45qe7P46O4Y/wgc4Xgv
         sdMQxY8P2pvjIp54o8S0F+aLUQpx7bnehS97zFm+Uz4BSvV99DGCeXe5/r6ZJTuUZytt
         HSPilyaUS5XR624/TER+v8yaEn4V+CzBcFPmK4Os5pYLGMGgM/mN1ky57S0pTIRg1KMl
         NeaK+3+5/ix8+yYDDr6ZrqL7fMyQ2TQ0k3Q6ElCJJIPXsea8L+U3Z7vGzlo39lFkc0Aa
         XwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730930616; x=1731535416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qIj8QYqUkzDrkpjYMB5/jbWypSblXkiBacZ+ENgTse8=;
        b=KLdJJrhikfvLrZtB6aF0XO1YHjusfd7d9FfDBF2ERsxnFw0PGiEiGPgyvgIWhY67uq
         OCXivVSjSBt208gqEfGNWLbD45q9+ctkm6oWbdnVB/bXL6/jVOUw2czHEH6VRAO+WiNe
         gPwJt/ZyOosO95ILV3WqGzi4Myn8XmejtTbBThJVIDMUtJQV3OXmj7xCSbm4dwwcw8Em
         t2EPaQ2Jf3+lQ/FJzGgyEVEd8ClZH08TWr9CULf28OGjGCKxYIKj1SBM7kojgYvv7lOD
         ghIXI7+Ogc7AcDxdWiRg4e14DaEtvS7gInEuCS16iwxCtIT8Fo1A/SYiVKCkyZ3vMMDn
         VCww==
X-Forwarded-Encrypted: i=1; AJvYcCVxXv8vrThEVVF3AFDaGu2k5szjFEYzzVgZuEMVFDREC0vH/KE3wYTtyxiatZIjWt5d25A21KhASMDx83Q=@vger.kernel.org, AJvYcCXeZCBhDMeFXh9CbB+sdmf9Pv24Qqp5IadcRg7Ofsyz02wlP/eUt8JEm1dyqpx/QvW7FgYKxPbs7VRreg==@vger.kernel.org
X-Gm-Message-State: AOJu0YziAHI1o8mCP/h9aaQc/egXq2KDbH3ZiAsgsmCOGxL52OFsP9CK
	NcVgmASmqaGJMcCOa4KSzy//cw9IWenGZu4kKNdAicHdij+scr3MJl25E0BTRVY01w8280mUSrg
	3R/W/8TOT9q8ROVlcp/Mfx3hxTuQ=
X-Google-Smtp-Source: AGHT+IEO77gOQ5lnKmiwOtNspVF7cv9Ls5keQEslYlOuWg0QevYlxNqB8qZZzxFkVY4hpuh+azhtXwKZaLz1TB3Qp9M=
X-Received: by 2002:a2e:be0c:0:b0:2fa:d84a:bda5 with SMTP id
 38308e7fff4ca-2fedb794b84mr154563801fa.7.1730930616224; Wed, 06 Nov 2024
 14:03:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241106015441.995014-1-anishkmr@amazon.com> <ZyusEX3Pad8DTAk+@duo.ucw.cz>
In-Reply-To: <ZyusEX3Pad8DTAk+@duo.ucw.cz>
From: anish kumar <yesanishhere@gmail.com>
Date: Wed, 6 Nov 2024 14:03:24 -0800
Message-ID: <CABCoZhDAg1LfUZ1XCTFkR=TbHEUn=yOQRqrugzDK5Apge3JVPw@mail.gmail.com>
Subject: Re: [PATCH] leds: driver for O2 Micro LED IC
To: Pavel Machek <pavel@ucw.cz>
Cc: anishkmr@amazon.com, dmurphy@ti.com, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Karthik Poduval <kpoduval@lab126.com>, 
	Yue Hu <yhuamzn@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 9:49=E2=80=AFAM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > +++ b/Documentation/devicetree/bindings/leds/leds-ozl003.txt
> > @@ -0,0 +1,23 @@
> > +*O2 Micro Compact LED Strobe Light Controller
> > +
> > +Compact LED strobe light controller, can be controlled by I2C or via a
> > +PWM gpio controlled.
> > +
> > +Required properties:
> > +- compatible : "o2micro,ozl003"
>
> o2micro needs to be registered as a prefix somewhere.

Wondering if adding hereDocumentation/devicetree/bindings/vendor-prefixes.y=
aml
not sufficient? I added that in the same patch though, I guess
I will have to split the patch to add that first and then the
driver.

>
> Best regards,
>                                                                 Pavel
> --
> People of Russia, stop Putin before his war on Ukraine escalates.

