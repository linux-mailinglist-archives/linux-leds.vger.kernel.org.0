Return-Path: <linux-leds+bounces-6967-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFedHueKlGnTFQIAu9opvQ
	(envelope-from <linux-leds+bounces-6967-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 17 Feb 2026 16:36:07 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 188D814D9B2
	for <lists+linux-leds@lfdr.de>; Tue, 17 Feb 2026 16:36:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D98F4303D677
	for <lists+linux-leds@lfdr.de>; Tue, 17 Feb 2026 15:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D944136CE09;
	Tue, 17 Feb 2026 15:35:30 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABED33509F
	for <linux-leds@vger.kernel.org>; Tue, 17 Feb 2026 15:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771342530; cv=none; b=lQF4/O5EURS60TBcA5VBqwiG7DiemNt/1E6ktJ+hlpOvxn9UZxqiTytLQX2Cmu2hiSaVUofGswZY/CCFQ6neGi1btRgHlIUTT0bK3AEkXY1sHrl3dca79tVWnlXfhPO2eEHalP4VV1f8GSFc46m1cZfF3OIRGPDlZ/4pusYvoOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771342530; c=relaxed/simple;
	bh=S6HNB33xkRNcOLGW/QtYV1xq7PEt+DnrPmhcaj/MZaU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GI/R2vjizLNGJFCQkbD3szt8uxSqkB1OgsAo6BFsvL+AFvBwAP2CJcz36uWRoU4Hm0tadFhwiLgwxAHST49tCEivwUydaSilb6Vy+vqzwvAyJhup9jmKZhlCPkVJt8ec4mqpavRQte3b46/XQZvgU9i5z+XWyK1yOkdA8YIMje4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1vsN6l-00024r-09; Tue, 17 Feb 2026 16:35:27 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH 0/2] leds: lp5860: add enable-gpio
Date: Tue, 17 Feb 2026 16:35:15 +0100
Message-Id: <20260217-v6-19-topic-ti-lp5860-enable-gpio-v1-0-f5e8edeb5d74@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALOKlGkC/2XNQQ6CMBCF4auQrh1TClQkxngPw6LQESeBtraFk
 BDvbtWVcfm/TObbWEBPGFiTbczjQoGsSZHvMtbflRkQSKdmggvJRX6ARUJ+hGgd9RAJRlfVkgM
 a1Y0IgyMLddFzWQldlEqz9Md5vNH6Ma7ttz0+5kTF78gmDEF9qCY7/Ujln/ReoSrVQUpdd+ny4
 tAMc/TW0LrXeH6TnQoIvZ0mik02og5gcI0g94Kz9vl8AacTUyH2AAAA
X-Change-ID: 20260217-v6-19-topic-ti-lp5860-enable-gpio-83c0652d34ad
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Steffen Trumtrar <kernel@pengutronix.de>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pengutronix.de:mid,pengutronix.de:email];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	DMARC_NA(0.00)[pengutronix.de];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.trumtrar@pengutronix.de,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	R_DKIM_NA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-6967-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 188D814D9B2
X-Rspamd-Action: no action

The LP5860 can have the VIO_EN pin either be connected to VIO power
supply or a GPIO.

Add support for the pin to the devicetree binding and the driver.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
Steffen Trumtrar (2):
      dt-bindings: leds: lp5860: add enable-gpio
      leds: rgb: lp5860: add enable-gpio

 Documentation/devicetree/bindings/leds/leds-lp5860.yaml |  7 +++++++
 drivers/leds/rgb/leds-lp5860-core.c                     | 10 ++++++++++
 include/linux/platform_data/leds-lp5860.h               |  1 +
 3 files changed, 18 insertions(+)
---
base-commit: 51455910fda1e5e315f604b7633f413116d4fa1f
change-id: 20260217-v6-19-topic-ti-lp5860-enable-gpio-83c0652d34ad
prerequisite-message-id: <20260217-v6-14-topic-ti-lp5860-v6-1-54a766d8b602@pengutronix.de>
prerequisite-patch-id: 1d4485e2a6544fae1103cf9475f317773f206dc5

Best regards,
-- 
Steffen Trumtrar <s.trumtrar@pengutronix.de>


