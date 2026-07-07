Return-Path: <linux-leds+bounces-8954-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yLSWEJVLTWoxxwEAu9opvQ
	(envelope-from <linux-leds+bounces-8954-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 07 Jul 2026 20:55:17 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B328571EC50
	for <lists+linux-leds@lfdr.de>; Tue, 07 Jul 2026 20:55:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=EMRvfJUu;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8954-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8954-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4626E3005AD7
	for <lists+linux-leds@lfdr.de>; Tue,  7 Jul 2026 18:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7558392814;
	Tue,  7 Jul 2026 18:54:39 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD08C2D1907;
	Tue,  7 Jul 2026 18:54:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783450479; cv=none; b=j8VHTnvg5YuiqInN7z7xB3Wo58ttcxvK9uGpilgdZo/+CrHE1Nj6zdwwGMJiNYDpTDMLKqQfhSWG5lyO/I/NIRn3+ZS4IHzkJaEE0fCVIlqzXv3bJczXA+RnYYQ241YzupWX20g7jf9MK6yGEvEYGeYLkTNSyHWRKm4FVXaAqeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783450479; c=relaxed/simple;
	bh=OtIxh+CY+dUF/Rq8SLgLrMK6IQwz9y5I4qWkW+QA2+U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fidZYJsQ7HAa4v1oODR7hCyFMgC/rpH3shUV7MezaVbxcCNqNq14QkTXTl7UBtkCn5eEPXjYMvmmULVpGfryqwtkbU96Z/F2tQjhEG4Z1R7Q4cIV1L7EbGvpS3BAv2zq1aoN7K+w4Kc+h6AUVWmB4EXj2Q4H6JwGMU/CXd2ub3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EMRvfJUu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1837D1F000E9;
	Tue,  7 Jul 2026 18:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783450478;
	bh=OtIxh+CY+dUF/Rq8SLgLrMK6IQwz9y5I4qWkW+QA2+U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EMRvfJUuz0mpz0N6rGIn+vaMDR+nGv6Y1WhESgNdzGfEppaUvpm5tGADcmuaT06BZ
	 ypgUodtTqtB7O25YwGBsCSf6kmZ+M/Ky7rPOoN4pq8TvbvgLGLIo8tJzEdOaJD6Xfk
	 S8p9bsXmo0StAurlP/H+jwJaRQCBriFhJVFka9jP4+MOeKn5ElotiusS4TUp4lFow8
	 hRyi4lPjgTapBoJiXJ0faXdkOy/mZYN/SARL9OFeE3lwKyHCVNbKNIzHa7rdzkNnnZ
	 GhAYHskQzIouxo0LvSb6mI8eMMq0oH6BWN1OWoDXK9fc75GXcpfsJWalW6ITEQaE1e
	 /fShEKURy+nkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dt-bindings: leds: bcm6358: Convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ninad Naik" <ninadnaik07@gmail.com>
Cc: linux-leds@vger.kernel.org, robh@kernel.org, lee@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260707184437.500278-1-ninadnaik07@gmail.com>
References: <20260707184437.500278-1-ninadnaik07@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 18:54:37 +0000
Message-Id: <20260707185438.1837D1F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ninadnaik07@gmail.com,m:linux-leds@vger.kernel.org,m:robh@kernel.org,m:lee@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-8954-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url,lists.linux.dev:replyto,smtp.kernel.org:mid];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
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
X-Rspamd-Queue-Id: B328571EC50

> Convert the brcm,bcm6358 to DT schema.
>=20
> Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707184437.5002=
78-1-ninadnaik07@gmail.com?part=3D1


