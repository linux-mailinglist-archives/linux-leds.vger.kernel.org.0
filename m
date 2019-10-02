Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA530C88D8
	for <lists+linux-leds@lfdr.de>; Wed,  2 Oct 2019 14:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727326AbfJBMkJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Oct 2019 08:40:09 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59772 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727194AbfJBMkI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Oct 2019 08:40:08 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x92Ce5xC099755;
        Wed, 2 Oct 2019 07:40:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570020005;
        bh=SeaeW4nYhSYJliZDSdI8+/VmnyNhDewoNXbFcQ4DWWg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=jlj5dVfplmkRzmPrK1z2fmDyrQA86BGCgH37kjCp5TpvQ3hOz5J3DhpU7/Gn3nZ7S
         bcBy7JGZwXStBCUuqAlQZGltreUS4EwZ776sLkafkZ9CP+cuHU4bggx108ct99jmrZ
         Vdu7anQnNyB+ErJ6W1NbfKhP0mek/ZUeBeuzOj6w=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x92Ce59N025037
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 2 Oct 2019 07:40:05 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 2 Oct
 2019 07:39:54 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 2 Oct 2019 07:39:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92Ce45Y055877;
        Wed, 2 Oct 2019 07:40:04 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v2 6/6] leds: core: Fix leds.h structure documentation
Date:   Wed, 2 Oct 2019 07:40:42 -0500
Message-ID: <20191002124042.25593-6-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20191002124042.25593-1-dmurphy@ti.com>
References: <20191002124042.25593-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Update the leds.h structure documentation to define the
correct arguments.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 include/linux/leds.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/linux/leds.h b/include/linux/leds.h
index 52e50183b963..242258f7d837 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -245,7 +245,7 @@ void led_set_brightness(struct led_classdev *led_cdev,
 /**
  * led_set_brightness_sync - set LED brightness synchronously
  * @led_cdev: the LED to set
- * @brightness: the brightness to set it to
+ * @value: the brightness to set it to
  *
  * Set an LED's brightness immediately. This function will block
  * the caller for the time required for accessing device registers,
@@ -298,8 +298,7 @@ void led_sysfs_enable(struct led_classdev *led_cdev);
 /**
  * led_compose_name - compose LED class device name
  * @dev: LED controller device object
- * @child: child fwnode_handle describing a LED or a group of synchronized LEDs;
- *	   it must be provided only for fwnode based LEDs
+ * @init_data: the LED class device initialization data
  * @led_classdev_name: composed LED class device name
  *
  * Create LED class device name basing on the provided init_data argument.
-- 
2.22.0.214.g8dca754b1e

