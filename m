Return-Path: <linux-leds+bounces-3040-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E2399880E
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2024 15:43:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17C871F2675F
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2024 13:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 150A31CB322;
	Thu, 10 Oct 2024 13:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z0iYSE4D"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6471CB316;
	Thu, 10 Oct 2024 13:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728567711; cv=none; b=MKRfqiPbmaRVnkHPnXAzhgbgnwKVIEobnL/yzU65QXYhyCTEm3ihZAqzWQBeOSaA21AtK3DwcELupeb7clc3pGMz8SlHc/UHOZuV/h2CkF64+NRIsz5elQ2AFsXBP6kW9lNhEbsYUd+rkVMPlxEMEmgNWIm8QltVHNfbiozu4LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728567711; c=relaxed/simple;
	bh=d4iIeICISX+R1+rFCH31YhNl+4sOJNEn2lFtTqfAaZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rxsPL0POgvyOBay3I7FHxob1+cUCUE3Z9ztOgIH9yipC8V4Cs5SBiD8JmNsq0D5vdB2uxVssUXCL9xTFaeLk5jumdpph+i1p0Mtzqlda4sa8IVnay+Vaq/03vbgLny46oJ5umPcTqoQ4k0kqvvLryHoQ7hT2btD9hHGEy4/9Ujc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z0iYSE4D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3296C4CEC5;
	Thu, 10 Oct 2024 13:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728567710;
	bh=d4iIeICISX+R1+rFCH31YhNl+4sOJNEn2lFtTqfAaZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z0iYSE4D9ehO5fL2ZvD821V4SAYlaEAsO9k6ZwgMczDowDkiNSP2TW8uakf9o+eVg
	 HaF5oczSVQP4OmQuprYF9+n31XWcDZFnO8rQFqxEiePoO2hWPb2zMjyiDnPgqwz5zq
	 xdJv6ieJygGsJrhhuMxs//nbqRVZWW3De+niE66ZB7NuAclrT2OecsOwfyZ4lhD9Ex
	 jh5KrDkciPTl6WfBSJxiB574WqV1/ZL26AwaQiS4CDHuwmGq3obinntuY1gv8qC9Bb
	 IQuyMmVJ1Pu3MfLYaXaOpsU/cd7jTfFDmdRv7ZAgJCJW3G1No0wEMtFMcZj5HXfRpe
	 9JZLP00dVtYEw==
Date: Thu, 10 Oct 2024 14:41:44 +0100
From: Lee Jones <lee@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/4] leds: bcm63138: Add some register defines
Message-ID: <20241010134144.GG661995@google.com>
References: <20241004-bcm63138-leds-v3-0-ba99a8e464b9@linaro.org>
 <20241004-bcm63138-leds-v3-4-ba99a8e464b9@linaro.org>
 <81b382d9-c290-40b9-be3a-916970a5797f@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81b382d9-c290-40b9-be3a-916970a5797f@broadcom.com>

On Fri, 04 Oct 2024, Florian Fainelli wrote:

> On 10/4/24 00:59, Linus Walleij wrote:
> > The Power LUT (Look-up Table) register base was missing, also
> > add the bit define for sending serial LED data in reverse order,
> > and use the BIT() macro to define the bits in the control
> > register.
> > 
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> >   drivers/leds/blink/leds-bcm63138.c | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/leds/blink/leds-bcm63138.c b/drivers/leds/blink/leds-bcm63138.c
> > index 9fe1af156c80..190d9774164b 100644
> > --- a/drivers/leds/blink/leds-bcm63138.c
> > +++ b/drivers/leds/blink/leds-bcm63138.c
> > @@ -21,8 +21,9 @@
> >   #define BCM63138_LEDS_PER_REG				(32 / BCM63138_LED_BITS)	/* 8 */
> >   #define BCM63138_GLB_CTRL				0x00
> > -#define  BCM63138_GLB_CTRL_SERIAL_LED_DATA_PPOL		0x00000002
> > -#define  BCM63138_GLB_CTRL_SERIAL_LED_EN_POL		0x00000008
> > +#define  BCM63138_GLB_CTRL_SERIAL_LED_DATA_PPOL		BIT(1)
> 
> Want to add:
> 
> #define BCM63138_GLB_CTRL_SERIAL_LED_CLK_POL	BIT(2)
> 
> while at it?
> 
> > +#define  BCM63138_GLB_CTRL_SERIAL_LED_EN_POL		BIT(3)
> > +#define  BCM63138_GLB_CTRL_SERIAL_LED_MSB_FIRST		BIT(4)
> >   #define BCM63138_MASK					0x04
> >   #define BCM63138_HW_LED_EN				0x08
> >   #define BCM63138_SERIAL_LED_SHIFT_SEL			0x0c
> > @@ -35,6 +36,7 @@
> >   #define BCM63138_BRIGHT_CTRL3				0x28
> >   #define BCM63138_BRIGHT_CTRL4				0x2c
> >   #define BCM63138_POWER_LED_CFG				0x30
> > +#define BCM63138_POWER_LUT				0x34 /* -> b0 */
> 
> Maybe BCM63138_POWER_LUT_BASE0, because it is an array on some chips, like
> 63138 and at offset 0x74 we have BCM63138_POWER_LUT_BASE1.

This set is on hold until we have some response to this.

-- 
Lee Jones [李琼斯]

