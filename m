Return-Path: <linux-leds+bounces-8894-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZUqsKW3rRmoOfgsAu9opvQ
	(envelope-from <linux-leds+bounces-8894-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:51:25 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F272D6FD4F2
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:51:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Qy3kRaYz;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8894-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8894-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9046C301E6FB
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 22:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E95D346E60;
	Thu,  2 Jul 2026 22:50:08 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A0F3C73EC
	for <linux-leds@vger.kernel.org>; Thu,  2 Jul 2026 22:50:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783032608; cv=none; b=aJGl6OxKMmg82RJtcLshWBdNSjP++fTfaZ9LwMR36M7p/QoWkTWqDJ1H2spVUy3jXLQqhCpBHBYJEL6DN2pyTGd/5BzuvWp9XCRtfYl0USq3zmb5YcobjYiU4MloBuA4GGGTgDBx0n/FYa6qfWUsscvlIFU5mXaUc6d1qdgMArA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783032608; c=relaxed/simple;
	bh=DBMXdQRpZqJDjrwDQy3R3Luit4cKqPoCa9oW2ACZIXU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QqfBhPb4ALHa8mlbvL/HhOzSfPxbsQFEAJzNxYl9wSvQWv8mIuOq0RtS6nxI5Til5oSycmDpy0otNRK3wAqL79NgCN190Nc+WfWges7pO0ArIliKKJYU08lXKJ9/db3yERWSevdWaQWt/HIh4cQQkqQjKD1Pr6TK1uF05xEnZEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qy3kRaYz; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E20411F000E9;
	Thu,  2 Jul 2026 22:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783032607;
	bh=R/SNBarhgEsrVG0ibRYX8zxrgI3IhJMP+4aOio3y2u8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qy3kRaYzL2LrKLATSJUfn55RPImrlqZ5q7voePBFLLuQXuKr5pFEvIRjocKHtW0s2
	 O7/zIXb0twn2AIUy3ZpR9+XMCWlv1fDzd9Khb8KQUoe5c3pCKlRu5DZwgHbGQfuXLw
	 WW+zENhAzjsaFYOIU/Tp6qbbpcIgkdzxyrgXCabWzXuRcsYZdmsT926rUZq7DbExRs
	 Rh5rHkcf4hrYHPH2HxdYpeKIdU5btGGfINF5xu1xs44MoVVoLFCcNI/1EstS3yHj3i
	 O8z4ks2+PyIUyYs2Xx0z5TPidRFpSvRx3cJPhWzmYpkZrvEpvoLmpDHC8dIrQ2XwGw
	 56vc/oRTW6hSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/9] leds: st1202: validate pattern input before
 stopping the sequence
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <GV1PR08MB84975929B6ED7CDFBCEB7D76C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB84975929B6ED7CDFBCEB7D76C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 22:50:06 +0000
Message-Id: <20260702225006.E20411F000E9@smtp.kernel.org>
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
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-8894-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[outlook.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fombuena@outlook.com,m:lee@kernel.org,m:linux-leds@vger.kernel.org,s:lists@lfdr.de];
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
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lists.linux.dev:replyto,outlook.com:email,smtp.kernel.org:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F272D6FD4F2

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] st1202_led_pattern_set() fails to clear or mark the remaining patt=
ern slots as skipped when len < ST1202_MAX_PATTERNS.
- [High] st1202_led_pattern_clear() unconditionally zeroes the shared globa=
l duration registers, destroying the timing of active sequences on all othe=
r LEDs.
--

commit 9126a03ff29680e83b737c78e164f544294aa400
Author: Manuel Fombuena <fombuena@outlook.com>

leds: st1202: validate pattern input before stopping the sequence

This commit moves input validation for pattern duration before taking the
mutex and interacting with the hardware. This prevents the chip from being
left in a stopped and partially written state if validation fails mid-loop.

> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index 316ed8eb054f9..a750c95ef3f89 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
[ ... ]
> @@ -235,10 +241,6 @@ static int st1202_led_pattern_set(struct led_classde=
v *ldev,
>  		return ret;
> =20
>  	for (int patt =3D 0; patt < len; patt++) {
> -		if (pattern[patt].delta_t < ST1202_MILLIS_PATTERN_DUR_MIN ||
> -				pattern[patt].delta_t > ST1202_MILLIS_PATTERN_DUR_MAX)
> -			return -EINVAL;
> -
>  		ret =3D st1202_pwm_pattern_write(chip, led->led_num, patt, pattern[pat=
t].brightness);
>  		if (ret !=3D 0)
>  			return ret;

[Severity: High]
This is a pre-existing issue, but does st1202_led_pattern_set() fail to cle=
ar
or mark the remaining pattern slots as skipped when len < ST1202_MAX_PATTER=
NS?

If a user writes a pattern of length L (where L < 8) to the sysfs pattern
attribute, this loop only iterates up to len, leaving the hardware duration
registers for slots len through 7 unmodified.

The ST1202 executes a fixed 8-slot sequence unless unused slots are explici=
tly
marked to skip by setting duration to 0.

Because the driver only programs the first L slots and abandons the remaini=
ng
slots without zeroing their duration registers, will the hardware sequencer
continue playing the stale durations and PWM values for the remaining steps
instead of truncating the pattern?

[Severity: High]
This isn't a bug introduced by this patch, but does st1202_led_pattern_clea=
r()
unconditionally zero the shared global duration registers?

drivers/leds/leds-st1202.c:st1202_led_pattern_clear() {
    ...
    for (int patt =3D 0; patt < ST1202_MAX_PATTERNS; patt++) {
        ...
        ret =3D st1202_write_reg(chip, ST1202_PATTERN_DUR + patt, 0);
    }
    ...
}

If a user sets a pattern on LED A, then clears the pattern on LED B using s=
ysfs,
this unconditional write to the global duration registers might destroy the=
 timing
of active sequences on all other LEDs.

The ST1202 uses a single global sequencer with chip-wide duration registers.
When a pattern is cleared on a single LED, writing 0 to all ST1202_PATTERN_=
DUR
registers marks the slots as skipped globally.

This instantly freezes or destroys the running pattern on all other LEDs sh=
aring
the chip. Should the driver only modify the target LED's PWM registers to v=
isually
clear it, without touching the shared timing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497C0B898=
789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D2

