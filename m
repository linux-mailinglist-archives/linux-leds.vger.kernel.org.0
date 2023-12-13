Return-Path: <linux-leds+bounces-361-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54146811578
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 16:01:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 864B71C2097F
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 15:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C9EE2F846;
	Wed, 13 Dec 2023 15:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFpINTgX"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DAF383;
	Wed, 13 Dec 2023 07:01:15 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3363880e9f3so704336f8f.3;
        Wed, 13 Dec 2023 07:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702479674; x=1703084474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XsKFunyIEF//ykMeSfV/a0SwdfxlBLJSsRhTiMN79G0=;
        b=VFpINTgXdBbtq1z4JzZmHFhADCfKPWcMySqfnF4Etu6mzSX1gGGLSmG5XdZYmw+sd4
         2O8TPHivEWR3zuu9oNFI5kxC/R1yq7PTp2rsHWo8CKVycUMz+t50bRr0fiEv8HBGwkAJ
         xFbXFGsDDbD4XdG291H3+gbe6GiEnDZUEgD1T89fIKjXJ9wGb53KNKxcc+/BvFhkUBK2
         wmrigUgWWaZ+2udjg6gdSowe+8bAP45CiFiJ8HpHA7uNC0SOvV5scGQmNcdnoRlj8p8e
         lznZLH/BlcbhK/I3GZTDvuEBIdekv+cnxKJB/LdLJvCbrNz43hGZFdIy+Yp2I6s0LDX3
         MkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702479674; x=1703084474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XsKFunyIEF//ykMeSfV/a0SwdfxlBLJSsRhTiMN79G0=;
        b=ajzbNMZThtuPtziUNzjWtZdipBeYTcMCycMrWxPKNnuHRxAdwfDRJOM6yOeMbe8XZj
         N1ZIAyQT+7rxDwzhEGS5BeBsK90+IfGdKM6eJDL6GauQIPX3eWsACKFjyZNly7OxADpI
         IMPhFGGIm4KVXC73xDam1zMjalb4WxiQKCSs2pwmzEn2gyORSmjTlIUyrG2LSDWvS4d8
         0SdSSiWZuM6+4XiIKfsMdpTOomwb4Z4z66mIDLGMT5Jo+or1cNZrZP6Ztz5viIz2v1qg
         bxJSidlUV4Su58J31j4klGsMZF0dtR8wJ2Aj5b17KddG4xQjWyn27tUhq5TC0Lfr7Wxa
         PEcA==
X-Gm-Message-State: AOJu0Yxz0iohTg2O5lOS0sgNwaIdfxCbJYJLEuqJR7Y8E9gin0wBmYyb
	Qem9sQQmlhrdzuqy3sNzI6g=
X-Google-Smtp-Source: AGHT+IEOLy+q3dqC7t3MNh/Guc+jrAH7t5b65xe4TwTDw8noWrph74ysNnmlEagMa8VWj4GSj2qxTg==
X-Received: by 2002:a5d:4887:0:b0:333:145e:f529 with SMTP id g7-20020a5d4887000000b00333145ef529mr4121057wrq.33.1702479673783;
        Wed, 13 Dec 2023 07:01:13 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id e6-20020a5d4e86000000b00336365d1dafsm2814378wru.69.2023.12.13.07.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:01:12 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Li Zetao <lizetao1@huawei.com>,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v2 2/2] docs: ABI: sysfs-class-led-trigger-netdev: Document now hidable link_*
Date: Wed, 13 Dec 2023 16:00:33 +0100
Message-Id: <20231213150033.17057-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231213150033.17057-1-ansuelsmth@gmail.com>
References: <20231213150033.17057-1-ansuelsmth@gmail.com>
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


