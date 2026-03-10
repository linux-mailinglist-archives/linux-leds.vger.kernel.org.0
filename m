Return-Path: <linux-leds+bounces-7248-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLMzG7svsGkShAIAu9opvQ
	(envelope-from <linux-leds+bounces-7248-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 10 Mar 2026 15:50:35 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB762527DD
	for <lists+linux-leds@lfdr.de>; Tue, 10 Mar 2026 15:50:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C2FB3157948
	for <lists+linux-leds@lfdr.de>; Tue, 10 Mar 2026 14:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71186264A86;
	Tue, 10 Mar 2026 14:15:09 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542071A9F8C
	for <linux-leds@vger.kernel.org>; Tue, 10 Mar 2026 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773152109; cv=none; b=kHhCok2E0n60xOxX2KPc7DqGk4gcYMxc9s3LOGdk+8AICrORslW9Du71TXnto73w3c8VCPZmiHcX6VqpoG06iLffDOZoipFNMXQz6ET71E1W8CNwFb7EURr8y2SghO1caU1JmO+ym0L8gA3cFDc/zGGaIxlEXjrdsGh+qqFJfA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773152109; c=relaxed/simple;
	bh=N9514f0RNEbSDNCJoPfbCNal9nNlU1pfx+gQoyGcuwM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A+X3ge9puALyJ8IkZK62eJI1IfRN90GljbJRsK2VAps8x8d1EZ+OOYKrptP/DRmLrm+KtQ914LSTkPTizVnfBGFmEC0fZSfamAM733DIihxjKUbjIMeH6v5xzFhVpml+gMpQmdGlBf28N9PRq9rbQGwmz5SOHYH4ud95Hr/tUsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1vzxrU-0006Tq-GM; Tue, 10 Mar 2026 15:15:04 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH v2 0/2] leds: lp5860: add enable-gpio
Date: Tue, 10 Mar 2026 15:14:38 +0100
Message-Id: <20260310-v6-19-topic-ti-lp5860-enable-gpio-v2-0-3fcc617fe03a@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE4nsGkC/5XPQW7DIBCF4atYrDsRYBscK6pyjygLDBNnpNi4Q
 FCqyHevQ3btqst/FvPpPVnEQBhZXz1ZwEyR/LyF/KiYvZp5RCC3NZNcKi6FhqxA7CH5hSwkgtv
 SdooDzma4IYwLeehqy1UrXd0Yx7Y/S8ALPYpxOr874Nd9o9L7yCaM0RSqrw5Fqvm+SM0fKWsQM
 Ah0yirTaIvHBefxnoKf6bFz+PkiBxMRrJ8mSn2V9Y5DsIK98CvF5MN32ZtF0f8xLQvgcGmxQ4d
 D63TzC2fndV1/AEcyx6xUAQAA
X-Change-ID: 20260217-v6-19-topic-ti-lp5860-enable-gpio-83c0652d34ad
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Steffen Trumtrar <kernel@pengutronix.de>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Rspamd-Queue-Id: DEB762527DD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pengutronix.de:mid,pengutronix.de:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.695];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FROM_NEQ_ENVFROM(0.00)[s.trumtrar@pengutronix.de,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-7248-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Action: no action

The LP5860 can have the VIO_EN pin either be connected to VIO power
supply or a GPIO.

Add support for the pin to the devicetree binding and the driver.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
Changes in v2:
- add acked-by
- updated deps to newer lp5860 series
- rebased to v7.0-rc1
- Link to v1: https://lore.kernel.org/r/20260217-v6-19-topic-ti-lp5860-enable-gpio-v1-0-f5e8edeb5d74@pengutronix.de

---
Steffen Trumtrar (2):
      dt-bindings: leds: lp5860: add enable-gpio
      leds: rgb: lp5860: add enable-gpio

 Documentation/devicetree/bindings/leds/leds-lp5860.yaml |  7 +++++++
 drivers/leds/rgb/leds-lp5860-core.c                     | 10 ++++++++++
 include/linux/platform_data/leds-lp5860.h               |  1 +
 3 files changed, 18 insertions(+)
---
base-commit: 559f264e403e4d58d56a17595c60a1de011c5e20
change-id: 20260217-v6-19-topic-ti-lp5860-enable-gpio-83c0652d34ad
prerequisite-message-id: <20260309-v6-14-topic-ti-lp5860-v7-1-b1ed6c6a47ce@pengutronix.de>
prerequisite-patch-id: 45e295aab0d3ea7d92bf71596f8b0e18e8621ac0

Best regards,
-- 
Steffen Trumtrar <s.trumtrar@pengutronix.de>


