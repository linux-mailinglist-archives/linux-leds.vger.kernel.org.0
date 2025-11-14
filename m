Return-Path: <linux-leds+bounces-6138-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6229BC5CF50
	for <lists+linux-leds@lfdr.de>; Fri, 14 Nov 2025 12:56:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1005935A837
	for <lists+linux-leds@lfdr.de>; Fri, 14 Nov 2025 11:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234B3317700;
	Fri, 14 Nov 2025 11:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SLawjDEm"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD2F3168F3
	for <linux-leds@vger.kernel.org>; Fri, 14 Nov 2025 11:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763121339; cv=none; b=OselkzZI/0Yo+hLP4s11JeZMhsMFHuYy0FJGBumJwdTaEX5VXRRS/uvxOC0m5JP9dvzYRPgM4BZlEGBWQp8HmrLjPzuxpevJlcc/Vbm181rS52FtHSY73alGtoCJmqyMoOP7ccC7JGsDZtExKt96Gm2kN4FtxEPz4VcqSZK6jtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763121339; c=relaxed/simple;
	bh=kSsVcz8630KwHo4IO7LJsqMTZrFWGAD+oaRzx2FLL3w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VEhEntn+FY7ocWugltBUAHODqL0Nk4taZqKOdT0pbIRyJYM45LfIaGG6IUWSlcAEYBFb3jRwqWfOrqmFsER2zz6CI49Z+GisuswN4O3fNlSqrd3y1kW6xVrtVFyOeZc4YBYlsleabnhaA47aodOlspm92d8OAZK/3XTt9OUZAgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SLawjDEm; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47755de027eso14155095e9.0
        for <linux-leds@vger.kernel.org>; Fri, 14 Nov 2025 03:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763121335; x=1763726135; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kSsVcz8630KwHo4IO7LJsqMTZrFWGAD+oaRzx2FLL3w=;
        b=SLawjDEmIkye7FklV/K0NRjVRjISwZlLXhh7NLhMp5I8d6eIDNFW3ENbEsrnKlOEbK
         wP0JiezJ6FXzc0YP0NiJOoRTpo2jTNUHgpttC37nd6OidVHmg+Z64cRg9Honr90y+7fD
         vY4U5+gOET7UBDi2+6m0nE3IHVqTC+n8b2MjOoukKLSqOQdSZcbd7UFfL1zB8pbmmyxV
         nzCfQmH8JdYSC1KDcjNxE6slEewY9NdKw+gPg7Qt9glB4DcEfcCKGThdsdB/7uqtGY+c
         Icm6rA+EMa6fppbBYI178ND65UVjuOU36LmpQdA7TaLx/mqrvylgW2CLEK+1YSXtpTqF
         //2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763121335; x=1763726135;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kSsVcz8630KwHo4IO7LJsqMTZrFWGAD+oaRzx2FLL3w=;
        b=aSSuv9Y6Njrhqp8ZugVcwL0u2bT++SjbCDpaIoIwctUKdgfqvW4kaKVM8LPS5Mh4/g
         KFU5wo0HBCkhibZ6ts9059o/iWVz54QiNtryye/Zo7CLVb5zh5dNlg0ZnJcL6qFRRuVY
         woG1eIVNyimVGNEc/IeCRHDpA613gtcQFOrrnxJqDDJsm536PG6ns20bu3xIWtVi9A1B
         i/tWzZKDTl4l2IDHWqrVQEqq6EnWqtEqBjZ+T+5R2G9FKziTUfjIB/zqr3fsP6QhmJFU
         l5P1HG5ToAQEY+1eygIspP4LgY39ibOLV2lCtGF+8Olv+S/9TAqremHrLmQ0lX1FI3Jx
         yI6g==
X-Forwarded-Encrypted: i=1; AJvYcCWF9+/m+NFYogZ9XSofghxMAizCThp5AVQJsr+gdqVB3JxT9mc5hwl4kd2a2Vok1Ggkpu06ZwPJ2tO/@vger.kernel.org
X-Gm-Message-State: AOJu0YzBnnek267lKJS0SGTvPAfoAyCbOs3NeZIjJSlNPL1vE6llFQqK
	bxP4asusOJmg4gXwm8Rc5hD+ktCunU0hRuIBpSzE4VIKtRzvB8dyFiunkJSG/jsKZuc=
X-Gm-Gg: ASbGncs8apY2sv8Za2Jv5yK8ZbpepUI5trjUpcyu2yj7KhW/nppmdsZxZ8SZXQHHaUL
	EfZNW+um4SdUJFwnt2/hgdYTkGSWpGzs5EUQ2hfUMcIITMb9KFEd+Etf9tTRFrbsfLqnSgqjeKe
	6OnyOPTJ98ygPyOFEdN4qFZs5k/e10pKNRN3o2yUZWmfD5FBEh34VoQMGi65Hc88xE9eLquU6rW
	n1SjNSaTZxMjBkQEQ1QftLzUbnmiHGUY/b1aHmPGYC7w2zd6cJosUxVbnjzwrN90SmhzPGD5Wo/
	G05vDnlmwois8Cb2EjGH+Tv7m1BT7snrognunVSk+y4jeQPWbOX4PUc6VyGwaT8QfDk8Fl1KsSJ
	s9k6OG4UmIV5+XpE0F6JE9S4G4PNmvTiwWfai9CANY4XZv90rTKQIj0ZrbAjZRz8eUyxSKwuqY5
	MqG+2fCA==
X-Google-Smtp-Source: AGHT+IGaX63VyG7288bvhFhh9mADvgY7EJnU+zr1vNcvBNVERTkgMmla9vn+invb7igtQmyDtjSXdw==
X-Received: by 2002:a05:600c:1c16:b0:476:4efc:8ed4 with SMTP id 5b1f17b1804b1-4778fe49c3bmr26839345e9.11.1763121335290;
        Fri, 14 Nov 2025 03:55:35 -0800 (PST)
Received: from draszik.lan ([212.129.74.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e85e6fsm9688761f8f.18.2025.11.14.03.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:55:34 -0800 (PST)
Message-ID: <6479a8d84052b326ffeb5609959aaf3a1aac9ff8.camel@linaro.org>
Subject: Re: [PATCH 06/13] mfd: sec-irq: add support for creating multiple
 IRQ chips
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Kaustabh Chakraborty
	 <kauschluss@disroot.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo
 Choi	 <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-leds@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, 	linux-rtc@vger.kernel.org,
 linux-doc@vger.kernel.org
Date: Fri, 14 Nov 2025 11:55:34 +0000
In-Reply-To: <20251114075004a444bff0@mail.local>
References: <20251114-s2mu005-pmic-v1-0-9e3184d3a0c9@disroot.org>
	 <20251114-s2mu005-pmic-v1-6-9e3184d3a0c9@disroot.org>
	 <20251114075004a444bff0@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-11-14 at 08:50 +0100, Alexandre Belloni wrote:
> On 14/11/2025 00:35:07+0530, Kaustabh Chakraborty wrote:
> > The current state of the driver only allows creating only one IRQ chip
> > per PMIC. On some PMICs, such as Samsung's S2MU005, there are multiple
> > interrupt blocks, for which the current implementation stands insuffici=
ent.
> >=20
> > Add support for creating multiple IRQ chips for a PMIC. Every IRQ chip =
is
> > given it's own index, which is used by sub-device drivers to request IR=
Qs.
> >=20
> > A macro is defined which states the maximum number of chips supported.
> > It's set to 1 as currently, no PMIC requires more than one IRQ chip. Th=
e
> > value must be changed accordingly on adding new PMICs requiring multipl=
e
> > IRQ chips.
> >=20
> > Moreover, adjust the s5m RTC driver to initialize IRQs with the
> > appropriate IRQ chip index.
> >=20
> > Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
>=20
> > ---
> > =C2=A0drivers/mfd/sec-irq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 163 +++++++++++++++++++++++----------------
> > =C2=A0drivers/rtc/rtc-s5m.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 15 +++-
> > =C2=A0include/linux/mfd/samsung/core.h |=C2=A0=C2=A0 5 +-
> > =C2=A0include/linux/mfd/samsung/irq.h=C2=A0 |=C2=A0 14 ++++
> > =C2=A04 files changed, 127 insertions(+), 70 deletions(-)

Your patch reminded me to finally send
https://lore.kernel.org/all/20251114-s5m-alarm-v1-0-c9b3bebae65f@linaro.org=
/

If applied first, you wouldn't need to touch rtc-s5m.c I believe.

Equally, I can rebase mine on top of yours - no strong feelings.

Cheers,
Andre'

