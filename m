Return-Path: <linux-leds+bounces-9078-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CzwfHRLoVWqjvQAAu9opvQ
	(envelope-from <linux-leds+bounces-9078-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 14 Jul 2026 09:41:06 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0760B752003
	for <lists+linux-leds@lfdr.de>; Tue, 14 Jul 2026 09:41:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ShSw1eFa;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9078-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-9078-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B9633061308
	for <lists+linux-leds@lfdr.de>; Tue, 14 Jul 2026 07:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E00AE3EEAE1;
	Tue, 14 Jul 2026 07:40:25 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AC13F0A87;
	Tue, 14 Jul 2026 07:40:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784014825; cv=none; b=j0xHlEpeiPUNh3XUj296+MHYzczL/hvLS6S2HiMF+bdw2IL0jZ5EuN+dP+PC1p8bfQvNJWVpFUooFpOv9l4aUuzknVdg0fs67ciU6e/BubvJmtTQcSj1LIvhz+os2V0hpJYzF/YZTgIChEqsmWpXV8oaFu0JUZ9D7yOLwdHiqXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784014825; c=relaxed/simple;
	bh=CSLB7OceZ4CS65riZ0IP71V/R7k3hpwJEqPZaBXDeZc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gE8GhiKGdm6HRHODh5d827lxm0QoMgqwdAvb2hHr5KrtoXoKf0jzuDbGF+VXzXjsfYRDOKRBsPCsBxuuI51Z1754zcIUEBJNTx1J3CY8/YmQs3RQOr/tdXIYUfF9LKh41CVe500zof37xZe4P4ncKdES4SN8wiP+sVbFAf88dcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ShSw1eFa; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54BF1F000E9;
	Tue, 14 Jul 2026 07:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784014824;
	bh=CSLB7OceZ4CS65riZ0IP71V/R7k3hpwJEqPZaBXDeZc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ShSw1eFaK27d+8047aGGSIQbU5mey2SvbULw0gTrdTC9WUp8THl/Bqax1K314TyIf
	 gDOxFdphY2ajeOYiEI4Yu/7NwuLtytj0TxXy3ffTbjHNK7cG0MxYlLZ8DGO8E6+jpY
	 rVShX8E26HD8Zw9ypXfB039FydmjGQ+jvhi1ikjpbEBbRZQGG2K1mFECluVyln5tAb
	 FJIOisPwyWvTil2CzrMMO63JvZg8+u6JFYu7X7/4NwgMGk+jXTYlAyLTqWcIO6gw0h
	 0qxgEeE8VjI/pasax/lw+FOdcggAk4CMjYJEoXk3x0+YMViwdd3qTENtGGY7GCAHHj
	 LZ9VDEh2Jec3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] dt-bindings: leds: Add default-intensity property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Rebmann" <jre@pengutronix.de>
Cc: lee@kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260714-multicolor-default-v4-1-c2335b32bc39@pengutronix.de>
References: <20260714-multicolor-default-v4-1-c2335b32bc39@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 07:40:23 +0000
Message-Id: <20260714074023.C54BF1F000E9@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-9078-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pengutronix.de:email,microchip.com:email];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jre@pengutronix.de,m:lee@kernel.org,m:linux-leds@vger.kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:robh@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0760B752003

> Document the default-intensity property to set a default color on
> multicolor LEDs.
>=20
> Update pwm-multicolor to support it and update the example to turn the
> LED red on boot.
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Jonas Rebmann <jre@pengutronix.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-multicolor=
-default-v4-1-c2335b32bc39@pengutronix.de?part=3D1


