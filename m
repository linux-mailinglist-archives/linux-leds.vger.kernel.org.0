Return-Path: <linux-leds+bounces-8941-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ney1MB/YS2oxbQEAu9opvQ
	(envelope-from <linux-leds+bounces-8941-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 06 Jul 2026 18:30:23 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E65713493
	for <lists+linux-leds@lfdr.de>; Mon, 06 Jul 2026 18:30:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=hxtQqKUf;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8941-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8941-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E6C9322B036
	for <lists+linux-leds@lfdr.de>; Mon,  6 Jul 2026 15:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1ACD42F709;
	Mon,  6 Jul 2026 15:54:02 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA22B42CB0E;
	Mon,  6 Jul 2026 15:54:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353242; cv=none; b=tZO93jqgDwdELu5fm+aaGqOFTbwZ3CJjJt6C6kgX+LeD0F+joQc6rHorERhDv04DdfVq5LPdJ5O+qdM+oNKcAXjXia8aKuYhgsQ0cI/7cIs+aPAf7VMzhHvJKfQgXXsTAX/sp5bqUxKzDXP3DhfnEWRBMrPNeQXhIGc5g83cwAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353242; c=relaxed/simple;
	bh=Mv7nxjYQ6BqAIoIBOF+fU1A/fyFoR+yW+jyJnsn2oik=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cpZ9PQ5OIRLKKxTKdTOr7NECvwIsW9Q1nrEKMnshMeb2eatqeJMU4SkMjkFm4DjU8lIsm2pOUTI3K820A++EQaSOErZdzbglbcs9hKg341f8B/D7DuOEkZhY1883Vb4GzlrOpktJG37JuEat04BJcCMw9/tKx+rzYNLxsgaB0bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxtQqKUf; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 021DC1F00A3F;
	Mon,  6 Jul 2026 15:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783353241;
	bh=Mv7nxjYQ6BqAIoIBOF+fU1A/fyFoR+yW+jyJnsn2oik=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hxtQqKUfnlULzYT7m1k0oaEzCMr9Wm5rKDEVDfVhP3DpK0y4aA+sqsecJUzF5K0IE
	 Sxq8BK21rr9wnTM/3bsav0ytF1t3nKxwncsguFwELZDTmfTlacJayFbX5LWvL9p7ff
	 XDaKxxEmyuDlq37iCtApunYIUDqVEyfT/wHuJkRUCH5yRxqlkFGxwSarJiW5msPKwp
	 yfQjcZijo1TwehJDQ4RqstYcFNfR+TvNUwdqhSYC9cIumSdNFTYnr+a1pbzMx+uufR
	 gGfVjud2PEW8rGhEfRoF2G4/KjC8GMp8o8kxJyo/c+61zgicv9xR1JMXw0MuMXzKMf
	 JIj/CeplhgwmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: leds: nxp,pca963x: fix reg maximum
 for pca9635
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org, robh@kernel.org
In-Reply-To: <20260706-monza-leds-v3-1-37ea8c988363@oss.qualcomm.com>
References: <20260706-monza-leds-v3-0-37ea8c988363@oss.qualcomm.com>
 <20260706-monza-leds-v3-1-37ea8c988363@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 15:54:00 +0000
Message-Id: <20260706155401.021DC1F00A3F@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-8941-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,smtp.kernel.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sashiko.dev:url,lists.linux.dev:replyto];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-leds@vger.kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 49E65713493

> The pca9635 supports 16 LED channels, unlike the pca9634 which only
> supports 8. The allOf conditional grouped both chips under a single
> else branch capping reg at a maximum of 7.
>=20
> Give pca9634 its own if/then block and let pca9635 fall through the
> else branch with the correct maximum of 15.
>=20
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-monza-leds=
-v3-0-37ea8c988363@oss.qualcomm.com?part=3D1


