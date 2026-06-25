Return-Path: <linux-leds+bounces-8750-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vzaxJ0EEPWpEvwgAu9opvQ
	(envelope-from <linux-leds+bounces-8750-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 12:34:41 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E19056C4AEE
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 12:34:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=hfdUnYGB;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8750-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8750-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9AB8C3037495
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 421F33CF217;
	Thu, 25 Jun 2026 10:34:39 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2E4373BE7;
	Thu, 25 Jun 2026 10:34:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782383679; cv=none; b=cirXObF1qzohxKBsFNrdTHgfeZkmonp7m4uY5DZevGwY8mAVmOYzgh3fz7iMeTI0J3qyJ+vbB1b30BhI5lPO0EDyiVt2u9fIuxFTJpBGWWUy2FSlZeS984FILg3nEYj5HWWqps/jKs+HnlxCiXhitoBVy0VdXXpsCMHs2GxlNDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782383679; c=relaxed/simple;
	bh=X4ZobGz2AI4cBWfsWEJCeS9MKfDCaazmW57VpP40QSw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q50IIWvt7zSv7y7JWcgEnB9viib1bIJ7L8NC0t2OVXfn4s1cdzws6bRW+2Otv6CenRRYKB5/dWY0Bmgqi/0Wm3WFX5kaaXo1QPs20C6ubuaTV4dqRBQKwuEfEAnt2oussniy4HEz3rpZWR33milMAYiaXtV4zrDHv9KH65dBxFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hfdUnYGB; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 406061F000E9;
	Thu, 25 Jun 2026 10:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782383677;
	bh=tbP/RNRqhALmoaQm1x4Q5JnQe5ZRmlpsKJ45GXP+A0k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hfdUnYGBEGcTVYObQuaRmzT57MtLuPwBmcMoswvN8rRgYZLduMmsPx2cfJcVm5GbC
	 gwkJy/bAsO2unXbU657VElcDFNEjVpeLS05m6KCXmQwwCAtYtuDjZUjG0ERSECUfuF
	 7SWjdOWMmQP62CgnvMbhZm3KQ4fXAQEIxrmz3mmOZR/W/WtVhfWEJM0i4ouV8WhOVg
	 W17ei2PB4IiiNEyOmgU8SeImRd8p1C+hnIQc/P7dk87OYEFDCt0yWP6h7DOXSE6VZK
	 ekKsYImwZAqs1LWMwQNBvvrpNA3wCKwN9or6uxiWixDs2stE/fgvyuUuFzOlBgkh4i
	 ACRbLUyoggeiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/6 RESEND] dt-bindings: mfd: motorola-cpcap: convert
 to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, lee@kernel.org, linux-leds@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260625081812.33474-4-clamor95@gmail.com>
References: <20260625081812.33474-1-clamor95@gmail.com>
 <20260625081812.33474-4-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 10:34:36 +0000
Message-Id: <20260625103437.406061F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-8750-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:dmitry.torokhov@gmail.com,m:linux-input@vger.kernel.org,m:lee@kernel.org,m:linux-leds@vger.kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,smtp.kernel.org:mid,sashiko.dev:url,lists.linux.dev:replyto,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E19056C4AEE

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The YAML schema introduces a `ports` wrapper node for the `audio=
-codec`, which conflicts with the original TXT binding and existing device =
trees that define `port@X` directly as children.
- [Medium] The schema explicitly expects the power button subnode to be nam=
ed exactly `key-power`, but the in-tree device tree uses `button`.
- [Medium] The `spi-cs-high` property, which is physically required by the =
hardware and was explicitly listed as required in the legacy text binding, =
has been omitted from the `required` list in the YAML schema.
--

commit 30a40e2d4eb937fd9bbca306ed8246e061a54ab4
Author: Svyatoslav Ryhel <clamor95@gmail.com>

dt-bindings: mfd: motorola-cpcap: convert to DT schema

Convert devicetree bindings for the Motorola CPCAP MFD from TXT to YAML.

> diff --git a/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml b/=
Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
> new file mode 100644
> index 0000000000000..76705ea56805a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
[ ... ]
> +  audio-codec:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
[ ... ]
> +      ports:
> +        $ref: /schemas/graph.yaml#/properties/ports

[Severity: Medium]
Will this break validation for existing device trees?

The legacy text binding example shows port@0 and port@1 directly under the
audio-codec node, but this schema requires them to be wrapped in a ports
node. Because additionalProperties is set to false on audio-codec, direct
port@X nodes in existing device trees will be rejected.

[ ... ]
> +  charger:
> +    $ref: /schemas/power/supply/cpcap-charger.yaml#
> +
> +  key-power:
> +    $ref: /schemas/input/motorola,cpcap-pwrbutton.yaml#

[Severity: Medium]
Is it intentional to restrict the subnode name strictly to key-power?

Existing in-tree device trees use button for this node. By strictly matching
key-power, existing configurations will be rejected as an undocumented
property during schema validation.

[ ... ]
> +patternProperties:
> +  "^led(-[a-z]+)?$":
> +    $ref: /schemas/leds/motorola,cpcap-leds.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +  - spi-max-frequency

[Severity: Medium]
Does this schema incorrectly omit spi-cs-high from the required list?

The legacy text binding explicitly listed spi-cs-high as a required propert=
y.
Without it, incomplete device trees lacking this hardware-critical property
will incorrectly pass validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625081812.3347=
4-1-clamor95@gmail.com?part=3D3

