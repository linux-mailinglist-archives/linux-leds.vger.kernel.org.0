Return-Path: <linux-leds+bounces-8998-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V54aBS2bUGpo2QIAu9opvQ
	(envelope-from <linux-leds+bounces-8998-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 09:11:41 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E7308737F57
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 09:11:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="PF/aJYWS";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8998-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8998-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E48A13006804
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jul 2026 07:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4D163C1974;
	Fri, 10 Jul 2026 07:11:34 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7893C455B
	for <linux-leds@vger.kernel.org>; Fri, 10 Jul 2026 07:11:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783667494; cv=none; b=Tf3K9matCPuUBpOqWFVh888jsZCABiMr24ZskZrOeWO+ltc68agd58Hg+IbwEs9RdF2Tpx79jN0szu0MWJ2b1oRWFWbLD/zKk1xo9k+yaNH+uRUBQqS5BDAW46DEhTlvtoNkrrWDZbt5gDtqZFIh170ozfbvoCDi/wrWqoiUkOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783667494; c=relaxed/simple;
	bh=VGTLLQuBSuUogSj3HX5a5u26n+Q6oiGutPaMP2vTrzs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hhU5e3pgmtay0G8Z6Su8wsHaMOzM8f1p14q3z04z3+NoE4S5mMGGHjIWhsNaQtNWsXDbxHNeCKfzNCaNSmFrgxCfzMdgEBRwt2Rho7+Yv9Q7zohbr1PiSAUy8xzEp14pIGALc7/FZM3AA3dBocfRakszQoe3dm2V6s/zLRSq25o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PF/aJYWS; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AAB91F000E9;
	Fri, 10 Jul 2026 07:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783667492;
	bh=+Wy9L1LjieVy4SPiXbtIkdsfarcBeKONAtqXY1iPrmw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PF/aJYWShZgUg35y8L5m8XeXkVGm1O8326q5UUVlIdNiMqIvY1xKyfXD7SihXvSxB
	 H/DvW1HgS0G8odAuzVHM1wBO8viflF2YWsqnNsOTTA1btjXs3OL2Oie9dLHsbW+0UF
	 T0vY0valSqpWlHF32+DR+7wrNEDiY4cdNIQ0KjUJRfkXWfGPnSjG3w3MjtEu0BAISo
	 Y68KuG+JkpNI/P2MnFdiSz9eXBLx6Y/W6DXrRbhBo6fW0lIoj2aspQ4V+dOJX6X8Oo
	 kwwoaV2lDfdw6wiS/eRiRXy7J2CbupZ0/F7hpmz1SkOLxvdD3Ix7rsVd3ggdCXBZz0
	 X3qC1lPLX5rfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] leds: pwm: Annotate leds[] with __counted_by()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mert Seftali" <mertsftl@gmail.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260710070141.37214-1-mertsftl@gmail.com>
References: <20260710070141.37214-1-mertsftl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 07:11:31 +0000
Message-Id: <20260710071132.2AAB91F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-8998-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mertsftl@gmail.com,m:lee@kernel.org,m:linux-leds@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,smtp.kernel.org:mid,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E7308737F57

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The refactoring to use pointer arithmetic (led_data++) bypasses =
the newly added __counted_by() bounds checking.
--

--- Patch [1]: [PATCH v3] leds: pwm: Annotate leds[] with __counted_by() ---
commit c418c024dbd5055ff67d14fc9a244c4d09795169
Author: Mert Seftali <mertsftl@gmail.com>

leds: pwm: Annotate leds[] with __counted_by()

Adds the __counted_by() attribute to the flexible array member leds[] in
struct led_pwm_priv for bounds checking. To avoid UBSAN triggers during
initialization, the code is refactored to pass a led_pwm_data pointer into
led_pwm_add() instead of indexing the array directly.

> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> --- a/drivers/leds/leds-pwm.c
> +++ b/drivers/leds/leds-pwm.c
> @@ -81,10 +81,9 @@ static int led_pwm_default_brightness_get(struct fwnod=
e_handle *fwnode,
>  }
> =20
>  __attribute__((nonnull))
> -static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
> +static int led_pwm_add(struct device *dev, struct led_pwm_data *led_data,
>  		       struct led_pwm *led, struct fwnode_handle *fwnode)
>  {
> -	struct led_pwm_data *led_data =3D &priv->leds[priv->num_leds];

[ ... ]

>  static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv=
 *priv)
>  {
> +	struct led_pwm_data *led_data =3D priv->leds;
>  	struct led_pwm led;
>  	int ret;
> =20
> @@ -193,7 +192,7 @@ static int led_pwm_create_fwnode(struct device *dev, =
struct led_pwm_priv *priv)
> =20
>  		led.default_state =3D led_init_default_state_get(fwnode);
> =20
> -		ret =3D led_pwm_add(dev, priv, &led, fwnode);
> +		ret =3D led_pwm_add(dev, led_data++, &led, fwnode);

[Severity: Medium]
By decaying the flexible array to a pointer and using pointer arithmetic
(led_data++), doesn't the compiler lose the context needed to enforce the
__counted_by bounds check?

Compilers and sanitizers typically enforce __counted_by mitigations during
array subscripting operations like priv->leds[i]. Because priv->leds is
decayed into a standalone pointer and passed to led_pwm_add(), all bounds
information relative to priv->num_leds appears to be lost.

Will the primary objective of adding __counted_by be neutralized by passing
the element as a bare pointer here rather than using an index?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710070141.3721=
4-1-mertsftl@gmail.com?part=3D1

