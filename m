Return-Path: <linux-leds+bounces-9026-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cQTzNgVmUWr/DwMAu9opvQ
	(envelope-from <linux-leds+bounces-9026-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 23:37:09 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4BE73F062
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 23:37:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=e9BFdyNr;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9026-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-9026-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5781E30E21C5
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 21:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083E33DA7C5;
	Fri, 10 Jul 2026 21:28:35 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B963BBFB3;
	Fri, 10 Jul 2026 21:28:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718914; cv=none; b=LII1pecItFSec2yk4pqT/dFyEDnmJ/UqL5rDm2JVs9HbUF7kF2BPBkfBbGgOJ1LFPCujBHmQj+nHwr+QkKMNgtj312fxY6uE9HrQCsbM0/AmHEXX1tan/NOgS4qGlnZfHE6KEXwATQFF36zMD3zCPhUcXl717/KpLmJnP8q1Hks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718914; c=relaxed/simple;
	bh=UEriDjcVIZMjDfM6l4Pq1kVK76YVfwC4g5Lv+iuLTm8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o53YY667QB7tI8bTekU8fsycE4ESU2KMeTWfhhjZg/TDKOU2KPgd1Bsva1Q2KWqcIcjwv5QW11ZC5tsbNgGu69vqRC6GeVJLB67ZZ4dHR81SnFacdZ6cOm3dWLYlq4oHwjC3puQDNB5uAVJjci2FkhzWvzWBp7P3akEBO12u53A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e9BFdyNr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 573251F00A3A;
	Fri, 10 Jul 2026 21:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783718913;
	bh=sZbIHxZdHMUwSUkMQi5RMlFurBlSnpGea15ztHC/eOU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e9BFdyNrgK+jsJpBldZxxlEEdxUeBHlmr8mWldf3Ygr7mQbGq8ka4PNnlLruLDtMl
	 2CJdgxowQX1tF0YZoKh+2/REbSxkHN5tdeMKfy3vl9SQX8BywTi094jISJW8msWdx0
	 dJoQnSC/qIGeAfdUxwIAoC9xJoAFHKzj23bcDhnp7aIR4d/AJgqttMpfsZZxrr+bon
	 konhyJGq77vg4DKDaOkwFTD6vstpYJ4rc9+NE6T4uTjAExMwPrS3ZDd7FQHZzmpdj+
	 AXBdJP7AUO/VK1YbiK4LzOZlRWs6GalmCPLxIzSih1IoAUm7UuNVFbp2W5wTs85SBm
	 iYqmUTnNunaDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/6] [v6] x86/olpc: select GPIOLIB_LEGACY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: linux-input@vger.kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, dmitry.torokhov@gmail.com
In-Reply-To: <20260710211854.1371746-6-arnd@kernel.org>
References: <20260710211854.1371746-1-arnd@kernel.org>
 <20260710211854.1371746-6-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 21:28:32 +0000
Message-Id: <20260710212833.573251F00A3A@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-9026-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lists.linux.dev:replyto,smtp.kernel.org:mid,sashiko.dev:url,vger.kernel.org:from_smtp,arndb.de:email];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:linux-input@vger.kernel.org,m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:dmitry.torokhov@gmail.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 3E4BE73F062

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Replacing `#include <linux/gpio.h>` with `#include <linux/gpio/lega=
cy.h>` causes a fatal compile error because the new header file does not ex=
ist in the kernel tree.
--

--- Patch [5]: [PATCH 5/6] [v6] x86/olpc: select GPIOLIB_LEGACY ---
commit dfd246b7263a8d5eeb27b20b07f4d9310db7a8d6
Author: Arnd Bergmann <arnd@arndb.de>

x86/olpc: select GPIOLIB_LEGACY

This commit selects CONFIG_GPIOLIB_LEGACY for the OLPC platform to resolve
implicit function declaration errors for legacy GPIO functions. It also
updates the audio driver Kconfig to depend on GPIOLIB_LEGACY or !OLPC.

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
Does this header actually exist in the kernel tree? Compiling this file
with CONFIG_OLPC enabled appears to result in a fatal No such file or
directory error because include/linux/gpio/legacy.h is missing.

>  #include <linux/input.h>
>  #include <linux/interrupt.h>

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
Similarly, will this cause a build failure here for the same missing header
reason?

> =20
>  #include <asm/olpc.h>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710211854.1371=
746-1-arnd@kernel.org?part=3D5

