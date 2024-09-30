Return-Path: <linux-leds+bounces-2891-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDE398A04F
	for <lists+linux-leds@lfdr.de>; Mon, 30 Sep 2024 13:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 271051F222DD
	for <lists+linux-leds@lfdr.de>; Mon, 30 Sep 2024 11:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5854118F2FD;
	Mon, 30 Sep 2024 11:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="Fc5IfMur"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C59118F2EA;
	Mon, 30 Sep 2024 11:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727695306; cv=none; b=PlPdTHU97JXk6+8VF+4GCbqjs3NDuYh+OU+H2rANFEo9CGWUw4/25lW47RrKfD3Vs+LKSGaMbfWpPmXQvHb3ZCVeIUw33APUftli5KDSI+C2ZKLs/DqM3lA++wUcEl66Nr+LspSKsAE8gNuCcbG9U/InSfeUYkM28X6TojROcOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727695306; c=relaxed/simple;
	bh=8sci8DgtrJ9SNtSwVT8uZ5lxG7rdzvgJnKLtl5ZI80g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J8vRoMpqsPcMfXl+Em8qtOS5q7rn2luCa/xd9AMlOtOPOUMB/pBMWNKi6GwGXsHWbKT09T4jyMT4KLLBV1Frg3l9tIMlheupjLhTdfozBBnBRa5UflMmwoo8yNhSlY88k7voBVfdYMfsZBYPBdUt8UgJlpBpSyGf+gPWABieC4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=Fc5IfMur; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=++9PHiPPfcqRLOfbhEw3s4YqUtiMU25oIaxfRw6u7a8=;
  b=Fc5IfMurwwhUFvMRrKgQ1ausRbTRfuX8kb0NaTkh6lRVW58kYb7SVKgg
   EWhPcJqRshFmv4azriyQoLZUlGGEJ9o4Ln0sriIQO/DlpuTf8S1Ewrlmp
   d0Rxau02ZprMoJSBw/i0/cFtgq3qD/o3EqXVOqleS/05/28b6d2a6zp2i
   E=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.11,165,1725314400"; 
   d="scan'208";a="185956877"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 13:21:26 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Pavel Machek <pavel@ucw.cz>
Cc: kernel-janitors@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/35] leds: leds-gpio-register: Reorganize kerneldoc parameter names
Date: Mon, 30 Sep 2024 13:20:53 +0200
Message-Id: <20240930112121.95324-8-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240930112121.95324-1-Julia.Lawall@inria.fr>
References: <20240930112121.95324-1-Julia.Lawall@inria.fr>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorganize kerneldoc parameter names to match the parameter
order in the function header.

Problems identified using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/leds/leds-gpio-register.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-gpio-register.c b/drivers/leds/leds-gpio-register.c
index de3f12c2b80d..ccc01fa72e6f 100644
--- a/drivers/leds/leds-gpio-register.c
+++ b/drivers/leds/leds-gpio-register.c
@@ -10,8 +10,8 @@
 
 /**
  * gpio_led_register_device - register a gpio-led device
- * @pdata: the platform data used for the new device
  * @id: platform ID
+ * @pdata: the platform data used for the new device
  *
  * Makes a copy of pdata and pdata->leds and registers a new leds-gpio device
  * with the result. This allows to have pdata and pdata-leds in .init.rodata


