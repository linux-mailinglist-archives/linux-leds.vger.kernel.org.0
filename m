Return-Path: <linux-leds+bounces-6223-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D30C712E1
	for <lists+linux-leds@lfdr.de>; Wed, 19 Nov 2025 22:47:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 21A624E1A14
	for <lists+linux-leds@lfdr.de>; Wed, 19 Nov 2025 21:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42CFA3002D6;
	Wed, 19 Nov 2025 21:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EWx51sst"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECA821E0BA;
	Wed, 19 Nov 2025 21:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763588819; cv=none; b=bpFpnKCHMqRvwqhdyVvKPsyNlW7TZfmebmKr9gqRdP2+HfON2hcqiigBpdnH3SEeSe4s8q23WZchdkC74SMFOeXp/i+Sym8OfN5zw3g49RFaaXrab6IJwg5cwTsJ8kMwbL9HkRjTKznF9+KhTzFMAgx/d+2pIP5phcj8+crRoNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763588819; c=relaxed/simple;
	bh=B9vI4ZZDj4BcBUv8st3zFCjQlFaGlkNhOdTCosXdbnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sLsNm2I88hc8mbupBhZjkkKmgquvC6zza/TY8q2viy7iXmDq91wd3i1bIThN5orcNp3GVpjRn3zeIAjaMqmRcp0OxWuE9SzGhiSvSolIBJXlF99FePlzAImGoR69s3BbuvCu58nOB8sjXWg5WLjGb8FvXWw429vZjrJun8MGiZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EWx51sst; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DC5AC4CEF5;
	Wed, 19 Nov 2025 21:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763588818;
	bh=B9vI4ZZDj4BcBUv8st3zFCjQlFaGlkNhOdTCosXdbnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EWx51sstLN/GIAov5D/wrvhZTnG4zkzxQlfl3ln7FnJbgzZKG2Q43f0AtCdGoESJF
	 yRkpaMuq6My+qQRY65z+lkptj2azuRASbNkdBMzxqkm5xTdW7qmtx9a00I+Kug/LYa
	 2EVpKnsx8ZfBEltTi7BJIOLiNYk4ViYAAXLZfZvMxMM5Nje+Vf052SvJkb6zNqL0zl
	 mHBNg+I+ipldhVznb7jxTip58nFgGXhuAYmrddovStFQUZTd/KQMSWSUksqgYcAUC+
	 ltTAXOEKkKHCMb92Ab8bKPlHaBR9hni+75IiE05x4gY/i6zhaBS3YY824vmNvq7BMd
	 6iOKGgQRsJMxA==
Date: Wed, 19 Nov 2025 15:51:53 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: fenglin.wu@oss.qualcomm.com
Cc: kernel@oss.qualcomm.com, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: qcom-lpg: Explain standalone
 PWM usage
Message-ID: <t5r7z435dui7aqiazyomnuswi2c4pud2q4xyayntqybg7medgd@whhdkulnbjcu>
References: <20251119-lpg_triled_fix-v3-0-84b6dbdc774a@oss.qualcomm.com>
 <20251119-lpg_triled_fix-v3-1-84b6dbdc774a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119-lpg_triled_fix-v3-1-84b6dbdc774a@oss.qualcomm.com>

On Wed, Nov 19, 2025 at 02:06:42PM +0800, Fenglin Wu via B4 Relay wrote:
> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 
> LPG channels can be used for only outputting PWM signals by routing to
> PMIC GPIOs without enabling TRILED. Explain this usage in the description
> for better clarity.
> 

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
> index 841a0229c472a4764426d25d9dbb900adc20fc11..c4b7e57b251845a6970b34bc9ae0c00647b1bf96 100644
> --- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
> +++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
> @@ -13,6 +13,11 @@ description: >
>    The Qualcomm Light Pulse Generator consists of three different hardware blocks;
>    a ramp generator with lookup table (LUT), the light pulse generator and a three
>    channel current sink. These blocks are found in a wide range of Qualcomm PMICs.
> +  The light pulse generator (LPG) can also be used independently to output PWM
> +  signal for standard PWM applications. In this scenario, the LPG output should
> +  be routed to a specific PMIC GPIO by setting the GPIO pin mux to the special
> +  functions indicated in the datasheet, the TRILED driver for the channel will
> +  not be enabled in this configuration.
>  
>  properties:
>    compatible:
> 
> -- 
> 2.34.1
> 
> 

