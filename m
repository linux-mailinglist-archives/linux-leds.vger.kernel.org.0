Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0233D0A42
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2019 10:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729761AbfJIIvv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Oct 2019 04:51:51 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:43656 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbfJIIvu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Oct 2019 04:51:50 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x998pgL7035182;
        Wed, 9 Oct 2019 03:51:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570611102;
        bh=X7hzJJQEkRzJAXvPctxNxtYyBZx2IAS1X6Y1pIA69ek=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=cg8Hc/XWIeQr5WklalooglsuVPEFPLxKcX4Nv1/0lW7UxGRHsh+dra9xgjWlt0jCT
         qxKpo/excvfInIG8D8r8Vu3pgKy0HMdUyoAhOGWo0sVDYRPwrm4K+bDKtMT4v3uiUG
         yzBHG3CoNynbjFZRq8U/W8lMuCtOehum18/01D4g=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x998pgOP075823;
        Wed, 9 Oct 2019 03:51:42 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 9 Oct
 2019 03:51:39 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 9 Oct 2019 03:51:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x998pfuP119823;
        Wed, 9 Oct 2019 03:51:42 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <sre@kernel.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <lee.jones@linaro.org>, <daniel.thompson@linaro.org>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ti.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v10 1/6] leds: populate the device's of_node
Date:   Wed, 9 Oct 2019 10:51:22 +0200
Message-ID: <20191009085127.22843-2-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009085127.22843-1-jjhiblot@ti.com>
References: <20191009085127.22843-1-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

If initialization data is available and its fwnode is actually a of_node,
store this information in the led device's structure. This will allow the
device to use or provide OF-based API such (devm_xxx).

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
---
 drivers/leds/led-class.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 647b1263c579..bfa1b1033274 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -276,8 +276,10 @@ int led_classdev_register_ext(struct device *parent,
 		mutex_unlock(&led_cdev->led_access);
 		return PTR_ERR(led_cdev->dev);
 	}
-	if (init_data && init_data->fwnode)
+	if (init_data && init_data->fwnode) {
 		led_cdev->dev->fwnode = init_data->fwnode;
+		led_cdev->dev->of_node = to_of_node(init_data->fwnode);
+	}
 
 	if (ret)
 		dev_warn(parent, "Led %s renamed to %s due to name collision",
-- 
2.17.1

