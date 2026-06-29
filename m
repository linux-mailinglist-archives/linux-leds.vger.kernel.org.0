Return-Path: <linux-leds+bounces-8802-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RXdWFsDOQmrlCwoAu9opvQ
	(envelope-from <linux-leds+bounces-8802-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 22:00:00 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0E76DE896
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 21:59:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=k+MifZF1;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8802-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8802-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EAD903011A72
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 19:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A255233D6C7;
	Mon, 29 Jun 2026 19:59:57 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E0D3655D5;
	Mon, 29 Jun 2026 19:59:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782763197; cv=none; b=bjEgdhK6NUvVfteiaSabUPGvvFo79+7nmRbc8GWFDTBv+gBD4JUrmZxJSjF14GUuphGJosBvV3EDYoa92AOJnbQujBOhGcCrScvRDL4JemnIuiFKYjkA2z1sgtLjfUk19j5C67UehlArPBgjBXL0uVVHd8y+oa8u8VghllT/zrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782763197; c=relaxed/simple;
	bh=igg3V5L2OZiYm9DkqgudJ1YKQZ/Y4akRTijLfeXXDcc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NDlx53eQmVZYTPqimMVpAka/cX6VIVYzk+awaM1Dg+2kk+VznIrknD7+R0ywj9WTc2Tl2iv/K/iHWFHpCs6wcSgUbdN8zEcFYe13jIXZQNwbYDCYuBdLAV1Tt+TpZmJzsNQDzvb4r0rJP07ciHxjTnsGw3HtVgMUWwA6pI2cQ3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+MifZF1; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B594F1F000E9;
	Mon, 29 Jun 2026 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782763185;
	bh=igg3V5L2OZiYm9DkqgudJ1YKQZ/Y4akRTijLfeXXDcc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k+MifZF1vcNvwskr2pqX5DivMpd/QpIotQRBcf5K/r2a4b4NkbKa/hM9QDXcFlDkf
	 N9m7MQuRyqvH40dDEDtXvfQ/QcnSq3UhW4Vhk5/trI+u423ahAQlPdFixkFBuROAjb
	 UPG0+SW8C7/h6ZaQevo+EHQHe5jQcz0oQXbTwxpGtiRChF9y8d1NuNkkd3e+OSAcvO
	 68RnEfprUCmgtIh0jkn9Obbna6Ew7Dqq73OgbYuvJUHmZDJpleRiq3Rrpjp+XT9Asm
	 PMKPAEPd5TcM5UQ6buvTBgavG25SudhsscfdyJCSVsDM7zN5TP/Lp/O2powYfvn4kv
	 9VWL180U1Ip9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] leds: pca963x: add multicolor LED class support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260629-monza-leds-v1-2-0cf7c0a7dc14@oss.qualcomm.com>
References: <20260629-monza-leds-v1-0-0cf7c0a7dc14@oss.qualcomm.com>
 <20260629-monza-leds-v1-2-0cf7c0a7dc14@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 19:59:44 +0000
Message-Id: <20260629195944.B594F1F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-8802-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,sashiko.dev:url,lists.linux.dev:replyto,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,smtp.kernel.org:mid];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:conor+dt@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA0E76DE896

> Allow grouping of individual PCA963x PWM channels into a single
> multicolor LED device by adding support for the LED multicolor class.
>=20
> A child node with sub-children is treated as a multicolor group,
> others are treated as single leds, keeping full backwards compatibility.
>=20
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-monza-leds=
-v1-0-0cf7c0a7dc14@oss.qualcomm.com?part=3D2


