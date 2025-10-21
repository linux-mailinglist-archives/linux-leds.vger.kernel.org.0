Return-Path: <linux-leds+bounces-5845-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9F9BF7417
	for <lists+linux-leds@lfdr.de>; Tue, 21 Oct 2025 17:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 660C23A2CE1
	for <lists+linux-leds@lfdr.de>; Tue, 21 Oct 2025 15:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC757342C93;
	Tue, 21 Oct 2025 15:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AY5TKxio"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD1C340299;
	Tue, 21 Oct 2025 15:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761059206; cv=none; b=FVjmC/0I9Q0P2fQ3DWUYBm/1Kl+nohk+7KwwaTuMD9Vue3vnzi14L0vCzwOWQK3EfRZy9cdRC0Esg34ZzVZzSz2RrC7zInjE5MUaxnSFCEmXuWY3Mo7+JmT1VKZR5peYMpMqdeZvzu+T2UV0yfZfL/KmZ/ZuGr95C6E/cziLRyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761059206; c=relaxed/simple;
	bh=GbKOuiXZBtxsAWSv9rFIVwfWTojJtnRVB3sTM7YwbPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Go2XxtHEonsILUyBiZjASs78vk6m9oW3pyM7wo/H4rrplFgWERhAXPBTRkkPkDSoXfgqTJn4Wf82NMTCRXwD4brMVPbJakc4GYfylPBUwbl8oltaM+rcXTf9EeJz3ysupHBRHhzW37e9WtAksAopJGM6O8guMnzYXljAiYH6nhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AY5TKxio; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0937C4CEF5;
	Tue, 21 Oct 2025 15:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761059206;
	bh=GbKOuiXZBtxsAWSv9rFIVwfWTojJtnRVB3sTM7YwbPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AY5TKxioba5QvWwSvsvhkB1ZkjjKEaSKHHQ+Hj8ieaibQAssbMUiPcu8ylPDXYn4G
	 ANJoGSN3MXVXXP0yM7a6iPISzqEWtg+6JNcFXBCyO5Dse20NjJjNYnNvjWMyn3L+v1
	 LZ5HqPCRU8M/nNOREr+8P0kJnhp38e12+LcqmkVzXBQ+iIydCirk2cLT2GFVRa7PKk
	 X65d+MysAxMI8B3JYVvn4ZXYJUL+Nj+HjmsrtvsKBQ3CdrBDisjDEUx5mSVIuYyPHQ
	 +OOQWGqYs92xw6THmp5PlyOhWGBSsMkQLYsTxg0JFdzbojQkws0HW8yrl4s2G+pstm
	 OO95NhE5UT1ww==
Date: Tue, 21 Oct 2025 16:06:42 +0100
From: Lee Jones <lee@kernel.org>
To: Christian Hitz <christian@klarinett.li>
Cc: Pavel Machek <pavel@kernel.org>, Christian Hitz <christian.hitz@bbv.ch>,
	stable@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: leds-lp50xx: LP5009 supports 3 modules for a total
 of 9 LEDs
Message-ID: <20251021150642.GJ475031@google.com>
References: <20251008125031.1174886-1-christian@klarinett.li>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251008125031.1174886-1-christian@klarinett.li>

On Wed, 08 Oct 2025, Christian Hitz wrote:

> From: Christian Hitz <christian.hitz@bbv.ch>

You need forthcoming and insightful commit message.

> Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
> Cc: stable@vger.kernel.org

Fine, but place this above your SoB.

> ---
>  drivers/leds/leds-lp50xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> index 94f8ef6b482c..05229e2f2e7e 100644
> --- a/drivers/leds/leds-lp50xx.c
> +++ b/drivers/leds/leds-lp50xx.c
> @@ -54,7 +54,7 @@
>  /* There are 3 LED outputs per bank */
>  #define LP50XX_LEDS_PER_MODULE	3
>  
> -#define LP5009_MAX_LED_MODULES	2
> +#define LP5009_MAX_LED_MODULES	3
>  #define LP5012_MAX_LED_MODULES	4
>  #define LP5018_MAX_LED_MODULES	6
>  #define LP5024_MAX_LED_MODULES	8
> -- 
> 2.51.0
> 

-- 
Lee Jones [李琼斯]

