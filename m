Return-Path: <linux-leds+bounces-2378-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9402A944CF8
	for <lists+linux-leds@lfdr.de>; Thu,  1 Aug 2024 15:17:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C25A51C20C76
	for <lists+linux-leds@lfdr.de>; Thu,  1 Aug 2024 13:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A26719F475;
	Thu,  1 Aug 2024 13:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ao+jgg/v"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01747198A03;
	Thu,  1 Aug 2024 13:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722518116; cv=none; b=TqBGmnTHL0EsAbzEq1awA8xGxBCVm1pUd2KUouPXgtpcoe3+vhbmnA1rEvo2xE44LvGCH75+og8df/8RIDveTsEQ1wPG6cTonyN0v/gPx9ABa8hukK5XGsoEchCxVpJzWDf6SMzEAwu4AUFSaAXEhxVT1mPqnKr6/C9IkAGwpIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722518116; c=relaxed/simple;
	bh=E5FgTnZHCL2l+39RU3tM6nSD8InX3sTbyvIxsySytoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uRutslkeee6zjMPyVhrDP/7OpqvDsxPRLEtiU70yzzLtWpod/ilCY2cvcv1M5Q4bbLUlgtX1YsBM/j8Ryi06huHMKO1OCuA8lmcvb79eN4HIarlvdZmA+YtWAgVDaqII6txUZLrdNDYeu4nuBXPHbGFb0v9Bz4wvQt76mJkvaa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ao+jgg/v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCB56C4AF0A;
	Thu,  1 Aug 2024 13:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722518115;
	bh=E5FgTnZHCL2l+39RU3tM6nSD8InX3sTbyvIxsySytoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ao+jgg/vxyNUl4IAmcDXWifB9Tv/t4vuQlsgrgjf0vF1a3KZzwXYq8yOVH+59eQfP
	 6gdQWKiMEp6OKm922trFFmvhEioPdmA6+6Cxh+z9m/ZYfAi336GmbA+Rvb5QlvSA5a
	 /5obzCA2HL7xEYXAJPtOWVGZMYuWpUUSeIndefUkOr5RCgmIj+0+EukzUySqeSnp8b
	 VAjwIvfZ8x3gMjN1qeu5KdIu0QV63LuGr4dMeUKVJ1BLwjzl4r5RkhqBBfAlsvZyzv
	 mw45FkbxHw4LsdbmGbJk9i0ez0t7i/1KP2r5rz7FN3WGVHZyMWj3iNHV2uYrvYDdeH
	 X7uexRxD+1JWA==
Date: Thu, 1 Aug 2024 14:15:11 +0100
From: Lee Jones <lee@kernel.org>
To: Jack Chen <zenghuchen@google.com>
Cc: Pavel Machek <pavel@ucw.cz>, Mark Brown <broonie@kernel.org>,
	Vadim Pasternak <vadimp@nvidia.com>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: lm3601x: reset led controller during init
Message-ID: <20240801131511.GA1019230@google.com>
References: <20240729204054.2269031-1-zenghuchen@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240729204054.2269031-1-zenghuchen@google.com>

Nit: Subject line descriptions start with an uppercase char in LED.

> LED controller should be reset during initialization to avoid abnormal
> behaviors. For example, when power to SoC is recycled but power to LED
> controller is not, LED controller should not presume to be in original
> state.
> 
> Signed-off-by: Jack Chen <zenghuchen@google.com>
> ---
>  drivers/leds/flash/leds-lm3601x.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/leds/flash/leds-lm3601x.c b/drivers/leds/flash/leds-lm3601x.c
> index 7e93c447fec5..978256310540 100644
> --- a/drivers/leds/flash/leds-lm3601x.c
> +++ b/drivers/leds/flash/leds-lm3601x.c
> @@ -434,6 +434,10 @@ static int lm3601x_probe(struct i2c_client *client)
>  		return ret;
>  	}
>  
> +	ret = regmap_write(led->regmap, LM3601X_DEV_ID_REG, LM3601X_SW_RESET);

So this controller is reset via the ID register?

> +	if (ret)
> +		dev_warn(&client->dev, "led controller is failed to reset\n");

"LED controller failed to reset"

Or

"Failed to reset the LED controller"

>  	mutex_init(&led->lock);
>  
>  	return lm3601x_register_leds(led, fwnode);
> -- 
> 2.46.0.rc1.232.g9752f9e123-goog
> 
> 

-- 
Lee Jones [李琼斯]

