Return-Path: <linux-leds+bounces-8476-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RNJzNeheIWrpFAEAu9opvQ
	(envelope-from <linux-leds+bounces-8476-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 04 Jun 2026 13:18:00 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CD71E63F5A6
	for <lists+linux-leds@lfdr.de>; Thu, 04 Jun 2026 13:17:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8476-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8476-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B7B5B305A3B0
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jun 2026 11:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C233A409137;
	Thu,  4 Jun 2026 11:07:30 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F3040961A
	for <linux-leds@vger.kernel.org>; Thu,  4 Jun 2026 11:07:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780571250; cv=none; b=n8ENsgECsd6lpoLvrr/Un0Cb56CjivYQnH1Kdxk+M1ZW3+wA8WJKM8Z46jrVknBvLMSEnZWv2x55RjNJxKTZs6NaYG8l8rDSZis0szzD7HOfUZUu78XarzTSmyhJeSjYrNs8ySjNLl/N6vPh9X/2DKYQfa+unswTQI3et+z1Sjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780571250; c=relaxed/simple;
	bh=r61IsFZ3swYwz17mLPEb7M6IRDu0lmNu/FPvdX3aGJ4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fcUfYeqWcchCNhWopPHet+KyS08aTmCYeTWcp9nG/rA2YQGTF7kVaQvwrvP/gKs32JTHvciMjtq9lbZDU5K96hBEyTAlqXSsNvDhB7Lzp0g8UhAuO6wFuiXN3Kru2k51JJaM4Rxf6U3PZQ43HTUqQJKnL0m9VtX2xoLJy4Qy9r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1wV5v0-0000OO-HM; Thu, 04 Jun 2026 13:07:22 +0200
From: Jonas Rebmann <jre@pengutronix.de>
Subject: [PATCH 0/2] leds: pwm-multicolor: Fix default-trigger by allowing
 default-intensity
Date: Thu, 04 Jun 2026 13:06:56 +0200
Message-Id: <20260604-multicolor-default-v1-0-b07bff431537@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFFcIWoC/yXMQQ6DIBRF0a2QP5YE0DroVowDhKf9jYoBbZoY9
 y7q8Azu3SkhMhK9xU4RP04c5gxdCHIfOw+Q7LPJKFOrWlVy2saVXRhDlB69zZJao+zgPNTLUg6
 XiJ7/97RpH6et+8Kt14mO4wSqqXbHdgAAAA==
X-Change-ID: 20260604-multicolor-default-11e3becde05a
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Sven Schwermer <sven.schwermer@disruptive-technologies.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=r61IsFZ3swYwz17mLPEb7M6IRDu0lmNu/FPvdX3aGJ4=;
 b=owGbwMvMwCV2ZcYT3onnbjcwnlZLYshSjMnIKFnkvsaU1+r6hbWG0a4nf68X3S6dKH9i9zR2f
 tHgr/ZLOkpZGMS4GGTFFFli1eQUhIz9r5tV2sXCzGFlAhnCwMUpABMp3M7I8N2Gp3uyO99C4TqV
 HwlLolbcuPtjwZTsR9f2tpixaX+1OMjwP+NQ+97pkU8VOPh+KFQv+6GawX1N+bd3TJyYqJBg3/1
 lXAA=
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jacek.anaszewski@gmail.com,m:sven.schwermer@disruptive-technologies.com,m:pavel@ucw.cz,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:jre@pengutronix.de,m:krzk@kernel.org,m:conor@kernel.org,m:jacekanaszewski@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,disruptive-technologies.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[jre@pengutronix.de,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-8476-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jre@pengutronix.de,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,pengutronix.de:mid,pengutronix.de:from_mime,pengutronix.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD71E63F5A6

Typically using linux,default-trigger allows turning LEDs on on initialization
or triggering on e.g. a kernel panic regardless of how early.

While supported in pwm-multicolor, this was not usable because the
individual color components multiplication factor (intensity), defaulted
all to 0 (black) and the LED remains off regardless of its overall
"brightness" value.

Allow setting defaults for each component's intensity to make the other
"default-" properties actually usable here.

Update binding documentation accordingly.

Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
Jonas Rebmann (2):
      dt-bindings: leds: Add default-intensity property
      leds: pwm-multicolor: Introduce default-intensity property

 Documentation/devicetree/bindings/leds/common.yaml             | 10 ++++++++++
 .../devicetree/bindings/leds/leds-pwm-multicolor.yaml          |  4 ++++
 drivers/leds/rgb/leds-pwm-multicolor.c                         |  2 ++
 3 files changed, 16 insertions(+)
---
base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
change-id: 20260604-multicolor-default-11e3becde05a

Best regards,
--  
Jonas Rebmann <jre@pengutronix.de>


