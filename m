Return-Path: <linux-leds+bounces-3753-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A2CA0ACCD
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jan 2025 01:24:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB9F7188680D
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jan 2025 00:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DBB98493;
	Mon, 13 Jan 2025 00:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="K//zqXzj"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3F633C5;
	Mon, 13 Jan 2025 00:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736727846; cv=none; b=TC0O+5haMDvXM/DW3P/zIPa84SM3i3ReODdL50h0QM2QcbT8t8MPCLgS4CcQNNUxB0JuhGNmDo4TTQvfNaoEa73DILQPBfvcypxhzcM5fP91u91h3n0DsV86MxXy0/ti9PbFhAfF9OhCX7eyrYmjeoG9Dk0RCqkgoKKfrHFDw+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736727846; c=relaxed/simple;
	bh=7IWIetYQnTMZ2QhsC+VEmaER3VBDdgItL1467q5IqJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=beTnuGBDShTP171yWlBL+phV87ZZUdq1PaTR5X0iCuGtlP4HGmL34JUn6ovImAMfDkEmM4+ky3HT6Sn6ameywSROBxRAhtcOdeAm9kH15QMBzgJGj5M0jURFsX7EmpCfACxmne8FAY3xqurqOH/VRNZ5kMmBTOzUo3YtTFtvIys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=K//zqXzj; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 51BA0101F415F;
	Mon, 13 Jan 2025 01:24:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1736727841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GAG6rXKySx7N9XWN2CeELl6QmJfJrz+oozSKI5vLgEw=;
	b=K//zqXzjSTO4cwuwJ6PGV074z/ESc/IDzKRAtsrdt4XUXGyDzwydm52ICeg0wWzXMuPCJy
	OnZjpbmJixDigYzqUxFnngAW75rw+D5i/KAO0LfsPIbDhyXPzCm4pQzKwCE3EtP5nTWC6J
	9QkRg1H6HXX2SjGJELY0qtDKUkW/1M3OrhD4BC7naCEYeYJjU1LNcxAuCVTs08Gv16wfhH
	YG3zoJrxknbLAfRb/0wKjZ+GbJxJIBjodtKUcRc2DICz56XBfGZYghV41+83wfpiVDBQa7
	VVtbEJ8r6dPQ8Kywoax/8Yx90eWFwrYHJn5Ay3e5D8GnweO3xGYkIXRvPZBP+w==
From: Marek Vasut <marex@denx.de>
To: linux-leds@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Lukasz Majewski <lukma@denx.de>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: leds: Document netdev trigger netdev-trigger-mode property
Date: Mon, 13 Jan 2025 01:23:37 +0100
Message-ID: <20250113002346.297481-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Document netdev trigger specific netdev-trigger-mode property which
is used to configure the netdev trigger mode flags. Those mode flags
define events on which the LED acts upon when the hardware offload is
enabled. This is traditionally configured via sysfs, but that depends
on udev rules which are available either too late or never in case of
non-Linux systems.

For each LED with linux,default-trigger = "netdev" described in DT, this
optional netdev-trigger-mode property supplies the default configuration
of the PHY LED mode via DT. This property should be set to a subset of
TRIGGER_NETDEV_* flags.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Christian Marangi <ansuelsmth@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Lee Jones <lee@kernel.org>
Cc: Lukasz Majewski <lukma@denx.de>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-leds@vger.kernel.org
---
 Documentation/devicetree/bindings/leds/common.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index 3e8319e443392..1f1148fdf20c0 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -233,6 +233,12 @@ properties:
       Maximum timeout in microseconds after which the flash LED is turned off.
       Required for flash LED nodes with configurable timeout.
 
+  # Requires netdev trigger
+  netdev-trigger-mode:
+    description:
+      The netdev LED trigger default mode flags, use TRIGGER_NETDEV_ * flags.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
 allOf:
   - if:
       required:
-- 
2.45.2


