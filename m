Return-Path: <linux-leds+bounces-8855-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /+sOMa+VRmqxZAsAu9opvQ
	(envelope-from <linux-leds+bounces-8855-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 18:45:35 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFD26FA7EB
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 18:45:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=FpMAF901;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8855-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8855-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E79432B09B1
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 16:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F6E349CCC;
	Thu,  2 Jul 2026 16:31:48 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043A4348C53;
	Thu,  2 Jul 2026 16:31:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783009907; cv=none; b=qbv63i2PZZTX/MAD56B7/Q61USqQZkZlb6Ci+zruQJHzMicrJbFSgMOcmSqEoA0d1hVXqXhVrxq1kgpBz/Z00PpylkZFYdkb3LNIpSA3caWgDOY8UoIBMpIFZIkF149ZqeKKuFiJEU1kuDue2Nh4R8lDZ/AJ8q7E9J/9dO+PDik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783009907; c=relaxed/simple;
	bh=6p9oJw5MFDn+kSUamq/zaTSh6Mx38EjNSlPb/ngjyHw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fNmEWJF+vTdwzBUox2dpXb++YQfsKLQVGN7ZTQ7mVP7OPcwvqMJdQL8PC8j2Qx2stwBB9gRLdWYmd+3QONyeI6ncCeIMuLfjEE7vQXlc9Dfx68wf+fHSyMe+LyjdgkYiZ4LoZRnkHt/zMgLXT7zy/zAn2OnWlKLEDOlKx7d8E4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FpMAF901; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B82AB1F000E9;
	Thu,  2 Jul 2026 16:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783009906;
	bh=RzzfmIogOoChfCuB1Ba9o2vBi864tKCQNnuaaTtA2d0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FpMAF901KOCXsLd9Peup0g2nFxlws6YELsM6AeOcDUdHrNZTxBbYwbFPemRHFOrPm
	 WeoMU7b24n0MLm0SN62gtXKt6cOaVz1trQF1m6P6xawmpvqbHMtuekkcUE2BKRN8oy
	 iNtPaMFUFktzbSTbZSgrhOaVguNpvX0/clrZNEZoRJ0UeEkYhXB6HmPh5Q6K/0Tn2w
	 dlbUR0TG0l/hGuupWcYnV6+Ze6hQtoQIOx0dbDSduHKInlWJ5HkcVqY8dh6h1xsZp8
	 1SO7zYM2TcWCJjyBxxdwyQ66uyj2W11jhZ3BZHot3XYroQmTM1PHfj2EoYrca9LoZL
	 U6evvTzS2aACA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, KancyJoe <kancy2333@outlook.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260529-topic-sm8650-ayaneo-pocket-s2-sy7758-v5-0-03aacd49747c@linaro.org>
References: <20260529-topic-sm8650-ayaneo-pocket-s2-sy7758-v5-0-03aacd49747c@linaro.org>
Subject: Re: [PATCH v5 0/2] backlight: Add SY7758 6-channel High Efficiency
 LED Driver support
Message-Id: <178300990349.2239788.13080024963462152507.b4-ty@b4>
Date: Thu, 02 Jul 2026 17:31:43 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:deller@gmx.de,m:neil.armstrong@linaro.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:kancy2333@outlook.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gmx.de,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-8855-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,outlook.com,oss.qualcomm.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3CFD26FA7EB

On Fri, 29 May 2026 21:23:07 +0200, Neil Armstrong wrote:
> Implement support for the Silergy SY7758 6-channel High Efficiency LED Driver
> used for backlight brightness control in the Ayaneo Pocket S2 dual-DSI panel.

Applied, thanks!

[1/2] dt-bindings: leds: backlight: document the SY7758 6-channel High Efficiency LED Driver
      commit: 2019a2a7268f6f7387f052110558b9f90b500324
[2/2] backlight: Add SY7758 6-channel High Efficiency LED Driver support
      commit: 110d67699a430daf0316f941254c46221e3f0914

--
Lee Jones [李琼斯]


