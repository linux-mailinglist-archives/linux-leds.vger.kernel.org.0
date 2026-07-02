Return-Path: <linux-leds+bounces-8897-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nWeWAw3tRmpnfgsAu9opvQ
	(envelope-from <linux-leds+bounces-8897-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:58:21 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D81A6FD516
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:58:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PPdFZUVC;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8897-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8897-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E5EE3009FAE
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 22:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5463BFAEE;
	Thu,  2 Jul 2026 22:58:18 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF1F381E93
	for <linux-leds@vger.kernel.org>; Thu,  2 Jul 2026 22:58:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783033098; cv=none; b=g5ZhcP8eSINz+a8Kx/hmWIzCKT1GIB1eLloepgK+HLGfMutJ8/vqbAeSV7mrhvw2web+ceCVSMp2IUltpyJzsBKGMIlqRDukht97B63v7rlsJKbTbCpEAbY+yg0W3Qfo19694GLhxfT74loGkEkzADqtib1+tnFbWRpxMJV8K7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783033098; c=relaxed/simple;
	bh=354RiTPrixHwK0wVp3SxuOY0/OTf3sEkodxdR2uhKjo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fKBp1dwmuGGAzAxfs+2aD8cQPmFtadriZtSFKkOFG2wH7q8q8Q5R+6OblhxB8nKn3ug/cfrc4YYezjYyyIpRgdEvLgGQcDFWNaqDdLlMQE2rp+oRo7fGyWaYC7d2sLXLk4HWfuOduxOgjbUYK+Mooaz10UslyEskzaRzT7fJJA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PPdFZUVC; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10B861F000E9;
	Thu,  2 Jul 2026 22:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783033097;
	bh=KBtBwc2PcvGYs7QggpiMUHjcl2R2Zu0fBC0Tt9vxSFg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PPdFZUVCTeSJgzhOU3eqjVDm4O3cjotkQnRKszI4vbsUgsOjnjDkk40hfAA7xEqFB
	 Ho6BY9TYSSE1SLsWx3K1uT7wyi4rfCcCYxCg86q/7JzeWwxXoBh01OuKFccLW7HDxC
	 nG6OxDklacAu/Kei01eHRTK2luyOmjhOp//FayMp4C73h6Qkwti6Nh/qy9McjxRGIQ
	 ia0wlkwxVQImgXmgXgjlvv+iSAvJnvPxWpHg10njGtU2xrOIMRKy9Yr8FGrVGWI1fr
	 vGioond8G+NnKHH6Q78MHGJJE9rJSC5+M5TDl6R2vo9b6BchQHdDAhtUQ+3C7/X6jQ
	 yejAD+bxJOAvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 9/9] leds: st1202: correct and extend hw_pattern
 documentation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <GV1PR08MB8497B2FB4F5AC4B142790CE5C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB8497B2FB4F5AC4B142790CE5C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 22:58:16 +0000
Message-Id: <20260702225817.10B861F000E9@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-8897-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[outlook.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fombuena@outlook.com,m:linux-leds@vger.kernel.org,m:lee@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
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
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,lists.linux.dev:replyto,outlook.com:email,smtp.kernel.org:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D81A6FD516

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware pattern brightness values are not scaled to the 12-bit PW=
M range, resulting in extremely dim patterns. The documentation update mask=
s this bug by incorrectly blessing the 0-255 range.
- [High] The driver lacks bounds checking for the `repeat` count, leading t=
o silent integer truncation. The documentation update inappropriately enshr=
ines this hardware artifact, breaking API consistency.
--

commit 77ce9e120b28b32a84e379b2ca92614b4ebbf1aa
Author: Manuel Fombuena <fombuena@outlook.com>

leds: st1202: correct and extend hw_pattern documentation

The commit updates the hardware pattern documentation for the ST1202 LED
driver. It adds a brightness range of 0-255 and clarifies that writing -1 or
255 causes infinite repeats. It also removes a redundant trailing sentence.

> diff --git a/Documentation/leds/leds-st1202.rst b/Documentation/leds/leds=
-st1202.rst
> index a2353549469ee..ed32eb3a27d45 100644
> --- a/Documentation/leds/leds-st1202.rst
> +++ b/Documentation/leds/leds-st1202.rst
> @@ -16,6 +16,7 @@ in terms of PWM duty-cycle and duration (ms).
>  To be compatible with the hardware pattern format, maximum 8 tuples of
>  brightness (PWM) and duration must be written to hw_pattern.
> =20
> +- Brightness range: 0-255

[Severity: High]
This is a pre-existing issue, but documenting 0-255 here appears to mask an
underlying bug in the driver.

The 8-bit brightness value (0-255) from the hw_pattern sysfs input is passed
directly to the 12-bit PWM write function without scaling:

drivers/leds/leds-st1202.c:st1202_led_pattern_set() {
    ...
    ret =3D st1202_pwm_pattern_write(chip, led->led_num, patt, pattern[patt=
].brightness);
    ...
}

Should the driver be updated to scale the brightness properly (e.g.,
brightness * 4095 / 255) so the hardware pattern isn't permanently
restricted to ~6.2% of its maximum brightness?

>  - Min pattern duration: 22 ms
>  - Max pattern duration: 5610 ms
> =20
> @@ -26,9 +27,7 @@ The format of the hardware pattern values should be:
>  ----------------------------
> =20
>  Specify a pattern repeat number, which is common for all channels.
> -Default is 1; negative numbers and 0 are invalid.
> +Default is 1. Writing 0 is invalid. Writing -1 or 255 repeats the
> +pattern indefinitely.

[Severity: High]
This isn't a bug introduced by this patch, but updating the documentation
to bless 255 as an infinite repeat value breaks the generic ledtrig-pattern
ABI contract.

The driver currently lacks bounds checking and passes the unvalidated repeat
integer directly to the 8-bit register write:

drivers/leds/leds-st1202.c:st1202_led_pattern_set() {
    ...
    ret =3D st1202_write_reg(chip, ST1202_PATTERN_REP, repeat);
    ...
}

Because of the implicit truncation to uint8_t, writing 256 causes it to loop
0 times, and writing 255 triggers the hardware's infinite loop instead of
looping 255 times.

Could we fix the bounds checking and truncation bug in the driver instead of
enshrining this hardware limit in the documentation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497C0B898=
789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D9

