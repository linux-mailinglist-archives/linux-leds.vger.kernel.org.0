Return-Path: <linux-leds+bounces-8777-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gZTIJnZ3Qmqc7wkAu9opvQ
	(envelope-from <linux-leds+bounces-8777-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 15:47:34 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB9A6DB7CE
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 15:47:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PZY5ucqz;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8777-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-leds+bounces-8777-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E6F4C3013449
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 13:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273EC1B4F0A;
	Mon, 29 Jun 2026 13:40:06 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A51F212548;
	Mon, 29 Jun 2026 13:40:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782740406; cv=none; b=INjddQVyGOD3o/96mYgtCUYJQlK4ODBrNsk6O8HdQpxfXtOCBhZs4IPL4CTYGRU19HV7hQxsip+Qdxbl0go7fYopG3uWJaKZ5wsUSk5RNdn4MUF9Yckfxwx1rZ2yBc1I7Ev1rox4qegqnRKlvvrxh/3RBkkESEDzCYme7Te2o40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782740406; c=relaxed/simple;
	bh=fFjOPI8ZqObFtENNlaUIXchv2hz4+4uJo1E55LwoHJA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eVnhN3aP1Z4joL524iwrYIuldB2/qA4SC005w6imkMUZRkc16F6x8iCo4pCPv6ZJCuDbUu5Luxw1idJpsl/QZySW6EmzupYlh9vQff6JtgbFuowTFpe1wr9YfEemYoqv/+Qo92bK6ii0rxW0Ng2IQQP/I3Yz/X5e1nfR5SY/SE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZY5ucqz; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368DD1F000E9;
	Mon, 29 Jun 2026 13:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782740405;
	bh=fFjOPI8ZqObFtENNlaUIXchv2hz4+4uJo1E55LwoHJA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PZY5ucqz1Szy7k/AoZwZtHbiBKuwHvCu97trQAdro4VhxHI3HzO88KKmCO+TzGXny
	 SdK3/71peonEpsiAIviDXbRb3lsBUbCXTGHJopinT0ZgARogioalTW0sRUuNmut58o
	 kbkbbE1QR6RIF4LBa5HMMGx5ImrptCAczhaPb0qQdcnHfHninYDMKehLvAn7O7TeCp
	 PlExs6n7iyDJXgSULn+DCz8w+hqGM733L3m4jAul4GIFi/p8/NvgiJXzgWGfs1szGk
	 UCzpKH8RLEmtG1Rok4azgnfrSZ/wHCK9e4V0IOP3Agu/rNNAUijyTXhgKJlUuW9Cav
	 SpNNAD6jCCt4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v21 2/3] rust: leds: add Mode trait
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Probst" <markus.probst@posteo.de>
Cc: ojeda@kernel.org, linux-pci@vger.kernel.org, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260629-rust_leds-v21-2-4f0f19579db5@posteo.de>
References: <20260629-rust_leds-v21-0-4f0f19579db5@posteo.de>
 <20260629-rust_leds-v21-2-4f0f19579db5@posteo.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 13:40:03 +0000
Message-Id: <20260629134004.368DD1F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8777-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:email,lists.linux.dev:replyto,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,smtp.kernel.org:mid,sashiko.dev:url];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:markus.probst@posteo.de,m:ojeda@kernel.org,m:linux-pci@vger.kernel.org,m:linux-leds@vger.kernel.org,m:lee@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7DB9A6DB7CE

> Add the `led::Mode` trait to allow for other types of led class devices
> in `led::LedOps`.
>=20
> Signed-off-by: Markus Probst <markus.probst@posteo.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-rust_leds-=
v21-0-4f0f19579db5@posteo.de?part=3D2


