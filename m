Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A76D27F638
	for <lists+linux-leds@lfdr.de>; Thu,  1 Oct 2020 01:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731987AbgI3XsD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 30 Sep 2020 19:48:03 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:42907 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732008AbgI3Xr6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Sep 2020 19:47:58 -0400
Received: from methusalix.internal.home.lespocky.de ([92.117.51.117]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MtO06-1khDwh18e6-00utdP; Thu, 01 Oct 2020 01:47:41 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kNlox-0007Zd-0j; Thu, 01 Oct 2020 01:47:39 +0200
Received: (nullmailer pid 7778 invoked by uid 2001);
        Wed, 30 Sep 2020 23:47:38 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alexander Dahl <ada@thorsis.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Alexander Dahl <post@lespocky.de>
Subject: [PATCH v6 4/7] ARM: dts: at91: smartkiz: Reference led node directly
Date:   Thu,  1 Oct 2020 01:46:34 +0200
Message-Id: <20200930234637.7573-5-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200930234637.7573-1-post@lespocky.de>
References: <20200930234637.7573-1-post@lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 47063c0bd3b0440d119657da58bc7562
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:kNQzKotdRff+jmTK4enfW2P8VC+lN5Mm6sK3dTcCWyI7KqF5K0w
 hs9y5hvIdZxbvwjGV6d1MbjwF+93wWztobk2nTO8bv4NKOk4hYWJzlm7+DToWFTqnOe+mK2
 bMDeUKjAMcccYMA6iDl3Pt9XXvtPQp57BkpOH8Ls3rFw2QjTLF+FnfU+Bqyjox9GG0VbD2f
 VwLnWtvbe25tfrYuE59KA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xbIVF+xv/VE=:Uz+vC7sq3WUaBiE4lhNcJj
 XwQJ7oHB2rlKtXrmOi4tlJ7hNuFYngnRC3TcDhVMUZZY/YJbHyhMnyR97klNea19PuQDQ4PAT
 HcW6hE6/JqViZM3GvQH/TCJADKdACqyekIbabzFUJir55DytD7v3vQaWBOTBEVNugVDjptxGQ
 eHF1+M8C3h6pZ47Dq8bThNyhotzI0PxPkCXS/7EM3yfT0yzhiLK+0GNJukaE2rAKkGCjMec/c
 0mvyopgCZlaSrnyZa7w0Eg3+1jVr9Yk3QQbI/RlngGQAvAXGhKpbKxHDXet4cmF5t+IaWk7Rj
 22d8aMSIFlQg2ESPrKYwI7p3VI4I7xnU6wDZ3WXkC4HlC4xoONey6XXDG7b86vYgys2iZFzzo
 +Qs3SknH4RmXhIiUwqtvBRdMwXlvjld6TOgkIPVhkoyB3TySHNwUrEXuMPQ1ec7sBWKtVr/yo
 I73Jpk2S5V9fJhN5PKPtklzlMbjvxlPl+wX5lq543st5Bkfa7H1YjL4yLDdvrHQndqZcp0d7D
 qXoVsq+fJlBQIUcJEnEj2+JF1RLI9uooYf3/FNrlQuMQXgUxC/EqGYUoE6VgvOrZBctfLYeO8
 T8jDFI2KphUWZdAGb1toGoycOaMbmbE12pR1145ibXYBInCVw+/uXZDNQKJ6izVqVQV7aB5bz
 WR5QGq+gnDtHt9znqX8/puUZvN5BRG55kRynLEqIBR5Ju/2vFGmi8Ax1t7vL/SlrYC1uvFU9K
 MJrN5ngcABLcteXK5E8NDMhkDj3H+N1L54+IhT4uD1IpSMDXiZ/1z0uO3XJ8DoyydAYRQU5I+
 N9iXWIIMT3DZD/4tzrRnAEtDxkBZRoqbbfgGkJvehDi89Jz5A9pr3uBfY/FYRioJZNNOPi0
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Do it the simple way like for the other kizbox boards.  This will allow
renaming the led controller node name later without breaking things.

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
    v6:
      * added this patch to series

 arch/arm/boot/dts/at91-smartkiz.dts | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/at91-smartkiz.dts b/arch/arm/boot/dts/at91-smartkiz.dts
index 106f23ba4a3b..b76a6b5ac464 100644
--- a/arch/arm/boot/dts/at91-smartkiz.dts
+++ b/arch/arm/boot/dts/at91-smartkiz.dts
@@ -84,10 +84,8 @@
 	status = "okay";
 };
 
-&leds {
-	blue {
-		status = "okay";
-	};
+&led_blue {
+	status = "okay";
 };
 
 &adc0 {
-- 
2.20.1

