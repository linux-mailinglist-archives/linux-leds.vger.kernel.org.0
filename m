Return-Path: <linux-leds+bounces-9097-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ov+XCY+TV2pwXQAAu9opvQ
	(envelope-from <linux-leds+bounces-9097-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2026 16:05:03 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D54475F230
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2026 16:05:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=oyal3+F6;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9097-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-9097-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8DF59300107D
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2026 13:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB9EC3043DB;
	Wed, 15 Jul 2026 13:51:57 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B249305680;
	Wed, 15 Jul 2026 13:51:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123517; cv=none; b=lw3sjWp2CCW8m9IGfY/V+FLDc6jTJY0HVs4BF7dnqRPMMTscuxVTLwF71HJc4rvh+QbRfMUjkA8YfWMeuR4cmQa56MsM0+r3ksmazRUJ6NyGtzvW629IVdgNPoQreVsEuM8gSUq3rLrlFo6/ha5jIjk/Y1h9aNY3BdIo1V2go4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123517; c=relaxed/simple;
	bh=/aKDa2kaqUVRk9ufeRGSTFGuljIVmQiABhfBmKVd91I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E1oOrU6CGhVwK3/W3dezChGQelLuvVIf03nuaRirUvofvXWi539JJ991F0owERHKxCsyqBmtW6poJxpD5WxBvQ7vrAJInKZcArOF7d3LViEDnpZFeELKWazfdmoRSEzNDKbAH4y1p52l4zE4v5dexsWVursia0r/PniT06F2Fw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oyal3+F6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5C311F000E9;
	Wed, 15 Jul 2026 13:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784123516;
	bh=hZoF7RerIR03yZN4MonDtp4YtuKsc+TsPXE0SJkdkUE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oyal3+F6tj/+ZlA9CIbnH+YxbMnHHyabmXQYG4oBfPbFwnfWq6zwO9Zh64mLTIYCE
	 eq0WjjsopygRa00PIyDK4mPgrosr6wTUytmKJpBALTlqS6neK7sq//Q8Pqh/DoCo7g
	 CTDDOcdeS0zHyNx6sasrGuFnJWZzx5hfdLY+3U9kL8Lfb6XQWDRii4eCOVpB8PHerC
	 +7uYkoMPTQtX+U5XBLCV/STi/oFodN/LrfY0aThOYjdnOtPtBxoypRRzQZws8gDWdZ
	 igsskStsQpcZgDrweEjvzXtS1vUcfEDUyCOlbMg3+aEvnsJ+wl4osrtEoFLqzw1XBq
	 g8nMQk6Gh270Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/4] dt-bindings: leds: nxp,pca963x: fix reg maximum
 for pca9635
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260715-monza-leds-v6-1-d1724bb7fe3d@oss.qualcomm.com>
References: <20260715-monza-leds-v6-0-d1724bb7fe3d@oss.qualcomm.com>
 <20260715-monza-leds-v6-1-d1724bb7fe3d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 13:51:55 +0000
Message-Id: <20260715135155.E5C311F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-9097-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,smtp.kernel.org:mid,qualcomm.com:email,vger.kernel.org:from_smtp,sashiko.dev:url];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D54475F230
X-Rspamd-Action: no action

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message claims to tighten the node name regex from `[=
0-9a-f]+` to `[0-9a-f]` to match the single-digit hardware limit. However, =
this change was only applied to the top-level `patternProperties`. The corr=
esponding regexes inside the `allOf` conditional blocks for older chip gene=
rations were neglected and still allow multiple hex digits.
--

--- Patch [1]: [PATCH v6 1/4] dt-bindings: leds: nxp,pca963x: fix reg maxim=
um for pca9635 ---
commit a500d493e0680c38dffc3b668e4fe9888ec4d0bd
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: dt-bindings: leds: nxp,pca963x: fix reg maximum for pca9635

This commit increases the maximum reg value to 15 in the top-level led node
to support 16 channels on the pca9635. It refactors the allOf conditionals
to give pca9634 its own block and changes the top-level regex constraint to
match a single hexadecimal digit.

> diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Do=
cumentation/devicetree/bindings/leds/nxp,pca963x.yaml
> index 938d0e48fe51b..4fda602912f7a 100644
> --- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
> +++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml

[ ... ]

> @@ -88,7 +88,13 @@ allOf:
>            properties:
>              reg:
>                maximum: 3
> -    else:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nxp,pca9634
> +    then:
>        patternProperties:
>          "^led@[0-9a-f]+$":

[Severity: Medium]
The commit message states the regex is tightened to single-digit [0-9a-f],
but is it intentional that the patternProperties inside the allOf blocks for
older generations still use the multiple-digit [0-9a-f]+ pattern?

While the top-level constraint handles the validation correctly, retaining
the '+' in the nested conditional blocks for pca9634 (and the pca9632 and
pca9633 block just above this hunk) leaves the schema internally
inconsistent with the stated intent.

>            properties:
>              reg:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-monza-leds=
-v6-0-d1724bb7fe3d@oss.qualcomm.com?part=3D1

