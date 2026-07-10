Return-Path: <linux-leds+bounces-9028-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Pe5xFxBmUWoCEAMAu9opvQ
	(envelope-from <linux-leds+bounces-9028-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 23:37:20 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C03D073F069
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 23:37:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=AA97LZwk;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9028-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-9028-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC4343038AA8
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 21:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DCA537AA99;
	Fri, 10 Jul 2026 21:32:57 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7AB3B8BD8;
	Fri, 10 Jul 2026 21:32:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783719177; cv=none; b=eOdBfUV//FNPNXwA7KbSOqYAaDH949J8pJxs1Ob3X34yFNVjF3oOBC8Xj8a6+2iwN8PZPjL7C8jYHoJlRv0hd8bcmEal/+WDTFZ+9ZBIrwIW3yyUE91rZGD+8i4k6cJ3XX5WXltumSIN3qJpyXCTJywMtNPTflDqIid1AjVOnyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783719177; c=relaxed/simple;
	bh=uU/LNt6tG7KZlKzNKNhws78cpOpbpgueRCo9q4qP1lA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MA8GzcorI1HRm00AbIBe502jIVw2mE5z4eDqYodOselAekJf/JtGPQ+gTQw52puuaPVFkpxe7P+vPhSHt601cJaSXmLeHMb3d6esgUg0iuhcneKGiZS734xJUZne00OGI1QPk1cmoEAsXyD6dlqC5UHpl908OPnHdsOgQ3qIDzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AA97LZwk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05F2E1F000E9;
	Fri, 10 Jul 2026 21:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783719176;
	bh=FUJsyXP8f/qUNOyxH2UTHgoKM5yjztNPJcoBaebCXXM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AA97LZwkg18YcHu2zxir2JySg6lTfBmfxMnaKkb68jmnGG9WAEzXdoGhSnXktsR00
	 rMi3km27QKXZ5mqeyEWCMYbcxm78dhzQrenl16hCdAQM7QUc06M9aWvbVVSim6ZInj
	 BV5qEvGNRUXhY8nbs/5dRpczNSqgeO05xAriPGRLUYFcZpKydo4o5eJiRnYFnBGmOb
	 cdnEZm1XW+pPa9ihk2Mol8BxiAIqh9Vmfjg3YfQfaDpKLiV4AbYY8/lkCmVHdnxh5v
	 d2nWEy6A5JVgNt3hO7S4e44cpHSRYdp9iF2mXWQaYPZ7zUlFF3RkwCm7+h02BsBG5q
	 rM1IbKnaFn5uw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] [v6] leds: gpio: make legacy gpiolib interface
 optional
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-input@vger.kernel.org, lee@kernel.org, dmitry.torokhov@gmail.com
In-Reply-To: <20260710211854.1371746-4-arnd@kernel.org>
References: <20260710211854.1371746-1-arnd@kernel.org>
 <20260710211854.1371746-4-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 21:32:55 +0000
Message-Id: <20260710213256.05F2E1F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-9028-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,smtp.kernel.org:mid,sashiko.dev:url,vger.kernel.org:from_smtp,arndb.de:email];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:linux-leds@vger.kernel.org,m:linux-input@vger.kernel.org,m:lee@kernel.org,m:dmitry.torokhov@gmail.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C03D073F069

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Disabling CONFIG_GPIOLIB_LEGACY breaks compilation for unrelated no=
n-legacy drivers that set `struct gpio_led::active_low`.
- [Low] The commit message description is not capitalized, violating the LE=
D subsystem guidelines.
--

--- Patch [3]: [PATCH 3/6] [v6] leds: gpio: make legacy gpiolib interface o=
ptional ---
commit ad55bf4fa40ddbff55ee69fcb15b56da1f063668
Author: Arnd Bergmann <arnd@arndb.de>

> leds: gpio: make legacy gpiolib interface optional

[Severity: Low]
This isn't a bug, but should the commit description be capitalized after the
subsystem prefix to match the LED subsystem guidelines? For example,=20
"leds: gpio: Make legacy..."

This commit makes the legacy GPIO library interface optional in the leds-gp=
io
driver by guarding the platform_data handling with CONFIG_GPIOLIB_LEGACY.

Link: https://lore.kernel.org/all/e9252384-a55c-4a91-9c61-06e05a0b2ce4@app.=
fastmail.com/

[ ... ]

> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index b16b803cc1ac5..e646bffcd8e74 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -676,8 +676,10 @@ typedef int (*gpio_blink_set_t)(struct gpio_desc *de=
sc, int state,
>  struct gpio_led {
>  	const char *name;
>  	const char *default_trigger;
> +#ifdef CONFIG_GPIOLIB_LEGACY
>  	unsigned 	gpio;
>  	unsigned	active_low : 1;
> +#endif

[Severity: Low]
Does hiding active_low behind CONFIG_GPIOLIB_LEGACY break the build for
unrelated non-legacy drivers (such as ath10k) that still rely on setting th=
is
field in struct gpio_led?

>  	unsigned	retain_state_suspended : 1;
>  	unsigned	panic_indicator : 1;
>  	unsigned	default_state : 2;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710211854.1371=
746-1-arnd@kernel.org?part=3D3

