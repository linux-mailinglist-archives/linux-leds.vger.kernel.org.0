Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2FE434861E
	for <lists+linux-leds@lfdr.de>; Thu, 25 Mar 2021 01:56:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235318AbhCYAz1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 24 Mar 2021 20:55:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235313AbhCYAzJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 24 Mar 2021 20:55:09 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55322C06174A
        for <linux-leds@vger.kernel.org>; Wed, 24 Mar 2021 17:55:09 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id t18so334521pjs.3
        for <linux-leds@vger.kernel.org>; Wed, 24 Mar 2021 17:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GBDH6T5ODC/wUmkG1l2ExHuO4vP2GpbUZsvbKohsot0=;
        b=S1Pz2x8GeIZZAjTXC8GiE/j0b2qnHu5G61VcPsoIdLINCbP8oQ4ItES8X20NnggNmp
         7Iw70sNr/MbLl4HdNN4NIIW0uhRzLQ8dsb/pFp4WEDPL7u1J0B0zt6wqDm1/H4oJzz9v
         0btmaQGTKUPnlJ9iaiysWZIxGowpDWD3sw1G5kBVo+K8491bfhwfXvjaQK2OHDP/EDzo
         Y+I6t7gAgN3SZhVTlGxDX547q9ZaxmQYep7nBLxZJrtOfaOmNsehMMi43WzCTlxqQvhz
         ppa047MI+K9Zy6H8mTTr+G0ufFWy8/3dKNCKbgZCPqlazCmJGiNivT3BJgLjqyt0Gk0m
         kWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=GBDH6T5ODC/wUmkG1l2ExHuO4vP2GpbUZsvbKohsot0=;
        b=RQ45loqo4cGzaZAB7nqYBvQSzDMh0aeMN5mHJJsWVUFinWIscj547y6c9L9plB+Tdx
         Ji1cQNIYLbkZwZ5zSGnr8mnVUPL0TB8fKoa12n6FibNwO0SOAKiB7blQ8fMIgzIEZYdE
         0gQFcCKBugT74aQ/O/daS82ISIBjPe1RlytJIXfgPv+OoIxkX0HnyMvuyCBiP/r5h0hw
         4oJLDZasyjMPe+Y0GoVy6tdKPvAyf3Z5KrXAu2F2CSLVx1tB5/HOens/gS/GpFa+CXGw
         Ns43mhZeFy43ZpeX22blED/KKdZjfl6H2NR39ArwmR4cJB7I1WGUCMJsSq7zkIfreOS8
         hzIw==
X-Gm-Message-State: AOAM532iyQR/WHtBy8Ea2QzkFwkxuYG27gpubbkeVBz81NhScRWhdj27
        Sk83HaQ2H4Qdp/VT2a6e54CTxNKuMg+/UA==
X-Google-Smtp-Source: ABdhPJzo4hrylloA0ppnqgiuXn578DXAgGcV2KowCQ/BPCgKuD5BZGhUP/NeC+JoQv+yIbuNCxxJlQ==
X-Received: by 2002:a17:90b:4d0f:: with SMTP id mw15mr6197194pjb.92.1616633708606;
        Wed, 24 Mar 2021 17:55:08 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id w17sm3245460pfu.29.2021.03.24.17.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 17:55:07 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>,
        linux-leds@vger.kernel.org
Subject: [PATCH] leds: pca955x: Allow full control over led name
Date:   Thu, 25 Mar 2021 11:24:56 +1030
Message-Id: <20210325005456.152469-1-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The PCA955x driver since it was merged has added a "pca955x:" prefix to
LED names. This meanas platform data (such as the device tree) cannot
fully control the name. Here's what this produces using the example in
the device tree bindings:

 # cat /sys/class/leds/
 pca955x:green:power/
 pca955x:pca9552:white/
 pca955x:pca9552:yellow/
 pca955x:red:power/

Some systems want the ability to configure the full string. To do this,
introduce a build time option that adds the prefix that defaults to
enabled in order to preserve existing behaviour.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/leds/Kconfig        | 11 +++++++++++
 drivers/leds/leds-pca955x.c |  8 +++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index b6742b4231bf..dcdb107e0967 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -519,6 +519,17 @@ config LEDS_PCA955X
 	  LED driver chips accessed via the I2C bus.  Supported
 	  devices include PCA9550, PCA9551, PCA9552, and PCA9553.
 
+config LEDS_PCA955X_SYSFS_PREFIX
+	bool "PCA955x sysfs prefix"
+	depends on LEDS_PCA955X
+	default y
+	help
+	  This option adds the string "pca955x:" to the start of the name
+	  presented in sysfs.
+
+	  If you wish to use the label provided by platform data without a
+	  prefix, disable this option.
+
 config LEDS_PCA955X_GPIO
 	bool "Enable GPIO support for PCA955X"
 	depends on LEDS_PCA955X
diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 7087ca4592fc..b7742d6226b5 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -61,6 +61,12 @@
 #define PCA955X_GPIO_HIGH	LED_OFF
 #define PCA955X_GPIO_LOW	LED_FULL
 
+#ifdef CONFIG_LEDS_PCA955X_SYSFS_PREFIX
+#define SYSFS_NAME "pca955x:%s"
+#else
+#define SYSFS_NAME "%s"
+#endif
+
 enum pca955x_type {
 	pca9550,
 	pca9551,
@@ -504,7 +510,7 @@ static int pca955x_probe(struct i2c_client *client,
 					sizeof(pdata->leds[i].name), "%d", i);
 
 			snprintf(pca955x_led->name,
-				sizeof(pca955x_led->name), "pca955x:%s",
+				sizeof(pca955x_led->name), SYSFS_NAME,
 				pdata->leds[i].name);
 
 			if (pdata->leds[i].default_trigger)
-- 
2.30.2

