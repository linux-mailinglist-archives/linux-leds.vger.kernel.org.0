Return-Path: <linux-leds+bounces-120-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFF47F640B
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 17:38:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 197EFB20F23
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 16:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D7E25546;
	Thu, 23 Nov 2023 16:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WsbgZ+8f"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE683FB1E;
	Thu, 23 Nov 2023 16:38:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B668C433CC;
	Thu, 23 Nov 2023 16:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700757501;
	bh=tDedXJ4tnaGMs3ZTX/pYA5ErQwaoQ9VfB/MU8vDEhKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WsbgZ+8fTYYujkEj1M5p0m4erPLW64Ku483nH050cih4Iup/Le+FsNJuo8wxh39qj
	 idzstqs32DolW3/mZzmDCIDKu21a/KkaNvSxzxk9KumL/2jHwtiJs5BuxsbI//gwxJ
	 fT+09/3nDeb3YiNjHmLwJDzVzAUzGYuyVdHLw0v5E5L3AU/mAOFSUsuMS0xsF/zKQ9
	 tzgoSXZVyVVLM6iPRiIPG2BH0qZNQSeHeLWUXPd/Fuc1Z02m92nbeDPwMMqCtMqXi4
	 IO2PmgTCbs2ThLftcJjdJg7V5PhL9ypqCcygHhkl1UQU8L0qay4rp5VhY3PLkQp79r
	 xJvnJ0BeW0rgQ==
Date: Thu, 23 Nov 2023 16:38:16 +0000
From: Lee Jones <lee@kernel.org>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, andy.shevchenko@gmail.com,
	kernel@sberdevices.ru, rockosov@gmail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	George Stark <gnstark@salutedevices.com>
Subject: Re: [PATCH v4 06/11] leds: aw200xx: add delay after software reset
Message-ID: <20231123163816.GG1354538@google.com>
References: <20231121202835.28152-1-ddrokosov@salutedevices.com>
 <20231121202835.28152-7-ddrokosov@salutedevices.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231121202835.28152-7-ddrokosov@salutedevices.com>

On Tue, 21 Nov 2023, Dmitry Rokosov wrote:

> From: George Stark <gnstark@salutedevices.com>
> 
> According to datasheets of aw200xx devices software reset takes at
> least 1ms so add delay after reset before issuing commands to device.

Are you able to use an auto-correct tool to sharpen the grammar a little?

> Signed-off-by: George Stark <gnstark@salutedevices.com>
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
>  drivers/leds/leds-aw200xx.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/leds/leds-aw200xx.c b/drivers/leds/leds-aw200xx.c
> index 4bce5e7381c0..bb17e48b3e2a 100644
> --- a/drivers/leds/leds-aw200xx.c
> +++ b/drivers/leds/leds-aw200xx.c
> @@ -321,6 +321,9 @@ static int aw200xx_chip_reset(const struct aw200xx *const chip)
>  	if (ret)
>  		return ret;
>  
> +	/* according to datasheet software reset takes at least 1ms */

Please start sentences with an uppercase char.

"According to the datasheet, software resets take at least 1ms"
              ^                            ^     ^

> +	fsleep(1000);
> +
>  	regcache_mark_dirty(chip->regmap);
>  	return regmap_write(chip->regmap, AW200XX_REG_FCD, AW200XX_FCD_CLEAR);
>  }
> -- 
> 2.36.0
> 

-- 
Lee Jones [李琼斯]

