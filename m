Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2042A399C6A
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jun 2021 10:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbhFCIVs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 3 Jun 2021 04:21:48 -0400
Received: from mail-pj1-f48.google.com ([209.85.216.48]:44568 "EHLO
        mail-pj1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbhFCIVr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 3 Jun 2021 04:21:47 -0400
Received: by mail-pj1-f48.google.com with SMTP id h12-20020a17090aa88cb029016400fd8ad8so3391815pjq.3
        for <linux-leds@vger.kernel.org>; Thu, 03 Jun 2021 01:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/sNX4mumXu2c+Ng1l217/qU0peCUh1MdGzV1rqEY8zk=;
        b=NNnZFIslIEAs3i1dDDoFryJpGlhlZVLUnJR9YXE3+MhBm8dRLRIRZzhxs4PFkZ0RvR
         biulvUcDQjwca9L7PLx82ToRTyoysNoNDbZB88bsM8TGSpxh1iJDXCTZw19+qLaO4WF0
         xZjqVmwDuYsU+510k/q4kkS18413TUXgnb9Z2G1dPJZ+IHrZOr2NVStyMsXHFf/FSbWv
         rsv4lIBsPr3a4pYM+4bGnZ29rbiRbYEtMt6d01FPpSfAaQBBuTOciaAwfujBT8V5+g7D
         VPti16FpaI2AYrVOb8ZjV6qQnmeN93/deEyCxZUbbxX05Ar4uRlWl3RMVjCEb8KDiBbf
         HFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=/sNX4mumXu2c+Ng1l217/qU0peCUh1MdGzV1rqEY8zk=;
        b=MBBETMjPAAqcPKi+QmFGHCZpGA5+0KgQE8I/Kar0hHzKl5wbxAy73ZPHhYPfVQ0wnl
         NHhcX1oxYLOqpv+1AS/tokPMgdfz3lxAi1H5VDgfPzwcs8EcZBlTWB1jHwX7k48h5mle
         /7HHmP3o7cG4QmgLM0RC/+NHEgj75jjXLR8Nt00N7FybhTkG/kRF9zbLIJRgAf+SaR7k
         u5y60CZwCjDRU+m8H9l3Zmiho8Ja9I0cJdkPmQBc1XmTvDFpDeK9Pb85lzExpFOfHwil
         mELkca9ZEPN1cCEKCfuGddpkNMcvjV79eksGUSGFEzfZqv+vSafLG7fbay6RBgYARYF+
         5MLQ==
X-Gm-Message-State: AOAM533PHFUNhXCca6IONM8jPh7vA0UmyOiEWxZJhiTt/TDUceZL2LXV
        K4BgF+5mWSaqhRTaazSOIB0=
X-Google-Smtp-Source: ABdhPJwyBPtPaOHNDdOWjCE88XJWWKM12RfAEQX7mGW84hxF8fqLhr46oabZWwC8dl5GQczMkCZWdA==
X-Received: by 2002:a17:90a:71c7:: with SMTP id m7mr9931392pjs.9.1622708343375;
        Thu, 03 Jun 2021 01:19:03 -0700 (PDT)
Received: from voyager.lan ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id 2sm1588101pjg.0.2021.06.03.01.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 01:19:02 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>,
        linux-leds@vger.kernel.org
Subject: [PATCH v2] leds: pca955x: Allow platform datato set full name
Date:   Thu,  3 Jun 2021 17:48:41 +0930
Message-Id: <20210603081841.208639-1-joel@jms.id.au>
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

 # ls /sys/class/leds/
 pca955x:green:power/
 pca955x:pca9552:white/
 pca955x:pca9552:yellow/
 pca955x:red:power/

Instead use the platform data when provided to name the LED device.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2: Drop kconfig option, per Pavel's review:

 > No. Config option is not acceptable for this.
 >
 > Just delete the prefix and fix the breakage.

 drivers/leds/leds-pca955x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 7087ca4592fc..4c5cc62c107a 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -503,9 +503,9 @@ static int pca955x_probe(struct i2c_client *client,
 				snprintf(pdata->leds[i].name,
 					sizeof(pdata->leds[i].name), "%d", i);
 
-			snprintf(pca955x_led->name,
-				sizeof(pca955x_led->name), "pca955x:%s",
-				pdata->leds[i].name);
+			strscpy(pca955x_led->name,
+				pdata->leds[i].name,
+				sizeof(pca955x_led->name));
 
 			if (pdata->leds[i].default_trigger)
 				pca955x_led->led_cdev.default_trigger =
-- 
2.30.2

