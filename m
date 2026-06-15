Return-Path: <linux-leds+bounces-8597-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VGbLCDXrL2oTJAUAu9opvQ
	(envelope-from <linux-leds+bounces-8597-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 14:08:21 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FCE685FDB
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 14:08:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=siemens.com header.s=fm2 header.b=VJIW+hB1;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8597-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8597-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=siemens.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9073D30422F2
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 12:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5993E5ED3;
	Mon, 15 Jun 2026 12:04:12 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4C53E5ED8
	for <linux-leds@vger.kernel.org>; Mon, 15 Jun 2026 12:04:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525052; cv=none; b=rJwURRDaCdGUtHupdSx5BLM/NlkzaOw78xxa6WgdIKHoHOReyPE5CrzHvsH2/3yBzegn+ryXcBlN5L1051aALryvhKUMo5aYpDrg+R9wE8TJ0CsSftQpqwxvMwRmTTw1xh7yFxXYXsa80oFl24rUAY5kBUEbhFyazIKxfmieTFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525052; c=relaxed/simple;
	bh=PoZENPoFpelQPToGedaF1Qw1CDV54r0klXwF9Vpvzyc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hiXXWJWjw/bUFPb9PTnZ4O5TSWEhxTy8HdwvgtC/jkpR/o+TLjOFeDeyDebkjtt9r57EHixIhcS8b/WA0t606BqVvGgdS75NESwquscEz4kIZQnF+HqSBISvWv7bVj2YpdyyqesirWeBKZ+h9nRzq5lfVV9zK/t09bjG+7zGhlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=VJIW+hB1; arc=none smtp.client-ip=185.136.64.225
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260615120357863ab9da8e000207e6
        for <linux-leds@vger.kernel.org>;
        Mon, 15 Jun 2026 14:03:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=lCOoc1nkAj9LM105Jbsd+SDj6HDskDfhiImH70CCtpM=;
 b=VJIW+hB1r1v2BVNgjuHpz6m0c3XuTFAuC/jxb2JCOs91V5KqN1/rIudfcyLJzmwMVZcyu3
 k4kYp6CZ1PwOIxG8TelhNFFt1GTde3wxRMv4THGZFLSHEZPVkh9//BGZYZEJC8VNJAIP6Nwf
 2UXdbonCtfumlbbYGnB9IGuA0Q3MU7iDYLL0bM1BwnLn7HZkhBsLlmKC1fg9QaSxtWhcz8lx
 S37v3jWBHhxulH3QQHqvux22KJSG5S5EokxDK3y2mDzJ1CVmuLXKEi+beE4JKcnLLynlU0IE
 STyI2qoMO+ZTrxK7VvWSSCMZ1mgkLnIetYx98tLDOYi2spHtQ8KPIelQ==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-leds@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Andrew Davis <afd@ti.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH 0/3] Convert LP8864 LED driver to backlight class
Date: Mon, 15 Jun 2026 14:03:46 +0200
Message-ID: <20260615120353.3409035-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[siemens.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[siemens.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-8597-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[siemens.com,kernel.org,gmail.com,gmx.de,ti.com,lists.freedesktop.org,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[alexander.sverdlin@siemens.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-leds@vger.kernel.org,m:alexander.sverdlin@siemens.com,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:deller@gmx.de,m:afd@ti.com,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.sverdlin@siemens.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[siemens.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,siemens.com:dkim,siemens.com:email,siemens.com:mid,siemens.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C3FCE685FDB

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

This series converts the TI LP8864/LP8866 driver from a pure LED class
driver to a backlight class driver, while preserving backward-compatible
LED class device registration.

The motivation is a use case on a hot-pluggable segment of an I2C bus.
The generic led-backlight driver (drivers/video/backlight/led_bl.c) is
a platform driver and thus inherently non-hotpluggable -- it cannot react
to dynamic appearance/disappearance of the underlying I2C device. By
making the LP8864 driver directly register a backlight class device, it
becomes a self-contained I2C driver that properly supports hot-plug/unplug
events without depending on a separate platform device for backlight
functionality.

The LED class device registration is retained for backward compatibility:
if the "led" child node is present in the device-tree, an LED class device
is registered in addition to the backlight device.

No in-tree device-trees reference this driver, so there is no mainline
impact. Out-of-tree users who previously relied on the LP8864 as a backend
for the generic led-backlight platform driver will notice a backlight class
device appearing directly.

Alexander Sverdlin (3):
  dt-bindings: backlight: ti,lp8864: Add backlight class properties
  leds: lp8864: Rename struct lp8864_led and local variables
  backlight: lp8864: Convert from LED to backlight class driver

 .../bindings/leds/backlight/ti,lp8864.yaml    |  16 +-
 MAINTAINERS                                   |   2 +-
 drivers/leds/Kconfig                          |  12 --
 drivers/leds/Makefile                         |   1 -
 drivers/video/backlight/Kconfig               |  15 ++
 drivers/video/backlight/Makefile              |   1 +
 .../backlight/lp8864_bl.c}                    | 169 ++++++++++++------
 7 files changed, 147 insertions(+), 69 deletions(-)
 rename drivers/{leds/leds-lp8864.c => video/backlight/lp8864_bl.c} (55%)

-- 
2.54.0


