Return-Path: <linux-leds+bounces-8432-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rzs5F27iHmq1YQAAu9opvQ
	(envelope-from <linux-leds+bounces-8432-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 16:02:22 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B610462F1DF
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 16:02:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=QkQaNHIK;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8432-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8432-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 48D12307FD2B
	for <lists+linux-leds@lfdr.de>; Tue,  2 Jun 2026 13:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B303DD51A;
	Tue,  2 Jun 2026 13:42:35 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6781F218E91;
	Tue,  2 Jun 2026 13:42:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780407755; cv=none; b=E1iwYOuFz68mns4wjOg4POLBF6qkhxiY9EUbUfPqyz/SzC0yHF1PfAkg7gxwXCGgaGp2zoqc8B/U/6mZ5225tPvsD73hZU3qhAHwQAt9lGt3lCq5uNesK9EB3NkPk5lC0LbCDFawZvGhh1g/uKMu6VFusM/CKZU3xXESU1uu81M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780407755; c=relaxed/simple;
	bh=Yb7daYDsVq36BbcozNedyFxELYgKgIyx0p22hMyRMkw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G3/MqvvM+cLQczO465pjVDMeg9K6OTwlEaLnxl83nndr6jOhsvOUiB5rg5ZipTOzH6l4VeHQbcrXkgnFTb3ukwxmNWaotlQySDE6dR0GoqKNrlOYnplbtlBMEFO0L/bFXA53gAXEoLKFm2yniijOodZcgUrciuxHgQzkbUTCe9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QkQaNHIK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE6291F00893;
	Tue,  2 Jun 2026 13:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780407754;
	bh=+NOwv3nIu/Ot0KxPJsgbaT8KLyjfpqdRwQOPFZyGDyo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=QkQaNHIKyHnxMEEHWFbu6OWHwnFZgNn0fwEiT2qDWJ5O1QLY9A3iMv7cwzbppdQoN
	 820Oo4HpnFSOU0L/FP6lp/cFc3ZUXGm/X520P0Gke8BIFOJkMqHe3yveARrrH6irRh
	 39y3QNs6j0FZIs6sy9U1ulKhOrUvnOMKLbuEiBTfm5nWAN3J3xn6Yi0gbnna0gh1D9
	 TQg/YW88ip7M0Cki+Jpdo/nJtZ3KeRpp7h7gi9kEYi+sydK5gPl//Eo9iu8jSrSZyL
	 vE+KhsNX+C5rkpNSQWADDGZY4KOfKXZQFs8Imh0rVGTOg8OpdamhgQxy/oIt3cwxlt
	 OyVgr5uekFYEg==
Date: Tue, 2 Jun 2026 14:42:22 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, Jingoo
 Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 03/11] iio: light: lm3533-als: Remove redundant pdata
 helpers
Message-ID: <20260602144222.7a50a041@jic23-huawei>
In-Reply-To: <20260601151831.76350-4-clamor95@gmail.com>
References: <20260601151831.76350-1-clamor95@gmail.com>
	<20260601151831.76350-4-clamor95@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-8432-lists,linux-leds=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,jic23-huawei:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B610462F1DF

On Mon,  1 Jun 2026 18:18:23 +0300
Svyatoslav Ryhel <clamor95@gmail.com> wrote:

> The lm3533_als_set_input_mode and lm3533_als_set_resistor functions are
> used only in lm3533_als_setup. Incorporate their code into
> lm3533_als_setup directly to simplify driver readability.
Minor stuff inline.


> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/iio/light/lm3533-als.c | 61 +++++++++-------------------------
>  1 file changed, 16 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-als.c
> index fb61904f110f..52136ca1abc9 100644
> --- a/drivers/iio/light/lm3533-als.c
> +++ b/drivers/iio/light/lm3533-als.c

>  static int lm3533_als_setup(struct lm3533_als *als,
>  			    const struct lm3533_als_platform_data *pdata)
>  {
> +	struct device *dev = &als->pdev->dev;
>  	int ret;
>  
> -	ret = lm3533_als_set_input_mode(als, pdata->pwm_mode);
> +	ret = regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_CONF,

Maybe a local struct regmap pointer given dereferenced in a couple of places.

> +				 LM3533_ALS_INPUT_MODE_MASK,
> +				 pdata->pwm_mode ? LM3533_ALS_INPUT_MODE_MASK : 0);

Andy raised this in previous patch but in the interests of being specific
regmap_assign_bits() is going to be cleaner here.

>  	if (ret)
> -		return ret;
> +		return dev_err_probe(dev, ret, "failed to set input mode %d\n",
> +				     pdata->pwm_mode);
> +
>  
>  	/* ALS input is always high impedance in PWM-mode. */
>  	if (!pdata->pwm_mode) {
> -		ret = lm3533_als_set_resistor(als, pdata->r_select);
> +		if (pdata->r_select < LM3533_ALS_RESISTOR_MIN ||
> +		    pdata->r_select > LM3533_ALS_RESISTOR_MAX) {
> +			dev_err(&als->pdev->dev, "invalid resistor value\n");
> +			return -EINVAL;
> +		}
> +
> +		ret = regmap_write(als->lm3533->regmap, LM3533_REG_ALS_RESISTOR_SELECT,
> +				   pdata->r_select);
>  		if (ret)
> -			return ret;
> +			return dev_err_probe(dev, ret, "failed to set resistor\n");
>  	}
>  
>  	return 0;


