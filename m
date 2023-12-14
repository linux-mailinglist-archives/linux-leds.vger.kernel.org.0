Return-Path: <linux-leds+bounces-395-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25947812FEB
	for <lists+linux-leds@lfdr.de>; Thu, 14 Dec 2023 13:21:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 372091C20A0F
	for <lists+linux-leds@lfdr.de>; Thu, 14 Dec 2023 12:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B463399F;
	Thu, 14 Dec 2023 12:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyKCowcq"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88891113;
	Thu, 14 Dec 2023 04:21:00 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3363e9240b4so329119f8f.0;
        Thu, 14 Dec 2023 04:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702556459; x=1703161259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XsKFunyIEF//ykMeSfV/a0SwdfxlBLJSsRhTiMN79G0=;
        b=lyKCowcqaNdBWnuIDXwY7XdtXVW2h/ll7v1U9VHpqysE8HAXIf333XVu+7UfnQpWFO
         DbzJudLlCtGlJubI9iVGKOhhx9gFNnQdK1vmnqKgtpvLQ1mPI3cXFmVkL7EHRliue+ei
         Ij3ytX9ffZQ0RE5MME1Ix24MAyS/zFLgXnco/sGC55DT+t3iqyRo9uLt4AeoFDuArjb0
         4d3V2gxPiduGn/XS4o8Spr4HfG1PuRuWdgZhfqx1WURyhj+kPdyyIQXfl/9VCsYETvlK
         /EffLAH9wvRtNyzy9S8m80qLu5g4gwt0TTPco138d03R4ZUdSTHXz70jKRxo5VzAWCwn
         NDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702556459; x=1703161259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XsKFunyIEF//ykMeSfV/a0SwdfxlBLJSsRhTiMN79G0=;
        b=a5hGBSC924y+MW9a1+BFKq1amMMCdB8ZEfpONeUJiOTD1kpNR2LcYYAyUmULoS2F3i
         GEiPsU2d2/ZP70BsjBFC0boIHCb5I2JQEIjjA+2p2UZsY/ZEbI8ELUXxy7ogsub4vfJN
         fndxtYpNLZpbJ/5j0etz7DV8uj0pjK0DwjmkyYgFvhePrD7GCh1bHLOJSLjktrGM0IjD
         2OUQBj/OBUrTdv89V4p0XDDsZithaL1NyALwyQ0hIn89rqiwAEuZsv9J55JMAj7h+Tnh
         iIP3evAQiQYqZ8JvIOd3zqE9xTYrhwAel+yO/reQ2xNT3G1ERCDXvoYngHIHoOVZAEan
         Rlgg==
X-Gm-Message-State: AOJu0YxvYYNSXdV0skPLD2DEN6ZfIXm0r2J0VvuTSuDwqEuHEq/TlnDE
	rvvHfI/KM59W/W70tzt5vKU=
X-Google-Smtp-Source: AGHT+IFd9GnOEo3uXLIFH2XNQ00FOp1Fd8656uT7gBZ3hma8d0rM0P9MECPNrOecViHOjk0xSlAzeg==
X-Received: by 2002:adf:f609:0:b0:336:45aa:689a with SMTP id t9-20020adff609000000b0033645aa689amr676600wrp.33.1702556458826;
        Thu, 14 Dec 2023 04:20:58 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id s18-20020a5d5112000000b0033330ace23asm15988494wrt.73.2023.12.14.04.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 04:20:58 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Li Zetao <lizetao1@huawei.com>,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v3 2/2] docs: ABI: sysfs-class-led-trigger-netdev: Document now hidable link_*
Date: Thu, 14 Dec 2023 13:20:41 +0100
Message-Id: <20231214122041.17439-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231214122041.17439-1-ansuelsmth@gmail.com>
References: <20231214122041.17439-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document now hidable link speed modes for the LED netdev trigger.

Link speed modes are now showed only if the named network device
supports them and are hidden if not.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Add this patch

 .../ABI/testing/sysfs-class-led-trigger-netdev       | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-netdev b/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
index a6c307c4befa..ed46b37ab8a2 100644
--- a/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
+++ b/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
@@ -88,6 +88,8 @@ Description:
 		speed of 10MBps of the named network device.
 		Setting this value also immediately changes the LED state.
 
+		Present only if the named network device supports 10Mbps link speed.
+
 What:		/sys/class/leds/<led>/link_100
 Date:		Jun 2023
 KernelVersion:	6.5
@@ -101,6 +103,8 @@ Description:
 		speed of 100Mbps of the named network device.
 		Setting this value also immediately changes the LED state.
 
+		Present only if the named network device supports 100Mbps link speed.
+
 What:		/sys/class/leds/<led>/link_1000
 Date:		Jun 2023
 KernelVersion:	6.5
@@ -114,6 +118,8 @@ Description:
 		speed of 1000Mbps of the named network device.
 		Setting this value also immediately changes the LED state.
 
+		Present only if the named network device supports 1000Mbps link speed.
+
 What:		/sys/class/leds/<led>/link_2500
 Date:		Nov 2023
 KernelVersion:	6.8
@@ -127,6 +133,8 @@ Description:
 		speed of 2500Mbps of the named network device.
 		Setting this value also immediately changes the LED state.
 
+		Present only if the named network device supports 2500Mbps link speed.
+
 What:		/sys/class/leds/<led>/link_5000
 Date:		Nov 2023
 KernelVersion:	6.8
@@ -140,6 +148,8 @@ Description:
 		speed of 5000Mbps of the named network device.
 		Setting this value also immediately changes the LED state.
 
+		Present only if the named network device supports 5000Mbps link speed.
+
 What:		/sys/class/leds/<led>/link_10000
 Date:		Nov 2023
 KernelVersion:	6.8
@@ -153,6 +163,8 @@ Description:
 		speed of 10000Mbps of the named network device.
 		Setting this value also immediately changes the LED state.
 
+		Present only if the named network device supports 10000Mbps link speed.
+
 What:		/sys/class/leds/<led>/half_duplex
 Date:		Jun 2023
 KernelVersion:	6.5
-- 
2.40.1


