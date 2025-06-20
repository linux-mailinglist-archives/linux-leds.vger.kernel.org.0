Return-Path: <linux-leds+bounces-4867-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6F0AE1A2F
	for <lists+linux-leds@lfdr.de>; Fri, 20 Jun 2025 13:44:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB4933A74A5
	for <lists+linux-leds@lfdr.de>; Fri, 20 Jun 2025 11:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 344EA289E1B;
	Fri, 20 Jun 2025 11:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h2lup0KH"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAD221A425;
	Fri, 20 Jun 2025 11:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750419885; cv=none; b=ArueF5eylsvL3Av14olXkZ0CkUNeczmrltWEPnjwZDeGlFL+X7kyY/mA0aQb3PrGSEW2vscZuMTMIjegQeXyVCEUHbC5pTJDEGSKv/gw/L+nUOTDJcsTMYPttLqr9kcFAX2iCR85kpr+ScPn8eo9nw7gkQK88pGhx+eQZozLYpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750419885; c=relaxed/simple;
	bh=XtR11yMx5ZilD72xUvYz9CFq7rxGWJY+oZxpwYkMdVo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iYD9l3sVP7vvObkMsl+j5LDWS4Yk2/QvwQFjnwu+JZfpstXJmX+T3H/Yk3klQXQ795MfalIuF/dNRL5hU/KPQOF0DlRyM6D9x3lhBflG5JwrdRUFNMHLVwVpJjmMjf0UCkHMve8LZ/dcxTOxF2LXJmSlD7nWQCr+B3yltSP60SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h2lup0KH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C2DFC4CEE3;
	Fri, 20 Jun 2025 11:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750419884;
	bh=XtR11yMx5ZilD72xUvYz9CFq7rxGWJY+oZxpwYkMdVo=;
	h=From:To:Cc:Subject:Date:From;
	b=h2lup0KHvc4PgEcnV49OdwSSj3J/qpGQVd+Dj2bQe71XC7DPyImx5QwwU7mx7YBPE
	 VN40t0HuYCpjacvaZi5spB46NjFyaTbqEQ6jKN/yDi2MdOdQYGCdk8nrHs3MAlgxfu
	 V86wwfo8WfjMOX+b5n/dg9XlNd8niT47xsOAnv1C6K2LeT/iN/TPS6REkGykA4CUgu
	 SzD3DUmbz/J78MD6820rnJnCtPdjlZNjTSm/vmZYySjJwIpf6jdSdpMGO0oGH425KL
	 Dta4pYZydOLPEvv6gRpoarH+AcvB4p4cw+p6qZ+E8IznWvhUw+EYeRKX76Oz/sZhf6
	 ibYZgzqvobzeQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Matthias Fend <matthias.fend@emfend.at>
Cc: Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] leds: tps6131x: add V4L2_FLASH_LED_CLASS dependency
Date: Fri, 20 Jun 2025 13:43:58 +0200
Message-Id: <20250620114440.4080938-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

This driver can optionally use the v4l2_flash infrastructure, but fails to
link built=in if that is in a loadable module:

ld.lld-21: error: undefined symbol: v4l2_flash_release
>>> referenced by leds-tps6131x.c:792 (drivers/leds/flash/leds-tps6131x.c:792)

Add the usual Kconfig dependency for it, still allowing it to be built when
CONFIG_V4L2_FLASH_LED_CLASS is disabled.

Fixes: b338a2ae9b31 ("leds: tps6131x: Add support for Texas Instruments TPS6131X flash LED driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/leds/flash/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
index 55ca663ca506..5e08102a6784 100644
--- a/drivers/leds/flash/Kconfig
+++ b/drivers/leds/flash/Kconfig
@@ -136,6 +136,7 @@ config LEDS_TPS6131X
 	tristate "LED support for TI TPS6131x flash LED driver"
 	depends on I2C && OF
 	depends on GPIOLIB
+	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
 	select REGMAP_I2C
 	help
 	  This option enables support for Texas Instruments TPS61310/TPS61311
-- 
2.39.5


