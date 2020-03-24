Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 107B21918D2
	for <lists+linux-leds@lfdr.de>; Tue, 24 Mar 2020 19:20:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbgCXSUd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 24 Mar 2020 14:20:33 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:40768 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727830AbgCXSUd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 24 Mar 2020 14:20:33 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02OIKUES061376;
        Tue, 24 Mar 2020 13:20:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585074030;
        bh=bcKZvJ3hx8TimzvL5uc4q4BoNGeqx9neHHThjZVmsWM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=RZISiVnRpSTKJwBOesN20+KXJzzp31ThTZV+OQgsCq3qhnVi/jCI09DsvogEenUdY
         yQ3stL0rMoEBZWJS5atEZGN+lNu+XuxwFzK3jcqzoprwg1xI2NTCvzuS0UV+LPn5su
         DSaYhJTxXjw3tkOzlIj0QnBgXF6CM8kKghRyfa2E=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02OIKU5M026011
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Mar 2020 13:20:30 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 24
 Mar 2020 13:20:30 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 24 Mar 2020 13:20:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02OIKTWg125243;
        Tue, 24 Mar 2020 13:20:29 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v18 2/4] dt-bindings: leds: Add multicolor ID to the color ID list
Date:   Tue, 24 Mar 2020 13:14:32 -0500
Message-ID: <20200324181434.24721-3-dmurphy@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324181434.24721-1-dmurphy@ti.com>
References: <20200324181434.24721-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add a new color ID that is declared as MULTICOLOR as with the
multicolor framework declaring a definitive color is not accurate
as the node can contain multiple colors.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 include/dt-bindings/leds/common.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index 9e1256a7c1bf..7006d15f71e8 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -29,7 +29,8 @@
 #define LED_COLOR_ID_VIOLET	5
 #define LED_COLOR_ID_YELLOW	6
 #define LED_COLOR_ID_IR		7
-#define LED_COLOR_ID_MAX	8
+#define LED_COLOR_ID_MULTI	8
+#define LED_COLOR_ID_MAX	9
 
 /* Standard LED functions */
 #define LED_FUNCTION_ACTIVITY "activity"
-- 
2.25.1

