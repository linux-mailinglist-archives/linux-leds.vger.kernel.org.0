Return-Path: <linux-leds+bounces-7663-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Pb0JTfD12mdSQgAu9opvQ
	(envelope-from <linux-leds+bounces-7663-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 09 Apr 2026 17:18:15 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0740E3CC81B
	for <lists+linux-leds@lfdr.de>; Thu, 09 Apr 2026 17:18:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 542843008A64
	for <lists+linux-leds@lfdr.de>; Thu,  9 Apr 2026 15:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A1C3D648F;
	Thu,  9 Apr 2026 15:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PHSRoZvi"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D373C3C0E;
	Thu,  9 Apr 2026 15:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775747577; cv=none; b=byuqzJj9McsvKpWHSXB5DgJJm4sXqDxGX2N/nkBY19ykhVYszMiLi7zjPyLn0IqV1rMgcmMSG+/bulVrJOJOn/hUHskQ0MbwgpKdfy2yQdIS9GaTtR+nWKspFxYQ36+1Ys3Tg5clHeyV6Re61Q52KwmTpKLTh0OCoczjz1iqQWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775747577; c=relaxed/simple;
	bh=XZ0j55lDt+ITPdEqlDtIZHLtAJWhK74mOYmyr6CkMFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o4YQugHB4ZwuuuYwB+rxpLKQWhsZpzN+soK5rommXM4qX/lSv/jkh090fRHpW4UhjS6TN4krcY0dRvRKiu/jSghCl49Tz2TbfEi9WhGhRALhwtRRU9fYyyOPzsJ0SWAiTaUsDpigNPieD0tCZ77cEGwI0DS5ioDmSqzppUzK7XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PHSRoZvi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6C65C4CEF7;
	Thu,  9 Apr 2026 15:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775747577;
	bh=XZ0j55lDt+ITPdEqlDtIZHLtAJWhK74mOYmyr6CkMFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PHSRoZvijMwHrrt1Ouw1xOi6RIbE+2T9n21Tpw00cAAA56c+UOCzCA7eW4fWk3iAH
	 6UPVYAQiMJU/HlBAV2nD3nz+uBx9SoL2A/MSn5J0YOn62MZ3f7HW3U2cGCNav/Z3vw
	 u2sja/edfPtY08bt8GlHZPU57Ydv+aSAvTEfLSH2MfP18sMp4f4vsl2ORVDKG0n7DR
	 5KAO+KcnmMddb1MZ/SrHeGukDqb0ReAuz3VLKE2dVLYsb41t4ElbE/MyMzZliIMV6r
	 peHK2DURcRdaH/6LfkUDLWygP7sJWC7cCINu1BLcp16FGfhZ/s+ZDpYDPCTbQ/MtU8
	 x8x+bv6Zt3cmg==
Date: Thu, 9 Apr 2026 16:12:53 +0100
From: Lee Jones <lee@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-leds@vger.kernel.org, Pavel Machek <pavel@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH] leds: qcom-lpg: allocate channels with main struct
Message-ID: <20260409151253.GH3290953@google.com>
References: <20260330211844.14796-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260330211844.14796-1-rosenp@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7663-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 0740E3CC81B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 30 Mar 2026, Rosen Penev wrote:

> Use a flexible array member to combine kzalloc and kcalloc. This
> required moving the struct lpg_channel definition up as flexible array
> members require a full definition.
> 
> Add __counted_by for extra runtime analysis.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/leds/rgb/leds-qcom-lpg.c | 117 +++++++++++++++----------------
>  1 file changed, 56 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> index f6061c47f863..83cedf4a0cbf 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -80,58 +80,8 @@
>  #define SDAM_PAUSE_HI_MULTIPLIER_OFFSET	0x8
>  #define SDAM_PAUSE_LO_MULTIPLIER_OFFSET	0x9
>  
> -struct lpg_channel;
>  struct lpg_data;
>  
> -/**
> - * struct lpg - LPG device context
> - * @dev:	pointer to LPG device
> - * @map:	regmap for register access
> - * @lock:	used to synchronize LED and pwm callback requests
> - * @pwm:	PWM-chip object, if operating in PWM mode
> - * @data:	reference to version specific data
> - * @lut_base:	base address of the LUT block (optional)
> - * @lut_size:	number of entries in the LUT block
> - * @lut_bitmap:	allocation bitmap for LUT entries
> - * @pbs_dev:	PBS device
> - * @lpg_chan_sdam:	LPG SDAM peripheral device
> - * @lut_sdam:	LUT SDAM peripheral device
> - * @pbs_en_bitmap:	bitmap for tracking PBS triggers
> - * @triled_base: base address of the TRILED block (optional)
> - * @triled_src:	power-source for the TRILED
> - * @triled_has_atc_ctl:	true if there is TRI_LED_ATC_CTL register
> - * @triled_has_src_sel:	true if there is TRI_LED_SRC_SEL register
> - * @channels:	list of PWM channels
> - * @num_channels: number of @channels
> - */
> -struct lpg {
> -	struct device *dev;
> -	struct regmap *map;
> -
> -	struct mutex lock;
> -
> -	struct pwm_chip *pwm;
> -
> -	const struct lpg_data *data;
> -
> -	u32 lut_base;
> -	u32 lut_size;
> -	unsigned long *lut_bitmap;
> -
> -	struct pbs_dev *pbs_dev;
> -	struct nvmem_device *lpg_chan_sdam;
> -	struct nvmem_device *lut_sdam;
> -	unsigned long pbs_en_bitmap;
> -
> -	u32 triled_base;
> -	u32 triled_src;
> -	bool triled_has_atc_ctl;
> -	bool triled_has_src_sel;
> -
> -	struct lpg_channel *channels;
> -	unsigned int num_channels;
> -};
> -
>  /**
>   * struct lpg_channel - per channel data
>   * @lpg:	reference to parent lpg
> @@ -216,6 +166,55 @@ struct lpg_led {
>  	struct lpg_channel *channels[] __counted_by(num_channels);
>  };
>  
> +/**
> + * struct lpg - LPG device context
> + * @dev:	pointer to LPG device
> + * @map:	regmap for register access
> + * @lock:	used to synchronize LED and pwm callback requests
> + * @pwm:	PWM-chip object, if operating in PWM mode
> + * @data:	reference to version specific data
> + * @lut_base:	base address of the LUT block (optional)
> + * @lut_size:	number of entries in the LUT block
> + * @lut_bitmap:	allocation bitmap for LUT entries
> + * @pbs_dev:	PBS device
> + * @lpg_chan_sdam:	LPG SDAM peripheral device
> + * @lut_sdam:	LUT SDAM peripheral device
> + * @pbs_en_bitmap:	bitmap for tracking PBS triggers
> + * @triled_base: base address of the TRILED block (optional)
> + * @triled_src:	power-source for the TRILED
> + * @triled_has_atc_ctl:	true if there is TRI_LED_ATC_CTL register
> + * @triled_has_src_sel:	true if there is TRI_LED_SRC_SEL register
> + * @channels:	list of PWM channels
> + * @num_channels: number of @channels
> + */

Should we be reordering the kerneldoc descriptions for '@channels' and
'@num_channels' here to correctly match the updated order in the struct below?

> +struct lpg {
> +	struct device *dev;
> +	struct regmap *map;
> +
> +	struct mutex lock;
> +
> +	struct pwm_chip *pwm;
> +
> +	const struct lpg_data *data;
> +
> +	u32 lut_base;
> +	u32 lut_size;
> +	unsigned long *lut_bitmap;
> +
> +	struct pbs_dev *pbs_dev;
> +	struct nvmem_device *lpg_chan_sdam;
> +	struct nvmem_device *lut_sdam;
> +	unsigned long pbs_en_bitmap;
> +
> +	u32 triled_base;
> +	u32 triled_src;
> +	bool triled_has_atc_ctl;
> +	bool triled_has_src_sel;
> +
> +	unsigned int num_channels;
> +	struct lpg_channel channels[] __counted_by(num_channels);
> +};
> +
>  /**
>   * struct lpg_channel_data - per channel initialization data
>   * @sdam_offset:	Channel offset in LPG SDAM
> @@ -1475,12 +1474,6 @@ static int lpg_init_channels(struct lpg *lpg)
>  	struct lpg_channel *chan;
>  	int i;
>  
> -	lpg->num_channels = data->num_channels;
> -	lpg->channels = devm_kcalloc(lpg->dev, data->num_channels,
> -				     sizeof(struct lpg_channel), GFP_KERNEL);
> -	if (!lpg->channels)
> -		return -ENOMEM;
> -
>  	for (i = 0; i < data->num_channels; i++) {
>  		chan = &lpg->channels[i];
>  
> @@ -1603,18 +1596,20 @@ static int lpg_init_sdam(struct lpg *lpg)
>  
>  static int lpg_probe(struct platform_device *pdev)
>  {
> +	const struct lpg_data *data;
>  	struct lpg *lpg;
>  	int ret;
>  	int i;
>  
> -	lpg = devm_kzalloc(&pdev->dev, sizeof(*lpg), GFP_KERNEL);
> +	data = of_device_get_match_data(&pdev->dev);
> +	if (!data)
> +		return -EINVAL;
> +
> +	lpg = devm_kzalloc(&pdev->dev, struct_size(lpg, channels, data->num_channels), GFP_KERNEL);
>  	if (!lpg)
>  		return -ENOMEM;
>  
> -	lpg->data = of_device_get_match_data(&pdev->dev);

You just NULL-ptr-derefed yourself.  Did you test this?

> -	if (!lpg->data)
> -		return -EINVAL;
> -
> +	lpg->num_channels = data->num_channels;
>  	lpg->dev = &pdev->dev;
>  	mutex_init(&lpg->lock);
>  
> -- 
> 2.53.0
> 
> 

-- 
Lee Jones [李琼斯]

