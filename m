Return-Path: <linux-leds+bounces-8956-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dZxhA5DdTWpP/QEAu9opvQ
	(envelope-from <linux-leds+bounces-8956-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 08 Jul 2026 07:18:08 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B6F721C10
	for <lists+linux-leds@lfdr.de>; Wed, 08 Jul 2026 07:18:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=H2UMaXnN;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8956-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8956-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A42AA3005D2D
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jul 2026 05:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC6D331222;
	Wed,  8 Jul 2026 05:17:18 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC597285072
	for <linux-leds@vger.kernel.org>; Wed,  8 Jul 2026 05:17:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783487838; cv=none; b=lKEvHbysSItSXTlQaDp1yJD4/rrWgnAWwhW0QXpDGbxNcKbbT7XvET7xGpawVMam/Q8E37iso4GoQrugkiEDGkxPZnogTgGaYZf+Mzk2KqxnLrRKTe1A3l8TxJpMv5xX0OLzhvnB+ap8OJbrMu4Eqh7FiuF62OOjSX9s37PzS5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783487838; c=relaxed/simple;
	bh=/130sFCQa/nQMGNgvO5a2p/nwVsdMoFLllBlDnyAfRs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dHz0CW9LyVOFiBl/KylwqWNVVfNXg4C0IDtWYTCefk1NAG9GFL6eVRrmWEOx/f+wfAlxm5KZU3TKV1tRzIsdTlfSh3WYbwktOQC9pBXiYpF2vkc0GccW5ZEhOE2g/2UwusKR6BHzoJ0mV2EoKhZzayy9s7SSDQUoB6TnAEz9YaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2UMaXnN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C4241F000E9;
	Wed,  8 Jul 2026 05:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783487836;
	bh=LeS1hx9TGHh8GKN3++5RtYSsvSUvAXnGRqAguFrM7RU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H2UMaXnNL9+9aIWh4xDzolwq2B30CtF+Y+BN+CQ8DEvSslWbNraLz3ummOVSKPOCG
	 oM/oB5hYIkbuCA0ixXL+8LRYOfMPR4wR0TC4ihxNBw9xmPqT3YTH3/IC7iVXef/K+I
	 bE65HUp71rTDxRCdGP9pr7i8gUg3lMxg9aAX/8uegKlfcFTWmIcHr+VF0oCrsVBDCA
	 KtuPeCeMXC5T7qVtnTCs4yGrwTMe/fbNQQ6FALAvWF2NZO5UwvwwdK3nZFWlenuW83
	 420+iORyf04pC3i0Ly+g4qPAUAa19PtgtyTkbixqcmJqqDrNJKM2fOkBc6YSg1KJUw
	 DOJLdlMbttSrg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] leds: rgb: leds-qcom-lpg: Fix LED color balancing in
 HW pattern mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fenglin Wu" <fenglin.wu@oss.qualcomm.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260707-lpg-rgb-color-balance-fix-v5-1-99e2d73084fc@oss.qualcomm.com>
References: <20260707-lpg-rgb-color-balance-fix-v5-1-99e2d73084fc@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 05:17:15 +0000
Message-Id: <20260708051716.3C4241F000E9@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-8956-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:fenglin.wu@oss.qualcomm.com,m:lee@kernel.org,m:linux-leds@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,msgid.link:url,lists.linux.dev:replyto,smtp.kernel.org:mid,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 57B6F721C10

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Mixing goto-based error handling with scope-based cleanup (__fre=
e and guard) in the same function.

Pre-existing issues:
- [High] `lpg_lut_free()` fails to clear LUT slots for valid patterns of le=
ngth 1, permanently leaking hardware LUT capacity.
--

--- Patch [1]: [PATCH v5] leds: rgb: leds-qcom-lpg: Fix LED color balancing=
 in HW pattern mode ---
commit d02ed2e49b5e3fa47ddff854cf6f3e5653dde705
Author: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW pattern mo=
de

This commit scales the pattern data according to the sub-led intensity=20
and programs the HW pattern separately for each LPG channel. This ensures=20
the LED device respects intensity settings instead of always operating in=20
a white-balanced mode.

Link: https://patch.msgid.link/20260629-lpg-rgb-color-balance-fix-v4-1-4db8=
592fb3c5@oss.qualcomm.com

> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qco=
m-lpg.c
> index d7d6518de30f2..7ba4765e7cfc2 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c

[ ... ]

> @@ -1087,43 +1098,64 @@ static int lpg_pattern_set(struct lpg_led *led, s=
truct led_pattern *led_pattern,
>  	 * duration of all steps.
>  	 */
>  	if (lpg->lut_base || lpg->lut_sdam) {
> -		lo_pause =3D pattern[0].delta_t;
> -		hi_pause =3D pattern[actual_len - 1].delta_t;
> +		prep->lo_pause =3D pattern[0].delta_t;
> +		prep->hi_pause =3D pattern[actual_len - 1].delta_t;
>  	} else {
>  		if (delta_t !=3D pattern[0].delta_t || delta_t !=3D pattern[actual_len=
 - 1].delta_t)
> -			goto out_free_pattern;
> +			return -EINVAL;
> +		prep->lo_pause =3D 0;
> +		prep->hi_pause =3D 0;
>  	}
> =20
> +	prep->data =3D no_free_ptr(pattern);
> +	prep->len =3D actual_len;
> +	prep->delta_t =3D delta_t;
> +	prep->ping_pong =3D ping_pong;

[Severity: High]
This is a pre-existing issue, but does lpg_lut_free() fail to clear LUT
slots for valid patterns of length 1?

When a user writes a 4-element palindrome pattern (which translates to=20
len =3D=3D 2 internal steps), lpg_prepare_pattern() calculates:

    if (ping_pong)
        actual_len =3D (len + 1) / 2;

making actual_len =3D 1.

Later, when this pattern is cleared or an error path triggers, lpg_lut_free=
()
checks:

    len =3D hi_idx - lo_idx + 1;
    if (len =3D=3D 1)
        return;

This early return seems to silently skip clearing the allocated bitmap slot=
,=20
permanently leaking hardware LUT capacity over time.

> +	return 0;
> +}
> +
> +static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_=
pattern,
> +			   u32 len, int repeat)
> +{
> +	struct lpg_channel *chan;
> +	struct lpg *lpg =3D led->lpg;
> +	struct lpg_pattern pattern;
> +	unsigned int lo_idx;
> +	unsigned int hi_idx;
> +	unsigned int i;
> +	int ret;
> +
> +	ret =3D lpg_prepare_pattern(lpg, led_pattern, len, repeat, &pattern);
> +	if (ret < 0)
> +		return ret;
> +
> +	guard(mutex)(&lpg->lock);
> =20
>  	if (lpg->lut_base)
> -		ret =3D lpg_lut_store(lpg, pattern, actual_len, &lo_idx, &hi_idx);
> +		ret =3D lpg_lut_store(lpg, pattern.data, pattern.len, &lo_idx, &hi_idx=
);
>  	else
> -		ret =3D lpg_lut_store_sdam(lpg, pattern, actual_len, &lo_idx, &hi_idx);
> +		ret =3D lpg_lut_store_sdam(lpg, pattern.data, pattern.len, &lo_idx, &h=
i_idx);
> =20
>  	if (ret < 0)
> -		goto out_unlock;
> +		goto free_pattern;
> =20
>  	for (i =3D 0; i < led->num_channels; i++) {
>  		chan =3D led->channels[i];
> =20
> -		chan->ramp_tick_ms =3D delta_t;
> -		chan->ramp_ping_pong =3D ping_pong;
> +		chan->ramp_tick_ms =3D pattern.delta_t;
> +		chan->ramp_ping_pong =3D pattern.ping_pong;
>  		chan->ramp_oneshot =3D repeat !=3D -1;
> =20
> -		chan->ramp_lo_pause_ms =3D lo_pause;
> -		chan->ramp_hi_pause_ms =3D hi_pause;
> +		chan->ramp_lo_pause_ms =3D pattern.lo_pause;
> +		chan->ramp_hi_pause_ms =3D pattern.hi_pause;
> =20
>  		chan->pattern_lo_idx =3D lo_idx;
>  		chan->pattern_hi_idx =3D hi_idx;
>  	}
> =20
> -out_unlock:
> -	mutex_unlock(&lpg->lock);
> -out_free_pattern:
> -	kfree(pattern);
> -
> +free_pattern:
> +	kfree(pattern.data);
>  	return ret;
>  }

[Severity: Medium]
Does this code mix goto-based error handling with scope-based cleanup?

The cleanup subsystem guidelines suggest avoiding mixing goto labels=20
(like free_pattern) and guard() declarations within the same function.=20
Since pattern.data is manually managed here alongside the guarded mutex,
this might make the code more prone to LIFO ordering mistakes or resource=20
leaks during future refactoring.

[ ... ]

> @@ -1144,23 +1176,86 @@ static int lpg_pattern_single_set(struct led_clas=
sdev *cdev,
>  }
> =20
>  static int lpg_pattern_mc_set(struct led_classdev *cdev,
> -			      struct led_pattern *pattern, u32 len,
> +			      struct led_pattern *led_pattern, u32 len,
>  			      int repeat)
>  {
>  	struct led_classdev_mc *mc =3D lcdev_to_mccdev(cdev);
>  	struct lpg_led *led =3D container_of(mc, struct lpg_led, mcdev);
> +	struct lpg *lpg =3D led->lpg;
> +	struct lpg_channel *chan;
> +	struct lpg_pattern pattern;
>  	unsigned int triled_mask =3D 0;
> -	int ret, i;
> +	unsigned int lo_idx;
> +	unsigned int hi_idx;
> +	unsigned int scale;
> +	unsigned int i, j;
> +	int ret;
> +
> +	ret =3D lpg_prepare_pattern(lpg, led_pattern, len, repeat, &pattern);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Allocate buffer for the per-channel scaled pattern copy */
> +	struct led_pattern *scaled __free(kfree) =3D
> +			   kmalloc_array(pattern.len, sizeof(*scaled), GFP_KERNEL);
> +	if (!scaled) {
> +		kfree(pattern.data);
> +		return -ENOMEM;
> +	}
> =20
>  	for (i =3D 0; i < led->num_channels; i++)
>  		triled_mask |=3D led->channels[i]->triled_mask;
> -	triled_set(led->lpg, triled_mask, 0);
> +	triled_set(lpg, triled_mask, 0);
> =20
> -	ret =3D lpg_pattern_set(led, pattern, len, repeat);
> +	led_mc_calc_color_components(mc, LED_FULL);
> +
> +	/*
> +	 * Each channel gets its own LUT block scaled by subled_info[i].brightn=
ess
> +	 * so the pattern respects the configured colour balance.
> +	 */
> +	guard(mutex)(&lpg->lock);
> +
> +	for (i =3D 0; i < led->num_channels; i++) {
> +		chan =3D led->channels[i];
> +		scale =3D mc->subled_info[i].brightness;
> +
> +		for (j =3D 0; j < pattern.len; j++) {
> +			scaled[j].brightness =3D DIV_ROUND_CLOSEST(
> +				(u32)pattern.data[j].brightness * scale, LED_FULL);
> +			scaled[j].delta_t =3D pattern.data[j].delta_t;
> +		}
> +
> +		if (lpg->lut_base)
> +			ret =3D lpg_lut_store(lpg, scaled, pattern.len, &lo_idx, &hi_idx);
> +		else
> +			ret =3D lpg_lut_store_sdam(lpg, scaled, pattern.len, &lo_idx, &hi_idx=
);
> +
> +		if (ret < 0) {
> +			/* Free LUT slots already allocated for previous channels */
> +			while (i-- > 0) {
> +				chan =3D led->channels[i];
> +				lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
> +				chan->pattern_lo_idx =3D 0;
> +				chan->pattern_hi_idx =3D 0;
> +			}
> +
> +			goto free_pattern;
> +		}
> +
> +		chan->ramp_tick_ms =3D pattern.delta_t;
> +		chan->ramp_ping_pong =3D pattern.ping_pong;
> +		chan->ramp_oneshot =3D repeat !=3D -1;
> +		chan->ramp_lo_pause_ms =3D pattern.lo_pause;
> +		chan->ramp_hi_pause_ms =3D pattern.hi_pause;
> +		chan->pattern_lo_idx =3D lo_idx;
> +		chan->pattern_hi_idx =3D hi_idx;
> +	}
> +
> +free_pattern:
> +	kfree(pattern.data);
>  	if (ret < 0)
>  		return ret;
> =20
> -	led_mc_calc_color_components(mc, LED_FULL);
>  	lpg_brightness_set(led, cdev, mc->subled_info);
> =20
>  	return 0;

[Severity: Medium]
Similarly here, does this function mix __free(), guard(), and a goto label?

The __free(kfree) and guard(mutex) helpers are used alongside the=20
free_pattern goto label to manually kfree pattern.data. The guidelines
recommend converting all resources in a function to scope-based cleanup=20
or none of them, to ensure consistent ownership semantics.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-lpg-rgb-co=
lor-balance-fix-v5-1-99e2d73084fc@oss.qualcomm.com?part=3D1

