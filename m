Return-Path: <linux-leds+bounces-8814-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t7ZsFnshRWok7goAu9opvQ
	(envelope-from <linux-leds+bounces-8814-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 01 Jul 2026 16:17:31 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C896EE9A6
	for <lists+linux-leds@lfdr.de>; Wed, 01 Jul 2026 16:17:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=kPSPwYxV;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8814-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8814-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 957663023DD1
	for <lists+linux-leds@lfdr.de>; Wed,  1 Jul 2026 13:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BCAF2517A5;
	Wed,  1 Jul 2026 13:49:34 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A60C23D7DC
	for <linux-leds@vger.kernel.org>; Wed,  1 Jul 2026 13:49:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782913774; cv=none; b=txsL9GbC/1b/imsE0t+2Qch1SldpUltJix6em/yTwfaIYVAMQCA2i4kfuetk++8h9m9nFujxtKaZhw8Y7R4Ou3cGVeSXsLv5usCaJBbPWeDtI2yLQVL4gT55yx44N7GibZG9egcWHJeZsZ9miktyh1rr+IhnamQpNiem8s2zQ1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782913774; c=relaxed/simple;
	bh=D/GnzvKInu2ZZMVasXfC/83GlWNrUU2RMj6Q/oLZ4pk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j3s8YenKUqjad9zVJbbGA7CciyFapRiOhpmNoDOIWFSwC/F9SMGICtzcqCDE03JmzGhE9oy3MSxNro7FDqWIkNtgpdyg2WTx46xudSh/SGHHI47+MXuFoRP3s/qqQlje7sL/B4Xd5Ld3kCm3Qg8NfshDmcboO3wyrZcgQk0ycMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kPSPwYxV; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D08A1F000E9;
	Wed,  1 Jul 2026 13:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782913772;
	bh=X17R3fADM3REFIkxJd7QQUnqt3Ov70i0cJIuCYLwm6c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kPSPwYxVkXIA7n7RSBKTgZqpkB7lfg9VzwIOSo5mH1cyJ1462loZRHot960N2qLqM
	 10mXai7o7Zh54aAYxM5qyeuYkhw706TFWZZJISgkD49EwOY7Mp4Im8WN26MWCXX2gb
	 ng38PzqyiCqGkkcdMCgS3G2xAbxwy7iwRV0MgTls4BUSxOmTZBzs00qhVz8l0MNGb9
	 W7jine1MtU5h5M3jA/zPfSoL3TIfJdBuriRLE05HN8N/VuLT7f3VWCd7r8ip1f7NdI
	 O76vICJva7w5OiVAuXvgUVIrP12GraBVylndylgybm1abISOjzUGjFx2uzTsk3N+vZ
	 gGX9eHkNG6MQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] backlight: aw99706: Fix DT property names to match
 binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junjie Cao" <junjie.cao@linux.dev>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260701133918.33487-1-junjie.cao@linux.dev>
References: <20260701133918.33487-1-junjie.cao@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 13:49:32 +0000
Message-Id: <20260701134932.7D08A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-8814-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:junjie.cao@linux.dev,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:lee@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,vger.kernel.org:from_smtp,smtp.kernel.org:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lists.linux.dev:replyto,linux.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3C896EE9A6

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver attempts to communicate with the chip via I2C before ac=
quiring and enabling the hardware via its enable GPIO.
--

commit a2f8eb8bf399f54262cbf37acb4512885c65a3b6
Author: Junjie Cao <junjie.cao@linux.dev>

backlight: aw99706: Fix DT property names to match binding

The driver reads four tuning properties without the unit suffixes that
the binding mandates. As a result, device_property_read_u32() never finds
these properties in a binding-conformant device tree and silently falls back
to the compiled-in defaults. This patch fixes the property name strings in
aw99706_dt_props[] to match the binding.

> diff --git a/drivers/video/backlight/aw99706.c b/drivers/video/backlight/=
aw99706.c
> index 18299faf06ad4..e130f164303a2 100644
> --- a/drivers/video/backlight/aw99706.c
> +++ b/drivers/video/backlight/aw99706.c
> @@ -130,23 +130,23 @@ static const struct aw99706_dt_prop aw99706_dt_prop=
s[] =3D {

[ ... ]

This is a pre-existing issue, but I noticed something concerning in the
initialization sequence within aw99706_probe() in the same file:

drivers/video/backlight/aw99706.c:aw99706_probe() {
    ...
	ret =3D aw99706_chip_id_read(aw);
	if (ret !=3D AW99706_ID)
		return dev_err_probe(dev, -ENODEV,
				     "Unknown chip id 0x%02x\n", ret);

	aw99706_dt_parse(aw, &props);

	aw->hwen_gpio =3D devm_gpiod_get(aw->dev, "enable", GPIOD_OUT_LOW);
	if (IS_ERR(aw->hwen_gpio))
		return dev_err_probe(dev, PTR_ERR(aw->hwen_gpio),
				     "Failed to get enable gpio\n");

	ret =3D aw99706_hw_init(aw);
    ...
}

[Severity: High]
Does this sequence result in unconditional probe failure on platforms where=
 the
bootloader does not pre-enable the backlight hardware?

The driver attempts to communicate with the chip via I2C during
aw99706_chip_id_read() before the hardware enable GPIO is acquired and
asserted in aw99706_hw_init().

Because the hardware is likely powered down when aw99706_chip_id_read() is
called, it will not acknowledge the I2C transaction and will return an erro=
r.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701133918.3348=
7-1-junjie.cao@linux.dev?part=3D1

