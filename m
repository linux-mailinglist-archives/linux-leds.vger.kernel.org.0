Return-Path: <linux-leds+bounces-3676-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D159F7740
	for <lists+linux-leds@lfdr.de>; Thu, 19 Dec 2024 09:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57B05167560
	for <lists+linux-leds@lfdr.de>; Thu, 19 Dec 2024 08:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CEAC21D001;
	Thu, 19 Dec 2024 08:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g7s9G9PJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69147218ADB;
	Thu, 19 Dec 2024 08:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734596926; cv=none; b=ZG3Hxvnqn+CNV/AT0ixeSTPeOkJgEVczDJ8cLMepCOVCC+ixFa5cbj+BhVcr40u24SKE0hEvRVd0d/bVzWpZza7pNrZX09zbUSR2Pf0gYG8Frjk2m0mWJClq6PrZmOxz+EvhfI3DI7U5+8w/d7b1AWFbvV13duKXpSvKIXbc2ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734596926; c=relaxed/simple;
	bh=R9C2PbNiq5kks7Yh+SobhVTB/LJjR1Nd17tI4b4h/GM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uP+QW7mIKsVvg0RMc9eNFAWRCHtaB5wX+CeLd/0sJkwNe9xbKXBceHcf7UdU0r/VIKHvV1zYZuWbHT+RPGUNGMCvbpC7cn2vsBhIGb5FPpFoiYfOt5KbyShGh5Jg4L20b7R7atiVQTBegbHhhDjzAU9HOntisFG4WXaU1xmrYlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g7s9G9PJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0FF2C4CED0;
	Thu, 19 Dec 2024 08:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734596925;
	bh=R9C2PbNiq5kks7Yh+SobhVTB/LJjR1Nd17tI4b4h/GM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g7s9G9PJudnsD3tByw0hk4MbOsFzMMTRKX9KImZ8auF5fHvOKMikougg9ni2OTHUu
	 WHnfB5o3wlSocGwZ8A4u7E1iHoNfn8CzyAn9t2FiwdLVxlBEwF4TNJ7lC5kN6komsZ
	 4LCwhtCSvRnwfDQM5MG0txM2nXAiyUV+ceUyBxp/LI+plklE91eGi5BEYxS6emO4/K
	 bVp557yQn8IlNWcmkFQJNmO7vstiIxLJhgMhUVxU25ndAkePcjULEeBs7zsGLfnQKH
	 9iEsABn4X3AT/jMPqitjfSkwbdHCAS7kNwiO6YMXsPER4c7vyX3p6Uwq5MIc5fx/Ah
	 jTt1ajl7sjaGQ==
Date: Thu, 19 Dec 2024 08:28:40 +0000
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v10 2/3] dt-bindings: leds: Add LED1202 LED Controller
Message-ID: <20241219082840.GN2418536@google.com>
References: <20241218182001.41476-1-vicentiu.galanopulo@remote-tech.co.uk>
 <20241218182001.41476-3-vicentiu.galanopulo@remote-tech.co.uk>
 <c93c89c2-7188-4b17-ab3f-a3d2f1972a21@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c93c89c2-7188-4b17-ab3f-a3d2f1972a21@linaro.org>

On Thu, 19 Dec 2024, Krzysztof Kozlowski wrote:

> On 18/12/2024 19:19, Vicentiu Galanopulo wrote:
> > The LED1202 is a 12-channel low quiescent current LED driver with:
> >   * Supply range from 2.6 V to 5 V
> >   * 20 mA current capability per channel
> >   * 1.8 V compatible I2C control interface
> >   * 8-bit analog dimming individual control
> >   * 12-bit local PWM resolution
> >   * 8 programmable patterns
> > 
> > If the led node is present in the controller then the channel is
> > set to active.
> > 
> > Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> Stop sending the same 5 times to people.

Without additional context, I don't think this is a reasonable request.

If you're a maintainer of an affected subsystem and the set is at v10,
you should expect to receive (and discard) the submission 10 times.

I certainly don't start stripping out maintainers once they've provided
their A-b or R-b, do you do that?

-- 
Lee Jones [李琼斯]

