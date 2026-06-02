Return-Path: <linux-leds+bounces-8439-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hK+iHMrkHmoVYwAAu9opvQ
	(envelope-from <linux-leds+bounces-8439-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 16:12:26 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BB462F2EE
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 16:12:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=IyNC9PbB;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8439-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8439-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7162B306961D
	for <lists+linux-leds@lfdr.de>; Tue,  2 Jun 2026 14:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99413E9588;
	Tue,  2 Jun 2026 14:05:32 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14BE3E8665;
	Tue,  2 Jun 2026 14:05:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780409132; cv=none; b=sxbUkRDo5zAtUpuipRjJlqwzwI1DJAJsci5otVabkplsTlZcIdukzXKswtzA6RMTYfksXqeXrsLYT2XGMCqqf1V5B+HL2POG9c4/EeQPoCXDAjIL1YRrddc5dTM7PWbZre7DGrl5no877R3/9x1SXaNzKNleWKbKF3mHy0j01QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780409132; c=relaxed/simple;
	bh=09NL+un6rl4U4C7BsxVzArGjjqcEtQxdpmghDXTV0P8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uYDImyJkxcO5jnlLOg/z25ljN5CrgmuSFL/KJgZs1USjcvrt00xYM5xmXZoYi5qYRgMiNB3RfBoHQLCG1IaGDTsqUWe2hJblBrcdIbucWJvdvC5uj5xXzJDWNWT5TfrwzT+HYoQK3Xoa5fPaEGkUJalJ18KvOip3wd2zwT2Bo0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IyNC9PbB; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFA5E1F00893;
	Tue,  2 Jun 2026 14:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780409131;
	bh=RwmM6VRZg5l+0GvbV/xOvwKkYl5MibkLoOqq8L//Tag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IyNC9PbBLUb7m07qNRltiOyeQtRvHibdxXDofusCnxdqOqIt4C/b08lD6V+mwRPqe
	 BgL28PJeGQuqV/eJbVS20qes2l1HBYm/COYkyP2Y07yswps9weXUxe1EGr1P+R21eM
	 7KJ7WLfgFMTl7FIIB9ToK604upmNy55XdOpmLKiz15HDL9tjaI6F8nEPm0qWavjQ3a
	 BBxu4CUkOhJkeq2yijdjb9G/EgfZSBXAri7+70ZuMiu2QHi7V7LZ6+bPdT+g8afoKh
	 wAJL1DKVpSU8RJ3mTi+we4xWC+3DvtcHPQ44jeTJ1oxJzmcrtqh+WlyuhGdvlH5Jzw
	 A49aM5OXdfG3g==
Date: Tue, 2 Jun 2026 15:05:25 +0100
From: Daniel Thompson <danielt@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>,
	Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 09/11] video: backlight: lm3533_bl: Set initial
 mapping mode from DT
Message-ID: <ah7jJbAKI6cAJbS0@aspen.lan>
References: <20260601151831.76350-1-clamor95@gmail.com>
 <20260601151831.76350-10-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601151831.76350-10-clamor95@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:lee@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-8439-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[danielt@kernel.org,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[danielt@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,aspen.lan:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4BB462F2EE

On Mon, Jun 01, 2026 at 06:18:29PM +0300, Svyatoslav Ryhel wrote:
> Add support to obtain the initial mapping mode from DT instead of leaving
> it unconfigured.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/video/backlight/lm3533_bl.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
> index 36e6f027613a..f0d88b7bc229 100644
> --- a/drivers/video/backlight/lm3533_bl.c
> +++ b/drivers/video/backlight/lm3533_bl.c
> @@ -34,6 +34,7 @@ struct lm3533_bl {
>
>  	u32 max_current;
>  	u32 pwm;
> +	bool linear;
>  };
>
>
> @@ -247,8 +248,15 @@ static struct attribute_group lm3533_bl_attribute_group = {
>
>  static int lm3533_bl_setup(struct lm3533_bl *bl)
>  {
> +	int id = lm3533_bl_get_ctrlbank_id(bl);
>  	int ret;
>
> +	ret = regmap_update_bits(bl->lm3533->regmap, LM3533_REG_CTRLBANK_AB_BCONF,
> +				 CTRLBANK_AB_BCONF_MODE(id),
> +				 bl->linear ? CTRLBANK_AB_BCONF_MODE(id) : 0);

I guess this is another candidate for regmap_assign_bits() but with that
change:
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.

