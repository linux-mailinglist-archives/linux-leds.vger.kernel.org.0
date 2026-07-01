Return-Path: <linux-leds+bounces-8825-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EklIMwZXRWrT+goAu9opvQ
	(envelope-from <linux-leds+bounces-8825-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 01 Jul 2026 20:05:58 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC626F080B
	for <lists+linux-leds@lfdr.de>; Wed, 01 Jul 2026 20:05:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="YA9/lTjd";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8825-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8825-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2AB0C300AC26
	for <lists+linux-leds@lfdr.de>; Wed,  1 Jul 2026 18:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6093E3B7778;
	Wed,  1 Jul 2026 18:05:55 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C0D23EA83;
	Wed,  1 Jul 2026 18:05:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782929155; cv=none; b=JAN4AuXuv1QjEqw2qxQH+EpZgBzwscglcqeIEn9okEZQ2uiR5NyuPngZyyE91bC4GplxXQ8QxXXjky2PXHsUBsNiL2bqcX1c2pbBoYPhPDBOTTMo5FUwLa6E5BXxNGN3BpKXM7m9DTQ2Kjyk6Ts7gR9iXiRAbs+3gFb8Uz9qteo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782929155; c=relaxed/simple;
	bh=b/gz3IqFpL28wRyeleRz7L1AuNEn24IKT88NASwmGYk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rBI8+OdZaCyWk9XylXplvB4jMl6lGeiioEgXQoF4EbKmJTGmAg2ru5PugEYznYgjg5zCy1lGL5PhaazgBs+0ycR5llDiOdgtfUyDrDf3Q1Hkt9Oj5FJteTIAjhevFT0se6zepX5dhnmSn5teT7os02XlVRSMXJoOaxSnhrqEovk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YA9/lTjd; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 473121F000E9;
	Wed,  1 Jul 2026 18:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782929153;
	bh=L58VQtbf8b6TCNyRuQCqUj+UMo6M21NL7uDY0+cpnHg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YA9/lTjd8U/uj5zTAhdIYk9wTWsrZCM/DTqSeHo164pa9rEEn6VzGiQQcko5J1y6o
	 FpAjXL559VY7yYCNg3G29+B9Lcp3LGeUvCrci3cbBTFQfjigt32sTLVnLT9JHm8wv5
	 7CgUrBGib+gz8rlsmMpmToYKF0KyWwoMhVYWE30+aG3W8EjAS5IMbNO9ILTp4IquuQ
	 E9GoDzVj/wNljnQ+B367WebJOmpyx6mCuxX5jQhp1Sq/CKNHm7llEd051Z/tZFoxwL
	 aZ3DiQ5xOM1qoku6V/HzNGnfBNbMHL3Bgh+/cLESG1fwHqjro515e2TSlzfA85Bv5m
	 +vGGV9XsiLAXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: leds: lacie,ns2-leds: Convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ninad Naik" <ninadnaik07@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260701175330.1645927-1-ninadnaik07@gmail.com>
References: <20260701175330.1645927-1-ninadnaik07@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 18:05:52 +0000
Message-Id: <20260701180553.473121F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ninadnaik07@gmail.com,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-8825-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,lists.linux.dev:replyto,sashiko.dev:url,smtp.kernel.org:mid];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3EC626F080B

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The schema conversion incorrectly restricts LED child node names to=
 `^led(-[0-9a-z]+)?$`, which breaks `dtbs_check` validation for all existin=
g upstream device trees using this binding.
--

commit 6c59295f22b17d02a2b26847db54458f820fa4f3
Author: Ninad Naik <ninadnaik07@gmail.com>

dt-bindings: leds: lacie,ns2-leds: Convert to DT schema

Convert lacie,ns2-leds to DT schema.

> diff --git a/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml b=
/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
> new file mode 100644
> index 0000000000000..679a618906d80
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
> @@ -0,0 +1,87 @@
[ ... ]
> +properties:
> +  compatible:
> +    const: lacie,ns2-leds
> +
> +patternProperties:
> +  "^led(-[0-9a-z]+)?$":

[Severity: Low]
Will this restrictive regex cause existing device trees to fail dtbs_check?

The old text binding example used a child node named blue-sata, which does
not match this pattern. Since additionalProperties is set to false below,
nodes in existing device trees that don't start with led will be rejected
during validation.

Should this regex be relaxed to allow existing node names, or should those
device tree files be updated alongside this conversion?

> +    type: object
> +    $ref: common.yaml#
> +    unevaluatedProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701175330.1645=
927-1-ninadnaik07@gmail.com?part=3D1

