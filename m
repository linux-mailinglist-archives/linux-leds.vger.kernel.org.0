Return-Path: <linux-leds+bounces-8785-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ePz4BQyBQmrq8gkAu9opvQ
	(envelope-from <linux-leds+bounces-8785-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 16:28:28 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E78A6DC099
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 16:28:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GljNOyEk;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8785-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-leds+bounces-8785-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 94620301474B
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 14:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A955840E8D4;
	Mon, 29 Jun 2026 14:26:52 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0135040E8F9;
	Mon, 29 Jun 2026 14:26:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743212; cv=none; b=aUWvsmhCu1ZJm5vHcISW0/1yg5+sQ/R7Y4ZJBBK/i4SeWB51zWiGdK6Qbk2uJx3Fj1LDFOz87IWeGLfMV+wPoujsGB7okcLrL6u2gBfBq5VHIqoBKT6pzoICOhhYVx0YegXJCKvh/lh4nEWG3yIAjyKAqFgOLhZQzhJRY0ToM/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743212; c=relaxed/simple;
	bh=0ZGPGDqvR6ru4wG9H7sosL++I80VBP7D+P7fKmPN3G4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bYoRi+sS4oCtGy4shqZxqGBhJny9EX6DgOnTURw7bmozG+bzyBtE8kd57CzjQcLFMnd5InY6lPXsG6ErHYNzYd960kMV5dssA+usLW8l4j5/eGPp8snUltcf55kEHSDb2eqahNvZtUZYIc1welN2x1bSQFo6NyOSx7F1wABoIQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GljNOyEk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29FE61F000E9;
	Mon, 29 Jun 2026 14:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782743210;
	bh=4+MrLttHs1xHjqL7zCcXr/yNFRuseFLIDD/fQZuPFp4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GljNOyEkSqsLvktGQ3KdtY3QIaNKZQEIJkI2tXIzHAPB1NIu5y88Nv8kXfA21aOqi
	 CFl8JNhF2k3XqriqRrvDptkp+thMHCLXBw6bflVLNFHmGng5gkKsLCu993kGs2/MYX
	 t2OJV7p0X+FBL2C5mE/O/Of+P18CQJl+skeIxjfAxHGG/jxm3d2jlRHdwWbsCrJA+3
	 rFR4zDlhtxMgDS4EuqBm6mbNJ/oReASuUvry+7h+XLf3h8/HYdyD9WeC4ezbqAYZVv
	 qdCFrHpItvAuM9iW6anqaOUjpeFjXWPaD19P8Dalk9jcug1Z2G1Rtsj9FiWjywFpsT
	 /dcBQaTQMlxuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 1/2] dt-bindings: embedded-controller: Add synology
 microp devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Probst" <markus.probst@posteo.de>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, robh@kernel.org, ojeda@kernel.org
In-Reply-To: <20260629-synology_microp_initial-v15-1-4b3d7367c7cf@posteo.de>
References: <20260629-synology_microp_initial-v15-0-4b3d7367c7cf@posteo.de>
 <20260629-synology_microp_initial-v15-1-4b3d7367c7cf@posteo.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 14:26:49 +0000
Message-Id: <20260629142650.29FE61F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-8785-lists,linux-leds=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:markus.probst@posteo.de,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:ojeda@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,sashiko.dev:url,lists.linux.dev:replyto,vger.kernel.org:from_smtp,smtp.kernel.org:mid,posteo.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E78A6DC099

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The compatible string `synology,ds1221rpp-microp` is a typo for `sy=
nology,rs1221rpp-microp`.
--

commit 227a0e75c964c535a574ba2e91904deade287d1d
Author: Markus Probst <markus.probst@posteo.de>

dt-bindings: embedded-controller: Add synology microp devices

This commit adds the devicetree bindings for the Synology Microp
microcontroller. It documents the serial-connected controller used
for power, fan, and LED management across various Synology NAS models.

> diff --git a/Documentation/devicetree/bindings/embedded-controller/synolo=
gy,ds918p-microp.yaml b/Documentation/devicetree/bindings/embedded-controll=
er/synology,ds918p-microp.yaml
> new file mode 100644
> index 0000000000000..eb1c9d3fac074
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/embedded-controller/synology,ds91=
8p-microp.yaml

[ ... ]

> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - synology,ds1221rpp-microp

[Severity: Low]
Does this compatible string introduce an ABI regression due to a typo?

Synology hardware models with Redundant Power (RP+) are RackStations (RS),
not DiskStations (DS).

Should this compatible string in the properties.compatible enum be renamed
to synology,rs1221rpp-microp before it becomes a permanent part of the
kernel ABI?

> +              - synology,rs822p-microp
> +              - synology,rs422p-microp
> +          - const: synology,rs1221p-microp

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-synology_m=
icrop_initial-v15-0-4b3d7367c7cf@posteo.de?part=3D1

