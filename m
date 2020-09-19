Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE7CD27103F
	for <lists+linux-leds@lfdr.de>; Sat, 19 Sep 2020 21:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbgISTbp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 15:31:45 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:45407 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbgISTbo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 15:31:44 -0400
X-Greylist: delayed 302 seconds by postgrey-1.27 at vger.kernel.org; Sat, 19 Sep 2020 15:31:44 EDT
Received: from buildfff.adridolf.com ([188.192.134.246]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M8hlZ-1kONCS3KFt-004nXT; Sat, 19 Sep 2020 21:26:41 +0200
From:   Adrian Schmutzler <freifunk@adrianschmutzler.de>
To:     linux-leds@vger.kernel.org,
        Adrian Schmutzler <freifunk@adrianschmutzler.de>
Subject: [PATCH v2 2/2] dt-bindings: leds: add LED_FUNCTION_RSSI
Date:   Sat, 19 Sep 2020 21:24:27 +0200
Message-Id: <20200919192427.57033-2-freifunk@adrianschmutzler.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200919192427.57033-1-freifunk@adrianschmutzler.de>
References: <20200919192427.57033-1-freifunk@adrianschmutzler.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Qjb+Jis3UvWPd5J+vLhYLtiL19xO1dLdbixjbcbPsZXoW2X0R5y
 mF/ptCSf7QAuSd8fJWjMWyq4jnFdAgHGHfZc5kaMzYMdbAMcOhVbFYmscgQYk2oOyjwfj5R
 +uJJmXIZZbXtkyH1wD8PuYhKKSUUkcVMoiRq9FKSV2kRiv2+f9Wj4Wqd4HOuB2qVWeE2MPO
 M9MauqaHX48bF2APAPsDQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GkTG740L4Ok=:1st+LG5Sata8IfaRy0uday
 lqqJLtjG4umqTv4aG1xZYieNZNRYmfLDnJm32mjRU76w0bPBLL5J/qcXW2WD9eOwOJ/z0/KQK
 SSxk2/EfPtlZ7m5FP43jEq3qLpW0oz9Nv2hcBd3hHoGJo5c5eHIq2yqsIDmHuXyHuAU8/bcih
 2/kFi2zM1onanwJZh/lXruMcD+jWHQhBozJk9JaMj1umN5yqjtnLHNcwUfb7LYitP3cdslxgj
 5FGG/xbuBa7+R5mvm/1sM+BqcaNRH3H20yxtENybeFWVq98+gijDb8eiVF0rYVhwP+sPQ8UlW
 PDe9Kv7JK91P243ejhF/yhNjdxKFNiOUPxBW8PgM+AE1C32GtsQIgDuMbYK7eDY8urCPkthn8
 ulQi/xff20j40zC+xg/1URGxB5+Qb7SABQZy/W6pkOEcEjUzuXJXhIcjs3RgEtbo5wzj2V0Tm
 nt21wyoDcqkJIAgFKN/CpNtvjBilhippFao2Tq2TvOx/Q3qQKnKtWzLlaxzXCklxKVFRns+mQ
 RRf8q1z2Cc7Vc7anKl0YXX2D3T9BLWhGV7B5OX4M8rbCoHmz9MMkbsXL41E98++7BDkMJ2pNG
 I1uVdDgkgC1JuytRIZrv9SA6rohS7wVXxSWyB8Y/hkCz2FMC7epYSYG4oWxg7lQqX6VhL7Oqk
 WE6j7Z/LoxHOcXmLBUBlxnfjgN8u9p2336k3UeUFpEveiHw/Xn7I0KjzV93D5zE7q7ayfNk5B
 rVncPpHxP+oJWiqoqQIQSxEJyls7OqxNrqDQNdsgIVBokXJUvCbPtybVwE70etIsGNxBwdfJF
 tKxYK0Ylv8g52HB07YkwAS2mKludA/of++UdA1R6hmoaMFwPlfYyxTOZtT6DpUz6i0zb8DVX7
 yXFrXlwIbvnhmJl6ZP3Q==
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Several consumer "routers" and CPE devices have dedicated LEDs to
show the received signal strength indicator (RSSI). This is
different from the "WLAN" LEDs that just show enabled/disabled
state and sometimes rx/tx activity.

Add a LED function for these LEDs.

Signed-off-by: Adrian Schmutzler <freifunk@adrianschmutzler.de>

---

Changes in v2:
none
---
 include/dt-bindings/leds/common.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index debbd406ff17..c4821a44e422 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -81,6 +81,7 @@
 #define LED_FUNCTION_MTD "mtd"
 #define LED_FUNCTION_PANIC "panic"
 #define LED_FUNCTION_PROGRAMMING "programming"
+#define LED_FUNCTION_RSSI "rssi"
 #define LED_FUNCTION_RX "rx"
 #define LED_FUNCTION_SD "sd"
 #define LED_FUNCTION_STANDBY "standby"
-- 
2.20.1

