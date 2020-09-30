Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F69E27F62E
	for <lists+linux-leds@lfdr.de>; Thu,  1 Oct 2020 01:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731975AbgI3Xrv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 30 Sep 2020 19:47:51 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:38083 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbgI3Xrv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Sep 2020 19:47:51 -0400
Received: from methusalix.internal.home.lespocky.de ([92.117.51.117]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MBDrM-1kGeY90zPi-00CgJ0; Thu, 01 Oct 2020 01:47:23 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kNlod-0007Z0-T1; Thu, 01 Oct 2020 01:47:21 +0200
Received: (nullmailer pid 7728 invoked by uid 2001);
        Wed, 30 Sep 2020 23:47:19 -0000
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
        Alexander Dahl <post@lespocky.de>,
        Denis Osterland-Heim <denis.osterland@diehl.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH v6 1/7] leds: pwm: Remove platform_data support
Date:   Thu,  1 Oct 2020 01:46:31 +0200
Message-Id: <20200930234637.7573-2-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200930234637.7573-1-post@lespocky.de>
References: <20200930234637.7573-1-post@lespocky.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 257374c4a781fc070d55e21f439eb91a
X-Spam-Score: -2.8 (--)
X-Provags-ID: V03:K1:jOBjAF/CkF48hBbOCUr5Z1QgpCLc02GeaEYNbCwJ99PA1LLbkiZ
 xHzp1rqs9sSPt1xHxyhq4jLizqlO9LFAw++h6YE0LN//pXOKbLHkKBiiiGwmFPlz7CdFDLg
 JNaqS1r+44GEpZCiXEfTEmJDd8Qp1ji40AAzKG+i3m1nCi1cNdsx/EgsVuJ4zuovoJNDa6y
 dgbxd+LBEval1wn5/02LQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GSF88Ru63gE=:fVUBUUaVYcOB8FBvPO/ppG
 wJ59KSFdKkPsDDQGJulkZ5RoXmTDDno1WSs/s35+AqRr9FKp6arQHplZDE21a7pYiwtgllW5f
 Iz4fjCCTRN5u17zN4sswYwd+eQqtN0wgC/GeJh3iLP/0u7qw9IliGjLSWXZEvbFjKpT4W71Yy
 y6DigH3OgpQzKihT4hSu5Rz2tBRCkajY8u0zKaU9Qm0kDCY8uL3qQ4qU49vq11zwA1uxz0be9
 0gA0tBAVQrEaH2Azi1eiQnDL29uTWE3NUyVa91wMRJuqeQfQnJEcGqUYRH99H+ID+iZx2UXSX
 135mff55LNYdB51u1Q8ewbc69X7R3jejwgV/oS2uVMU78KzrzBTPIDiP2/CYmBmNq2ROPQN+X
 rlPaV8YVwJlkzpzfhycj/dy/sJKJONYJuqi80chS0VIIOpvElOpa9C4g99xISgXTnT+g++y8o
 5MVXRv3HFv3re8X4xU87/qXhDSz4cI5Xd4cXj0LkejP52cP0NQEAdDpu7n27WbzFRAicuHyJQ
 JGGQJMnjBQjuYqBEdAIpw0g7UvhNi6+AYteUj6D+eI7eMe4mO/iC/OwZhz/xBQFu5swmtmxp+
 37JYjxZeCRLfQXSso6sY76nyyu7+MaJR4QtOW/dzjgI61Rg8hjgO78AGQAVBKNbDqMDnegHGA
 v21NWOYBOO+ELiQ75QGMhBDYJyheeAhgj7KgZlT/crfVomMf/89fWO5ExILEQ40RXA3DUHoEJ
 +PvwlulIjGeMh4OkzpSFeh6K+sJNwiz7XSwpH2K5IQPxwzeStDqTJdSd2C4XvCI+ch4LzcVgK
 qmlUPtqBhjiIEV5MW9QoH1MskQUCHctAMNH81W+xNDO0usOJkcQwuIhlKPm5rs/NATCucwJ
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Since commit 141f15c66d94 ("leds: pwm: remove header") that platform
interface is not usable from outside and there seems to be no in tree
user anymore.  All in-tree users of the leds-pwm driver seem to use DT
currently.  Getting rid of the old platform interface allows the
leds-pwm driver to switch over from 'devm_led_classdev_register()' to
'devm_led_classdev_register_ext()'.

Signed-off-by: Alexander Dahl <post@lespocky.de>
Cc: Denis Osterland-Heim <denis.osterland@diehl.com>
Reviewed-by: Marek Behún <marek.behun@nic.cz>
---

Notes:
    v5 -> v6:
      * added Reviewed-by from Marek
      * minimal commit message rewording, because a later patch was
        already applied
    
    v5:
      * added this patch to series (replacing another patch with a not
        working, different approach)
    
    v5:
     * added this patch to series (replacing another patch with a not
       working, different approach)

 drivers/leds/leds-pwm.c | 30 +++++-------------------------
 1 file changed, 5 insertions(+), 25 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index 2a16ae0bf022..f53f9309ca6c 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -24,11 +24,6 @@ struct led_pwm {
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
@@ -60,6 +55,7 @@ static int led_pwm_set(struct led_classdev *led_cdev,
 	return pwm_apply_state(led_dat->pwm, &led_dat->pwmstate);
 }
 
+__attribute__((nonnull))
 static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 		       struct led_pwm *led, struct fwnode_handle *fwnode)
 {
@@ -73,10 +69,7 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
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
@@ -139,15 +132,11 @@ static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv *priv)
 
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
@@ -157,16 +146,7 @@ static int led_pwm_probe(struct platform_device *pdev)
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

