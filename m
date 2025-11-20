Return-Path: <linux-leds+bounces-6257-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E022DC75561
	for <lists+linux-leds@lfdr.de>; Thu, 20 Nov 2025 17:25:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DDAC14E46CE
	for <lists+linux-leds@lfdr.de>; Thu, 20 Nov 2025 16:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDCF32E88B0;
	Thu, 20 Nov 2025 16:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lAIiJ9m0"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEDB2D9EDC;
	Thu, 20 Nov 2025 16:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763655188; cv=none; b=I4Q+w6wHFzNiKNfJupDqQcS3c/LAMwdTHzTrVjGIc3q4bFfVNY8/wEL7OodjX+5M/rpJ7DjS8Vh+ah2TmDmoT77/7DTfMK5wdv3F5ASl2O5PQRA33dlLIJxlhp0Qs+Zuj28r6W8NMgoHRL/y7mWrtY4NClLdYAV81uGOyRwwEY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763655188; c=relaxed/simple;
	bh=U2Yymk82oxW3QAqGYYk1nRCJ1Gq7NQgRNxhzjfFuXvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j14OwNcJtJqW3uueBegMdF5npVgDuHA6Vnou795kmhxOfvTo+7p+MlplGCxtkSn/UqlcQdbp91lh7TFYpGpvsqRpXcFZAPuSMbaxfJfdOH6pzlP7MbrQIvU+DU+zASyJk7x8n8WnxZPhlrTzrmR6oGKszacrwtQlzr+46MKMtSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lAIiJ9m0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FA0BC4CEF1;
	Thu, 20 Nov 2025 16:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763655188;
	bh=U2Yymk82oxW3QAqGYYk1nRCJ1Gq7NQgRNxhzjfFuXvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lAIiJ9m0LFZo9AbyRZ5XRyOHg0kd6b9GIn9+oyj+oJhHuIbSbEibyuYmBkrTorzkF
	 m79sVk1ZVWzC1AIDswfcr6Xstlp6+l00oFGkpQym5l1HIur3HHAqteQLkWtxFXFuBG
	 8t41XQYzicXaascb2wWn9ujAMCM3lhtM0CnqtmQ4WdvX3mZLdnxCRor2H/p1GHX/0r
	 TTyIb/wEmp2903me3oy+QDEQ7XFt2jOtucU67FCrGSDOnfcNa/gd3oy15xRw96Cv9A
	 kWjpzd4prj8cU55987CmaD9SbiQAH4p7BoQKykyeDFv0oes5q6Zc0p98suKhb5QnvH
	 1lNpVGWzOkwCA==
Date: Thu, 20 Nov 2025 10:13:06 -0600
From: Rob Herring <robh@kernel.org>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: kernel@oss.qualcomm.com, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
	Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: qcom-lpg: Explain standalone
 PWM usage
Message-ID: <20251120161306.GA1468415-robh@kernel.org>
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

On Wed, Nov 19, 2025 at 02:06:42PM +0800, Fenglin Wu wrote:
> LPG channels can be used for only outputting PWM signals by routing to
> PMIC GPIOs without enabling TRILED. Explain this usage in the description
> for better clarity.
> 
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

Is this a separate paragraph or the same paragraph? The former needs a 
blank line.

Acked-by: Rob Herring (Arm) <robh@kernel.org>

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

