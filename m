Return-Path: <linux-leds+bounces-8871-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7qwRNVuvRmpEbgsAu9opvQ
	(envelope-from <linux-leds+bounces-8871-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 20:35:07 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 388B36FC1C0
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 20:35:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=kaX993ws;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8871-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8871-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76F1430F3117
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 17:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D439320A37;
	Thu,  2 Jul 2026 17:55:45 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E93C394470
	for <linux-leds@vger.kernel.org>; Thu,  2 Jul 2026 17:55:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783014945; cv=none; b=DT9NAWDZNftmv5PgDmo0Z2xpvpAkOb4xAUxMfsrIUVNO5pi8TNf6OjhIf2O6lCz61tRNVgKzS00M+zAjbz2LkMcFP30BGe7Vj6KNbkCdVQ3Q86jksJTEQ/EEjl7IreVNFjmNpF7Vmy9jYOqgzCrBDOeXH/yDqzD6oNgW5wdwO3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783014945; c=relaxed/simple;
	bh=ClaFp9OMVUEfTxI1iHybIBw/Oq1CtIISZhFSJ5P5Nb0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NBNeQHC9U+hcjiKcFyPDjCO8b7kgv1F97qTb3al1rXInrA7buySdJ1achxJkA53nOzf6mQh3AynzIHyDsEVttzaZ6vfm9sckd1SOaHzFwb4qgDhEO5eIyFiGMyuvr6tZ0ISlrh3E8nGM3g/hpjd3phKYRZzn6ufB+aRE8YVDQaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kaX993ws; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C12701F000E9;
	Thu,  2 Jul 2026 17:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783014943;
	bh=FeP89dWQ6KWj8vgFQjsmd18sDP7RWFRBOhyM436mpkA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kaX993wset/VDg3RiWPQ7v3uMoA7ILvqRXzFMmBa0GkPluGMoUaZSwZOhTJMLX3Wm
	 66YAG7+1VX9pIXsrf/8Y8nAQH+WHadokavqHPEZMJ5Wi4ChuQLu7QiDYdEesJlUd3q
	 Tk9+SAv2uMwK5z2AGoXyrdsbQr8fjWoI7rdeK65+SuTzw9y7HXxDAs3oQRQnJd/l7E
	 cVlQWdSXi/hR+Rf8koClBYC4kfTNWkynFgOb5uLf95WJoeemBAnR9aATfro4YjSkUS
	 5IbwpTALqsTW6ZwFmEzi5xft4nrP6vY6+23NgzK0uv6uhnyoUd3ogMbISHH8PbGJGY
	 G8EtQ3aIwmRXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/9] leds: st1202: stop pattern sequence before
 reprogramming
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <GV1PR08MB8497E8C6EB0630EE9312B273C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB8497E8C6EB0630EE9312B273C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 17:55:42 +0000
Message-Id: <20260702175542.C12701F000E9@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-8871-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,outlook.com:email,vger.kernel.org:from_smtp,lists.linux.dev:replyto,smtp.kernel.org:mid,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 388B36FC1C0

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] Clearing a pattern on one LED overwrites the global pattern dura=
tion registers, breaking patterns on other LEDs.
--

commit 386064b373f70c3a399e565edba1ae99f2fd73ed
Author: Manuel Fombuena <fombuena@outlook.com>

leds: st1202: stop pattern sequence before reprogramming

The LED1202 ignores modifications to pattern registers if the sequencer is =
in
infinite loop mode. This patch clears the PATS bit in the Configuration
register to stop the running sequence before reprogramming it.

> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index 7f68d956f6948..316ed8eb054f9 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
> @@ -200,6 +200,10 @@ static int st1202_led_pattern_clear(struct led_class=
dev *ldev)
> =20
>  	guard(mutex)(&chip->lock);
> =20
> +	ret =3D st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHF=
T);
> +	if (ret !=3D 0)
> +		return ret;
> +
>  	for (int patt =3D 0; patt < ST1202_MAX_PATTERNS; patt++) {
>  		ret =3D st1202_pwm_pattern_write(chip, led->led_num, patt, LED_OFF);
>  		if (ret !=3D 0)
>  			return ret;
>=20
>  		ret =3D st1202_write_reg(chip, ST1202_PATTERN_DUR + patt, 0);

[Severity: Medium]
This is a pre-existing issue, but does clearing a pattern on one LED
inadvertently break patterns on other LEDs?

When st1202_led_pattern_clear() is called to clear a single LED's pattern,
it zeros out the pattern duration registers for all 8 pattern steps as shown
in the loop above.

Because these duration registers are shared chip-wide among all LEDs,
overwriting them corrupts the timing for any other LEDs that are currently
running a pattern concurrently.

This patch makes the behavior actively destructive because adding the
sequencer stop ensures these duration writes are fully applied by the
hardware.

While the commit message notes that halting the sequencer is a hardware
constraint, is there a hardware requirement to also overwrite the shared
duration registers when clearing a single LED's pattern?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB84972A16ED=
557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D1

