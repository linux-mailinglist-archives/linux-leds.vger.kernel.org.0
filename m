Return-Path: <linux-leds+bounces-8746-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0mm3LpPmPGpsuAgAu9opvQ
	(envelope-from <linux-leds+bounces-8746-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:28:03 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDE46C3CBA
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:28:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RiOF2Yqa;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8746-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8746-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ABCE4300CB10
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 08:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C93E37BE60;
	Thu, 25 Jun 2026 08:28:00 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3F01E32A2;
	Thu, 25 Jun 2026 08:27:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782376080; cv=none; b=em218E3ztUm5OC8mdrIksCNVIaDMrAvTJ1aOB1/zM3bBMjm31In4DVURgeL9ZQnGpFdGn/mrW9VK96fd4MFriKlaFf82iSujPblirPrFL77YIJI1f95iBmow5dOxhGuRIKcL496Yynuupfdp9iWkNXG736vOabq90i/v7H4E1UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782376080; c=relaxed/simple;
	bh=+coBmhYgyURRGwX3T53+GmiUvimHziGcSd7913hosSs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JgEX+fcRQecp3Fq4dci+Hq+PGzOVbmD9xihLDDIqbbwZefHxOCJUG6Q9eKvBecceYeFDWp+q7RUDTQPT2lNztyeCNKbUUTHh4Op+oCwggRddCeIVYkOIqNmyziWiZGGMzLQS5s7Y/kWnJQoZSIRhtv4595EEviSuhQvsOfa4sNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RiOF2Yqa; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E6CB1F000E9;
	Thu, 25 Jun 2026 08:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782376079;
	bh=D8agqbFKmtG4ZzlbSngzHpX9UjemAREGvQYvUlIKYmg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RiOF2YqagWxXV8sPBAW4o1LQ3VA3/8QsVQkIRdKTL7n6MbwxCREl8B7vxq5jhOOnR
	 YpHx4kvhZO4nGrDCAFEjGMxSzejGlWVwa/XuM256QAf1eHeSn28nKhFhQqXjP15x+L
	 rb0+GaB285ijiSVgqFxaf5CyTLRb5BV7vgGalj1fktP5nA3i1RsvIpCojh4DaEFucN
	 tKq2RQnPCo1GfoODZoRSRJ4uQnwxJCSaj9oF9bnQ7gBKerMnZyNv3YiMzNI0eEYIMs
	 ArWux3N4Kq/6f3HfjyEB+hckwcdogdNFeS1Xlws53eHkdKLXhdsnAfx1u/WV0xUJzp
	 6WWckhQa21sMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/6 RESEND] dt-bindings: mfd: motorola-cpcap:
 document Mapphone and Mot CPCAP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org, dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260625081812.33474-5-clamor95@gmail.com>
References: <20260625081812.33474-1-clamor95@gmail.com>
 <20260625081812.33474-5-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 08:27:58 +0000
Message-Id: <20260625082758.8E6CB1F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-8746-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:lee@kernel.org,m:conor+dt@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-input@vger.kernel.org,m:linux-leds@vger.kernel.org,m:conor@kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,sashiko.dev:url,vger.kernel.org:from_smtp,lists.linux.dev:replyto,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5BDE46C3CBA

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The newly added device tree compatible strings `motorola,mapphone-=
cpcap` and `motorola,mot-cpcap` are defined as a standalone enum without a =
fallback, forcing device trees to either break schema validation or break O=
MAP platform initialization.
--

commit 6926040210bec2501eaa0528dd29bde0ac318c6c
Author: Svyatoslav Ryhel <clamor95@gmail.com>

dt-bindings: mfd: motorola-cpcap: document Mapphone and Mot CPCAP

Add compatibles for Mapphone and Mot CPCAP subdevice compositions. Both
variations cannot use st,6556002 fallback since they may be based on
different controllers.

> diff --git a/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml b/=
Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
> --- a/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
> +++ b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
[ ... ]
> @@ -14,9 +14,14 @@ allOf:
> =20
>  properties:
>    compatible:
> -    items:
> -      - const: motorola,cpcap
> -      - const: st,6556002
> +    oneOf:
> +      - enum:
> +          - motorola,mapphone-cpcap
> +          - motorola,mot-cpcap

[Severity: High]
Will this schema change break OMAP platform initialization for devices=20
using these new variants?

The schema defines the new compatibles as a standalone enum. However, the
OMAP platform initialization code explicitly relies on finding a node with =
the
generic motorola,cpcap compatible to configure the PMIC:

arch/arm/mach-omap2/pmic-cpcap.c:omap4_cpcap_init() {
	...
	if (!of_find_compatible_node(NULL, NULL, "motorola,cpcap"))
		return -ENODEV;
	...
}

If a device tree conforms to this new schema (using only the specific varia=
nt
compatible), the platform code will fail to find the node, breaking PMIC se=
tup
and CPU voltage scaling.=20

Conversely, if a device tree defines an items array using motorola,cpcap as=
 a
fallback to successfully initialize the platform code, it will fail schema
validation because this oneOf block expects either a standalone enum or the
specific ["motorola,cpcap", "st,6556002"] items list.

Should the new variants include motorola,cpcap as a fallback in an items
array, or does the OMAP platform code need an update to recognize these
new standalone compatibles?

> +
> +      - items:
> +          - const: motorola,cpcap
> +          - const: st,6556002
> =20
>    reg:
>      maxItems: 1

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625081812.3347=
4-1-clamor95@gmail.com?part=3D4

