Return-Path: <linux-leds+bounces-8716-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mnQoDCKMO2p7ZggAu9opvQ
	(envelope-from <linux-leds+bounces-8716-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 24 Jun 2026 09:49:54 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 777546BC55E
	for <lists+linux-leds@lfdr.de>; Wed, 24 Jun 2026 09:49:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cgIZs5hJ;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8716-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8716-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D03B301E959
	for <lists+linux-leds@lfdr.de>; Wed, 24 Jun 2026 07:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC855346AF1;
	Wed, 24 Jun 2026 07:49:06 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF6F31197C
	for <linux-leds@vger.kernel.org>; Wed, 24 Jun 2026 07:49:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782287346; cv=none; b=MB1hCxPoRhTRQqWOhjV9QQZzVElu4X7MEodOjEeeC1jHhBPlxqNMiLIpxfwr2SfLE3nqdnelv/e1dBtGhm9q5kKmerz1kk+sYaOotDnaz/gafNmsfzpT7qtT9wt0LzUG0eydGlt9SFuRH3LHeVi/15sW2MP7UIuHBfS2bSJ3NaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782287346; c=relaxed/simple;
	bh=vX4QfUlbEfnAZElKi9vO2hbSwpQDdckp1GbPpQ+MBzA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GaY7N04m0jSSceQRM/aXOv+XZNyVRNt/bhA2R4cvzaVP1s2mcHYvZ3Dl/ECeD4jjf1oJW/HGopZaHy6zWnIKVHIOptYaNO15TZ9Zu5Pzf1iaANPhmgbY6iuUjYgpBantjnWYr/hLhMDZJdaPAszG69lVOUVClZIbGJH5lbzJe5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cgIZs5hJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 110BD1F000E9;
	Wed, 24 Jun 2026 07:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782287345;
	bh=/CbZytHv8bEvBcxEA6Yxy1c1mRjipCKEBLjTW76qx8k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cgIZs5hJFd4ZYaU/tr+Qbz1d2KMX/vHKEd8tvrscc74jOI4vpqVNTimkP8SojczmQ
	 RDGHmoLTHMqrAJsMIA7zxoCTiBI7dHAMDscjkNWAkfhs9zmLS46oMzu6gzWc+dIFbT
	 0A62otLldPJkl0M/5VbIcmnmawyxW0fJxezS0IRXEQSTck8CX2N0HdzR0ld9EteyRy
	 CHQRwMdBlhhmP4HSajofu1rFPz6yjsSGQoYirtCUfJcgzH5/MPCDpuiaj2ObuP6GqF
	 MOHhwXfv2tZtvcy3gigh86AUdT5pSSPn0ppmurpWesAISfH1SVJzrw3h7HS/jSb8cX
	 aDGHGq7TaM5nA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] leds: rgb: leds-qcom-lpg: Fix LED color balancing in
 HW pattern mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fenglin Wu" <fenglin.wu@oss.qualcomm.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260624-lpg-rgb-color-balance-fix-v2-1-c01b0e50caf6@oss.qualcomm.com>
References: <20260624-lpg-rgb-color-balance-fix-v2-1-c01b0e50caf6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 07:49:04 +0000
Message-Id: <20260624074905.110BD1F000E9@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-8716-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,pattern.data:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,smtp.kernel.org:mid,qualcomm.com:email,sashiko.dev:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 777546BC55E

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unprotected call to lpg_brightness_set() from lpg_pattern_mc_set()=
 leads to data races on shared chip state.
- [High] Short palindrome patterns trigger an edge case that permanently le=
aks LUT slots and silently fails to display the pattern.
--

commit 8e19f4c1d616341c9f4d4953aa70f990483e7985
Author: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW pattern mo=
de

This commit fixes an issue where the LED device operates in a white-balanced
mode regardless of intensity settings when triggered by a HW pattern. It sc=
ales
the pattern data according to the sub-led intensity and programs the HW
pattern separately for each LPG channel.

> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qco=
m-lpg.c
> index d7d6518de30f2..daf796df5706c 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
[ ... ]
> @@ -1087,20 +1098,48 @@ static int lpg_pattern_set(struct lpg_led *led, s=
truct led_pattern *led_pattern,
>  	 * duration of all steps.
>  	 */
>  	if (lpg->lut_base || lpg->lut_sdam) {
> -		lo_pause =3D pattern[0].delta_t;
> -		hi_pause =3D pattern[actual_len - 1].delta_t;
> +		prep->lo_pause =3D pattern[0].delta_t;
> +		prep->hi_pause =3D pattern[actual_len - 1].delta_t;

[Severity: High]
This is a pre-existing issue, but does the pattern preparation logic
handle short palindrome patterns correctly without leaking LUT slots?

When a minimal 4-element HW palindrome pattern is processed internally
(translating to a len of 2 internally), the ping_pong mode sets
actual_len =3D (2 + 1) / 2 =3D 1.

lpg_lut_store() then successfully allocates exactly 1 slot, setting
lo_idx =3D=3D hi_idx. However, lpg_lut_free() has an early exit:

static void lpg_lut_free(struct lpg *lpg, unsigned int lo_idx,
                         unsigned int hi_idx)
{
    ...
    len =3D hi_idx - lo_idx + 1;
    if (len =3D=3D 1)
        return;
    ...
}

Because lpg_brightness_set() checks for pattern_lo_idx !=3D pattern_hi_idx
before applying it, the pattern itself is ignored and not displayed.=20
Furthermore, the early return in lpg_lut_free() prevents the bitmap from ev=
er
being cleared, permanently leaking the allocated slot.

Could this lead to eventual resource exhaustion for pattern assignments?

>  	} else {
>  		if (delta_t !=3D pattern[0].delta_t || delta_t !=3D pattern[actual_len=
 - 1].delta_t)
> -			goto out_free_pattern;
> +			goto out_free;
[ ... ]
> @@ -1144,23 +1182,88 @@ static int lpg_pattern_single_set(struct led_clas=
sdev *cdev,
>  }
> =20
>  static int lpg_pattern_mc_set(struct led_classdev *cdev,
[ ... ]
> +out_unlock:
> +	mutex_unlock(&lpg->lock);
> +	kfree(scaled);
> +out_free_prep:
> +	kfree(pattern.data);
> =20
> -	ret =3D lpg_pattern_set(led, pattern, len, repeat);
>  	if (ret < 0)
>  		return ret;
> =20
> -	led_mc_calc_color_components(mc, LED_FULL);
>  	lpg_brightness_set(led, cdev, mc->subled_info);

[Severity: High]
This isn't a bug introduced by this patch, but does calling
lpg_brightness_set() here outside of the lpg->lock lead to data races?

The lpg->lock mutex is explicitly released just prior to this call. However,
lpg_brightness_set() updates chip-wide shared state. For instance, it calls
lpg_set_pbs_trigger() which performs an unprotected read-modify-write on
lpg->pbs_en_bitmap:

static int lpg_set_pbs_trigger(...)
{
    ...
    lpg->pbs_en_bitmap |=3D lut_mask;
    ...
}

Concurrent sysfs accesses or pattern triggers invoking lpg_pattern_mc_set()
could race here alongside other brightness updates, potentially causing
data corruption in the shared state. Is it safe to leave this invocation
unprotected?

>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624-lpg-rgb-co=
lor-balance-fix-v2-1-c01b0e50caf6@oss.qualcomm.com?part=3D1

