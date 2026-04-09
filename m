Return-Path: <linux-leds+bounces-7669-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGsOAMPb12klTwgAu9opvQ
	(envelope-from <linux-leds+bounces-7669-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 09 Apr 2026 19:02:59 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9064A3CDE44
	for <lists+linux-leds@lfdr.de>; Thu, 09 Apr 2026 19:02:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21D6A300CBE3
	for <lists+linux-leds@lfdr.de>; Thu,  9 Apr 2026 17:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5EF63DE425;
	Thu,  9 Apr 2026 17:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hJmI8UDB"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27F72248A3;
	Thu,  9 Apr 2026 17:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775754174; cv=none; b=VNN6JbJVh7Yaol/ZfwOCaypQXwA5p3r5yviHqr+zNohkdEbyTYtr9b1QpiljROGN66y8aSojy2GEyiuc0uE0R0R1rD3/OPCi1X5LIBFWglRiM04+03rCPDFsI7ul5Sn8NQnDAWCCzYOdjUPqzcvB+rhXMiPXtxnN9R/VLWLRlxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775754174; c=relaxed/simple;
	bh=M7445RKK25eqNYJ7fGHZ3RUAySSUxct6zvUwIUm4sb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nu7zdSng2h8cL3ZDqdoC/f3Ludqkgqv/u5Lcwv4ZicxKGn/IXK3XM6f3DdtYfxlFldIf+HfRfLY8CVSSJPuEDtWA2xbBXVzslYCgFBVepgJw1o8D340/YlsX3RS71oNAkd+3Q3ZxZkOxjdU4sGKJNRwK6u2rZovX7ddygADwxxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hJmI8UDB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDF54C4CEF7;
	Thu,  9 Apr 2026 17:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775754174;
	bh=M7445RKK25eqNYJ7fGHZ3RUAySSUxct6zvUwIUm4sb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hJmI8UDBQsQt0Dqo4mSvCG06iZv8uKV3KiwbhSIZvxh6Wbs3xFdiKdeXJlgbv5MJP
	 vtm0Jmy6mBesK7ExrksG6aB/P66FU+44pfbndIs6SYPl1g+lePRwEr9kL6mPqohluf
	 CtfGhWdo5p1sLvGTghRZCGspOK4LY9goJfqSL2n9a+de23R+FQ1q8/A8HmG4wSs8Px
	 KKGCGh9V4Ym9lIeneuTvOLulTxtsj1VMhtMCmF+FSQ9ebPnp6l8H/1Glh+/dSSo9Ir
	 aPpnt14zL90vFh3c44BK2IreOv6q28rPFBIyW1sB4mkm8139VJPkMuUTMYAxFzCQIA
	 fw13YkyhHGFNg==
Date: Thu, 9 Apr 2026 18:02:50 +0100
From: Lee Jones <lee@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-leds@vger.kernel.org, Pavel Machek <pavel@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH] leds: qcom-lpg: allocate channels with main struct
Message-ID: <20260409170250.GC3439476@google.com>
References: <20260330211844.14796-1-rosenp@gmail.com>
 <20260409151253.GH3290953@google.com>
 <CAKxU2N9xHS25zhcqwmOpXbgdMN-WDiOcDLTEgHs6WbqPuJ__dQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N9xHS25zhcqwmOpXbgdMN-WDiOcDLTEgHs6WbqPuJ__dQ@mail.gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7669-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9064A3CDE44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 09 Apr 2026, Rosen Penev wrote:

> On Thu, Apr 9, 2026 at 8:12 AM Lee Jones <lee@kernel.org> wrote:
> >
> > On Mon, 30 Mar 2026, Rosen Penev wrote:
> >
> > > Use a flexible array member to combine kzalloc and kcalloc. This
> > > required moving the struct lpg_channel definition up as flexible array
> > > members require a full definition.
> > >
> > > Add __counted_by for extra runtime analysis.
> > >
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > ---
> > >  drivers/leds/rgb/leds-qcom-lpg.c | 117 +++++++++++++++----------------
> > >  1 file changed, 56 insertions(+), 61 deletions(-)
> > >
> > > diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> > > index f6061c47f863..83cedf4a0cbf 100644
> > > --- a/drivers/leds/rgb/leds-qcom-lpg.c
> > > +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> > > @@ -80,58 +80,8 @@
> > >  #define SDAM_PAUSE_HI_MULTIPLIER_OFFSET      0x8
> > >  #define SDAM_PAUSE_LO_MULTIPLIER_OFFSET      0x9
> > >
> > > -struct lpg_channel;
> > >  struct lpg_data;
> > >
> > > -/**
> > > - * struct lpg - LPG device context
> > > - * @dev:     pointer to LPG device
> > > - * @map:     regmap for register access
> > > - * @lock:    used to synchronize LED and pwm callback requests
> > > - * @pwm:     PWM-chip object, if operating in PWM mode
> > > - * @data:    reference to version specific data
> > > - * @lut_base:        base address of the LUT block (optional)
> > > - * @lut_size:        number of entries in the LUT block
> > > - * @lut_bitmap:      allocation bitmap for LUT entries
> > > - * @pbs_dev: PBS device
> > > - * @lpg_chan_sdam:   LPG SDAM peripheral device
> > > - * @lut_sdam:        LUT SDAM peripheral device
> > > - * @pbs_en_bitmap:   bitmap for tracking PBS triggers
> > > - * @triled_base: base address of the TRILED block (optional)
> > > - * @triled_src:      power-source for the TRILED
> > > - * @triled_has_atc_ctl:      true if there is TRI_LED_ATC_CTL register
> > > - * @triled_has_src_sel:      true if there is TRI_LED_SRC_SEL register
> > > - * @channels:        list of PWM channels
> > > - * @num_channels: number of @channels
> > > - */
> > > -struct lpg {
> > > -     struct device *dev;
> > > -     struct regmap *map;
> > > -
> > > -     struct mutex lock;
> > > -
> > > -     struct pwm_chip *pwm;
> > > -
> > > -     const struct lpg_data *data;
> > > -
> > > -     u32 lut_base;
> > > -     u32 lut_size;
> > > -     unsigned long *lut_bitmap;
> > > -
> > > -     struct pbs_dev *pbs_dev;
> > > -     struct nvmem_device *lpg_chan_sdam;
> > > -     struct nvmem_device *lut_sdam;
> > > -     unsigned long pbs_en_bitmap;
> > > -
> > > -     u32 triled_base;
> > > -     u32 triled_src;
> > > -     bool triled_has_atc_ctl;
> > > -     bool triled_has_src_sel;
> > > -
> > > -     struct lpg_channel *channels;
> > > -     unsigned int num_channels;
> > > -};
> > > -
> > >  /**
> > >   * struct lpg_channel - per channel data
> > >   * @lpg:     reference to parent lpg
> > > @@ -216,6 +166,55 @@ struct lpg_led {
> > >       struct lpg_channel *channels[] __counted_by(num_channels);
> > >  };
> > >
> > > +/**
> > > + * struct lpg - LPG device context
> > > + * @dev:     pointer to LPG device
> > > + * @map:     regmap for register access
> > > + * @lock:    used to synchronize LED and pwm callback requests
> > > + * @pwm:     PWM-chip object, if operating in PWM mode
> > > + * @data:    reference to version specific data
> > > + * @lut_base:        base address of the LUT block (optional)
> > > + * @lut_size:        number of entries in the LUT block
> > > + * @lut_bitmap:      allocation bitmap for LUT entries
> > > + * @pbs_dev: PBS device
> > > + * @lpg_chan_sdam:   LPG SDAM peripheral device
> > > + * @lut_sdam:        LUT SDAM peripheral device
> > > + * @pbs_en_bitmap:   bitmap for tracking PBS triggers
> > > + * @triled_base: base address of the TRILED block (optional)
> > > + * @triled_src:      power-source for the TRILED
> > > + * @triled_has_atc_ctl:      true if there is TRI_LED_ATC_CTL register
> > > + * @triled_has_src_sel:      true if there is TRI_LED_SRC_SEL register
> > > + * @channels:        list of PWM channels
> > > + * @num_channels: number of @channels
> > > + */
> >
> > Should we be reordering the kerneldoc descriptions for '@channels' and
> > '@num_channels' here to correctly match the updated order in the struct below?
> Yeah probably.
> >
> > > +struct lpg {
> > > +     struct device *dev;
> > > +     struct regmap *map;
> > > +
> > > +     struct mutex lock;
> > > +
> > > +     struct pwm_chip *pwm;
> > > +
> > > +     const struct lpg_data *data;
> > > +
> > > +     u32 lut_base;
> > > +     u32 lut_size;
> > > +     unsigned long *lut_bitmap;
> > > +
> > > +     struct pbs_dev *pbs_dev;
> > > +     struct nvmem_device *lpg_chan_sdam;
> > > +     struct nvmem_device *lut_sdam;
> > > +     unsigned long pbs_en_bitmap;
> > > +
> > > +     u32 triled_base;
> > > +     u32 triled_src;
> > > +     bool triled_has_atc_ctl;
> > > +     bool triled_has_src_sel;
> > > +
> > > +     unsigned int num_channels;
> > > +     struct lpg_channel channels[] __counted_by(num_channels);
> > > +};
> > > +
> > >  /**
> > >   * struct lpg_channel_data - per channel initialization data
> > >   * @sdam_offset:     Channel offset in LPG SDAM
> > > @@ -1475,12 +1474,6 @@ static int lpg_init_channels(struct lpg *lpg)
> > >       struct lpg_channel *chan;
> > >       int i;
> > >
> > > -     lpg->num_channels = data->num_channels;
> > > -     lpg->channels = devm_kcalloc(lpg->dev, data->num_channels,
> > > -                                  sizeof(struct lpg_channel), GFP_KERNEL);
> > > -     if (!lpg->channels)
> > > -             return -ENOMEM;
> > > -
> > >       for (i = 0; i < data->num_channels; i++) {
> > >               chan = &lpg->channels[i];
> > >
> > > @@ -1603,18 +1596,20 @@ static int lpg_init_sdam(struct lpg *lpg)
> > >
> > >  static int lpg_probe(struct platform_device *pdev)
> > >  {
> > > +     const struct lpg_data *data;
> > >       struct lpg *lpg;
> > >       int ret;
> > >       int i;
> > >
> > > -     lpg = devm_kzalloc(&pdev->dev, sizeof(*lpg), GFP_KERNEL);
> > > +     data = of_device_get_match_data(&pdev->dev);
> > > +     if (!data)
> > > +             return -EINVAL;
> > > +
> > > +     lpg = devm_kzalloc(&pdev->dev, struct_size(lpg, channels, data->num_channels), GFP_KERNEL);
> > >       if (!lpg)
> > >               return -ENOMEM;
> > >
> > > -     lpg->data = of_device_get_match_data(&pdev->dev);
> >
> > You just NULL-ptr-derefed yourself.  Did you test this?
> This can never return NULL. All compatible entries have a
> corresponding data value pointing to a statically allocated struct.

Where is lpg->data now set?

-- 
Lee Jones [李琼斯]

