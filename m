Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEC5E5BF61
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jul 2019 17:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730197AbfGAPOj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 1 Jul 2019 11:14:39 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:36198 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730191AbfGAPOi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 1 Jul 2019 11:14:38 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x61FETB9124733;
        Mon, 1 Jul 2019 10:14:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561994069;
        bh=+6v26NB+tLXJYVTGZvrfrMOfb0AGJI+ZnSI3OxEbA4o=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ZLDFCZpHi00XjdBePSH2DWgCNUJhniDPDtuyT4ai5U9eIeAkcSVTqpo4aG1BI+Tp9
         dBugh0r0qdnchtxEd7enLWIiJSbAUSeRpVU0ybl5C0XK7fQqgoJPFgy03zwMbkRRVq
         Tm0i+M9qoj+BTdwE4S8PGMyZvKe5iLm19lvVxZVE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x61FETUC000916
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 1 Jul 2019 10:14:29 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 1 Jul
 2019 10:14:29 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 1 Jul 2019 10:14:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x61FESg8067728;
        Mon, 1 Jul 2019 10:14:29 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <lee.jones@linaro.org>,
        <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ti.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>,
        <devicetree@vger.kernel.org>
Subject: [PATCH 2/4] devicetree: Update led binding
Date:   Mon, 1 Jul 2019 17:14:21 +0200
Message-ID: <20190701151423.30768-3-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190701151423.30768-1-jjhiblot@ti.com>
References: <20190701151423.30768-1-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Update the led binding to describe the possibility to add a "compatible"
option to create a child-device, user of the LED.

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/leds/common.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
index 70876ac11367..2f7882528d97 100644
--- a/Documentation/devicetree/bindings/leds/common.txt
+++ b/Documentation/devicetree/bindings/leds/common.txt
@@ -11,6 +11,9 @@ have to be tightly coupled with the LED device binding. They are represented
 by child nodes of the parent LED device binding.
 
 Optional properties for child nodes:
+- compatible : driver name for a child-device. This child-device is the user
+               of the LED. It is created when the LED is registered and
+	       destroyed when the LED is unregistered.
 - led-sources : List of device current outputs the LED is connected to. The
 		outputs are identified by the numbers that must be defined
 		in the LED device binding documentation.
-- 
2.17.1

