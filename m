Return-Path: <linux-leds+bounces-8580-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kDJGA0oxLGp+NQQAu9opvQ
	(envelope-from <linux-leds+bounces-8580-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jun 2026 18:18:18 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B2B67ACF5
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jun 2026 18:18:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="kY40Iw/j";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8580-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8580-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DB8B83005A9A
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jun 2026 16:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E5853ACA7A;
	Fri, 12 Jun 2026 16:18:15 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312CA218EB1;
	Fri, 12 Jun 2026 16:18:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281095; cv=none; b=WzUtYXcitEgkHE4ICuJrxa18bGBiDKcrDF9jk77jOxStq6faalVAUGDGAQPOEMpve2l/Ga9IIFikeLPzyebvxyauTTi5Va3opjYu+bxpBPXKN1rw0EKP7ggxrtoH2r+88KHWzp9Uwwe6V0KK2SLWYcO2Ow+XMp9geNWNnF9KRjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281095; c=relaxed/simple;
	bh=gcN/ebDW59Eb8scLHGRO1cBHAeg7AB0pQ62NF8tH3yY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kn5ApB1Vn0I5ZWnfxrYC4UyHHl3Ct2ITzgrho9uMK4oO8TgvgHK4OA3DMimp0VLJ8B4zKgeQzpZM+IfeZHZyxK/qgWOFDCBwIhll4lxjc6sBYXQz1NvidNdRO4DosnEdpYRga0cp1fNH+WksbOsM+xpPjeQMhluDM8nLAvFZWn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kY40Iw/j; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F6D1F00A3A;
	Fri, 12 Jun 2026 16:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781281093;
	bh=t59SHBM/VnxNzq8RXGo9/WOt6b2EmmZZqsobTFLaZsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kY40Iw/jyhoBShnqbs4tO+X4bPSLaSNBb69NP2nyAtkQfCRIlfETj5U3LYjbg+7vd
	 VU237ntWsQSo9Yr3akENeHyUQqIe0/Ha3yMvGxa4Ce8xs1/0wFluWa9qeaB3apMACq
	 EhFaTb5EJ9SX/UnDWB8DEqZB6XBpPCwV+OeXZ31afkcTk5cKdIbnIH1CGVJa7QqVvr
	 VahhRTGopjjbqlvbKpb+/YQnt0T2uXMsCZ6JTWagTE6k/XtjrxtOr1nlBKaaXGotaB
	 1ry8eZqr7JMbWcYvHMchXhUmToBacgrwJXkgOLT1NhvZDmnrq9D/TbWcVOj6qLkSm+
	 eJjd8clEscl/g==
Date: Fri, 12 Jun 2026 11:18:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Johan Hovold <johan@kernel.org>, linux-iio@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Daniel Thompson <danielt@kernel.org>, Lee Jones <lee@kernel.org>,
	linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v4 01/14] dt-bindings: leds: Document TI LM3533 LED
 controller
Message-ID: <178128109241.1149158.14270432284406889754.robh@kernel.org>
References: <20260606045738.21050-1-clamor95@gmail.com>
 <20260606045738.21050-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260606045738.21050-2-clamor95@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8580-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:jic23@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jingoohan1@gmail.com,m:nuno.sa@analog.com,m:johan@kernel.org,m:linux-iio@vger.kernel.org,m:andy@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk+dt@kernel.org,m:pavel@kernel.org,m:dlechner@baylibre.com,m:danielt@kernel.org,m:lee@kernel.org,m:linux-fbdev@vger.kernel.org,m:deller@gmx.de,m:conor+dt@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-leds@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.freedesktop.org,vger.kernel.org,gmail.com,analog.com,baylibre.com,gmx.de];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 91B2B67ACF5


On Sat, 06 Jun 2026 07:57:25 +0300, Svyatoslav Ryhel wrote:
> Document the LM3533 - a complete power source for backlight, keypad and
> indicator LEDs in smartphone handsets. The high-voltage inductive boost
> converter provides the power for two series LED strings display backlight
> and keypad functions.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Reviewed-by: Jonathan Cameron <jic23@kernel.org> #for light sensor
> Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org> #for backlight
> ---
>  .../leds/backlight/ti,lm3533-backlight.yaml   |  69 +++++++
>  .../bindings/leds/ti,lm3533-leds.yaml         |  67 +++++++
>  .../devicetree/bindings/leds/ti,lm3533.yaml   | 169 ++++++++++++++++++
>  3 files changed, 305 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lm3533-backlight.yaml
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533-leds.yaml
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


