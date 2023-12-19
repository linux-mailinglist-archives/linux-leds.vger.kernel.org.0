Return-Path: <linux-leds+bounces-445-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4474F8184A1
	for <lists+linux-leds@lfdr.de>; Tue, 19 Dec 2023 10:36:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9A8B281AEC
	for <lists+linux-leds@lfdr.de>; Tue, 19 Dec 2023 09:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C90F413AFB;
	Tue, 19 Dec 2023 09:36:44 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B7013AE2;
	Tue, 19 Dec 2023 09:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (82-72-63-87.cable.dynamic.v4.ziggo.nl [82.72.63.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 7089820058;
	Tue, 19 Dec 2023 10:17:18 +0100 (CET)
Date: Tue, 19 Dec 2023 10:17:16 +0100
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
Message-ID: <3lsapoxlqijes5m4nqcbhdfhhs4chq3mcq3jaty7v2zihsqnwu@nn67a4h6425k>
References: <20220719211848.1653920-1-marijn.suijten@somainline.org>
 <20220719211848.1653920-2-marijn.suijten@somainline.org>
 <ZYFS04cznE5bhOeV@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZYFS04cznE5bhOeV@hovoldconsulting.com>

Hi Johan and Lee,

On 2023-12-19 09:22:43, Johan Hovold wrote:
> Hi Marijn and Lee,
> 
> On Tue, Jul 19, 2022 at 11:18:48PM +0200, Marijn Suijten wrote:
> > Inherit PM660L PMIC LPG/triled block configuration from downstream
> > drivers and DT sources, consisting of a triled block with automatic
> > trickle charge control and source selection, three colored led channels
> > belonging to the synchronized triled block and one loose PWM channel.
> > 
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> > 
> > Changes since v3:
> > - Rebased on -next;
> > - (series) dropped DTS patches that have been applied through the
> >   Qualcomm DTS tree, leaving only leds changes (driver and
> >   accompanying dt-bindings).
> 
> > diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> > index 02f51cc61837..102ab0c33887 100644
> > --- a/drivers/leds/rgb/leds-qcom-lpg.c
> > +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> > @@ -1304,6 +1304,23 @@ static int lpg_remove(struct platform_device *pdev)
> >  	return 0;
> >  }
> >  
> > +static const struct lpg_data pm660l_lpg_data = {
> > +	.lut_base = 0xb000,
> > +	.lut_size = 49,
> > +
> > +	.triled_base = 0xd000,
> > +	.triled_has_atc_ctl = true,
> > +	.triled_has_src_sel = true,
> > +
> > +	.num_channels = 4,
> > +	.channels = (const struct lpg_channel_data[]) {
> > +		{ .base = 0xb100, .triled_mask = BIT(5) },
> > +		{ .base = 0xb200, .triled_mask = BIT(6) },
> > +		{ .base = 0xb300, .triled_mask = BIT(7) },
> > +		{ .base = 0xb400 },
> > +	},
> > +};
> > +
> >  static const struct lpg_data pm8916_pwm_data = {
> >  	.num_channels = 1,
> >  	.channels = (const struct lpg_channel_data[]) {
> > @@ -1424,6 +1441,7 @@ static const struct lpg_data pm8350c_pwm_data = {
> >  };
> >  
> >  static const struct of_device_id lpg_of_table[] = {
> > +	{ .compatible = "qcom,pm660l-lpg", .data = &pm660l_lpg_data },
> >  	{ .compatible = "qcom,pm8150b-lpg", .data = &pm8150b_lpg_data },
> >  	{ .compatible = "qcom,pm8150l-lpg", .data = &pm8150l_lpg_data },
> >  	{ .compatible = "qcom,pm8350c-pwm", .data = &pm8350c_pwm_data },
> 
> When reviewing the Qualcomm SPMI PMIC bindings I noticed that this patch
> was never picked up by the LEDs maintainer, while the binding and dtsi
> changes made it in:
> 
> 	https://lore.kernel.org/r/20220719211848.1653920-2-marijn.suijten@somainline.org
> 
> Looks like it may still apply cleanly, but otherwise, would you mind
> rebasing and resending so that Lee can pick this one up?
> 
> Johan

Coincidentally I haven't touched this device/platform for months... until last
weekend where I noticed the same.  It does not apply cleanly and I had to solve
some conflicts:

https://github.com/SoMainline/linux/commit/8ec5d02eaffcec24fcab6a989ab117a5b72b96b6

I'll gladly resend this!

Note that I have one more unmerged leds patch around, that hasn't been looked
at either.  Would it help to send this once again, perhaps with more reviewers/
testing (Johan, would you mind taking a look too)?

https://lore.kernel.org/linux-leds/20220719213034.1664056-1-marijn.suijten@somainline.org/

Thanks!

- Marijn

