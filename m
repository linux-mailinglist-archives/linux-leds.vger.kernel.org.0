Return-Path: <linux-leds+bounces-3300-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 864729BE122
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 09:37:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B744282EAE
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 08:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0233D1D5CF4;
	Wed,  6 Nov 2024 08:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wh9phyY+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6271D5CDE;
	Wed,  6 Nov 2024 08:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730882174; cv=none; b=NXhhYg5/Hy+oADQVG1IyU/llyQlJ5poYidBF66WWqJO72PlKyamRBSe2aPZv9x66OKyFmskXbWRv+bnTh0bzp6jPqv8AF0xQWzsFrp6hZU3R1cjfx96XjUvgd9Gy0US1TpPI7KiMsSsaQnT4M3225ig7IccXEi5cIqpvlX4vb9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730882174; c=relaxed/simple;
	bh=DT7jPvg+uMjRT1KybOHBUs2PD5ZYj3jL+/mncJNPAGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=meJ97IFo92cj//hwZg2XWtkxWW4srwKQAb2lnFwO1zAcGMb14n6Mp4G23rQVR1EcbnOmHqBcDnnYqTYUspNYSWfJWcEJtIXckbv3k2+851MnPMG7BCcHt4X5MYmof2lCRjPrg5pLZ3403L7KQ+Zo8i84wADxsPQncOPvEIv+6DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wh9phyY+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9843BC4CED3;
	Wed,  6 Nov 2024 08:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730882174;
	bh=DT7jPvg+uMjRT1KybOHBUs2PD5ZYj3jL+/mncJNPAGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wh9phyY+K5Q5/i4ih41qu5K4d0eFndvOZvlMi7hOE5LUSXKmM2Q+kPs+ZOjzVmnmm
	 c/4u+MgbbLYUklY8Hi+JDiu/jJmk6sqgl1CJC0oG+V0mL9IyteUa9V/wDxvuq+HpSG
	 wv+xJ1U2aKzK+/cf7gEYu3u8xspqhJL2NK5r7tzd5LefgPXlQz9D2rAPoRwrE1CHlX
	 lkcspLzYGm56epG/EAvwUQpASy6Po6j4gG+2mUEc7tkbKwCruf5rehJVcmCne5Uzxr
	 9OWQ95sR0XOsQyn/dTWLHj0LyfktwLdmwCLXja0ZXFhvanhxPXCGfscH5rqP8fCon2
	 IqhO4TV/EKbcw==
Date: Wed, 6 Nov 2024 08:36:09 +0000
From: Lee Jones <lee@kernel.org>
To: linux-kernel@vger.kernel.org,
	Raymond Hackley <raymondhackley@protonmail.com>
Cc: pavel@ucw.cz, krzysztof.kozlowski@linaro.org, duje.mihanovic@skole.hr,
	daniel.thompson@linaro.org, linus.walleij@linaro.org,
	u.kleine-koenig@baylibre.com, linux-leds@vger.kernel.org
Subject: Re: (subset) [PATCH] leds: ktd2692: Set missing timing
Message-ID: <20241106083609.GG1807686@google.com>
References: <20241103083505.49648-1-raymondhackley@protonmail.com>
 <173088213948.3248329.10549504992077467020.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <173088213948.3248329.10549504992077467020.b4-ty@kernel.org>

On Wed, 06 Nov 2024, Lee Jones wrote:

> On Sun, 03 Nov 2024 08:35:16 +0000, Raymond Hackley wrote:
> > props.timing is not set after b5a8c50e5c18. Set it with ktd2692_timing.
> > 
> > 
> 
> Applied, thanks!
> 
> [1/1] leds: ktd2692: Set missing timing
>       commit: 95c65546f03f888481eda98b499947252e1f3b20

Please make sure you run checkpatch.pl in future.

-- 
Lee Jones [李琼斯]

