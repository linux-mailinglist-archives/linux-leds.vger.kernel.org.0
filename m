Return-Path: <linux-leds+bounces-2312-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6200293BEBF
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2024 11:09:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E42128229C
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2024 09:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87CE5196D81;
	Thu, 25 Jul 2024 09:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LexQ7sTY"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6F01741EF;
	Thu, 25 Jul 2024 09:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721898556; cv=none; b=mtmsXsXwtbk40fvqOxqslXwkodCPR6sMbcxVspu9aIYLLfnknu2J3QyOaU/+ecwCFMvReLAARFGW6w4NwYmWgKew40eFTCamedgTeezKPaR7Knn/vrSn7TyNXJ4kLlykW4FzqYkzVwqVAE7Ey+UCK3FtUkGDFoJPd0ADvB4eFb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721898556; c=relaxed/simple;
	bh=RSkHqpENBRPjHlDRJ0C37xA8oP+HPpa5DeM3X05jgyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UcPKHs41sv/frknVNAuxOEvTOqwZ8CkTnDwlxHPYpSRM6rgshdfZrGK2Q2H+Bv+p3orZ0qWSegynRZu5djpNYqkl7T+xv/dwM6gv5k0gccP1x0k3XJldMhePr9JNUppUtbXCtMs8EyH6K7ipB+FSLa6zgEJMJW4g+WtJ5N90JOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LexQ7sTY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D717C116B1;
	Thu, 25 Jul 2024 09:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721898556;
	bh=RSkHqpENBRPjHlDRJ0C37xA8oP+HPpa5DeM3X05jgyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LexQ7sTYHgwpPWEr9+bcD7LYWOr2a9fjYJgzRDRFeSPZQ0EcIf6ebWcycRcy2ggfc
	 IVT2TvBPx69ployfd+ZxfykGwcVoCEIilwWe2y8n4mpo+VJbIRLF181ppex4093Lua
	 OmIo31LxBCPjv9s7dwynQNcGtxacWnp65yusBFMuKEkou/s2gFPTpy/SabYumGQ+n8
	 J7lj/XidEsPp9uq86qHt1pBlf+RjYfXNe3oSNs46Z+Kzkg7pU9hORA+hoIb5aR8ogA
	 lnni09kK4Gf5BRS8aswDOOblAasuY3CF6A/7RVrv9wP1gjxzk+KSe4Uc1URevmtJ2L
	 vBNK5NWOiRx8w==
Date: Thu, 25 Jul 2024 10:09:11 +0100
From: Lee Jones <lee@kernel.org>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Riku Voipio <riku.voipio@iki.fi>, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Christopher Cordahi <christophercordahi@nanometrics.ca>
Subject: Re: [PATCH v3 0/4] leds: pca9532: Use hardware for blinking LEDs
Message-ID: <20240725090911.GD501857@google.com>
References: <20240711120129.100248-1-bastien.curutchet@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240711120129.100248-1-bastien.curutchet@bootlin.com>

On Thu, 11 Jul 2024, Bastien Curutchet wrote:

> Hi all,
> 
> This series aims to use hardware more often to blink LEDs.
> 
> The pca9532_set_blink() rejects asymmetric delays. So the core's software
> fallback is almost always used when we want to blink a LED. Removing
> this restriction revealed some conflicts between setting brightness and
> blinking as the same PWM (PWM0) configuration is used by all LEDs for
> both brightness and blinking.
> 
> Make use of the second available PWM (PWM1) to blink LEDs. This PWM1 was
> reserved for beepers so hardware blinking is explicitly disabled if at
> least one LED is used to drive a beeper to avoid conflicts.
> 
> Tested with PCA9532
> 
> Changes in v2:
>  * Add defines to get rid of magic numbers
>  * Replace every 'led' by 'LED'
>  * Use dev_err() when returning errors
>  * Remove unused struct pca9532_data from patch 2 to add it on patch 3
>    where it's actually used
> 
> Changes in v3 (in PATCH 2/4):
>  * Drop dev_err() messages for comments
>  * Replace a -EINVAL with a -EBUSY
> 
> [v1] : https://lore.kernel.org/all/20240527125940.155260-1-bastien.curutchet@bootlin.com/
> [v2] : https://lore.kernel.org/all/20240617143910.154546-1-bastien.curutchet@bootlin.com/
> 
> Bastien Curutchet (4):
>   leds: pca9532: Use defines to select PWM instance
>   leds: pca9532: Use PWM1 for hardware blinking
>   leds: pca9532: Explicitly disable hardware blink when PWM1 is
>     unavailable
>   leds: pca9532: Change default blinking frequency to 1Hz

This set was applied on the 20th June.

Please rebase and send follow-ups.

-- 
Lee Jones [李琼斯]

