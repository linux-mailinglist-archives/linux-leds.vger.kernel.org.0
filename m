Return-Path: <linux-leds+bounces-9029-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5LvhI4hmUWobEAMAu9opvQ
	(envelope-from <linux-leds+bounces-9029-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 23:39:20 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D85D673F0AA
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 23:39:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Sf1LPH/3";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9029-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-9029-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9AF03037B96
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 21:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FEA33C0633;
	Fri, 10 Jul 2026 21:35:40 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F2A3BFAD1;
	Fri, 10 Jul 2026 21:35:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783719340; cv=none; b=Luh58pfBee+uY925gxfcat/p1X/nMzT1fgfiPijqddL5iQ8FV8K7HHGznHPJivqQQbBChBXtsxJycqLjqGSqvNLj5qHW73aXtDVYDpuOSFPmh1vi1RE0LK92XSbrb+wOsdGgeBwIVNVjOfbHMcj4TWQGNRxMEhxl7q1I8NvjKFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783719340; c=relaxed/simple;
	bh=V4kgPQSc8K4Zo3Pq5H4OO4x4rBHh5iFPReI/ayyS/30=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ftShsM+vIqxAl+yo+tb8kIy4t7B64FR/oP9BIvfKu4I8eTRlpGumxExFAiF4kGLiP45lpnsXO6L8j+mYv7iE6WhLXqxS7o74kj/eRdhnFFM/oRUpogbMZt4TfMmIYYOy/05/YmybD1cEX40jQoQO/JpAdKEDVPh1+6x5GHKSGDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sf1LPH/3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 872CD1F000E9;
	Fri, 10 Jul 2026 21:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783719338;
	bh=gUcdAN00xf/L23XBL4KYjYS87AgViYvbm6bXPWTc55Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Sf1LPH/3JDkHvvdSgKyWqmGqKmVNRnD6lIpz9lJZ0QUT27yis4Na/6VDAvvwVxV6A
	 RDGD68HVMoRTAnGBxy2YwMq4Yrff2VXxYn3l7XAjWKu3qaCUtB/4NTsoIqD0hycaXW
	 2BpsfDiLEE5OD7OhjbHFeH9LCxnZZ1HXs/rsTI0JPKBmcbhac44XMwMR3d4/Ugaze5
	 B2ujdQWY2HG7Y5z/Wq2ADQWxHHwpQW1iaNwBdteI9l8tWWG7PW+rwGma5kl0Bs7kky
	 /Oou6/NbubTPLNYrTNj6ZUZhubkR4HKTqPQRQMz7vYifBu9rbwaZlizZ/+XFSNoPrJ
	 CttN7PDI8thew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/6] [v6] gpiolib: turn off legacy interface by default
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260710211854.1371746-7-arnd@kernel.org>
References: <20260710211854.1371746-1-arnd@kernel.org>
 <20260710211854.1371746-7-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 21:35:38 +0000
Message-Id: <20260710213538.872CD1F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-9029-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url,smtp.kernel.org:mid,vger.kernel.org:from_smtp,lists.linux.dev:replyto,arndb.de:email];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-input@vger.kernel.org,m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D85D673F0AA

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Drivers MFD_AAT2870_CORE, MFD_SI476X_CORE, and SND_SOC_TLV320DAC33=
 become silently unselectable on standard kernels because they still use `d=
epends on GPIOLIB_LEGACY`.
--

--- Patch [6]: [PATCH 6/6] [v6] gpiolib: turn off legacy interface by defau=
lt ---
commit c81360523a83f6de8b9f91867c27fb9f36e0da52
Author: Arnd Bergmann <arnd@arndb.de>

gpiolib: turn off legacy interface by default

This commit turns off the legacy GPIO interface by default, allowing it to
be enabled manually only for compile testing. It relies on the assumption
that all legacy users now select CONFIG_GPIOLIB_LEGACY.

> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 020e51e30317a..543de15a12f63 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -4,7 +4,14 @@
>  #
> =20
>  config GPIOLIB_LEGACY
> -	def_bool y
> +	bool "Legacy GPIO interfaces" if COMPILE_TEST

[Severity: High]
Does this change silently disable MFD_AAT2870_CORE, MFD_SI476X_CORE, and
SND_SOC_TLV320DAC33 in production builds?

The commit message states that all users of the legacy interface now select
CONFIG_GPIOLIB_LEGACY, but it appears these drivers still depend on it
instead:

drivers/mfd/Kconfig:
config MFD_AAT2870_CORE
    ...
    depends on GPIOLIB_LEGACY

drivers/mfd/Kconfig:
config MFD_SI476X_CORE
    ...
    depends on GPIOLIB_LEGACY

sound/soc/codecs/Kconfig:
config SND_SOC_TLV320DAC33
    ...
    depends on GPIOLIB_LEGACY

Since GPIOLIB_LEGACY now defaults to n and its prompt is hidden without
COMPILE_TEST, won't these dependencies prevent the drivers from being
selected on standard kernels, causing their hardware to stop functioning?

> +	help
> +	  There are a few legacy platforms that use the traditional GPIO
> +	  number based interfaces instead of GPIO descriptors.
> +	  Say Y here to enable build testing drivers that are specific
> +	  to those platforms.
> +
> +	  If unsure, say N.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710211854.1371=
746-1-arnd@kernel.org?part=3D6

