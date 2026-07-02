Return-Path: <linux-leds+bounces-8869-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yHmVAnmwRmqxbgsAu9opvQ
	(envelope-from <linux-leds+bounces-8869-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 20:39:53 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DB46FC2EC
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 20:39:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=glmh3Cxx;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8869-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8869-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A73D7300BD61
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 17:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5453381E8E;
	Thu,  2 Jul 2026 17:55:17 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8353635F179
	for <linux-leds@vger.kernel.org>; Thu,  2 Jul 2026 17:55:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783014917; cv=none; b=scpTyk98W2KQFE/miqv2f/g4LBp4m86KBW7DwNInfP2p5M/2FnPq8NnUh1CIDFSHpVfTJz6QMQe8Hg4azRKomJe3+1X0YLF/eLMObyOTh6WR9++vQswlOnefHlLplzGd6L2bTKXM94O1SVCHPtSlczMG4ATU5LUD0CRXnQXSik4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783014917; c=relaxed/simple;
	bh=EIMOVVEuhgmz47QseyEe0QoVkikwcJ+1ZcksmDbK6Oo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MYB7vKg8Nan2cfoTNO5lUJSouWJjk5HDbnmWx6iM0hSm/Pma53Iw3kS98gcPfIECWxcwOUHleI4g+FcSfmBrjKCCme3v67O1Z6wie8vbLU2gBcALN2fCMVKl0KRvLog/bmiHz2bV2ysde8NEn2YWS+RB/YBVbZFvA/bMj9y0R/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=glmh3Cxx; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D83CB1F000E9;
	Thu,  2 Jul 2026 17:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783014916;
	bh=AsqsNL1ZN/UkM63n1Sm5y32NyeIPsEulcItQA0TKEbY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=glmh3CxxrcMEHypfpKkjUbvctSPGKeIRWxaHSWb4ZAwqSh4EFLZ7HTlSRD5Fg1tbM
	 /0ApbJwl2ANt+xnM09RuOoQ0DbXpHRrPDQ+rWzbFz+cHKFP7JnXeYJo6iGDiY7/rle
	 VyQYdXrXXf/s0NX3WOCzScpuOco4ENdpdlLi2AB3i9X0AMzNrpeXBEfQzaXp5RvB3I
	 IhQuW5wiT+ZFJZYlYKBTYJsY+TAVJtXW2KR18yJXX6afKi+TnqARXAiFrEgOqCK/JR
	 IlEch0XQ7HP+kRbC+mgAx6xC+kHBCwS6ksUBqoqmprpJ2+cv6SXAFdA4eYnmQmk9Ix
	 BdZcm2p6CE+qg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/9] leds: st1202: fix pattern duration prescaler and
 pattern_clear skip marker
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <GV1PR08MB8497E6FE3F611C57006E80EDC5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB8497E6FE3F611C57006E80EDC5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 17:55:15 +0000
Message-Id: <20260702175515.D83CB1F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8869-lists,linux-leds=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:fombuena@outlook.com,m:lee@kernel.org,m:linux-leds@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[outlook.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,lists.linux.dev:replyto,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,smtp.kernel.org:mid,vger.kernel.org:from_smtp,outlook.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 17DB46FC2EC

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver exposes a single global hardware sequencer as a per-LED=
 pattern, causing pattern operations on one channel to destructively overwr=
ite and halt patterns on all other channels.
- [High] The `brightness_set` callback points to a sleeping function, while=
 `brightness_set_blocking` fails to actually set the analog brightness.
- [Medium] `st1202_led_pattern_set()` fails to clear duration registers for=
 unused pattern steps, causing stale steps to leak into new, shorter patter=
ns.
- [Medium] Pattern brightness is written directly to 12-bit registers, but =
`max_brightness` is advertised as 8-bit (255), severely capping output.
--

commit 9be44f88b33b68ec231e7f9681b7161f1bb21c36
Author: Manuel Fombuena <fombuena@outlook.com>

leds: st1202: fix pattern duration prescaler and pattern_clear skip marker

The commit fixes the ST1202 LED driver where the pattern duration prescaler
calculation was off by one, causing durations to be too short. It corrects
the maximum duration constant to reflect the 8-bit register limit.
Additionally, it explicitly clears unused pattern slots by writing 0 to the
duration register to mark them as skipped.

> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index a750c95ef3f89..b4adade49898e 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
[ ... ]
> @@ -85,7 +85,7 @@ static int st1202_write_reg(struct st1202_chip *chip, i=
nt reg, uint8_t val)
> =20
>  static uint8_t st1202_prescalar_to_miliseconds(unsigned int value)
>  {
> -	return value / ST1202_MILLIS_PATTERN_DUR_MIN - 1;
> +	return value / ST1202_MILLIS_PATTERN_DUR_MIN;
>  }
> =20
>  static int st1202_pwm_pattern_write(struct st1202_chip *chip, int led_nu=
m,

[Severity: Medium]
This is a pre-existing issue, but is the brightness value getting scaled
properly to the hardware's 12-bit range?

In drivers/leds/leds-st1202.c:st1202_pwm_pattern_write():

    value_l =3D (u8)value;
    value_h =3D (u8)(value >> 8);

The user's requested pattern brightness is scaled to the advertised
max_brightness of 255, but the driver appears to pass this value directly
to the hardware's 12-bit PWM register (max 4095).=20

Does this cause requesting maximum brightness to cap the PWM duty cycle
at roughly 6.2%, making patterns extremely dim?

[ ... ]
> @@ -209,7 +209,7 @@ static int st1202_led_pattern_clear(struct led_classd=
ev *ldev)
>  		if (ret !=3D 0)
>  			return ret;
> =20
> -		ret =3D st1202_duration_pattern_write(chip, patt, ST1202_MILLIS_PATTER=
N_DUR_MIN);
> +		ret =3D st1202_write_reg(chip, ST1202_PATTERN_DUR + patt, 0);
>  		if (ret !=3D 0)
>  			return ret;
>  	}

[Severity: Medium]
This isn't a bug introduced by this patch, but while pattern_clear resets
all slots, does st1202_led_pattern_set() fail to clear duration registers
for unused pattern steps?

drivers/leds/leds-st1202.c:st1202_led_pattern_set() {
    for (int patt =3D 0; patt < len; patt++) {
        ret =3D st1202_pwm_pattern_write(chip, led->led_num, patt,
                                       pattern[patt].brightness);
        ...
        ret =3D st1202_duration_pattern_write(chip, patt,
                                            pattern[patt].delta_t);
    }
}

If a user programs a shorter pattern sequence after a longer one, the
loop updates only up to len steps, failing to zero out the durations of
the remaining ST1202_MAX_PATTERNS - len steps.=20

Will the hardware sequencer continue to execute the stale un-cleared
trailing steps?

[Severity: High]
This is a pre-existing issue, but does clearing the pattern for one LED
destructively overwrite and halt patterns on all other channels?

In st1202_led_pattern_clear():

    ret =3D st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHF=
T);

And in st1202_duration_pattern_write():

    return st1202_write_reg(chip, (ST1202_PATTERN_DUR + pattern),
                            st1202_prescalar_to_miliseconds(value));

Since ST1202_PATTERN_DUR and ST1202_CONFIG_REG are globally shared
registers, it appears that programming or clearing a pattern on one LED
corrupts the duration registers and sequencer state of all other active
patterns.=20

Is there a lack of isolation between independent LED devices on the same
chip?

[Severity: High]
This isn't a bug introduced by this patch, but are the brightness
callbacks mapped correctly in st1202_dt_init()?

drivers/leds/leds-st1202.c:st1202_dt_init() {
    ...
    led->led_cdev.brightness_set_blocking =3D st1202_led_set;
    led->led_cdev.brightness_set =3D st1202_brightness_set;
    ...
}

The brightness_set callback is strictly required to be non-blocking, but
it is mapped to st1202_brightness_set, which is an I2C-dependent sleeping
function.=20

Could this cause a kernel panic (scheduling while atomic) if a kernel LED
trigger calls it from a softirq context?

Additionally, st1202_led_set() acts only as an on/off toggle:

drivers/leds/leds-st1202.c:st1202_led_set() {
    ...
    return st1202_channel_set(led->chip, led->led_num, !!value);
}

Since this is assigned to brightness_set_blocking, it completely drops the
requested brightness magnitude.=20

Will this break sysfs writes if blocking is required?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB84972A16ED=
557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D3

