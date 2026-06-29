Return-Path: <linux-leds+bounces-8772-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ncDbGxx0Qmo+7gkAu9opvQ
	(envelope-from <linux-leds+bounces-8772-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 15:33:16 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BBB6DB40E
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 15:33:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LXydnBm0;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8772-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8772-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 395F13372566
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 13:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B9164071CA;
	Mon, 29 Jun 2026 13:18:45 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF8E4071CD;
	Mon, 29 Jun 2026 13:18:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739125; cv=none; b=WZWy/kcFLrbOh8DnYYLcQrYKAutfnLC/EXzwYW8qEZAfrjfTvVbQ1OavhX01+Jd+YDzTPEW9ApD3C79BBDEC31ZAt/4YXLreA7wsgczUEg/QXDSmh3vN2DyvWJfv64gDd0C7ptlYGAAClmtzJNH3U30OnJD+BKPL6V+sX+pD4Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739125; c=relaxed/simple;
	bh=6Io9H5zyDtsp8daiesBZnem1dHzaKslMO5y5DHLeTrM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=asblwp33kKzMBPbTPjgRQx5smz1OplweL9g24vUxHtUfKMw/aGLVSIv/I9fLuXcCcK3XTxVWrwXT8NQ3+jbWrOyQQsP/mwpEKwv6+qXE2/KVopZKQBBL7l2n4myNbE8RaWKnjUmYwZTXHp2BJANTZCfto9+2+4bIXGpk8aXsU9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LXydnBm0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD2611F000E9;
	Mon, 29 Jun 2026 13:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782739124;
	bh=G1bZy+k/fIknGmXTuSe4aFfBxUmStfVtFOkbU0UcOac=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LXydnBm0DVuoSwDD+7GykPA02e4u0B7FZzgUsY83TWX4KmmeUF5RwQzJgmwOSyvrg
	 PBU4auo2b7Hq7FyM74kVJyv3pzNuqx1QSoVHzHH2xlwQk6Wv10Z6XCAMC2YGqVa9IR
	 fwPwlgC2GHml4u65tcwMnBfyMM7BBIIc3m7cqI7CCXuG3ZVHPK6/6iRNQz1MPnJowM
	 TZMKL234qJaRqEXsY/oW80R6y+pCe9XHt87R04GUlC3k1s55dW2BiJPQ5na9WUk04H
	 hgnAvtqNy2++VPliAfSKwAYPXtx8bt96ODFG3bi3OVE0DGPYps+/SVxA13sr3LFyiB
	 Fi/IXQZpe4Alg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] [v5] Input: soc_button_array - select
 CONFIG_GPIOLIB_LEGACY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com, lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260629130329.1291953-4-arnd@kernel.org>
References: <20260629130329.1291953-1-arnd@kernel.org>
 <20260629130329.1291953-4-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 13:18:43 +0000
Message-Id: <20260629131843.BD2611F000E9@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-8772-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,lists.linux.dev:replyto,sashiko.dev:url,arndb.de:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:linux-input@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:lee@kernel.org,m:linux-leds@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: B4BBB6DB40E

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Duplicate inclusion of `<linux/gpio/consumer.h>`.
--

commit 2bb9f5b4a775c5b3c871a4230ef5de7eb9ac7ae6
Author: Arnd Bergmann <arnd@arndb.de>

Input: soc_button_array - select CONFIG_GPIOLIB_LEGACY

This commit adds dependencies and selects CONFIG_GPIOLIB_LEGACY for the
soc_button_array driver since it uses obsolete gpio interfaces. It also
replaces linux/gpio.h with linux/gpio/consumer.h in the driver source.

Link: https://lore.kernel.org/all/ah-1z9LhVG0wtfBw@google.com/

[ ... ]

> diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/s=
oc_button_array.c
> index b8cad415c62ca..eb11bf2e94362 100644
> --- a/drivers/input/misc/soc_button_array.c
> +++ b/drivers/input/misc/soc_button_array.c
> @@ -15,7 +15,7 @@
>  #include <linux/dmi.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/gpio_keys.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>

[Severity: Low]
This isn't a bug, but is it intentional to include <linux/gpio/consumer.h>
twice here?

>  #include <linux/platform_device.h>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629130329.1291=
953-1-arnd@kernel.org?part=3D3

