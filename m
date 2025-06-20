Return-Path: <linux-leds+bounces-4866-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E059AE1999
	for <lists+linux-leds@lfdr.de>; Fri, 20 Jun 2025 13:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF5CE3AC224
	for <lists+linux-leds@lfdr.de>; Fri, 20 Jun 2025 11:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D38283FEE;
	Fri, 20 Jun 2025 11:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LjjBf/5M"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879F92836B4;
	Fri, 20 Jun 2025 11:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750417704; cv=none; b=iWz+Af9sshsreLnbQoz4LRfykxWKEanO9qAfgCVcT+bYvdmR3STNa8ST2i6EjkN8TQQzQ2nBN68DI3J+Ia95mBE3CHzKilrSIYlRF4BPPqNZ7E3alH8bbl8s4H/GOCL00pdUTyuOc3865O1MXKmYbpnjxT0y8UuYi5dqj82xvGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750417704; c=relaxed/simple;
	bh=2NBxXKmqGGjyq6HMaYrlf7xajIm8cc3GiP94xNDB6i4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=auItk9ubjUXlrmzFNgpU4E2+0P9QIEWERMtyY5PEkGRgtoDTpUABEbBntdXs2/45bW4U9C09l+qCj65OtyVe9RcUjqpfAHBq+/mdE2m1pSdU4vC+Zg9JiOKJ1NrdK8zsGpDXq5kOnlXA5ShSsrIqa43u21TR4ZgFCkXPQW1jFcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LjjBf/5M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFEA0C4CEE3;
	Fri, 20 Jun 2025 11:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750417704;
	bh=2NBxXKmqGGjyq6HMaYrlf7xajIm8cc3GiP94xNDB6i4=;
	h=From:To:Cc:Subject:Date:From;
	b=LjjBf/5McKbcCoOOsrH1IiNv4wMUmIhLy9TFYTL6DdtVJMrOV2oRZ2ub3d6ihJ4WI
	 Ff9lxErrcJvjmghr3M0coHjJk1a0mVBmq3mmxXpWPp1orJy9SzdZYds9LN0WIuMSJ7
	 2w9bEMNbyLPY19UxNq/hz+agFhQcEG8+3LItQa3jDaV9RxmRNWbmmQadxCycZ98vNP
	 sOzxswfvaQ5A9HRpICFGpVOTPwrV2XtSCXGXMv54Tp/joSOuyhQ4a8km2rtWzP4q8t
	 B0XyNTemjs4NKPjLqsmCBNU1PrKa4PrOw5T4zPqhFQnzltZop/JOCWtRBVcGyOPFLS
	 objqki628vj2A==
From: Arnd Bergmann <arnd@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Hans de Goede <hansg@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] leds: trigger: ledtrig-cpu:: enforce NR_CPUS limit in Kconfig
Date: Fri, 20 Jun 2025 13:08:15 +0200
Message-Id: <20250620110820.3364008-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

This driver fails build testing with larger values of CONFIG_NR_CPUS:

drivers/leds/trigger/ledtrig-cpu.c: In function ‘ledtrig_cpu_init’:
include/linux/compiler_types.h:571:45: error: call to ‘__compiletime_assert_726’ declared with attribute error: BUILD_BUG_ON failed: CONFIG_NR_CPUS > 9999
drivers/leds/trigger/ledtrig-cpu.c:137:9: note: in expansion of macro ‘BUILD_BUG_ON’
  137 |         BUILD_BUG_ON(CONFIG_NR_CPUS > 9999);

Enforce this limit in Kconfig instead to avoid the build failure.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/leds/trigger/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
index c11282a74b5a..e07bd17cfe35 100644
--- a/drivers/leds/trigger/Kconfig
+++ b/drivers/leds/trigger/Kconfig
@@ -65,6 +65,7 @@ config LEDS_TRIGGER_BACKLIGHT
 config LEDS_TRIGGER_CPU
 	bool "LED CPU Trigger"
 	depends on !PREEMPT_RT
+	depends on NR_CPUS <= 9999
 	help
 	  This allows LEDs to be controlled by active CPUs. This shows
 	  the active CPUs across an array of LEDs so you can see which
-- 
2.39.5


