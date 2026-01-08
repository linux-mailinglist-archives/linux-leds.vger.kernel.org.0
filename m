Return-Path: <linux-leds+bounces-6581-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C3BD03176
	for <lists+linux-leds@lfdr.de>; Thu, 08 Jan 2026 14:39:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61D4C30329C1
	for <lists+linux-leds@lfdr.de>; Thu,  8 Jan 2026 13:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4034AC7B3;
	Thu,  8 Jan 2026 11:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j3OiA/V6"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FCC4AC798;
	Thu,  8 Jan 2026 11:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767870388; cv=none; b=OnfL+n5XwwZ0SDF8Tw5z1dnT202WSp+Dapcm/b/L8M1K9dZWh+RkbPWfqIJDjlKXD3leWm2i/YiOlzvFGpJaPJrXMlwMO4cNHnXuCeVl4VBi9pl/RRpZglwWJOBxdmQkeiffz17WjxCsTNi9pe8qHs0krDabjOelZPSpzL/iFIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767870388; c=relaxed/simple;
	bh=QJKMun5QRAcxX3jJHl8Ue5cS4f8WEAVqoly+7CYI0AI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RcUN//i9EGJbsO59eBEBl5/tZ9CLK6i+A7TLL3R+M+x+kkgEDpwYnfZKNX3EmlBtedR55EcCGfgp+Y6tPRzvtFQqlunWJm/PRNLdYB1cU8BfdhZqZf6RJnbPn8i4LYiE5nA4hw6N5kTfp99WZPcFN8Nc94EQeKEn6VHvmk5bGFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j3OiA/V6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC96C116C6;
	Thu,  8 Jan 2026 11:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767870387;
	bh=QJKMun5QRAcxX3jJHl8Ue5cS4f8WEAVqoly+7CYI0AI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j3OiA/V6pMYF7g1j2PD/2lFiFz2ihmeOchcGAhbEn4suHhWFyDJqPDxG11Y4nwsMZ
	 3NE4twU5om8u7d5r2ga9/qSvTPCAfNACWgrEGz0PBe31RSj8SXn0qJKs7h4iLOHsV8
	 mxZgVeGQqUvMEOKvQbvCd6kpgaCeKqYUCsR/3t9BY+Ju4ByJgSkbfN/ihH/fohKfmL
	 O8u/PmgNzb7NBanm4SOZa5sc7rSyU/TqRv7V9kN5VxMxjBMq5e+SjavPq1aIncYA2d
	 JQNBJ+uorlUzahXlmdKkaE5g91bZSUDYSQrLmt9Yn29gKcXLZHJvJ1Zi0kSK05ViaK
	 bV3otHAOf6Pow==
Date: Thu, 8 Jan 2026 11:06:22 +0000
From: Lee Jones <lee@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: pavel@kernel.org, abel.vesa@linaro.org, marijn.suijten@somainline.org,
	sre@kernel.org, andersson@kernel.org,
	anjelique.melendez@oss.qualcomm.com, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: qcom-lpg: Check the return value of
 regmap_bulk_write()
Message-ID: <20260108110622.GD302752@google.com>
References: <20251204061728.124-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251204061728.124-1-vulab@iscas.ac.cn>

On Thu, 04 Dec 2025, Haotian Zhang wrote:

> The lpg_lut_store() function currently ignores the return value of
> regmap_bulk_write() and always returns 0. This can cause hardware write
> failures to go undetected, leading the caller to believe LUT programming
> succeeded when it may have failed.
> 
> Check the return value of regmap_bulk_write() in lpg_lut_store and return
> the error to the caller on failure.
> 
> Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/leds/rgb/leds-qcom-lpg.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> index 4f2a178e3d26..76734b1520f6 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -369,7 +369,7 @@ static int lpg_lut_store(struct lpg *lpg, struct led_pattern *pattern,
>  {
>  	unsigned int idx;
>  	u16 val;
> -	int i;
> +	int i, ret;
>  
>  	idx = bitmap_find_next_zero_area(lpg->lut_bitmap, lpg->lut_size,
>  					 0, len, 0);
> @@ -379,8 +379,10 @@ static int lpg_lut_store(struct lpg *lpg, struct led_pattern *pattern,
>  	for (i = 0; i < len; i++) {
>  		val = pattern[i].brightness;
>  
> -		regmap_bulk_write(lpg->map, lpg->lut_base + LPG_LUT_REG(idx + i),
> +		ret = regmap_bulk_write(lpg->map, lpg->lut_base + LPG_LUT_REG(idx + i),
>  				  &val, sizeof(val));

Fine, but you need to re-align this to the '(' above.

> +		if (ret)
> +			return ret;
>  	}
>  
>  	bitmap_set(lpg->lut_bitmap, idx, len);
> -- 
> 2.50.1.windows.1
> 

-- 
Lee Jones [李琼斯]

