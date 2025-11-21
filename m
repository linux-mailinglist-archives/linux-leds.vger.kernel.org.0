Return-Path: <linux-leds+bounces-6267-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFCDC78E3A
	for <lists+linux-leds@lfdr.de>; Fri, 21 Nov 2025 12:45:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 200054EBBBA
	for <lists+linux-leds@lfdr.de>; Fri, 21 Nov 2025 11:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81643350A3E;
	Fri, 21 Nov 2025 11:36:24 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8AD234FF65
	for <linux-leds@vger.kernel.org>; Fri, 21 Nov 2025 11:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.23.86.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763724984; cv=none; b=st7LyhqvaGniLDcYIvpdOgcDI2Rln1K24AVML638R5yEczyx/ORQaahOQes3u+CvnVcJMXlBQU1tCKpujWeeVV46LxquEvSJ7w56mkgFL47wEHkanIU+xp7hb8AhfJtMP5CKRAOEY9+0FLdyUsi9NIl3D8YwpZrE5VgzNJ2wURM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763724984; c=relaxed/simple;
	bh=/a545e6fZRml0lFSUSAtl/PqAMTBrvfjRiZVHm6Q4M0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M6RYP6xiJejF/CqzSNSmUQADaNDj4WDhj3FlcE3/MrjCiklttRYb5bdLZg45QkUyYlPZDXazEpbizQCAC3S06v/mP4hHhZXjyc1O4KDWtbnZ9qn+p4UBJiFmo0vP4FXn2xz0Ceutgvh8LfXNHG1Su7RZbnESX3WDOuOUacYfSjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=holoplot.com; spf=fail smtp.mailfrom=holoplot.com; arc=none smtp.client-ip=46.23.86.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=holoplot.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=holoplot.com
Received: from hq-00595.pfsense.f14 (p4ff24940.dip0.t-ipconnect.de [79.242.73.64])
	by mail.bugwerft.de (Postfix) with ESMTPSA id C8739281ED5;
	Fri, 21 Nov 2025 11:36:14 +0000 (UTC)
From: Daniel Mack <daniel.mack@holoplot.com>
To: linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	Daniel Mack <daniel@zonque.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/3] dt-bindings: leds: add issi,is31fl3293 to leds-is31fl32xx
Date: Fri, 21 Nov 2025 12:35:55 +0100
Message-ID: <20251121113557.77418-2-daniel.mack@holoplot.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251121113557.77418-1-daniel.mack@holoplot.com>
References: <20251121113557.77418-1-daniel.mack@holoplot.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Mack <daniel@zonque.org>

This variant supports 3 channels with 4096 brightness steps.

Signed-off-by: Daniel Mack <daniel@zonque.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
index 926c2117942c..7082ed186dd9 100644
--- a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
+++ b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
@@ -10,6 +10,7 @@ Required properties:
 	issi,is31fl3235
 	issi,is31fl3218
 	issi,is31fl3216
+	issi,is31fl3293
 	si-en,sn3218
 	si-en,sn3216
 - reg: I2C slave address
-- 
2.51.1


