Return-Path: <linux-leds+bounces-4576-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D04AAA1F9
	for <lists+linux-leds@lfdr.de>; Tue,  6 May 2025 00:53:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A720C7AFF51
	for <lists+linux-leds@lfdr.de>; Mon,  5 May 2025 22:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 584102D3FA5;
	Mon,  5 May 2025 22:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RoAAFJVa"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8FA1C1F05;
	Mon,  5 May 2025 22:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746483645; cv=none; b=tFq/j2799VkNAI3EimEnkJvnA0pw8hOxXn6wFzsxw7IQXZmIgrZ+oyhvpXmaMm+HsuDfgkz8vmKf31wd8aBKTqRbF/FloDstDIYqlTnCM7Hc9G/o2kxR6uaseG2IAP2W45gsOo/0Akzkmnpw/nyZF4RemnHA9tFweXEHwKefuz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746483645; c=relaxed/simple;
	bh=fVvvLKogYm++tZvMxX2B3Xw5iybaZOLuQ6ee6V4DCSc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HMBoGwBYyDautOqpOmoHad5QElz0+FHKOShlCdU7Jui1hu/+nOCmXChNY+RYTAjTfLfzogERsfCyOPgLh7FT5Euk75Fu16VfxZW2xc1wNqJgA37QT+SYJZSoeSRh/QDYJ3QO/Z3U7pr8MCLSmz4v5ncql/Hk7kMdGdr6drPOMXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RoAAFJVa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA02C4CEE4;
	Mon,  5 May 2025 22:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483644;
	bh=fVvvLKogYm++tZvMxX2B3Xw5iybaZOLuQ6ee6V4DCSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RoAAFJVaV0oqJe2fzdVeB4FESuFJQQEr1hdrdHqOlLq9U3qRjmenthHsxQsn5Nl84
	 qbprbFQnwgXw7s1t/6pQWvga5ogzwN77RfOSLJcMEkIsFj2gKQdLrX+RtcSzAGUOjG
	 Pwztko3qPYEhHLjmqpXA8kMB72PTSYslnl56uh64BpvleT6yHvpd3eQe66tUMw7tPI
	 vd7A0GIJeSSmnp8Tqf8O1vTwu9FuLPfh9P5Aiwzm5W2OPhIKFoLrY0oIM1uySvrQrU
	 Hf2spY37oUvpB/gbAWI7HUfhWpTpzbNPy4CLM3LsuOCopI45MafhsE2j3qE3JXLE+3
	 kumby/Ms7W3Pg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Manuel Fombuena <fombuena@outlook.com>,
	Lee Jones <lee@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	pavel@kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 157/642] leds: Kconfig: leds-st1202: Add select for required LEDS_TRIGGER_PATTERN
Date: Mon,  5 May 2025 18:06:13 -0400
Message-Id: <20250505221419.2672473-157-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Manuel Fombuena <fombuena@outlook.com>

[ Upstream commit be2f92844d0f8cb059cb6958c6d9582d381ca68e ]

leds-st1202 requires the LED Pattern Trigger (LEDS_TRIGGER_PATTERN), which
is not selected when LED Trigger support is (LEDS_TRIGGERS).

To reproduce this:

- make menuconfig KCONFIG_CONFIG=
- select LEDS_ST1202 dependencies OF, I2C and LEDS_CLASS.
- select LEDS_ST1202
- LEDS_TRIGGERS is selected but LEDS_TRIGGER_PATTERN isn't.

The absence of LEDS_TRIGGER_PATTERN explicitly required can lead to builds
in which LEDS_ST1202 is selected while LEDS_TRIGGER_PATTERN isn't. The direct
result of that would be that /sys/class/leds/<led>/hw_pattern wouldn't be
available and there would be no way of interacting with the driver and
hardware from user space.

Add select LEDS_TRIGGER_PATTERN to Kconfig to meet the requirement and
indirectly document it as well.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Link: https://lore.kernel.org/r/CWLP123MB5473F4DF3A668F7DD057A280C5C22@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
Signed-off-by: Lee Jones <lee@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/leds/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 2b27d043921ce..8859e8fe292a9 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -971,6 +971,7 @@ config LEDS_ST1202
 	depends on I2C
 	depends on OF
 	select LEDS_TRIGGERS
+	select LEDS_TRIGGER_PATTERN
 	help
 	  Say Y to enable support for LEDs connected to LED1202
 	  LED driver chips accessed via the I2C bus.
-- 
2.39.5


