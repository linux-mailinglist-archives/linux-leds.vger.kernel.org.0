Return-Path: <linux-leds+bounces-6677-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07697D3AE54
	for <lists+linux-leds@lfdr.de>; Mon, 19 Jan 2026 16:07:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03189314AF9F
	for <lists+linux-leds@lfdr.de>; Mon, 19 Jan 2026 14:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D23F38F93A;
	Mon, 19 Jan 2026 14:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EpPnoXM3"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E1338A9BB;
	Mon, 19 Jan 2026 14:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768834421; cv=none; b=ggf/F5A6x8sGdUGqsun2y/tMip07XZIEaiB77/qROHV6clJIpoDH5KJAIs2WJ32J1NG4wRE6wtQZMDI6iWcvIqR8rJAxlfIiWcy3qcvRrsS5rIX9U0nW46qXqVODMf6WIIP9gQCzz0dMDuHOC9CLA1FoUDy10rjfMYZ087OtvGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768834421; c=relaxed/simple;
	bh=PjW88bpBQA6g4rD0v8HvGLkfvikwUAEsezrluo8/1tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hXec69QljLR9mmApB9NTJy5UlzrYXvUvpsrhy1u5wiXJnyEM9WiTpecIg/QYiRcP6qtxp7ji63fZpp1MCOQ+0nDA4mwWB4ZQdzQeq69k3wo/5o5KXYLxYXTv1Dlap9SolPRXnAupqOZphlmI0V13O951aKMcJuSWEE7OVTO7GdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EpPnoXM3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ACB8C19423;
	Mon, 19 Jan 2026 14:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768834420;
	bh=PjW88bpBQA6g4rD0v8HvGLkfvikwUAEsezrluo8/1tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EpPnoXM3+E5/2yAFQ1+wKxsaHOEk3rliv+M8eFOs+f0/tH8aY9xX3k1VnGdVlIf0j
	 wSgVOg8aZ1s2wTLd1GqOu0q/CaDbTdGQDpQ5VBu7gotmbp1GrbBQJeJfgxYInaTuMy
	 8JzxAUQR+FBi5XC0ycUR/+zQU1vHBRBOPPvMoL1nGFtDbxCk9/5VOdkPS2e6RcxDaf
	 J+NPEBROOK/li50HJfyOJ8aIzrJNhD6m9eM2jadK8wStMm/TgfqziLbqS4rkQYLUxm
	 /MgY+1fdI+bK6YWAbdwOFYUoKrZe/ebFTogV8C+ibx5/4z6RMwhazE+aoG/CoDYy/e
	 tAYRp7TIqixVw==
Date: Mon, 19 Jan 2026 14:53:33 +0000
From: Daniel Thompson <danielt@kernel.org>
To: =?iso-8859-1?B?QmFybmFi4XMgQ3rpbeFu?= <barnabas.czeman@mainlining.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>,
	Luca Weiss <luca@lucaweiss.eu>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Eugene Lepshy <fekz115@gmail.com>,
	Gianluca Boiano <morf3089@gmail.com>,
	Alejandro Tafalla <atafalla@dnyon.com>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Thompson <daniel.thompson@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/7] backlight: qcom-wled: Change PM8950 WLED
 configurations
Message-ID: <aW5FbaVkDHkApE3S@aspen.lan>
References: <20260116-pmi8950-wled-v3-0-e6c93de84079@mainlining.org>
 <20260116-pmi8950-wled-v3-4-e6c93de84079@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260116-pmi8950-wled-v3-4-e6c93de84079@mainlining.org>

On Fri, Jan 16, 2026 at 08:07:36AM +0100, Barnabás Czémán wrote:
> PMI8950 WLED needs same configurations as PMI8994 WLED.
>
> Fixes: 10258bf4534b ("backlight: qcom-wled: Add PMI8950 compatible")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 5decbd39b789..8054e4787725 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -1455,7 +1455,8 @@ static int wled_configure(struct wled *wled)
>  		break;
>
>  	case 4:
> -		if (of_device_is_compatible(dev->of_node, "qcom,pmi8994-wled")) {
> +		if (of_device_is_compatible(dev->of_node, "qcom,pmi8950-wled") ||
> +		    of_device_is_compatible(dev->of_node, "qcom,pmi8994-wled")) {
>  			u32_opts = pmi8994_wled_opts;

I still really dislike naming the structures after a single instance of
the PMIC when, at inception, that name is known to be wrong. However
if the Qualcomm devs are happy with it then I guess I can live with it.

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Thanks

Daniel.

