Return-Path: <linux-leds+bounces-755-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0DA848FB9
	for <lists+linux-leds@lfdr.de>; Sun,  4 Feb 2024 18:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18BD71C21494
	for <lists+linux-leds@lfdr.de>; Sun,  4 Feb 2024 17:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F20C22EF2;
	Sun,  4 Feb 2024 17:29:50 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C8F24205;
	Sun,  4 Feb 2024 17:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707067790; cv=none; b=gDoTohjXrSCTrkD0KX0a7MWD4mgPMbjCe1BUyS5fmdzSQoZ28L6UvuWbNGg93Ki0DYGRlALNxL1jnN+8NbzFKzCXiJi9wAQpysSQmuxROnliD29d0bEg/GiXRuD48focEJly6jqEHuKm/tv+g3VboA0TccdtNFHebBC/jgM1oT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707067790; c=relaxed/simple;
	bh=lzSrv4+0HNUHwkpIOl2xT9ERzLM/rHgR5h5G3ipP+LI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BhSlZWpW3IxAEFybWnKW//Ek8c/YrpaNjyYkVJ+0wX9gGkYLQF6SVVFIkKkleF7uFyZCdM9SnRJzreR/7pvFIh/YByxca20nfO9XAP1B0UUJHh7kfcl65+R7eN+6KBk6x5lXxzG57sdbW0VG6BU8DteyAQs9WBPYmsnFMYM/rKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (2a02-a420-67-c93f-164f-8aff-fee4-5930.mobile6.kpn.net [IPv6:2a02:a420:67:c93f:164f:8aff:fee4:5930])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 348BA3EF26;
	Sun,  4 Feb 2024 18:29:45 +0100 (CET)
Date: Sun, 4 Feb 2024 18:29:43 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Johan Hovold <johan@kernel.org>
Cc: Lee Jones <lee@kernel.org>, phone-devel@vger.kernel.org, 
	Pavel Machek <pavel@ucw.cz>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, 
	Martin Botka <martin.botka@somainline.org>, Jami Kettunen <jami.kettunen@somainline.org>, 
	linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stephen Boyd <swboyd@chromium.org>, Satya Priya <quic_c_skakit@quicinc.com>
Subject: Re: [PATCH v4 2/2] leds: qcom-lpg: Add PM660L configuration and
 compatible
Message-ID: <vj7mlrrvn7y45fpavdy37eqfxrz3anq43qh4n2flktckuaoeo7@ynlw5rexyi27>
References: <20220719211848.1653920-1-marijn.suijten@somainline.org>
 <20220719211848.1653920-2-marijn.suijten@somainline.org>
 <ZYFS04cznE5bhOeV@hovoldconsulting.com>
 <3lsapoxlqijes5m4nqcbhdfhhs4chq3mcq3jaty7v2zihsqnwu@nn67a4h6425k>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3lsapoxlqijes5m4nqcbhdfhhs4chq3mcq3jaty7v2zihsqnwu@nn67a4h6425k>

On 2023-12-19 10:17:21, Marijn Suijten wrote:
> Hi Johan and Lee,
> 
> On 2023-12-19 09:22:43, Johan Hovold wrote:
> > Hi Marijn and Lee,
> > 
> > On Tue, Jul 19, 2022 at 11:18:48PM +0200, Marijn Suijten wrote:
> > > Inherit PM660L PMIC LPG/triled block configuration from downstream
> > > drivers and DT sources, consisting of a triled block with automatic
> > > trickle charge control and source selection, three colored led channels
> > > belonging to the synchronized triled block and one loose PWM channel.
> > > 
> > > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> > > 
> > > Changes since v3:
> > > - Rebased on -next;
> > > - (series) dropped DTS patches that have been applied through the
> > >   Qualcomm DTS tree, leaving only leds changes (driver and
> > >   accompanying dt-bindings).
> > 
> > > diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> > > index 02f51cc61837..102ab0c33887 100644
> > > --- a/drivers/leds/rgb/leds-qcom-lpg.c
> > > +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> > > @@ -1304,6 +1304,23 @@ static int lpg_remove(struct platform_device *pdev)
> > >  	return 0;
> > >  }
> > >  
> > > +static const struct lpg_data pm660l_lpg_data = {
> > > +	.lut_base = 0xb000,
> > > +	.lut_size = 49,
> > > +
> > > +	.triled_base = 0xd000,
> > > +	.triled_has_atc_ctl = true,
> > > +	.triled_has_src_sel = true,
> > > +
> > > +	.num_channels = 4,
> > > +	.channels = (const struct lpg_channel_data[]) {
> > > +		{ .base = 0xb100, .triled_mask = BIT(5) },
> > > +		{ .base = 0xb200, .triled_mask = BIT(6) },
> > > +		{ .base = 0xb300, .triled_mask = BIT(7) },
> > > +		{ .base = 0xb400 },
> > > +	},
> > > +};
> > > +
> > >  static const struct lpg_data pm8916_pwm_data = {
> > >  	.num_channels = 1,
> > >  	.channels = (const struct lpg_channel_data[]) {
> > > @@ -1424,6 +1441,7 @@ static const struct lpg_data pm8350c_pwm_data = {
> > >  };
> > >  
> > >  static const struct of_device_id lpg_of_table[] = {
> > > +	{ .compatible = "qcom,pm660l-lpg", .data = &pm660l_lpg_data },
> > >  	{ .compatible = "qcom,pm8150b-lpg", .data = &pm8150b_lpg_data },
> > >  	{ .compatible = "qcom,pm8150l-lpg", .data = &pm8150l_lpg_data },
> > >  	{ .compatible = "qcom,pm8350c-pwm", .data = &pm8350c_pwm_data },
> > 
> > When reviewing the Qualcomm SPMI PMIC bindings I noticed that this patch
> > was never picked up by the LEDs maintainer, while the binding and dtsi
> > changes made it in:
> > 
> > 	https://lore.kernel.org/r/20220719211848.1653920-2-marijn.suijten@somainline.org
> > 
> > Looks like it may still apply cleanly, but otherwise, would you mind
> > rebasing and resending so that Lee can pick this one up?
> > 
> > Johan
> 
> Coincidentally I haven't touched this device/platform for months... until last
> weekend where I noticed the same.  It does not apply cleanly and I had to solve
> some conflicts:
> 
> https://github.com/SoMainline/linux/commit/8ec5d02eaffcec24fcab6a989ab117a5b72b96b6
> 
> I'll gladly resend this!

Apologies for taking more time than necessary.  According to b4 the patch should
become available at:

https://lore.kernel.org/r/20240204-pm660l-lpg-v5-1-2f54d1a0894b@somainline.org

> Note that I have one more unmerged leds patch around, that hasn't been looked
> at either.  Would it help to send this once again, perhaps with more reviewers/
> testing (Johan, would you mind taking a look too)?
> 
> https://lore.kernel.org/linux-leds/20220719213034.1664056-1-marijn.suijten@somainline.org/

I'll continue looking into clarifying this patch before resending it.

- Marijn

