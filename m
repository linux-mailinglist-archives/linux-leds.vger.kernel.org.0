Return-Path: <linux-leds+bounces-8741-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EQXmN3HmPGpfuAgAu9opvQ
	(envelope-from <linux-leds+bounces-8741-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:27:29 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8E26C3C96
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:27:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=FRpsRs3P;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8741-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8741-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3B9C30A1ED7
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 08:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 924F137BE60;
	Thu, 25 Jun 2026 08:23:38 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBA22253EB;
	Thu, 25 Jun 2026 08:23:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782375818; cv=none; b=Z/1oLqyID+Vq+DJAe5yE2OhTZfdz5/fqQooy6ytKrcY2FpJTrK7X+OBS/Jn95ymjAgjq+ASe0IOMYaGg06ZhxUTTq9tPmpWnCRGsTOvBwicR+AWWB82JBt2Lrp2jU6MkumZP039SGOkruXqgylkGo4gn6XrgBpfMPI27VY9+smY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782375818; c=relaxed/simple;
	bh=eXk9wotiYSlgv9dbFl/AWc4G+D07IniZ4g65k+BeJd8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=foLNEpqA7Ok0d04QtbJlRGEH0OO2RWAjsayXS/C1DnL9C0LLpZ5Ms1tUT+wBgpYnZpCbU+4hyc+YM5vNku5qIxn0/mqsMZMIokDhXcKkqQTrQ+1Eq3+zc2uH7/maLmDYGXvxOZqo5hlIWUNusRwSQyXA5LjdudFwm340mvfB4GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FRpsRs3P; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F08BF1F000E9;
	Thu, 25 Jun 2026 08:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782375817;
	bh=eXk9wotiYSlgv9dbFl/AWc4G+D07IniZ4g65k+BeJd8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FRpsRs3P1chBdzhAMiFFHwFxr+sGs25D5iBwBAkqfpUqP0YoUyfhvgWrib6MJHG/s
	 K8T6wE3Wu1M6M90JOgBoUjwzvxnTPq3TvNkueOxmI2sPyOMFY6A6yYc4bCNUQZF43t
	 iiBDJdq9HQDaMg5RRhlSdWoeNKz2QKyg4iDXqK6SsEtY7zk3T6IN8ntEyD+4ZihqVA
	 /cKDHGfJmAIJvt1uaCFrOh9AqWaLSrsEcc6UV3nVmCUWmjHw/1VC+9jrCQiJmtjvYO
	 67zPYsNl93ZNRDIeoSO9D2KZ5iZAo9YQYYtj2flRDqLSUhCIZNIDM+izHDQvDyRzmy
	 Q20BN5ajDyEdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/6 RESEND] mfd: motorola-cpcap: add support for Mot
 CPCAP composition
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: robh@kernel.org, linux-leds@vger.kernel.org, dmitry.torokhov@gmail.com, conor+dt@kernel.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260625081812.33474-7-clamor95@gmail.com>
References: <20260625081812.33474-1-clamor95@gmail.com>
 <20260625081812.33474-7-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 08:23:36 +0000
Message-Id: <20260625082336.F08BF1F000E9@smtp.kernel.org>
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
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-8741-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:robh@kernel.org,m:linux-leds@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:conor+dt@kernel.org,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:lee@kernel.org,m:dmitrytorokhov@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,vger.kernel.org:from_smtp,sashiko.dev:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A8E26C3C96

> Add a MFD subdevice composition used in Tegra20 based Mot board
> (Motorola Atrix 4G and Droid X2).
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625081812.3347=
4-1-clamor95@gmail.com?part=3D6


