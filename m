Return-Path: <linux-leds+bounces-9073-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m2BcAlNHVWqdmQAAu9opvQ
	(envelope-from <linux-leds+bounces-9073-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 22:15:15 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CF474F008
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 22:15:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=koVlrFMI;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9073-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-9073-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1D17303FFFD
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 20:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0B7935CB61;
	Mon, 13 Jul 2026 20:15:11 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F953446B9
	for <linux-leds@vger.kernel.org>; Mon, 13 Jul 2026 20:15:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783973711; cv=none; b=AshG68kJqBH0+GcOIBsKkNt6PAwtOBKflUcQawNsvBxWNzerhAZwEoC/tS0XwFdklccXUTW9tFQ/zuh4mU19TnpotZr5+Vs4hxedmJY1dsKvuRCYTA6pYXlRSbsFok2nIM8RAe9AMGXi1EYFkYs2qoLWed2BSPmWbrbU/xJOfEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783973711; c=relaxed/simple;
	bh=mI0v/YNMJ+i+xqr84E9wXFrovpAD/GMIIfQd94M9kak=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LiG2cXeRkJvFBWWVtOydLd1gHG8EL6wKT8V8sVjIcfev2FIPrqIxdiOAyVD6Cz4FcZ98j/DNXrOOPQqYyvH2Pr07HQ/K/gPBvJrC2RN48xx2PlZ7e0E0tU6S0vy1grCg8P6Xx1kprVKoKZN4NrkFAgThe+r1P7m514EhoSTwAzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=koVlrFMI; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426191F000E9;
	Mon, 13 Jul 2026 20:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783973708;
	bh=r5eDDMNCrObAduanMoLu5mAEjAb9pdjhyH0ilehmNZc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=koVlrFMIWm6kdrhzGCl0TNmvJihzE7BH9DbQbwgJXCgoeG7CvCpxrdjh2xxVP9epO
	 YhEnMLRTOQFYaucy2OQYa8Ee7XX0YjIi70u24ndwK3AErdp086u6PGk1htvRVVoO7a
	 pAiXk3kvRfVwnqiB+pUAZYOAwWcw5RMl8yidsjR6VOoXV9r5wZF8DC39n65Zu1ShAB
	 ha7NvbKQ6Mw2it2aXNvLZbdXBp1znK5bGb9Yg8oFiS2ebqsDQVgozuyboN5w4ts1Ze
	 aARnDZLOBCwY8U+vmMFIAEM63gHXUyu1gXJJDykYNC2zjXDJroWKaUBz2hbYFhy5/v
	 r9Mr1GoWs5WVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: bcm63138: Use %pe to print pinctrl error instead
 of %ld
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ninad Naik" <ninadnaik07@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260713200732.2470666-1-ninadnaik07@gmail.com>
References: <20260713200732.2470666-1-ninadnaik07@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 20:15:07 +0000
Message-Id: <20260713201508.426191F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-9073-lists,linux-leds=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ninadnaik07@gmail.com,m:linux-leds@vger.kernel.org,m:lee@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
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
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 48CF474F008

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver ignores `-EPROBE_DEFER` from `devm_pinctrl_get_select_d=
efault()`, failing to properly defer probe when the pinctrl driver is not y=
et ready.
- [High] Hardware initialization occurs without holding the required spinlo=
ck after the LED is exposed to user space, causing a data race on shared ha=
rdware registers.
--

--- Patch [1]: [PATCH] leds: bcm63138: Use %pe to print pinctrl error inste=
ad of %ld ---
commit 11674fcbe14b4d4811e6f7f83c90fb13ea7bf5ac
Author: Ninad Naik <ninadnaik07@gmail.com>

leds: bcm63138: Use %pe to print pinctrl error instead of %ld

Pass the pinctrl error pointer directly to %pe to print the
symbolic error name. Detected by Coccinelle. Tested by compiling.

> diff --git a/drivers/leds/blink/leds-bcm63138.c b/drivers/leds/blink/leds=
-bcm63138.c
> index 2cf2761e49145..78a87e1df4d7c 100644
> --- a/drivers/leds/blink/leds-bcm63138.c
> +++ b/drivers/leds/blink/leds-bcm63138.c
> @@ -237,8 +237,8 @@ static void bcm63138_leds_create_led(struct bcm63138_=
leds *leds,
> =20
>  	pinctrl =3D devm_pinctrl_get_select_default(led->cdev.dev);
>  	if (IS_ERR(pinctrl) && PTR_ERR(pinctrl) !=3D -ENODEV) {
> -		dev_warn(led->cdev.dev, "Failed to select %pOF pinctrl: %ld\n",
> -			 np, PTR_ERR(pinctrl));
> +		dev_warn(led->cdev.dev, "Failed to select %pOF pinctrl: %pe\n",
> +			 np, pinctrl);
>  	}

[Severity: High]
This is a pre-existing issue, but does this code ignore -EPROBE_DEFER from
devm_pinctrl_get_select_default()?

If the pinctrl provider is probed after this LED driver, it would return
-EPROBE_DEFER. Because the driver merely logs a warning and continues inste=
ad
of returning the error (e.g. via dev_err_probe), the LED device registers
successfully but remains physically non-functional since its pins are never
multiplexed.

> =20
>  	bit =3D BIT(led->pin);
>  	bcm63138_leds_update_bits(leds, BCM63138_PARALLEL_LED_POLARITY, bit,
>  				  led->active_low ? 0 : bit);
>  	bcm63138_leds_update_bits(leds, BCM63138_HW_LED_EN, bit, 0);
>  	bcm63138_leds_set_flash_rate(leds, led, 0);
>  	bcm63138_leds_enable_led(leds, led, led->cdev.brightness);

[Severity: High]
This is also a pre-existing issue, but is it safe to initialize the hardware
without holding the required spinlock after the LED is exposed to user spac=
e?

bcm63138_leds_update_bits() performs a non-atomic read-modify-write on shar=
ed
hardware registers. Calling it locklessly here can race with
bcm63138_leds_brightness_set() from another CPU, which locks leds->lock and
performs its own read-modify-write on the same registers, corrupting the
hardware state of previously registered LEDs.

User space can concurrently write to sysfs attributes of this or other LEDs
during this lockless initialization sequence because
devm_led_classdev_register_ext() was already called earlier in this functio=
n.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713200732.2470=
666-1-ninadnaik07@gmail.com?part=3D1

