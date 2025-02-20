Return-Path: <linux-leds+bounces-4033-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25936A3DF9D
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 17:00:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 138A33B14D9
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 15:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57361FECBA;
	Thu, 20 Feb 2025 15:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="trpXHrN/"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CC513BACC;
	Thu, 20 Feb 2025 15:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740067118; cv=none; b=X+oCr1GhCdK0HkuQCMIEBh8SI0Bf8B9woH+qIBvMZVPZ4qCvzkqwjHWyAR+KjKHj4NB4FXpUn01/D1QDeG8JpeoJ9m5a8JslbPOBeA1aTQGK5RypxwkhcuITwJzF4yAJSFz/cuy8mZSjH8YpDpvrRwLEp9TlTB2dUFdsFTf5tkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740067118; c=relaxed/simple;
	bh=14rJoV0ANKQdFBTR+duDJVpDee6Cz/q0o6NV+rmiOU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YsvtgEyBsqHgr8Qg+RMu11R7//IKMo3escMEnJrcpywXOUI70Q7cu9//cAMIQRI10YTKU+ibYD+pss1lBf3QGqUt4k42dQAFFlqKYuMcBdTQJv2td3S1+kI2ZMjz9rj3wBZxm4gc7eUbiMkvMG1BXyShRtLPtMsXsdAM90MrYWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=trpXHrN/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B24C4CED1;
	Thu, 20 Feb 2025 15:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740067118;
	bh=14rJoV0ANKQdFBTR+duDJVpDee6Cz/q0o6NV+rmiOU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=trpXHrN/WRxpPIJd+Ki2aEBFIqN+k8UcruG6iXcDDywo9WlieD1+Bw2YKnzMJt69I
	 O46Ae0Vk3LQQRmIT+kZdXWHpEYnkCdxcO5BEZSPjMB461rJk295ALffb9zLLPMC3FB
	 If1aYim7UPVG1wVS2+lnMxyKWltMvhcWDpvhaKqk7ZZFi8W7d87vPxDgUSmoCWk1su
	 p8WPtuH9y8IApUc7Jh0ylR5gC/GR/eRSYCki12I7sj35+7hHHsFhZS0o/MK8FMF8V5
	 LXptJhQPF3K+R2ALxVqGeA9n+xq5yCkpet1LxmAobfpIqllQi2dEjjSfZJEmDOUVRc
	 Pra3pEexReqTQ==
Date: Thu, 20 Feb 2025 15:58:34 +0000
From: Lee Jones <lee@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Pavel Machek <pavel@kernel.org>,
	Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: st1202: Fix an error handling path in
 st1202_probe()
Message-ID: <20250220155834.GA824852@google.com>
References: <4afa457713874729eb61eec533a4674a51d1d242.1739985599.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4afa457713874729eb61eec533a4674a51d1d242.1739985599.git.christophe.jaillet@wanadoo.fr>

On Wed, 19 Feb 2025, Christophe JAILLET wrote:

> devm_mutex_init() may return -ENOMEM.
> So this error should be handled in st1202_probe().

The start of a new sentence shouldn't warrant a line break.

> Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/leds/leds-st1202.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index b691c4886993..4fc17d518292 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
> @@ -356,7 +356,10 @@ static int st1202_probe(struct i2c_client *client)
>  	if (!chip)
>  		return -ENOMEM;
>  
> -	devm_mutex_init(&client->dev, &chip->lock);
> +	ret = devm_mutex_init(&client->dev, &chip->lock);
> +	if (ret < 0)

My assumption is that anything but 0 would be bad, thus:

	if (ret)

> +		return ret;
> +
>  	chip->client = client;
>  
>  	ret = st1202_dt_init(chip);
> -- 
> 2.48.1
> 

-- 
Lee Jones [李琼斯]

