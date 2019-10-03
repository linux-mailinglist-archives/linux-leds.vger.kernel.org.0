Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0263BC99D2
	for <lists+linux-leds@lfdr.de>; Thu,  3 Oct 2019 10:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727611AbfJCI23 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 3 Oct 2019 04:28:29 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:36022 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbfJCI23 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 3 Oct 2019 04:28:29 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x938SJTt037686;
        Thu, 3 Oct 2019 03:28:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570091299;
        bh=zHZNeDL779jJyDu708ggzOFMfXOscN51xWhlBD7mkHE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=BQL/d8vhZh4aWHBwYpdSMgD+qbCIIX79p+KyCFfsWk8nQyFwTs/FrT3anI2CPNGdC
         B84Lq4nL1Q0/ZcjKG1k5fJ/LxWtyajMJP0lT1H8OaGwuowG4hY8fDLjpVYIewGpB9J
         qTlAqP/ZVaSmfTnC7MhIYqXHwBxJg1RlVvh7ba4g=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x938SJoJ058528;
        Thu, 3 Oct 2019 03:28:19 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 3 Oct
 2019 03:28:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 3 Oct 2019 03:28:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x938SIAn082890;
        Thu, 3 Oct 2019 03:28:18 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <lee.jones@linaro.org>,
        <daniel.thompson@linaro.org>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ti.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v8 1/5] leds: populate the device's of_node when possible
Date:   Thu, 3 Oct 2019 10:28:08 +0200
Message-ID: <20191003082812.28491-2-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191003082812.28491-1-jjhiblot@ti.com>
References: <20191003082812.28491-1-jjhiblot@ti.com>
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
 drivers/leds/led-class.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 647b1263c579..c2167b66b61f 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -276,8 +276,11 @@ int led_classdev_register_ext(struct device *parent,
 		mutex_unlock(&led_cdev->led_access);
 		return PTR_ERR(led_cdev->dev);
 	}
-	if (init_data && init_data->fwnode)
+	if (init_data && init_data->fwnode) {
 		led_cdev->dev->fwnode = init_data->fwnode;
+		if (is_of_node(init_data->fwnode))
+			led_cdev->dev->of_node = to_of_node(init_data->fwnode);
+	}
 
 	if (ret)
 		dev_warn(parent, "Led %s renamed to %s due to name collision",
-- 
2.17.1

