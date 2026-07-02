Return-Path: <linux-leds+bounces-8874-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HNGqJpuvRmpkbgsAu9opvQ
	(envelope-from <linux-leds+bounces-8874-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 20:36:11 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4006FC21E
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 20:36:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HOsdLWHp;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8874-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8874-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7759320920C
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 17:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57901320A37;
	Thu,  2 Jul 2026 17:58:47 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3029E35F179
	for <linux-leds@vger.kernel.org>; Thu,  2 Jul 2026 17:58:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783015127; cv=none; b=paC6mVgPTpLvKnwaXfgX+8bFn8hHXpFHnYBD0yHvgbszLMzkOt2iHAHip3P41hv1dQuQmKlvqpWi5wJdEXco6PDbOK2Po5X5MI+p8UDz23DvvuVChtmnH1+qHWRnNGR/pWq6kHIYMtlQ3in0J69Pc8ri4uIpm0mtEAkybiPbSbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783015127; c=relaxed/simple;
	bh=f1zfhpNEWgXWz7vbG5XxL4NdbYZ5y7nxFlWCUkToNIw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UL/HqE1xOl3RQJrps1wHekfET3frk22qBGZDG2C8tbgfo1n/6JCvBo3bcajuEAPfx2M4/k/LPWLIxWxcn77ftaX1CEJKZ7l4gicuRI/8pD/I2UhHdy0S/8OypCYeBDuGVH2V2cmltK3ybmzyMK59THs8wJfi4ynDfDqg9E96XEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HOsdLWHp; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A311F000E9;
	Thu,  2 Jul 2026 17:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783015125;
	bh=qnzVrTw0dpyo2HRK3UKzAD8wCCsruSIdf+ua2qY8yOo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HOsdLWHp/GCHaPOMdERMFNdxDqynwTaNV0vViXJgBJ4g/LuCWMXrp8ZAzOrt/cEF5
	 80QAlbgMcADMhaHw3cGmDC0E1RBKo8gdasOeZYfZBpf3x5uZLgzAVHt+CGCs/z23dW
	 GATMjcch3wZXGPF+hEb31nyEQWQWWX66QB7QklN1Ge2pC0p10Fjg862iaXFr497uls
	 TCsFBQTSQ39wnBOY8WcQRQOKnCt4oDsRof8FM3TSFTz7lgQoP0z/jYnSgtyNJL2Phj
	 ZclUdC+IXR6F+nnLzwjpd6C2N5mhKHoa6EjV7/rqb9gmEMTOJJ5/tGTiYDb2yiuqL/
	 q7igQ2j/AiXVA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/9] leds: st1202: validate pattern input before
 stopping the sequence
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <GV1PR08MB84971EE254E4D7A3B0178039C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB84971EE254E4D7A3B0178039C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 17:58:45 +0000
Message-Id: <20260702175845.A1A311F000E9@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-8874-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,outlook.com:email,sashiko.dev:url,lists.linux.dev:replyto,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF4006FC21E

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver improperly writes 8-bit brightness values directly into=
 a 12-bit PWM register without scaling, resulting in extremely dim pattern =
output.
- [High] The driver implements the `.brightness_set` callback with a functi=
on that sleeps, violating LED subsystem requirements and causing a panic in=
 atomic context.
- [High] Clearing one LED's pattern destructively resets the globally share=
d pattern sequencer and duration registers for all other LEDs.
--

commit 9797d63cea6ed2c2a29dd33d73d899810acde5ba
Author: Manuel Fombuena <fombuena@outlook.com>

leds: st1202: validate pattern input before stopping the sequence

Input validation for pattern duration is performed inside the write
loop, after the pattern sequence has already been stopped. This patch
moves all input validation before the mutex and before any hardware
interaction, so an invalid input leaves the chip state unchanged.

> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index 316ed8eb054f9..a750c95ef3f89 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
> @@ -228,6 +228,12 @@ static int st1202_led_pattern_set(struct led_classde=
v *ldev,
>  	if (len > ST1202_MAX_PATTERNS)
>  		return -EINVAL;
> =20
> +	for (int patt =3D 0; patt < len; patt++) {
> +		if (pattern[patt].delta_t < ST1202_MILLIS_PATTERN_DUR_MIN ||
> +				pattern[patt].delta_t > ST1202_MILLIS_PATTERN_DUR_MAX)
> +			return -EINVAL;
> +	}
> +
>  	guard(mutex)(&chip->lock);
> =20
>  	ret =3D st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHF=
T);
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

[Severity: High]
This isn't a bug introduced by this patch, but does this function improperly
write 8-bit brightness values directly into a 12-bit PWM register without
scaling?

Because the input brightness value is bounded to max_brightness (255) by
the subsystem, the upper 8 bits in st1202_pwm_pattern_write() appear to
always be 0:

drivers/leds/leds-st1202.c:st1202_pwm_pattern_write() {
    ...
    value_h =3D (u8)(value >> 8);
    ...
}

Will this result in extremely dim pattern output (maximum of 6.2% brightnes=
s)
and render the pattern feature functionally broken?

>  		if (ret !=3D 0)
>  			return ret;

[ ... ]

Additionally, there are a few other pre-existing issues in this driver
that I noticed:

[Severity: High]
This is a pre-existing issue, but does the driver inappropriately register a
sleeping function as the non-blocking .brightness_set callback?

drivers/leds/leds-st1202.c:st1202_dt_init() {
    ...
    led->led_cdev.brightness_set =3D st1202_brightness_set;
    ...
}

When a trigger (like the timer trigger) calls this from atomic context,
st1202_brightness_set() takes a mutex and performs I2C operations which can
sleep:

drivers/leds/leds-st1202.c:st1202_brightness_set() {
    ...
    guard(mutex)(&chip->lock);
    ...
}

Will this cause a panic in atomic context? Should the driver only implement
.brightness_set_blocking to ensure the LED core defers the work to a
workqueue?


[Severity: High]
This is a pre-existing issue, but does clearing one LED's pattern
destructively reset the globally shared pattern sequencer for all other LED=
s?

In st1202_led_pattern_clear(), it writes directly to the global configurati=
on
register, disabling the pattern sequencer for all LEDs on the chip:

drivers/leds/leds-st1202.c:st1202_led_pattern_clear() {
    ...
    ret =3D st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHF=
T);
    ...
}

It also appears to blindly zero out the globally shared duration registers:

drivers/leds/leds-st1202.c:st1202_led_pattern_clear() {
    ...
    ret =3D st1202_write_reg(chip, ST1202_PATTERN_DUR + patt, 0);
    ...
}

Will this corrupt any sequences currently running on other channels on the
same chip?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB84972A16ED=
557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D2

