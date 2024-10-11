Return-Path: <linux-leds+bounces-3070-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B51BB999E48
	for <lists+linux-leds@lfdr.de>; Fri, 11 Oct 2024 09:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EB1E1F24FD9
	for <lists+linux-leds@lfdr.de>; Fri, 11 Oct 2024 07:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E955E209F43;
	Fri, 11 Oct 2024 07:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/4qcOVZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B131CF7A0;
	Fri, 11 Oct 2024 07:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728632827; cv=none; b=GpXu3+F5oPY/YRLSoCu9I+KVY3j3/HLODuJIoVbEJaQUyBs4uYVDE5XZcHHlbruSI7+qFxhmybXdjRWLpcHouU2MeTdjE7XAklNKoL0Q+6qMDRvqTHFR1x9Lg4EDM1Z+Zc9kHB+Pr6dQqxWZS0uOk2gpngENJ96WOy4efgtz2is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728632827; c=relaxed/simple;
	bh=oAwiclH4R473iyZQa5x0BV8e2TNLGMme2GM+GzFIaRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aGB//QNNopt8LIC0uzCZk+Y2nykBiVmza1ANIGRwEj6UWTVt1QlClfPAdN0/4Xx8ijimkBX1syCI5UWf8pTbXUpToNJkM3hMOmnpBeguc/1oGadBKA/0fOBHbburWOfo9WsSMTD9NlzJ/1lO5fAKiJ1BcJCoSmbEREnAMphmEd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/4qcOVZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B610BC4CEC3;
	Fri, 11 Oct 2024 07:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728632827;
	bh=oAwiclH4R473iyZQa5x0BV8e2TNLGMme2GM+GzFIaRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q/4qcOVZn7ymB14RPWSPh6g2mNaRupkX5VHemC8y2LaZ7JtAbTN56bDZDND/94F6y
	 o3YReBMn7TQWdBTh8AgpzJJu41XVFlWK4N68XtkoG9t+2W039z1lGDVC7HMtu39hC7
	 kWTWey8GUZld5cI5QZFsssndCu018luVpnrfCJ7g3ChqLPx547hwN8CNydrKFFFd/G
	 3UONBDPGYTEnT2bpBM3tJqZFwdyTaapdtEt4l8JBY0v/iuai3E4xbiGJO2nqMVsLCl
	 Gmp3hJwGPhRyP+8LzIZjCRLGVsZ2AYbkn3HlKpMRYslltraGtBKJfbdW43bWnYQo6C
	 hRqSLroNFoBjg==
Date: Fri, 11 Oct 2024 08:47:02 +0100
From: Lee Jones <lee@kernel.org>
To: SurajSonawane2415 <surajsonawane0215@gmail.com>
Cc: pavel@ucw.cz, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] leds: Fix uninitialized variable 'ret' in
 mt6370_mc_pattern_clear
Message-ID: <20241011074702.GN661995@google.com>
References: <20241006131337.48442-1-surajsonawane0215@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241006131337.48442-1-surajsonawane0215@gmail.com>

On Sun, 06 Oct 2024, SurajSonawane2415 wrote:

> Fix the uninitialized symbol 'ret' in the function mt6370_mc_pattern_clear
> to resolve the following warning:
> drivers/leds/rgb/leds-mt6370-rgb.c:604 mt6370_mc_pattern_clear()
> error: uninitialized symbol 'ret'.
> Initialize 'ret' to 0 to prevent undefined behavior from uninitialized
> access.
> 
> Signed-off-by: SurajSonawane2415 <surajsonawane0215@gmail.com>

Real names only.  Please update your .gitconfig.

> ---
>  drivers/leds/rgb/leds-mt6370-rgb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/rgb/leds-mt6370-rgb.c b/drivers/leds/rgb/leds-mt6370-rgb.c
> index 10a0b5b45..87805c21e 100644
> --- a/drivers/leds/rgb/leds-mt6370-rgb.c
> +++ b/drivers/leds/rgb/leds-mt6370-rgb.c
> @@ -587,7 +587,7 @@ static inline int mt6370_mc_pattern_clear(struct led_classdev *lcdev)
>  	struct mt6370_led *led = container_of(mccdev, struct mt6370_led, mc);
>  	struct mt6370_priv *priv = led->priv;
>  	struct mc_subled *subled;
> -	int i, ret;
> +	int i, ret = 0;
>  
>  	mutex_lock(&led->priv->lock);
>  
> -- 
> 2.34.1
> 

-- 
Lee Jones [李琼斯]

