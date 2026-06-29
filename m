Return-Path: <linux-leds+bounces-8752-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MWy5DxpEQmqP3AkAu9opvQ
	(envelope-from <linux-leds+bounces-8752-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 12:08:26 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7236D8B21
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 12:08:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=A0Acn+Wf;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8752-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8752-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A30630ADD41
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 10:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F22C3FFAD0;
	Mon, 29 Jun 2026 10:01:49 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF4C3FBB66
	for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 10:01:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727308; cv=none; b=nI+4VB5gBCIlV85ugygx1Si64SmP5p0Wzkc3ZDDWMM3MkO5RArHxkrOSjKUo3EhVyt+jVhdH3Y4iTf9QKLjk1Fn6Sz7dS5pfnfJ6yfzveTRvTYoxETZ4L5P/XmmF0Gc+Dya7va9OqizXhvqRF4w67jSWbTgb4hIExmT6gCry6vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727308; c=relaxed/simple;
	bh=T/GUAWAWv954fYx3zIuW6OvynKBmZ41jsdkQiv3Wtdo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YM4NvwV13EWxRxnJt0+D2rAgym/adVSiJB+S/Ewnv9s1/A2l3d7MTAXU0uGB0w13FJL55rBiLcx4dwvRiKtFVumv15eCzi2LIm4mReqVdjAHXpiEhN/zL3x419DJNi/BkMNgFugN1usSCEeykk36GTxvr4A5zu5scpOyiXdtxwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A0Acn+Wf; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 097A11F000E9;
	Mon, 29 Jun 2026 10:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782727307;
	bh=bUNDkHSqcyFxByB2ky6P8Z+VU9VqgnjbAIgVwbsRwrs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A0Acn+WffszU9xdSNZy5qYaKsfGZss4sQo70lTtNM7YXoYaaYMfgz4wZb1wP5H0FO
	 tFpmSlloCbNStk+6HiWItnluJT10nnVPKrzulOpc4QhDmxcMXEobgeST13CVoQHOin
	 Efd+KJoXrCSM2QpScXYMm4TuzACphNXXcdbxn/ooYwL/AGB6fFmdlaD2+L7n9vSxgD
	 lrmmWRYyGyyCRNv3W33PbDevdtNoJA4Qy93pGA5SjnKTLDWLIJAsnB3p0BzCfAjk82
	 sA/cKhlzOAtQCmqb7Vj7/je8+6HzJHagGA259aqK4lN+sMAL6xIiEpjq3pvItVb/mc
	 r6n3ynWvcZiTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] leds: rgb: leds-qcom-lpg: Fix LED color balancing in
 HW pattern mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fenglin Wu" <fenglin.wu@oss.qualcomm.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260629-lpg-rgb-color-balance-fix-v3-1-17796a06d799@oss.qualcomm.com>
References: <20260629-lpg-rgb-color-balance-fix-v3-1-17796a06d799@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 10:01:46 +0000
Message-Id: <20260629100147.097A11F000E9@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-8752-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:fenglin.wu@oss.qualcomm.com,m:lee@kernel.org,m:linux-leds@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,vger.kernel.org:from_smtp,pattern.data:url,sashiko.dev:url,smtp.kernel.org:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B7236D8B21

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Failing to inhibit cleanup of the __free() 'pattern' variable =
in lpg_prepare_pattern() causes it to be freed on success, leading to Use-A=
fter-Free and Double-Free in callers.
- [Low] Mixing goto-based error handling with scope-based cleanup (__free a=
nd guard) violates subsystem guidelines and causes a compilation error.
--

commit 6d61dc847ec65d99f5fb5a8faf11368f527f4b5c
Author: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW pattern mode

This patch updates the LED pattern programming to scale pattern data
according to sub-LED intensities. This ensures proper white balancing
when using hardware patterns.

> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qco=
m-lpg.c
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
[ ... ]
> @@ -959,23 +977,15 @@ static int lpg_blink_mc_set(struct led_classdev *cd=
ev,
> +static int lpg_prepare_pattern(struct lpg *lpg, struct led_pattern *led_=
pattern,
> +				u32 len, int repeat, struct lpg_pattern *prep)
>  {
[ ... ]
> -	pattern =3D kzalloc_objs(*pattern, len / 2);
> +	struct led_pattern *pattern __free(kfree) =3D kzalloc_objs(*pattern, le=
n / 2);
> +
>  	if (!pattern)
>  		return -ENOMEM;
[ ... ]
> +	prep->data =3D pattern;
> +	prep->len =3D actual_len;
> +	prep->delta_t =3D delta_t;
> +	prep->ping_pong =3D ping_pong;
> =20
> -	mutex_lock(&lpg->lock);
> +	return 0;
> +}

[Severity: Critical]
Since pattern is declared with __free(kfree), does returning 0 without
inhibiting cleanup cause pattern to be freed immediately upon function
exit? Could this be resolved by using no_free_ptr(pattern) when assigning
it to prep->data?

> +static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_=
pattern,
> +			   u32 len, int repeat)
> +{
[ ... ]
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

[Severity: Low]
Does mixing goto-based cleanup labels with scope-based cleanup like
guard(mutex) violate the kernel's cleanup guidelines? The guidelines
recommend either converting all resources to scope-based cleanup or not
using it at all in the same function.

[ ... ]
> -out_unlock:
> -	mutex_unlock(&lpg->lock);
> -out_free_pattern:
> -	kfree(pattern);
> -
> +free_pattern:
> +	kfree(pattern.data);
>  	return ret;
>  }

[ ... ]
>  static int lpg_pattern_mc_set(struct led_classdev *cdev,
> -			      struct led_pattern *pattern, u32 len,
> +			      struct led_pattern *led_pattern, u32 len,
>  			      int repeat)
>  {
[ ... ]
> +	/* Allocate buffer for the per-channel scaled pattern copy */
> +	struct led_pattern *scaled __free(kfree) =3D
> +			   kmalloc_array(pattern.len, sizeof(*scaled), GFP_KERNEL);
> +	if (!scaled) {
> +		ret =3D -ENOMEM;
> +		goto free_pattern;
> +	}

[Severity: Low]
Does jumping to free_pattern on this error path skip the declaration of
guard(mutex)(&lpg->lock) further down in the function? In C, jumping
forward over a variable initialized with a cleanup attribute results in a
compilation error.

[ ... ]
> +	guard(mutex)(&lpg->lock);
> +
> +	for (i =3D 0; i < led->num_channels; i++) {
> +		chan =3D led->channels[i];
> +		scale =3D mc->subled_info[i].brightness;
> +
> +		for (j =3D 0; j < pattern.len; j++) {
> +			scaled[j].brightness =3D DIV_ROUND_CLOSEST(
> +				(u32)pattern.data[j].brightness * scale, LED_FULL);

[Severity: Critical]
If pattern.data was already freed at the end of lpg_prepare_pattern(),
can this loop dereference freed memory?

> +			scaled[j].delta_t =3D pattern.data[j].delta_t;
> +		}
[ ... ]
> +free_pattern:
> +	kfree(pattern.data);

[Severity: Critical]
Would this unconditional kfree() trigger a double-free, since pattern.data
was already freed upon exiting lpg_prepare_pattern()?

>  	if (ret < 0)
>  		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-lpg-rgb-co=
lor-balance-fix-v3-1-17796a06d799@oss.qualcomm.com?part=3D1

