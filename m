Return-Path: <linux-leds+bounces-6135-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2B7C5C6B3
	for <lists+linux-leds@lfdr.de>; Fri, 14 Nov 2025 11:01:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E867B355566
	for <lists+linux-leds@lfdr.de>; Fri, 14 Nov 2025 09:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0C3235358;
	Fri, 14 Nov 2025 09:54:41 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9641C3090E2
	for <linux-leds@vger.kernel.org>; Fri, 14 Nov 2025 09:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.23.86.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763114081; cv=none; b=mp/70rvwLBpIQ+81MbSLSVUxYsXSNdKWXkzBQKUR62QU9yW+3mw74YaKoWtL3YXHnUOus0UwJl+G9AcYFoVWjHYdAqqN8LpZ1lJ0sl2WOxIxEfeYudoJAJqN1j3cDtBR06hmw3FLeAveL52wLfW9vC+2CytKEQwQOM+KReda2bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763114081; c=relaxed/simple;
	bh=YveyPSk/Uoa3cLXc82odA1WmCsY6mw7jsdnQ6QYhdTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RMRvIpysT5sqtgKJzpsznE45OZ7eNRdkbKtRnR0rxE0q64aGAjUa0rKC+CtooBjOFtr4hNA8y04bAiEEWmTVfC9gOS4ysgeFiH4NgvyvyYrvmZ/b5o3+bwF+ABeUROtQK6eEcYH69H0SPjILMmdtKYIRaaR/dAtAVhwF8yPhJjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=holoplot.com; spf=fail smtp.mailfrom=holoplot.com; arc=none smtp.client-ip=46.23.86.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=holoplot.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=holoplot.com
Received: from hq-00595.pfsense.f14 (p4ff24940.dip0.t-ipconnect.de [79.242.73.64])
	by mail.bugwerft.de (Postfix) with ESMTPSA id 43185281EAB;
	Fri, 14 Nov 2025 09:46:49 +0000 (UTC)
From: Daniel Mack <daniel.mack@holoplot.com>
To: linux-leds@vger.kernel.org
Cc: pavel@kernel.org,
	lee@kernel.org,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	Daniel Mack <daniel@zonque.org>
Subject: [PATCH v2 1/3] dt-bindings: leds: add issi,is31fl3293 to leds-is31fl32xx
Date: Fri, 14 Nov 2025 10:46:38 +0100
Message-ID: <20251114094640.4096054-2-daniel.mack@holoplot.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114094640.4096054-1-daniel.mack@holoplot.com>
References: <20251114094640.4096054-1-daniel.mack@holoplot.com>
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


