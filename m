Return-Path: <linux-leds+bounces-8851-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8E9jKaiORmohYgsAu9opvQ
	(envelope-from <linux-leds+bounces-8851-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 18:15:36 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4726FA072
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 18:15:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Lz4VLf8M;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8851-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8851-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F16631552E2
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 16:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1D1B312815;
	Thu,  2 Jul 2026 16:05:01 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8E833F39C
	for <linux-leds@vger.kernel.org>; Thu,  2 Jul 2026 16:05:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783008301; cv=none; b=SE5f3fMhqw22bwz5bwcIi8h0vnhsrZy3jB0wVOzVO6Q3z1IeiWyRe/5pbLSkV+y7QnImf64ICuXTkZ4XkdDrdw+3mwgBmhVtvcPAxpq/AafjKXx4BfbjeN+vTR7QiOX0eWIsV4vbY/Q/WPjx4AB/cJRcxLWGLhHKyjuqgkSdWas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783008301; c=relaxed/simple;
	bh=3GFOgqtQwvmhOfI9GVUpD3b7eSJ2rZoHqYQDCDAZJO4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FeJ4HkH+sfhV7cOSAtAYadCCc9J52Ias+cCUp3JRfV8unnm5bTK02c4qRfdBWHMbON+/gCmPs87TlAQ2FYQl24gKuYKOnquwdNIyjTdZ8gUD81wlHW1ounY9tv70tX3M9w9+E4x50w8FJSUiyfpuJjpWnVzkZ9wvXQoQab3a5VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lz4VLf8M; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BC4E1F00A3A;
	Thu,  2 Jul 2026 16:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008300;
	bh=YjNwT7DO7XFbafH4oQO+7Rnj4SmXMTE48yFTMATjpmM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lz4VLf8MEPsv2De/bOoVii+Tqoj0rw6ZxQ55wmBKMAZ7Fxg41K7LqS9wiwbTSSzN/
	 bOqqtW7Xip1fLTtOVewvQokfkgl/oxwLCZi+NlbLIO+/EB85XzLjOvGe//ODdmeUbq
	 /jIjUE9KC0pLdM3eSBpSTfffzpBwbZO9iufFEukucp7OxuPuWaq4cG7okimZa9fFWu
	 M4R41h7ihaccpmRgbfcFkRVv0ck1dqz9bGn0afbAoV1JmC/3MANXRqmXcQZRKiXnsN
	 5Y1/Nm5YaM97hnvUrOEj/QkjSgsL2pjrhnDANnZJw42lgt/hKh/b4eUpD9oRr3v/nN
	 nDR+yOJkc9Hvg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] leds: pwm: Annotate leds[] with __counted_by()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mert Seftali" <mertsftl@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260702155452.67594-1-mertseftali@web.de>
References: <20260702155452.67594-1-mertseftali@web.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 16:04:59 +0000
Message-Id: <20260702160459.9BC4E1F00A3A@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-8851-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mertsftl@gmail.com,m:linux-leds@vger.kernel.org,m:lee@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,smtp.kernel.org:mid,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E4726FA072

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The addition of the `__counted_by(num_leds)` annotation causes an =
unconditional out-of-bounds trap during probe.
--

commit f2069ade09481403f091ed2758ef698b0c75c2cc
Author: Mert Seftali <mertsftl@gmail.com>

leds: pwm: Annotate leds[] with __counted_by()

This commit adds the __counted_by(num_leds) attribute to the flexible array
member leds[] in struct led_pwm_priv for bounds checking. It also updates
led_pwm_add() to accept the led_pwm_data element directly, leaving num_leds
to be incremented in the caller.

> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> index 6c1f2f50ff854..dabdf04235826 100644
> --- a/drivers/leds/leds-pwm.c
> +++ b/drivers/leds/leds-pwm.c
> @@ -36,7 +36,7 @@ struct led_pwm_data {
> =20
>  struct led_pwm_priv {
>  	int num_leds;
> -	struct led_pwm_data leds[];
> +	struct led_pwm_data leds[] __counted_by(num_leds);
>  };

[ ... ]

> @@ -193,9 +191,10 @@ static int led_pwm_create_fwnode(struct device *dev,=
 struct led_pwm_priv *priv)
> =20
>  		led.default_state =3D led_init_default_state_get(fwnode);
> =20
> -		ret =3D led_pwm_add(dev, priv, &led, fwnode);
> +		ret =3D led_pwm_add(dev, &priv->leds[priv->num_leds], &led, fwnode);

[Severity: High]
Does evaluating &priv->leds[priv->num_leds] before incrementing num_leds
trigger an out-of-bounds trap under UBSAN_BOUNDS or FORTIFY_SOURCE?

Because leds is now annotated with __counted_by(num_leds), the compiler
expects the valid indices to be less than num_leds. When this loop starts
in led_pwm_create_fwnode(), priv->num_leds is initially 0. Taking the addre=
ss
of index 0 when the count is 0 will fail the bounds check and trigger a
splat during driver probe.

>  		if (ret)
>  			return ret;
> +		priv->num_leds++;
>  	}
> =20
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702155452.6759=
4-1-mertseftali@web.de?part=3D1

