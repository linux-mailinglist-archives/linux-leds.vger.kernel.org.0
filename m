Return-Path: <linux-leds+bounces-8776-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PY91HUN6Qmqq8AkAu9opvQ
	(envelope-from <linux-leds+bounces-8776-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 15:59:31 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B37F46DBA7D
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 15:59:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=jduZfLYz;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8776-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8776-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 032F73009E1F
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 13:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F4CD202F70;
	Mon, 29 Jun 2026 13:38:02 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451321C3BFC;
	Mon, 29 Jun 2026 13:38:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782740282; cv=none; b=pGUmLg4wDwyV5WHvVKvci2pQc7ZUMe069xCijhCSeahkrGUZmEJ+XJ+6GWL8I64wczwc66PqYDpdXGSvJxqHh2bSTv+dkw4X5XA8kD6AC5qLsm0Mn5lI3AuyiMSbvI+DFCGUlIbh0c90wdREdiOEXL5oO/4oYSduh+owJms7fL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782740282; c=relaxed/simple;
	bh=h0NzO1io+fgYlm1+qBEUP+mMXcgWEx+u2huOZYmnOlY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PF8UXgzfUgLERELZR0N/Kpb2lB8QqvOHdI+gtCRTxPB566PzwqRhV6bm2FVwFyDjrFCZCznWzX8fDeQ1ktvKtYPLe5nVHt2cJYDtQJNcCH2frJIEXpxf2wuNCf5SOfwOp8v7iSvweZUui1PBP4WpA35NSjKVP9fWKhaSlE+RLpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jduZfLYz; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C8731F000E9;
	Mon, 29 Jun 2026 13:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782740280;
	bh=8UlMaOm8BTmhX7nDTKw745qE/4Yj1dRnU49r449uo+g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jduZfLYzkwdroju15z+zcLIY6Ezoh9dO5Gedy7AgT17GImt66hAuvSUHo7zV2rUwe
	 Q6tCH8qZDORrCWeranBbZIZkFmVxI+EZJ5G/Fe9XXsN/YfHSQoeilu38DFikksljWr
	 UwixBseP+ubQib89cCfFhu8NpHo0R78OEvM6uXDXMLqyzpfIIYld1PBsjjp8shuGQb
	 ujrpErEV/J7neb0IAqED39lAHP+g0N8JN0zKWFnHK2Mzkz4GDrEn0uU/fB1X87vL+y
	 mm0LSicM20eq8cB/Lhhua8q2uoAeZMq4wsz7FkrMCYXvbI7unDuiaq30E5Hcqz/CA6
	 E//KGdOXiR2Lg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/6] [v5] leds: gpio: make legacy gpiolib interface
 optional
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260629130329.1291953-6-arnd@kernel.org>
References: <20260629130329.1291953-1-arnd@kernel.org>
 <20260629130329.1291953-6-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 13:38:00 +0000
Message-Id: <20260629133800.9C8731F000E9@smtp.kernel.org>
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
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-8776-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,vger.kernel.org:from_smtp,arndb.de:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,sashiko.dev:url,lists.linux.dev:replyto];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-input@vger.kernel.org,m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B37F46DBA7D

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Fatal build error due to missing header file `linux/gpio/legacy.h`.
--

commit 2f558c72edeac39e19dec733e556e60219934526
Author: Arnd Bergmann <arnd@arndb.de>

leds: gpio: make legacy gpiolib interface optional

This commit splits out the legacy portion of the platform_data handling into
a custom helper function guarded by CONFIG_GPIOLIB_LEGACY. The goal is to
allow the leds-gpio driver to compile cleanly when the legacy configuration
gets turned off for modern platforms.

Link: https://lore.kernel.org/all/e9252384-a55c-4a91-9c61-06e05a0b2ce4@app.=
fastmail.com/

> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index a3428b22de3a1..740772c2504a1 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -9,8 +9,8 @@
>  #include <linux/container_of.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
> -#include <linux/gpio.h>
>  #include <linux/gpio/consumer.h>
> +#include <linux/gpio/legacy.h>

[Severity: Low]
Does this cause a build failure? It looks like linux/gpio/legacy.h doesn't
exist in the kernel source tree, and the legacy GPIO APIs remain conditiona=
lly
available within include/linux/gpio.h itself.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629130329.1291=
953-1-arnd@kernel.org?part=3D5

