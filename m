Return-Path: <linux-leds+bounces-9061-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DXJ4AGipVGoRpAMAu9opvQ
	(envelope-from <linux-leds+bounces-9061-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 11:01:28 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A1C7490C1
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 11:01:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LsvxHcLe;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9061-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-9061-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 335EF304C11E
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 08:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325093D47AE;
	Mon, 13 Jul 2026 08:55:57 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3873B7759;
	Mon, 13 Jul 2026 08:55:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783932957; cv=none; b=Hz4rZ3os8siupgtGeev2N6zsfkfFrkGcgdabjM/0gwsqUFMWJ4BMCkla1NAnczp8blivzPAlrhksJSPdReBAmX3GrQ94VE+tEXUt/H4vc0qQHz+NNQVxwcBSSp4FVgE5l4MMJQE5ybqg8kDDoBrF1QiK9tgCYIje3YbxM3agG/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783932957; c=relaxed/simple;
	bh=PxR3IYrOGaie1GzmTU3gAuPgCpTpDEmZgCF1YiD4c5g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GFwp18cRM6CNZQVj5PLpI7JzUw9qbCUm2tmKO/SAJSy7ZBfd5J7pW+4WHijBAIggqdk45RCAbUSwYDHVIc8G5acHvQDLddXo3ZXcwtibDPTMhF7jyS80OZtZgCiyXB51aITFh2bO1UN+nH3WMW3pt5QU0oxlyYZ9yIPaGDjVG6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LsvxHcLe; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ACAB1F000E9;
	Mon, 13 Jul 2026 08:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783932955;
	bh=PxR3IYrOGaie1GzmTU3gAuPgCpTpDEmZgCF1YiD4c5g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LsvxHcLe4v+E9tNIL6Gyy3bsWy8PTDoDweZSYxrFWP3MzN/bUIabmap0qzuLQLOaC
	 r9Mmpi0rZPUBCtv7rUsqYDSsu4h15KsEcZ+N5yamn2P7hv0+dzpcC3GK0xtNDSf8t0
	 0lm/CXC+bDUnqZ2I9GOPfSG06YaH5qvwtX1E79itysuREejzM9DO+9kyQYGZstyo3p
	 c9/A17SxgRmTA4PDiztLb2qS1Jw46sKNHAqYGOhYLa8oYn9JAqBBvtvLBAeTeOYYZt
	 pdqgw4D0oajxs0EOOtEhqDepXlCdB0BR2nUfhVYpoQjBUvlq7Sy2VgVAx1eYsFFRws
	 UY73nOd50x4iA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v3] dt-bindings: leds: Add default-intensity
 property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Rebmann" <jre@pengutronix.de>
Cc: linux-leds@vger.kernel.org, lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260713-multicolor-default-v3-1-fb43f3f789cf@pengutronix.de>
References: <20260713-multicolor-default-v3-1-fb43f3f789cf@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 08:55:55 +0000
Message-Id: <20260713085555.6ACAB1F000E9@smtp.kernel.org>
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
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,lists.linux.dev:replyto,smtp.kernel.org:mid,pengutronix.de:email,sashiko.dev:url];
	TAGGED_FROM(0.00)[bounces-9061-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jre@pengutronix.de,m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:devicetree@vger.kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[sashiko.dev:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B0A1C7490C1

> Document the default-intensity property to set a default color on
> multicolor LEDs.
>=20
> Update pwm-multicolor to support it and update the example to turn the
> LED red on boot.
>=20
> Signed-off-by: Jonas Rebmann <jre@pengutronix.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-multicolor=
-default-v3-1-fb43f3f789cf@pengutronix.de?part=3D1


