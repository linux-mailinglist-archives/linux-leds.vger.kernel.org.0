Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83090270B01
	for <lists+linux-leds@lfdr.de>; Sat, 19 Sep 2020 07:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbgISFpj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 01:45:39 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:59377 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbgISFpj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 01:45:39 -0400
Received: from methusalix.internal.home.lespocky.de ([92.117.44.159]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N0nOF-1ke2RV0sfF-00wooU; Sat, 19 Sep 2020 07:32:20 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kJVTt-0004nF-K2; Sat, 19 Sep 2020 07:32:18 +0200
Received: (nullmailer pid 7641 invoked by uid 2001);
        Sat, 19 Sep 2020 05:32:17 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Alexander Dahl <ada@thorsis.com>,
        Alexander Dahl <post@lespocky.de>,
        Denis Osterland-Heim <denis.osterland@diehl.com>
Subject: [PATCH v5 1/3] leds: pwm: Remove platform_data support
Date:   Sat, 19 Sep 2020 07:31:43 +0200
Message-Id: <20200919053145.7564-2-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200919053145.7564-1-post@lespocky.de>
References: <20200919053145.7564-1-post@lespocky.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 4bf9351666375fa7ad51de20efbfb169
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:ZapwOjmSjjVYc3LmLhMI3dSVtvP2XiO/5ktb3Tr2uTUx0YpWQPt
 t1eZHLdQadXU+YYjDWSA1BJD3onv11nsn4VGz+dl4rNkHZsSrgwAAZkVffoAj3en7Y3Dcxn
 WDOxyHDuYOwtodFrTnGsCKN6UWsqlhelLySCHfFcdXrH4xRjW0y1aWWdl7gT8osNfVekBFf
 Psp3QF9uFsysCmTEuRa+A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NE+LY5/+wtw=:jynDN0i9tG/sDxNaF6gynw
 PgX3yUk1FwMiMfQkZdhFC8nZp9FjQsZieR23OglQYhIQaPMqopX+e/E2LxfNknkH861xeppCR
 iveS7zRrrRmLMvoJZbp80jOmW1m7eJqzSIb9Afleb3YXpdNofJb3nWfTYKsDBIjHDFe6hHlVl
 ZL+VwDPOTue3WpTNkOcJVu5Ys0CL5eH2YlHYvowaotuRaVjH4DXjsviDSdP/A+D8pj8eV/GZT
 uFXkAnr0b/gAds1cZ0PdZr8a3DPtrGtCX/0qPCBNnT9JqCnSttMcNk9ya17VG8W/os+l0npgu
 w11jXxM+/Omjf5r080Lmmtyoa6U6osUW8vMU8vduXydUgQs5cXr4QHHn+4h4EmHi6DTCjcgLu
 YeOufNwkUNke5OxocG7IjyBPZnltxi31NAyeT0LAU9//o3mwjEBtEwlH8j2YprwpQNMYG+Shh
 IfLPzsevktz+ejHt3iefN7xCz2ZDKSMYitpsDwbHenFkLZDDtd+2B5guWT7EkGRWxK+HkOaxr
 XEkgInirybe9IrqvZUFAIWiSbOducCQT8S7Adph+ryWxlyHBD9o4eniQ7Sl8/lB9Za50OILD9
 sna9wKePjjnLbP0xuRPPGM5wI3GghPEMgl1CCkicEHnlqTeRLKQ8qK+/nQV/99mHn/hlVu0X6
 vnN9vdlgrHzBg12HUaj1ge275B8r6VFgYHrONMNjeofc+HLniPNXaRD6isqVJxRISylGAGcv1
 nMdLFNyPpTvUWKw8kFeMjuhHeNMNSiN1P4WdXFXor8Ebnz/mWdpDfMX5d/B8oeoqdTNDGDsCC
 szjg+Crgdf0R11l1+QDvAPY88Rf5eta9E23YIaBgLOTF98vQDMVgi6R/G5k/0XnkLHJe32J
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Since commit 141f15c66d94 ("leds: pwm: remove header") that platform
interface is not usable from outside and there seems to be no in tree
user anymore.  All in-tree users of the leds-pwm driver seem to use DT
currently.  Getting rid of the old platform interface will allow the
leds-pwm driver to switch over from 'devm_led_classdev_register()' to
'devm_led_classdev_register_ext()' later.

Signed-off-by: Alexander Dahl <post@lespocky.de>
Cc: Denis Osterland-Heim <denis.osterland@diehl.com>
Cc: Marek Behún <marek.behun@nic.cz>
---

Notes:
    v5:
     * added this patch to series (replacing another patch with a not
       working, different approach)

 drivers/leds/leds-pwm.c | 30 +++++-------------------------
 1 file changed, 5 insertions(+), 25 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index e35a97c1d828..4e9954f8f7eb 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -25,11 +25,6 @@ struct led_pwm {
 	unsigned int	max_brightness;
 };
 
-struct led_pwm_platform_data {
-	int		num_leds;
-	struct led_pwm	*leds;
-};
-
 struct led_pwm_data {
 	struct led_classdev	cdev;
 	struct pwm_device	*pwm;
@@ -61,6 +56,7 @@ static int led_pwm_set(struct led_classdev *led_cdev,
 	return pwm_apply_state(led_dat->pwm, &led_dat->pwmstate);
 }
 
+__attribute__((nonnull))
 static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 		       struct led_pwm *led, struct fwnode_handle *fwnode)
 {
@@ -74,10 +70,7 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 	led_data->cdev.max_brightness = led->max_brightness;
 	led_data->cdev.flags = LED_CORE_SUSPENDRESUME;
 
-	if (fwnode)
-		led_data->pwm = devm_fwnode_pwm_get(dev, fwnode, NULL);
-	else
-		led_data->pwm = devm_pwm_get(dev, led->name);
+	led_data->pwm = devm_fwnode_pwm_get(dev, fwnode, NULL);
 	if (IS_ERR(led_data->pwm))
 		return dev_err_probe(dev, PTR_ERR(led_data->pwm),
 				     "unable to request PWM for %s\n",
@@ -143,15 +136,11 @@ static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv *priv)
 
 static int led_pwm_probe(struct platform_device *pdev)
 {
-	struct led_pwm_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	struct led_pwm_priv *priv;
-	int count, i;
 	int ret = 0;
+	int count;
 
-	if (pdata)
-		count = pdata->num_leds;
-	else
-		count = device_get_child_node_count(&pdev->dev);
+	count = device_get_child_node_count(&pdev->dev);
 
 	if (!count)
 		return -EINVAL;
@@ -161,16 +150,7 @@ static int led_pwm_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	if (pdata) {
-		for (i = 0; i < count; i++) {
-			ret = led_pwm_add(&pdev->dev, priv, &pdata->leds[i],
-					  NULL);
-			if (ret)
-				break;
-		}
-	} else {
-		ret = led_pwm_create_fwnode(&pdev->dev, priv);
-	}
+	ret = led_pwm_create_fwnode(&pdev->dev, priv);
 
 	if (ret)
 		return ret;
-- 
2.20.1

