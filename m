Return-Path: <linux-leds+bounces-8773-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ABNuHX50Qmpf7gkAu9opvQ
	(envelope-from <linux-leds+bounces-8773-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 15:34:54 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D9D6DB471
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 15:34:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=aqVlWE1j;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8773-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8773-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE35B3059A75
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 13:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F834071C8;
	Mon, 29 Jun 2026 13:25:07 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC4E36EAA7;
	Mon, 29 Jun 2026 13:25:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739507; cv=none; b=cg6Y0mV4Zujb+zB6djwAvDmTtyA9roqUqGplY4+f/qnoxSwKUGbBUjVOPXMF5RlzpZy3RT7rT3AEjbbFsfINmGFkI+N1pqdkDafPWrLzqrKK6U+4nRONPhVr85k27ONRkEh22C0qL3HFB7OTh7t0Z7BHW5NrmANnU9G9uVis0MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739507; c=relaxed/simple;
	bh=1hmK4kR6HF7Gta7tXwU42CkYKLd5g0ySBKIpa0699d4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aLo7SpJdozBlxbX6WRloA7JT0MEp7fQ1BIT+4QCXWCO+0fJTTOi5uLTVF3XH1TVXz4x8RTZCQegCRGLNuR4TslRX4BZho1a6pUwZmLUSnAuDc5atvFYbjJB9sQhLDoFTea1JLYYGBOCnbumLs+DzbN9LCVEnbDlGnTqTvtgetPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aqVlWE1j; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A53EB1F000E9;
	Mon, 29 Jun 2026 13:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782739506;
	bh=sgRsY4zYtIbLv8rc2NSjx7kjzejcvcpW4xrjI6sFxYQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aqVlWE1jmO2Gfb0adrc11FvVfgpThXO75fChvAIafjVEl5O4gqNLxCU5ZfrugpfQW
	 TN+K71uwsmzKOPQB23HjhJYZkS3ftqyLQD2Pg4B9F6qVow5tlE69lDv0TKMGUC+C9i
	 ilRoxjdogoYbHaxrkrXlCMBagbHoiXZPuXLBsR5PtUCApHqVhzjnhpMzyAYap/xbFw
	 Niz+KQibNssVK7KQAZq2n7xDg6QWmXEPYh+D+YlQPCGD5W9p8KgclHxa1mKhYNhmHX
	 A8uNTJsaOrXkLAP8burFvOm5rZ3vo8e7YOBgpc9wOrZMFOzfZ/vd1VZ8E5pWrclBMa
	 kf3AQEVVPSjwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/6] [v5] x86/olpc: select GPIOLIB_LEGACY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: linux-input@vger.kernel.org, lee@kernel.org, dmitry.torokhov@gmail.com, linux-leds@vger.kernel.org
In-Reply-To: <20260629130329.1291953-3-arnd@kernel.org>
References: <20260629130329.1291953-1-arnd@kernel.org>
 <20260629130329.1291953-3-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 13:25:05 +0000
Message-Id: <20260629132505.A53EB1F000E9@smtp.kernel.org>
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
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-8773-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,arndb.de:email,vger.kernel.org:from_smtp,smtp.kernel.org:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sashiko.dev:url];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:linux-input@vger.kernel.org,m:lee@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-leds@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3D9D6DB471

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch introduces `#include <linux/gpio/legacy.h>` but this file=
 does not exist in the tree, causing a fatal compiler error.
--

commit 0da87dc4a65872189dc6e83e56582e1870d842f6
Author: Arnd Bergmann <arnd@arndb.de>

x86/olpc: select GPIOLIB_LEGACY

This commit selects CONFIG_GPIOLIB_LEGACY for the OLPC platform to resolve
implicit declaration warnings for legacy GPIO functions. It also updates
dependencies for the cs5535audio driver to require the legacy GPIO library.

[ ... ]

> diff --git a/arch/x86/platform/olpc/olpc-xo1-sci.c b/arch/x86/platform/ol=
pc/olpc-xo1-sci.c
> index 30751b42d54ef..a5b47960ba32e 100644
> --- a/arch/x86/platform/olpc/olpc-xo1-sci.c
> +++ b/arch/x86/platform/olpc/olpc-xo1-sci.c
> @@ -9,7 +9,7 @@
> =20
>  #include <linux/cs5535.h>
>  #include <linux/device.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/legacy.h>

[Severity: Low]
Does this cause a build failure when setup_ec_sci() and other functions in
this file are compiled? It appears include/linux/gpio/legacy.h does not exi=
st
in the tree, and the legacy GPIO APIs might still be declared directly in
include/linux/gpio.h.

[ ... ]

> diff --git a/sound/pci/cs5535audio/cs5535audio_olpc.c b/sound/pci/cs5535a=
udio/cs5535audio_olpc.c
> index 122170a410d9e..cfdcc5bf4341e 100644
> --- a/sound/pci/cs5535audio/cs5535audio_olpc.c
> +++ b/sound/pci/cs5535audio/cs5535audio_olpc.c
> @@ -9,7 +9,7 @@
>  #include <sound/info.h>
>  #include <sound/control.h>
>  #include <sound/ac97_codec.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/legacy.h>

[Severity: Low]
Could this missing include file similarly break the compilation of
olpc_analog_input() in the sound driver?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629130329.1291=
953-1-arnd@kernel.org?part=3D2

