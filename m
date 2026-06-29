Return-Path: <linux-leds+bounces-8771-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DJCwI+tyQmrs7QkAu9opvQ
	(envelope-from <linux-leds+bounces-8771-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 15:28:11 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 293576DB336
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 15:28:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Bu631/hY";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8771-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-leds+bounces-8771-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AD0E631354E2
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jun 2026 13:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B4BC41B35C;
	Mon, 29 Jun 2026 13:12:36 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE24C419308;
	Mon, 29 Jun 2026 13:12:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782738756; cv=none; b=W+Lj14MKu6s2AVaTsJWbJm+0ArSinhs1CtR8f8oFlsnPkecIF/h/OPgK2x9BkdGDuBU7unv4WeiynD+WWAdBmvrVydd0QQCfOM5DSvd5+fNiS7qDYvRL4Z9CpSuvRP/CeLHJT8ZMaZekPBTxSxvQtdI1PlXoUa2E8014pkLIWYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782738756; c=relaxed/simple;
	bh=IaAnCU43ti7ZTrUnwH0bkWQiPqQ177g5PV6Evlo5nVk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UjwdLueXOHwOLOPwONbV0skmXxWqwwVW02stjaQ9ypLb4iXpASWdVAiadDVOQm86mMMb/eiAjAvkTmk//j1ZyrooRUvQNgobLj4WFzTNyHO+p4lppGAjDVQD7AC2hjAUEySew1kZXFMY5Wj+r4ZwEl2E7NyQ1ScG6ejmrT3yl90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bu631/hY; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32DBB1F01566;
	Mon, 29 Jun 2026 13:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782738753;
	bh=IaAnCU43ti7ZTrUnwH0bkWQiPqQ177g5PV6Evlo5nVk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bu631/hYdVRmkjeBChVU99EhqgMH1taUKZUCCAOI2TEqBX1OUQAOsXT6dZz5Mu1T3
	 CLIJpi5V0tRovLCwDkKeK3A9TflbAUjGhkElmsP28gsviYRE2DfTYhOLD/kkUhfdd9
	 ivwF91Ke0vr14wNoVIBWC1ZIMMBMCDnBGLSU5R3hfvJZ628+Oezj5zb+aM1AnKmFhx
	 c+ZxNrxf1ipSFms8HpENIPJ/lskTVcdEUoI6HKT1Fx5c2pPyEo5KC9oMvQSre6pVml
	 JutwZNhjRftunUK3aqJwKcPPaCw0GuzWqf2xghmOpCC8yxhsy9GQc8jWZjxKRN2X20
	 nZeAEMHV0YXZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/6] [v5] sh: select legacy gpiolib interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: dmitry.torokhov@gmail.com, linux-leds@vger.kernel.org, lee@kernel.org, linux-input@vger.kernel.org
In-Reply-To: <20260629130329.1291953-2-arnd@kernel.org>
References: <20260629130329.1291953-1-arnd@kernel.org>
 <20260629130329.1291953-2-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 13:12:32 +0000
Message-Id: <20260629131233.32DBB1F01566@smtp.kernel.org>
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
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-8771-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,smtp.kernel.org:mid,lists.linux.dev:replyto,fu-berlin.de:email,arndb.de:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,sashiko.dev:url];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:linux-input@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
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
X-Rspamd-Queue-Id: 293576DB336

> From: Arnd Bergmann <arnd@arndb.de>
>=20
> Many board files on sh reference the legacy gpiolib interfaces that
> are becoming optional. To ensure the boards can keep building, select
> CONFIG_GPIOLIB_LEGACY on each of the boards that have one of the
> hardcoded calls.
>=20
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629130329.1291=
953-1-arnd@kernel.org?part=3D1


