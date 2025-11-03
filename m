Return-Path: <linux-leds+bounces-5968-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DA2C2B935
	for <lists+linux-leds@lfdr.de>; Mon, 03 Nov 2025 13:08:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 62BCF4E04A3
	for <lists+linux-leds@lfdr.de>; Mon,  3 Nov 2025 12:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55824307487;
	Mon,  3 Nov 2025 12:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vJBJX71R"
X-Original-To: linux-leds@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61930239E9E
	for <linux-leds@vger.kernel.org>; Mon,  3 Nov 2025 12:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762171702; cv=none; b=aXgiI5MBZUUO3KLhN118l6HFN8ahiuDCtV7D8Bj3+B28SrxubHMZr5sBF+4DLIPXC4/MwfLde4toB7GcedkqNXzeAOH4WeqMMzpqKTmF20EXArUquI8ssM30loeX9MgspebZrrJAsZUO88YZ+jKxddnK+vRQ3JvkGHV4OE7PqMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762171702; c=relaxed/simple;
	bh=p0o2FuMMOcgdqopUEEms1lW5IVeru9s809ZoRQJpmL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cXCG2GCcKNzGPg7hLFQKXHec86Yo/e4Zh+alJY7MKZY/qvOIYXBifI7dFEFLd1ATL5m+sdCcyOsLbL4BsDd7cRGc8IWtOe1G14V4WQoGSGUGNYj1y22plZZndM38M8nmK2m4VzA00rUq0Dv0CpIlh0EolK/iv5ZBls9r55vTwNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vJBJX71R; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1762171698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iGDcyq3Knv+D9H4bmNDRHk5OGsSqZ+1+mXD5MKk+UMY=;
	b=vJBJX71R9aAKiF3PidbLbVwzC+XRssvOjhRmD0dnAbdD7wDbMfGRZobZ4KNDyutbT+V82b
	IR23R7Mn6MiYig+eEndiZgPrVhCMc95HxoMD7mGW2j4UwypZb6fxXXC2Q/vx6Hwd6e4prX
	0CS8ZySVrqA60EAV/dUqbte2UFj6d+c=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] leds: led-class: Replace sprintf with sysfs_emit in sysfs show functions
Date: Mon,  3 Nov 2025 13:08:09 +0100
Message-ID: <20251103120809.32834-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Replace sprintf() with sysfs_emit() in sysfs show functions.
sysfs_emit() is preferred to format sysfs output as it provides better
bounds checking.  No functional changes.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/leds/led-class.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index f3faf37f9a08..885399ed0776 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -38,7 +38,7 @@ static ssize_t brightness_show(struct device *dev,
 	brightness = led_cdev->brightness;
 	mutex_unlock(&led_cdev->led_access);
 
-	return sprintf(buf, "%u\n", brightness);
+	return sysfs_emit(buf, "%u\n", brightness);
 }
 
 static ssize_t brightness_store(struct device *dev,
@@ -80,7 +80,7 @@ static ssize_t max_brightness_show(struct device *dev,
 	max_brightness = led_cdev->max_brightness;
 	mutex_unlock(&led_cdev->led_access);
 
-	return sprintf(buf, "%u\n", max_brightness);
+	return sysfs_emit(buf, "%u\n", max_brightness);
 }
 static DEVICE_ATTR_RO(max_brightness);
 
@@ -122,7 +122,7 @@ static ssize_t brightness_hw_changed_show(struct device *dev,
 	if (led_cdev->brightness_hw_changed == -1)
 		return -ENODATA;
 
-	return sprintf(buf, "%u\n", led_cdev->brightness_hw_changed);
+	return sysfs_emit(buf, "%u\n", led_cdev->brightness_hw_changed);
 }
 
 static DEVICE_ATTR_RO(brightness_hw_changed);
-- 
2.51.1


