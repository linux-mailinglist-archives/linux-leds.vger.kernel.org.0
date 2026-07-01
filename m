Return-Path: <linux-leds+bounces-8815-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ELhcBSgiRWpl7goAu9opvQ
	(envelope-from <linux-leds+bounces-8815-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 01 Jul 2026 16:20:24 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8E66EEA47
	for <lists+linux-leds@lfdr.de>; Wed, 01 Jul 2026 16:20:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=K9BopHwB;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8815-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8815-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B9B70302048F
	for <lists+linux-leds@lfdr.de>; Wed,  1 Jul 2026 13:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56DA224B04;
	Wed,  1 Jul 2026 13:52:29 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE8925B0B8
	for <linux-leds@vger.kernel.org>; Wed,  1 Jul 2026 13:52:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782913949; cv=none; b=uba4e+10QrbUT2MTP/47WEUshcz1KEFB8jHMJaVsVJj2uWAgP/QIefsWwpZiPtamgfJLypaQbhy62XdjiMeFAJ+WQHZwjmkTrP0zBDL/h+0ZDMK+aPsaTTNCSbpWs+k5L/B/5G0ifPAZQceAJ8q6HBRtI0kUjeVruCyD5YNDPqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782913949; c=relaxed/simple;
	bh=YskM+f4SyHrLY5y6Z+2IJfFUDgaPgpugDx1LFkI/1KI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qu0dI9r0uyMD/urjfx9ypZLmZoeocGB/AAdVw7QoG2wmWoZZD2pJnkVkIos3/H09bsuVgbKG5vMD3eretBizmLPHqPiUKRobAo0ZVY3xPQsteICpqsA7pZYp/DBu37ySNgqCQHDRKkBI59JrjI27ak8/yp1WihtHO77WoqPnWLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K9BopHwB; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B65B1F000E9;
	Wed,  1 Jul 2026 13:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782913948;
	bh=VDpaVJlS708zRfOZO5PAB+Hs1J4dA8avvbijsZKglYI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K9BopHwBV4QcBM24HqDkbv9V68b+IscxN5klKIfPSihejhB+RkXHEyM2HscDhExFc
	 NFDPyypQvojWGwKNAy6s/IcNn/WPe9fexRhQdY7ZICaNrv6iiTq6NWWeuAJqrcj87M
	 NU0hZHnsj3gYn9Qzq7/GJEPdiS42zxhexOAyIv3EGPlcWhleOIp6zy0CpYoECSu3Du
	 +dfL81zU2IWiBNuzOMrhb7Zj7KQItkdoJh19/H+wAh/mh2EHSwNTUTSo+1uzXX+85+
	 BQyg67wqb2VqcV4fQAFThxFue2VB8qGucpnBoPvYFrEWw2MAZ/D0Mw328L/ENCZEos
	 8FfKqm73+s2Xw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] backlight: aw99706: Validate all DT property values
 consistently
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junjie Cao" <junjie.cao@linux.dev>
Cc: dri-devel@lists.freedesktop.org, lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260701133918.33487-2-junjie.cao@linux.dev>
References: <20260701133918.33487-1-junjie.cao@linux.dev>
 <20260701133918.33487-2-junjie.cao@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 13:52:27 +0000
Message-Id: <20260701135228.0B65B1F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-8815-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:junjie.cao@linux.dev,m:dri-devel@lists.freedesktop.org,m:lee@kernel.org,m:linux-leds@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,sashiko.dev:url,vger.kernel.org:from_smtp,linux.dev:email,smtp.kernel.org:mid,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F8E66EEA47

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] I2C read performed before enabling the chip via GPIO.
--

commit 9b2c49c6b957cfe305a408b8c9b3c4052b039334
Author: Junjie Cao <junjie.cao@linux.dev>

backlight: aw99706: Validate all DT property values consistently

The lookup helpers for dim-mode and ramp-ctl take a shortcut when
lookup_tbl is NULL: they accept any u32 value without range-checking
and return success unconditionally. Out-of-range values get silently
truncated by regmap_update_bits instead of triggering the dev_warn +
default-fallback path that the other properties use.

> diff --git a/drivers/video/backlight/aw99706.c b/drivers/video/backlight/=
aw99706.c
> index e130f164303a2..dfb4b38b5b4c7 100644
> --- a/drivers/video/backlight/aw99706.c
> +++ b/drivers/video/backlight/aw99706.c

[ ... ]

[Severity: High]
This is a pre-existing issue, but while reviewing this driver I noticed
a potential issue in aw99706_probe(). Does the driver attempt to read
the chip ID before enabling the device?

drivers/video/backlight/aw99706.c:aw99706_probe() {
    ...
	ret =3D aw99706_chip_id_read(aw);
	if (ret !=3D AW99706_ID)
		return dev_err_probe(dev, -ENODEV,
				     "Unknown chip id 0x%02x\n", ret);

	aw99706_dt_parse(aw, &props);

	aw->hwen_gpio =3D devm_gpiod_get(aw->dev, "enable", GPIOD_OUT_LOW);
    ...
}

If the bootloader leaves the chip disabled, would this I2C read fail or time
out because the enable GPIO is not fetched and asserted until later in the
probe sequence?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701133918.3348=
7-1-junjie.cao@linux.dev?part=3D2

