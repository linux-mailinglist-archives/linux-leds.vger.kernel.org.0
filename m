Return-Path: <linux-leds+bounces-8757-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id et55CSFHQmqo3gkAu9opvQ
	(envelope-from <linux-leds+bounces-8757-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 12:21:21 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6776D8D7A
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 12:21:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=otGBEeM7;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8757-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8757-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE1093003EC7
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 10:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3763D3CF4;
	Mon, 29 Jun 2026 10:20:34 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2763A451B;
	Mon, 29 Jun 2026 10:20:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782728434; cv=none; b=AUJd0tq3U9jc0mGcTV0qrKmzb5lEXcTapetDJ8C4tq2OvRB3f/QfWKRuTcR/XrDGwdP1kIe2pn/XRcbL2QwCI74jtYIgKi9dbeJ7XI1+oLicJzy1qcZT3H+wI6oMo38Ng3OotO80aiaE4Wl0NR85twvhYljJwtAB3dHXgK8ZiVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782728434; c=relaxed/simple;
	bh=cyfDFe/DLLN4SaT4lKBAYW31HJPeCQSAaNik37VE+fs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=utxdQfzgclfvUSwAXcproZ8tSgm/EiJXEv9LBWZK/QZTW76oF7rYyN+erR8d9R3Yg0Jw5uqRRlGS6GVAeCe8SLBhCQi2nnTJp9L1dgSrFjb2spg+kVfyu7rRPcPketMBbJjktYlcxL0Ss9B920+yykMaAjekP9sYUIWjUlOay8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=otGBEeM7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 032251F00A3A;
	Mon, 29 Jun 2026 10:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782728433;
	bh=cyfDFe/DLLN4SaT4lKBAYW31HJPeCQSAaNik37VE+fs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=otGBEeM7iF9uYA5YPtynRCg0EQqTA2nRoRLojoe+LA86HdhwvbZFTOnvTTIJOsi10
	 JkMtgOQdxKtpXpMJa+fwQ97DqzzRR7VQqI8QFqGbBanysBRK2LEa2fnIJscS1HS2XZ
	 EOTRJ/8GTgfe9Ai1zEDXGXLnY/E7sbRUetQpZGJ71P9EygAnYhFtqr87ABMfA/orvf
	 pqXXiqbW3eZP/GWeYN1Q/vYI5u9F1iF+VQk5JALE1iyh5Uhk7b/Rsn0sRY3EIClHLh
	 c9ggfhwdcmSk2qm86EOEu1Ana6hYsa8pB/3FYMx8P7GtXRGgdmPsoEvqTGxihN8B7Z
	 +GKIPZyntCHuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 2/3] rust: leds: add Mode trait
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Probst" <markus.probst@posteo.de>
Cc: linux-pci@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260629-rust_leds-v20-2-f493ab053b4f@posteo.de>
References: <20260629-rust_leds-v20-0-f493ab053b4f@posteo.de>
 <20260629-rust_leds-v20-2-f493ab053b4f@posteo.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 10:20:32 +0000
Message-Id: <20260629102033.032251F00A3A@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-8757-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,lists.linux.dev:replyto,sashiko.dev:url,posteo.de:email];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:markus.probst@posteo.de,m:linux-pci@vger.kernel.org,m:ojeda@kernel.org,m:linux-leds@vger.kernel.org,m:lee@kernel.org,s:lists@lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E6776D8D7A

> Add the `led::Mode` trait to allow for other types of led class devices
> in `led::LedOps`.
>=20
> Signed-off-by: Markus Probst <markus.probst@posteo.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-rust_leds-=
v20-0-f493ab053b4f@posteo.de?part=3D2


