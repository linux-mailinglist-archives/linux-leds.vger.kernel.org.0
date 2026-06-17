Return-Path: <linux-leds+bounces-8639-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XATCIMW9MmoD5AUAu9opvQ
	(envelope-from <linux-leds+bounces-8639-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 17:31:17 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF13969B019
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 17:31:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=b+IPeK24;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8639-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8639-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A04053282711
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 15:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F704921AC;
	Wed, 17 Jun 2026 15:04:09 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0623543DA25;
	Wed, 17 Jun 2026 15:04:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708649; cv=none; b=hP5l7FfDuvyQf0bjbxrGjxbZ2FSalNpAJVCgI083Ksh0or5NGjatR27TDlXBnYGMn4wAxHzbg1oL4nFqrnb7cVYiyDWhWUj9iCROfaXIBYitM7AfDJjByKfs4IdEA8ywdCBYCT+cBe+BPl4ByJYjc9VWWUgUw51jZOel95QSruU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708649; c=relaxed/simple;
	bh=kO7E8cCF65wX2fhbdd0WlJoObMrQsek9ep9S1FmjxO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nEmgchbQsHpFEoq9ydaC83pIlOdG/HmSTTeI0Lbe6LFdlctQH1y2rJHyUepnDRBqTb/ice9rQaTTmYM9jaIe3YzF8meBIaqVDpWtIC4viIVUMMITJjvLsfzNRTPX++GnyFO/9jU31cBF8uKWjb0r411FiIRqoaSiVtucifSyhns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+IPeK24; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6044B1F000E9;
	Wed, 17 Jun 2026 15:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781708647;
	bh=mgcDr3xf6yHgWv+vs8BnqaJ+b3JMHi7fz0jCUM+mNn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b+IPeK244lbZjb4Bf2WUuvrVG0Z3aRIJlAvtRyg2tng2AELIlzrVlh+SDzm+9qie6
	 F2uchHIvm3gBOpshqjkHQp7+X/qYTV4B1I1+9Z0m/pq3IuTGsSLiN0y6wrxpzGotmC
	 1PzBdkFCSmFmam2zmLHk8lXNFWe09Xi2PwQtww0L9+mbpXJpkwV7q5rTIGZTvxxk1Y
	 18Zk8ogvgM3VotZMioVuDqyAVAtgMgdnQEzqjFHc2BEXY7Xyrq74lKdxnGtRcenVqR
	 K7jM5/oe/x7PFQFyyu+2W8bfEgz6lA98op2lxf8v5+w+789YkfWXqcO3JaZHnA5h/V
	 dM8Fwb2T7Ihyw==
Date: Wed, 17 Jun 2026 16:04:03 +0100
From: Lee Jones <lee@kernel.org>
To: Manuel Fombuena <fombuena@outlook.com>
Cc: pavel@kernel.org, vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/9] leds: st1202: stop pattern sequence before
 reprogramming
Message-ID: <20260617150403.GJ10056@google.com>
References: <GV1PR08MB849762937DA5B82DC89F1CC4C5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB84976729EED25ECB484835A4C5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GV1PR08MB84976729EED25ECB484835A4C5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:fombuena@outlook.com,m:pavel@kernel.org,m:vicentiu.galanopulo@remote-tech.co.uk,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[outlook.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-8639-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,outlook.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF13969B019

/* Sashiko Automation: Issues Found (3 Findings) */

Where the non-pre-existing issues considered?

On Fri, 05 Jun 2026, Manuel Fombuena wrote:

> The LED1202 datasheet (section 4.8) states that modifications to the
> Pattern Sequence Repetition register (PAT_REP) and pattern duration
> registers are only applied after the sequence has completed or been
> stopped. When the device is running in infinite loop mode (PAT_REP =
> 0xFF) the sequence never completes on its own, so these writes are
> silently ignored by the hardware.
> 
> Neither pattern_clear() nor pattern_set() stop the running sequence
> before modifying pattern registers, causing any subsequent pattern
> reprogramming to have no effect when the previous pattern was set to
> infinite repeat.
> 
> Fix this by clearing PATS in the Configuration register before touching
> any pattern registers in both functions, ensuring the hardware accepts
> the new values immediately.
> 
> Note that the LED1202 has a single global pattern sequencer shared by
> all channels: PATS, PATSR, the duration registers, and PAT_REP are
> chip-wide. Stopping the sequencer in pattern_clear() therefore halts
> any pattern running on other channels. This is an inherent hardware
> constraint; pattern_set() restarts the sequencer when a new pattern is
> programmed.
> 
> Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
> Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
> Assisted-by: Claude:claude-sonnet-4-6
> ---
>  drivers/leds/leds-st1202.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index 7f68d956f694..316ed8eb054f 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
> @@ -200,6 +200,10 @@ static int st1202_led_pattern_clear(struct led_classdev *ldev)
>  
>  	guard(mutex)(&chip->lock);
>  
> +	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
> +	if (ret != 0)
> +		return ret;
> +

[Severity: High]
Does clearing the PATS bit here permanently freeze actively running sequences
on all other channels?

Because the ST1202 uses a single global sequencer, stopping it here and never
restarting it seems to break multi-channel independence. The commit message
notes this is an inherent hardware constraint required to modify duration
registers. 

However, does clearing a channel's pattern actually require stopping
the sequencer, or can it be done simply by setting the channel's PWM
registers to 0 (which the datasheet doesn't restrict while running)? 

Is it necessary to stop the sequencer and zero the global duration registers,
or does this fundamentally break the independence of multi-channel
led_classdev instances?



>  	for (int patt = 0; patt < ST1202_MAX_PATTERNS; patt++) {
>  		ret = st1202_pwm_pattern_write(chip, led->led_num, patt, LED_OFF);
>  		if (ret != 0)
> @@ -226,6 +230,10 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
>  
>  	guard(mutex)(&chip->lock);
>  
> +	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
> +	if (ret != 0)
> +		return ret;
> +

[Severity: High]
Does clearing the PATS bit here permanently freeze actively running sequences
on all other channels?

Because the ST1202 uses a single global sequencer, stopping it here and never
restarting it seems to break multi-channel independence. The commit message
notes this is an inherent hardware constraint required to modify duration
registers. 

However, does clearing a channel's pattern actually require stopping
the sequencer, or can it be done simply by setting the channel's PWM
registers to 0 (which the datasheet doesn't restrict while running)? 

Is it necessary to stop the sequencer and zero the global duration registers,
or does this fundamentally break the independence of multi-channel
led_classdev instances?



>  	for (int patt = 0; patt < len; patt++) {

[Severity: High]
This is a pre-existing issue, but does setting a pattern on a single channel
destructively overwrite the globally shared pattern duration registers?

Looking at the subsequent loop in st1202_led_pattern_set():

	for (int patt = 0; patt < len; patt++) {
		ret = st1202_pwm_pattern_write(chip, led->led_num, patt, pattern[patt].brightness);
		if (ret != 0)
			return ret;

		ret = st1202_duration_pattern_write(chip, patt, pattern[patt].delta_t);
		if (ret != 0)
			return ret;
	}

The ST1202 hardware utilizes a single set of shared pattern duration
registers (ST1202_PATTERN_DUR). Because st1202_led_pattern_set() executes
as a per-channel led_classdev operation, directly overwriting these global
duration registers with the newly requested channel's delta_t timings will
silently corrupt the sequence timings of all other active channels.



[Severity: High]
This is a pre-existing issue, but looking at how the led_classdev callbacks
are initialized in st1202_dt_init():

	led->led_cdev.brightness_set = st1202_brightness_set;

Is it safe to assign a sleepable function to the non-blocking brightness_set
operation?

The LED subsystem strictly requires brightness_set to be non-blocking because
it is routinely invoked from atomic contexts (e.g., inside softirq timer
callbacks by ledtrig-timer or ledtrig-heartbeat). 

Since st1202_brightness_set() acquires a mutex and performs I2C bus
transactions:

static int st1202_brightness_set(struct led_classdev *ldev, enum led_brightness value)
{
	...
	guard(mutex)(&chip->lock);
	...
}

Calling it from these triggers will cause a scheduling while atomic kernel
panic.

Should this driver map its blocking I2C functions to the
brightness_set_blocking hook instead, which safely delegates execution to a
workqueue?

>  		if (pattern[patt].delta_t < ST1202_MILLIS_PATTERN_DUR_MIN ||
>  				pattern[patt].delta_t > ST1202_MILLIS_PATTERN_DUR_MAX)
> -- 
> 2.54.0
> 
> 

-- 
Lee Jones

