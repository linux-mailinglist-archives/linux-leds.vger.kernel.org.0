Return-Path: <linux-leds+bounces-9039-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U9roKhWaUmqdRQMAu9opvQ
	(envelope-from <linux-leds+bounces-9039-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 21:31:33 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFC5742B2D
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 21:31:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=DRgjZzyw;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9039-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-9039-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14D933005D0C
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 19:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B63232DB7BE;
	Sat, 11 Jul 2026 19:30:01 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858BB4499B8;
	Sat, 11 Jul 2026 19:30:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783798201; cv=none; b=hKRqZ8+txjEdZBinAeyrOTe1FCld/7xQFcv1c+vqmrmxrm+3bOjTuln5sxWnsS9oE6/maUEyFd5Eav2E74jBJTA4wmYfZgwEhnLGtIhqnNq8gwG36TvYaM8FYrNRqWZZDrBvlxOL0h7TeM2mvUjoKyWX0TQIQOX7X1wpjp01Tlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783798201; c=relaxed/simple;
	bh=Z72G4XJL1vZSUbt7YIAuY3GQc7bvXBA3paoTEFi5o+4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ps1iN18hjtxhy19JMB2G/2krjeYo3sL96senenzXmvbcaTJbh7mIHlXRA3s3rbi9ZntUa2+cQL1TRADnqa3ykvtZ2gzbuSjobICSpa7Rw6Y10ZS15NUCgJ3qryKx69HK2ywNOWUjg7fnpzLZafRk1mwi4ypDEuLkJhFoLT5364M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DRgjZzyw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F211F000E9;
	Sat, 11 Jul 2026 19:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783798200;
	bh=Z72G4XJL1vZSUbt7YIAuY3GQc7bvXBA3paoTEFi5o+4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DRgjZzywgYjyoLILTMe7ftLalsvG4TxjfwSCcRk+AZqEV2W+IiU0nKR/NcI39WjLh
	 qU4yj6kC4sPfsBg5jcx14xhMFx0vC25jYu0ugpR9QswpGgGItdLi6v068XM48XEhrg
	 078pi+hzS2LgeSmcaoZNDMPzgx5RjWdAEeAbv5WiFg3QIqLB5xQFKjsM/LcVsuUVm0
	 0ObFO8GFOWZ+7oTcwk0cCnuDZy9huP+H6bRq7C3LAYQ7GFLC7czjSPQehAQTGNF3uI
	 OzwCMW+X6fxYNhMtHFxS5pFPpAbnk0/teqAxLuuZolj/tEQcVh33NmUNZ2X+jkGvwU
	 QPNO6vzwqz03g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: vendor-prefixes: Add techvision
Reply-To: sashiko-reviews@lists.linux.dev
To: "Samuel Holland" <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, lee@kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260711192842.845048-3-samuel@sholland.org>
References: <20260711192842.845048-1-samuel@sholland.org>
 <20260711192842.845048-3-samuel@sholland.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 19:29:59 +0000
Message-Id: <20260711192959.B7F211F000E9@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-9039-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,sashiko.dev:url,vger.kernel.org:from_smtp,techvision.com.cn:url,sholland.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:samuel@sholland.org,m:devicetree@vger.kernel.org,m:robh@kernel.org,m:lee@kernel.org,m:conor+dt@kernel.org,m:linux-leds@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2CFC5742B2D

> Techvision Intelligent Technology Co., Ltd[1] aka Shenzhen Huiwei
> Intelligent Technology Co., Ltd[2] is a manufacturer of single-board
> computers.
>=20
> Link: https://cn.techvision.com.cn/ [1]
> Link: https://www.techvision.com.cn/ [2]
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711192842.8450=
48-1-samuel@sholland.org?part=3D2


