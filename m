Return-Path: <linux-leds+bounces-4794-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B745AD72AF
	for <lists+linux-leds@lfdr.de>; Thu, 12 Jun 2025 15:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E25D716C79B
	for <lists+linux-leds@lfdr.de>; Thu, 12 Jun 2025 13:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0969246BB4;
	Thu, 12 Jun 2025 13:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CZ576ryH"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F75220F2A;
	Thu, 12 Jun 2025 13:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749736370; cv=none; b=Y5HV5P8GTDMcbK7fZIqNM20WIIGuppeTEliSJPTy/ezwZHwuurzeteq2ht/ZuUX0Qt5YP66Vp7WjKcRsuLpr0iTbSSBJva8jRZluGfU5omiKGvLl5Y/iPkWDxchW6P4eqs4WJsX6LeI+eiMjGPmTxiyNsWkpsK/SJ0WIkqQumM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749736370; c=relaxed/simple;
	bh=S5qtNAXCpRXuIJHkgSFJUeAvSjADu2RXd2r/n4jbK0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptcX9+kYx69FS/3ehRUjtVgWIG9Yi2tWU5j5FhGi4t0k/Wi12ERzITCxOBpUoCxyglXlUiTj3FU4oJ6E8s7nlxdzh6M9xxRjefm0ThiWKR8FBRwWyDltB5HiylL8tOJhKM64eBZAfAwujs3HO6Paz5W0+z4+cec0WlHIwQ+Nm7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CZ576ryH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 514C4C4CEEA;
	Thu, 12 Jun 2025 13:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749736370;
	bh=S5qtNAXCpRXuIJHkgSFJUeAvSjADu2RXd2r/n4jbK0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CZ576ryHXNGQ547s7LE6F+wUGVxvdrMiZ+qHyaJ5axp6VaK15awFGbW2LqrDI/jAT
	 X1vw2xIOYKUjulm/YmyAu8KXissvgc+PVhXyAj3BzG4dFEJJ5XR3WUCmy2w/tCRroI
	 tdHf5EsEn+taetHjsil3ReDw0BnpcHeRkoDH7UkyOfMZA7cOyuGAMdFQd6hdbsP8RZ
	 72MBluGC8Bn81kXlrd76pAKDUjLUNm03uJw+5nmaEbeT1jZiZS+UAWYrPOPEEeJJFQ
	 514ZX20538PFJheI2vRNTbvsXjj1BnSm8OQT+7i/i58bT6gAMd8SSdLuhxzZx0AY/u
	 IGm64rtC/Cofg==
Date: Thu, 12 Jun 2025 14:52:45 +0100
From: Lee Jones <lee@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Steffen Trumtrar <kernel@pengutronix.de>,
	Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] leds: lp5860: save count of multi_leds
Message-ID: <20250612135245.GE381401@google.com>
References: <20250514-v6-14-topic-ti-lp5860-v2-0-72ecc8fa4ad7@pengutronix.de>
 <20250514-v6-14-topic-ti-lp5860-v2-3-72ecc8fa4ad7@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250514-v6-14-topic-ti-lp5860-v2-3-72ecc8fa4ad7@pengutronix.de>

On Wed, 14 May 2025, Steffen Trumtrar wrote:

> Save the count of multi_leds child nodes for later use.
> As the leds are added to a flex array, the size needs to be saved at
> runtime.

Size of the LEDs?  Length in millimeters?

> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  drivers/leds/leds-lp5860-spi.c | 2 ++
>  drivers/leds/leds-lp5860.h     | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/leds/leds-lp5860-spi.c b/drivers/leds/leds-lp5860-spi.c
> index 751cc4184037c3c0e14d3493d0a43f0885786523..eee41ee8a8c226db6a68413998642624fabffe7c 100644
> --- a/drivers/leds/leds-lp5860-spi.c
> +++ b/drivers/leds/leds-lp5860-spi.c
> @@ -50,6 +50,8 @@ static int lp5860_probe(struct spi_device *spi)
>  	if (!lp5860)
>  		return -ENOMEM;
>  
> +	lp5860->leds_size = multi_leds;
> +
>  	spi_set_drvdata(spi, lp5860);
>  
>  	spi->mode = SPI_MODE_0;
> diff --git a/drivers/leds/leds-lp5860.h b/drivers/leds/leds-lp5860.h
> index b4255fb48372814c7fda86ada96f504c2036f534..3b8342a832bc75afdf2318fd4ee1ee9ce105cbe3 100644
> --- a/drivers/leds/leds-lp5860.h
> +++ b/drivers/leds/leds-lp5860.h
> @@ -305,6 +305,7 @@ struct lp5860_led {
>  struct lp5860 {
>  	struct device *dev;
>  	struct regmap *regmap;
> +	unsigned int leds_size;
>  
>  	DECLARE_FLEX_ARRAY(struct lp5860_led, leds);
>  };
> 
> -- 
> 2.47.1
> 
> 

-- 
Lee Jones [李琼斯]

