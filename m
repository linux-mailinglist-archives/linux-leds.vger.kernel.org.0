Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D88C271040
	for <lists+linux-leds@lfdr.de>; Sat, 19 Sep 2020 21:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbgISTbp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 15:31:45 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:60717 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbgISTbp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 15:31:45 -0400
Received: from buildfff.adridolf.com ([188.192.134.246]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MVMqF-1jruTe2hiZ-00SKQD; Sat, 19 Sep 2020 21:26:41 +0200
From:   Adrian Schmutzler <freifunk@adrianschmutzler.de>
To:     linux-leds@vger.kernel.org,
        Adrian Schmutzler <freifunk@adrianschmutzler.de>
Subject: [PATCH v2 1/2] dt-bindings: leds: add LED_FUNCTION for wlan2g/wlan5g
Date:   Sat, 19 Sep 2020 21:24:26 +0200
Message-Id: <20200919192427.57033-1-freifunk@adrianschmutzler.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:OHN8o7SA4wG8GS22Hbyjhi09vk+aZ7uq5j76qHOnd5ZQG5gbdKU
 XEQfulb7Z0Q0cKu3YBtta8LBiVhoQpW/mJAjlRYc0HfREQegH75zZ6A2ID69CpWAijp4yNf
 LM+ECmCB2D+Tu9cQSPfoRTxkz2YcgMqBRgHhSfd33LJniY95VrPzumgXZVZPSk/5osfF0U8
 7FMN+1yDTRamQPIFPDI2Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:K4IsxMa4BOY=:5yea0A7s1jdq8HXbjETULf
 bFzaFaxRGmUKBelvs1FcOUBDqctXOhY3gZYkCas3yRDUZo4X69HRr4nCmVzYDi6DHuKLb+UdA
 Aintw4m/CErSzrmsIh3WTuWCZ/C2UMgFu0gcsWoLbJBtD5EZm5fGH2nUdquJ6hZTsdLKj/4QM
 lfkuGEGISYUolNS3io2jibNFYRb7JpAG/uKYptM+sr/2OaBiMgzZJBB9KHAnrKteIEqHZvBjy
 r9eLhOB/qqVDJfdCL9xe8mY+u22GGR8F/4hQbsoQkxALcPMrowzL8/pkftL5EUUKC88WSOQgw
 aEf6CdKvTXdg8fnYxo9QkZ4mTRZ8QZQgQP2NAj1+rXFWVT42rcd/Y6S5/DXO9U2t4D3ZVpMc9
 fqZNEPsJQsQTBa1v2uI0HzCgU+BpeBdcLXWEMg5LLqzTtULiRjun04Z7blURj06jHbvMjD4xM
 AnLaoVjMkFKCMMv0ztvojcxlnYXBmhIxEFRb7I3fqYyhAg5EpYTFRvRqoWuES5/3+ao7Y5WBr
 9hAb7tAItiyaHyGtBynVDlKplr0+XYgLx/V4Amwj37lsebt4jGROFgO2Mj1eVrIHQDUtyaCno
 SUy75DHUwFOl0nDW90S5aupAg/mAzLzUF1onnoqDGM4ex4hhTj+Men75bbLU9euMmCXKHM+Gd
 UR2T6Cg0aNEmXqaIn7ZaYhKH8MqHjG7zdoAa1Kzxh72HMvM107IKya3xTEMAY8gfWtxIu0UDz
 Ki3lwwOLAndvmCmFRCbvhjRQuEx1A5XIkjMCafsWRVPmxJFvgYKbFkegYZmYc9VRjr4UcA2OR
 5QUzFsk6tQ/spquyH7ZPqvGxtMGi8IWILzotZjl86r8N+YDJcWga81ME8aMH5EWA2CY4FSjCW
 ++xsKCP+pT4jEDmbJASQ==
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Many consumer "routers" have dedicated LEDs for specific WiFi bands,
e.g. one for 2.4 GHz and one for 5 GHz. These LEDs specifically
indicate the state of the relevant band, so the latter should be
included in the function name. LED_FUNCTION_WLAN will remain for
general cases or when the LED is used for more than one band.

This essentially is equivalent to how we use LED_FUNCTION_LAN and
LED_FUNCTION_WAN instead of just having LED_FUNCTION_ETHERNET.

Signed-off-by: Adrian Schmutzler <freifunk@adrianschmutzler.de>

---

Changes in v2:
- Without typo this time. Sorry.
---
 include/dt-bindings/leds/common.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index 52b619d44ba2..debbd406ff17 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -89,6 +89,8 @@
 #define LED_FUNCTION_USB "usb"
 #define LED_FUNCTION_WAN "wan"
 #define LED_FUNCTION_WLAN "wlan"
+#define LED_FUNCTION_WLAN2G "wlan2g"
+#define LED_FUNCTION_WLAN5G "wlan5g"
 #define LED_FUNCTION_WPS "wps"
 
 #endif /* __DT_BINDINGS_LEDS_H */
-- 
2.20.1

