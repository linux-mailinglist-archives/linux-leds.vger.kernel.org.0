Return-Path: <linux-leds+bounces-8973-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OoogK8BjTmoiLwIAu9opvQ
	(envelope-from <linux-leds+bounces-8973-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 08 Jul 2026 16:50:40 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A81727975
	for <lists+linux-leds@lfdr.de>; Wed, 08 Jul 2026 16:50:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Sl5Xg1Vt;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8973-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8973-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A2FD303D726
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jul 2026 14:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B385B345725;
	Wed,  8 Jul 2026 14:38:44 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F3115FA81;
	Wed,  8 Jul 2026 14:38:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783521524; cv=none; b=T/7pOz4TgBzaMSCfSQacI+MSgz0ngttLMDLekhZQHVg82IIBz8/8peqk/qTfSqM/6+X3NVgiGXmk4cZm83Ei639ds39ZXhq7oJnMyNDBshL29BydcEiUXvJZH1MuDv3R3120Rl1am99ZwX20RfuFyvp+LIWnN7xWdZxjfG85B8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783521524; c=relaxed/simple;
	bh=VNTy+Qh/ByqakEyAd9A3bdOISd5gs3E6eRwXTemwRqM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UkaWRwSebzTd46v90YHE3xvdGL0ToA8rYrAAAN/f0GQkECgU7yGAQcLeeqqT/hWkXybqMnN/eU7+3xQK1oltsFfuLiULI5GJXORxNWycZqH+MlAim7O/0HTWDTTAXeN0FRfYDHkbUuYQtoT4+bDuVz7maPbjudl2WbYyQFsfBpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sl5Xg1Vt; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1222B1F000E9;
	Wed,  8 Jul 2026 14:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783521523;
	bh=VNTy+Qh/ByqakEyAd9A3bdOISd5gs3E6eRwXTemwRqM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Sl5Xg1Vt7O16NtCRu5EwWRblLjcZ02M30GyjxgalxvmJQf/0IK3mqcwzehYejHaUc
	 HGNVgVaQZXstuQ6LJs1Go9D0aZONJwfu6UVxM6PGbxrT33Qsm9ukrqm39bNXItLVJ3
	 vi12sCZx9gzWn5AER5SPgytxu7MEwTEifJwrPA5MzBxaXfSWcZgN9+BL4ApjYOUDwz
	 FHTGNJQSnLo4iekeTyN73ZUmcbXGFFmEoQvCxjdaWyfxzEe0i3xW56DHVCuJPRMauC
	 v+pyGBjBVxNfOU4eWe9sQqyYSWdej2HxVMJUR1U2UPLKik1iAyRG63MCviGI2E+UUz
	 L9cQ491QtDdyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] leds: pca963x: add multicolor LED class support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: lee@kernel.org, robh@kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708-monza-leds-v4-3-a7acfc524c0b@oss.qualcomm.com>
References: <20260708-monza-leds-v4-0-a7acfc524c0b@oss.qualcomm.com>
 <20260708-monza-leds-v4-3-a7acfc524c0b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 14:38:42 +0000
Message-Id: <20260708143843.1222B1F000E9@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-8973-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lists.linux.dev:replyto,smtp.kernel.org:mid,vger.kernel.org:from_smtp,sashiko.dev:url];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:lee@kernel.org,m:robh@kernel.org,m:linux-leds@vger.kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 28A81727975

> Allow grouping of individual PCA963x PWM channels into a single
> multicolor LED device by adding support for the LED multicolor class.
>=20
> A child node with sub-children is treated as a multicolor group,
> others are treated as single leds, keeping full backwards compatibility.
>=20
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-monza-leds=
-v4-0-a7acfc524c0b@oss.qualcomm.com?part=3D3


