Return-Path: <linux-leds+bounces-8942-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M5efLVHYS2pBbQEAu9opvQ
	(envelope-from <linux-leds+bounces-8942-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 06 Jul 2026 18:31:13 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FB17134B3
	for <lists+linux-leds@lfdr.de>; Mon, 06 Jul 2026 18:31:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Qd1zCb6i;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8942-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8942-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B9A730306F2
	for <lists+linux-leds@lfdr.de>; Mon,  6 Jul 2026 15:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0E63ADBB4;
	Mon,  6 Jul 2026 15:54:45 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6F12F7F1D;
	Mon,  6 Jul 2026 15:54:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353285; cv=none; b=qa2gF+Qdayy00YLwZrMKEru1TF/TIMgGgdcwdpnfvdK/VnpIxi7XwWsATLTmZMDZHvORU0TjPA82I1JjeP/dpOeowAIXVOZUmPFFf6ounssbieQkVoeM9P2ZFmRcvrhhQBkQmfF++cWMjhEK+jDDcua8vqbTfOwtPrvA11tNOaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353285; c=relaxed/simple;
	bh=y/wnLTRNpeQajux61WDDzgy9qXiop+DYmWp2W2gqeoc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ccLA9yoFqmsy/1UhC7q76R6vq7Psqn4Ida2WUllIEoya7Er6Tg0rLDEOQ8nSuw0TwHzg3PnMmkG2RKH8RYLQmHyxlXVc0CxOX56oa8yR7/fb3uu/IpSDMPgm+8bQgMcIdJ0G84eSsg+WDMeVYusgaarutEBYCoz7XbViYObDNGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qd1zCb6i; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D541F00A3A;
	Mon,  6 Jul 2026 15:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783353282;
	bh=y/wnLTRNpeQajux61WDDzgy9qXiop+DYmWp2W2gqeoc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qd1zCb6ijtHZWiexGwWF77RhQ5VwFbKC4z4hDMPoCn1YROtWT3UBr6yw4Ew/keWbh
	 +mPgdRCE9JMWm2Xh2D/MEeghOvI81cZ/5gjDgqJjeCTcSuAs/EgDNdETV34G1IUHab
	 oTbEB6WS3nKC0i+yIwZkf0Rjpjumg0czxSfnVAMFfy8XMbqkfLTP146TAS+L2BWQ46
	 GKrrFObIHZkMpinpdMIzKfr/MJHjdL7vUpoK3J13qLnQ8H2vccQ9/FPSr92YmBc41d
	 iMk6HUofGOBUyNFPqrMf7Tey1Hijo0KspWbKENJdIx8KF8sSlvpe8i+AJWf4BXc5HX
	 hDbpmxYfJQr0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: leds: nxp,pca963x: add multicolor
 LED support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: robh@kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260706-monza-leds-v3-2-37ea8c988363@oss.qualcomm.com>
References: <20260706-monza-leds-v3-0-37ea8c988363@oss.qualcomm.com>
 <20260706-monza-leds-v3-2-37ea8c988363@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 15:54:41 +0000
Message-Id: <20260706155442.49D541F00A3A@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-8942-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,lists.linux.dev:replyto,smtp.kernel.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sashiko.dev:url];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:robh@kernel.org,m:linux-leds@vger.kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:lee@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: D4FB17134B3

> Add support for grouping individual PCA963x channels into a multicolor
> LED by introducing a multi-led@N node pattern. This follows the
> convention established by other multicolor LED drivers such as
> kinetic,ktd202x.
>=20
> This is necessary to support and model hardware setups where multiple
> PWM channels drive a single physical RGB LED.
>=20
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-monza-leds=
-v3-0-37ea8c988363@oss.qualcomm.com?part=3D2


