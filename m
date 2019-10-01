Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78EC8C3F4D
	for <lists+linux-leds@lfdr.de>; Tue,  1 Oct 2019 20:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731555AbfJASEd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 1 Oct 2019 14:04:33 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:42210 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbfJASEY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 1 Oct 2019 14:04:24 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x91I4Jop054153;
        Tue, 1 Oct 2019 13:04:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569953059;
        bh=2GcFghmzbOxrboNekJ5oh9fzsxmTa0oc0n6YrSflEMI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=BjM/0eE31GIF8cYhZhjX2MPveroV0odtGJ5z7GCVwOfZvqviqxbZIhlDV0sylvLkR
         rZfc9B41ElRHqr+aFMLWc7ArV8v6Cg7Z8rkpsLBL6FCXE/XfJsY6Udvm3XkDrBfbLO
         tt91laFPzyAFryJUQbvoBDAoKW7rs2BN3StulccI=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x91I4JMU036210
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Oct 2019 13:04:19 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 1 Oct
 2019 13:04:19 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 1 Oct 2019 13:04:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x91I4J0a075928;
        Tue, 1 Oct 2019 13:04:19 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 2/5] leds: flash: Convert non extended registration to inline
Date:   Tue, 1 Oct 2019 13:04:36 -0500
Message-ID: <20191001180439.8312-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20191001180439.8312-1-dmurphy@ti.com>
References: <20191001180439.8312-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Convert the #define non-extended registration API to an
inline function.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 include/linux/led-class-flash.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/linux/led-class-flash.h b/include/linux/led-class-flash.h
index 1e824963af17..7ff287a9e2a2 100644
--- a/include/linux/led-class-flash.h
+++ b/include/linux/led-class-flash.h
@@ -98,8 +98,11 @@ extern int led_classdev_flash_register_ext(struct device *parent,
 					struct led_classdev_flash *fled_cdev,
 					struct led_init_data *init_data);
 
-#define led_classdev_flash_register(parent, fled_cdev)		\
-	led_classdev_flash_register_ext(parent, fled_cdev, NULL)
+static inline int led_classdev_flash_register(struct device *parent,
+					struct led_classdev_flash *fled_cdev)
+{
+	return led_classdev_flash_register_ext(parent, fled_cdev, NULL);
+}
 
 /**
  * led_classdev_flash_unregister - unregisters an object of led_classdev class
-- 
2.22.0.214.g8dca754b1e

