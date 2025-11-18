Return-Path: <linux-leds+bounces-6186-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0DEC6AA83
	for <lists+linux-leds@lfdr.de>; Tue, 18 Nov 2025 17:34:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 30E5D351FC1
	for <lists+linux-leds@lfdr.de>; Tue, 18 Nov 2025 16:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 131C536A03B;
	Tue, 18 Nov 2025 16:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aTyvatNo"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA5E35C197;
	Tue, 18 Nov 2025 16:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763483012; cv=none; b=orZ6lzqAL9ZbEaZw1/5XOYL5OSim3IDWe7ZRXtAA4hcm/BicmmR1QhOqyssWdTguT+3TcFO91nEalYZnDwBZyTD+d4fYD1kG6d1S83Y/+/8n8ggqKIbwQPoUI6zodl5GvrApamzxnFR+zjegg2exNUQgENUzdfqWPwq/Kpk9wYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763483012; c=relaxed/simple;
	bh=Cx6ra/ZZXYIPAEbShPjgNZwEQVFiDKOYHxlr5SRo3JU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PO3rR+Zyjs5yBucf5X7n86hR67MmZnG661Z6U5L2vo3D8SDFpW6V65mptw/fFk0R/fhZoHNVQvmeTGq7nmIP/wXeifNGsza8xPiI+Gh+kBhgd+lD3hiXrYPJrqiwHPesyxQR7bDUauYPYJC0+o2/s4P4/fMpGuFmVXPOKNJIn80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aTyvatNo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE0DC4CEF1;
	Tue, 18 Nov 2025 16:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763483011;
	bh=Cx6ra/ZZXYIPAEbShPjgNZwEQVFiDKOYHxlr5SRo3JU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aTyvatNoSR9xCNZjY4ZJGFyZWTXxVr0SyRSlVUJzVWhLLBiH58ua6poviieFoDqSH
	 EUqV89uuD1Ky14qEi4CQ71qkE21W8edumHLcblEdNsrfk0yIlRhrBjZFK8uPVSlW03
	 cDNKkqEKeaWgpbt7sFt4grGEzOvY+ZkQdQCBepuAOHBjKyjklbQgjE+HVbPOaZeBAc
	 QmUMUDGHdVSGCP6Guy9J8NSN5r9gWEaecqR1ZCHdRcbZMUbfG6AKYGWkVuprK05T3f
	 e5LokPAewwcMprxu7kQytLAC0NPZb19bfPS7fFpqDpUQsem4H92H+sTYeYeAW1qeXM
	 PKFGh4pCsTZHQ==
Date: Tue, 18 Nov 2025 10:28:19 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] leds: rgb: leds-qcom-lpg: Allow LED_COLOR_ID_MULTI
Message-ID: <j6fyiebd4f5rwi36gzy53bkikrpsf6jidbxh4d4d3zkcrvbmlz@7cwqv444kog3>
References: <20251117-topic-lpg_multi-v1-1-05604374a2dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117-topic-lpg_multi-v1-1-05604374a2dd@oss.qualcomm.com>

On Mon, Nov 17, 2025 at 02:45:59PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> There's nothing special about RGB multi-led instances. Allow any color
> combinations by simply extending the "if _RGB" checks.
> 

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/leds/rgb/leds-qcom-lpg.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> index 4f2a178e3d26..c8afc68e442f 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -1382,7 +1382,7 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
>  		return dev_err_probe(lpg->dev, ret,
>  			      "failed to parse \"color\" of %pOF\n", np);
>  
> -	if (color == LED_COLOR_ID_RGB)
> +	if (color == LED_COLOR_ID_RGB || color == LED_COLOR_ID_MULTI)
>  		num_channels = of_get_available_child_count(np);
>  	else
>  		num_channels = 1;
> @@ -1394,7 +1394,7 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
>  	led->lpg = lpg;
>  	led->num_channels = num_channels;
>  
> -	if (color == LED_COLOR_ID_RGB) {
> +	if (color == LED_COLOR_ID_RGB || color == LED_COLOR_ID_MULTI) {
>  		info = devm_kcalloc(lpg->dev, num_channels, sizeof(*info), GFP_KERNEL);
>  		if (!info)
>  			return -ENOMEM;
> @@ -1454,7 +1454,7 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
>  
>  	init_data.fwnode = of_fwnode_handle(np);
>  
> -	if (color == LED_COLOR_ID_RGB)
> +	if (color == LED_COLOR_ID_RGB || color == LED_COLOR_ID_MULTI)
>  		ret = devm_led_classdev_multicolor_register_ext(lpg->dev, &led->mcdev, &init_data);
>  	else
>  		ret = devm_led_classdev_register_ext(lpg->dev, &led->cdev, &init_data);
> 
> ---
> base-commit: b179ce312bafcb8c68dc718e015aee79b7939ff0
> change-id: 20251117-topic-lpg_multi-cf47ea164b14
> 
> Best regards,
> -- 
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 

