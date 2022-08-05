Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79D0A58ADA0
	for <lists+linux-leds@lfdr.de>; Fri,  5 Aug 2022 17:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241488AbiHEPwC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 5 Aug 2022 11:52:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241375AbiHEPvW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 5 Aug 2022 11:51:22 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 131E46E889;
        Fri,  5 Aug 2022 08:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659714565; x=1691250565;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NEeFuL7s2HGlJGPjMrfp/6jwPjBk7uYpbdHP2kx39AA=;
  b=j2Aab5WItV/SZwOnPcAeZzG5yLiHM0GQJABTBTn3zqWmrNiMTO8brpLj
   otDFaa8/46PhoJbi7dLjs0OWm9PYkV9tYAUWViQ6sLzxRp6wMBCVh1bac
   /vzGup1EXp77D6UGBFzD9XVKAF2Vh6DF3f4TFN607d+w87b8iyRMBMiQI
   GMzBKUrCU+ixcU6xayivS2x7mZMAZkgx+BXIJ1qNioiEYG0DYFd5GqoT2
   v5WnCnYO0gvSxhgJIfKa7pbcysgLbUV1DqMd05Yg1wuV1eHHEcnT8wYkb
   wRngbhPxkt5mm0M5eH/UZDgpns1vJQmaC5YvnSi59SW+uwj+T1mK+4rHX
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10430"; a="288988398"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="288988398"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2022 08:49:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="693037566"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Aug 2022 08:49:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9D8FC11C; Fri,  5 Aug 2022 18:49:16 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Gene Chen <gene_chen@richtek.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Pavel Machek <pavel@ucw.cz>,
        Eddie James <eajames@linux.ibm.com>,
        Denis Osterland-Heim <Denis.Osterland@diehl.com>,
        linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Kurt Kanzenbach <kurt@linutronix.de>,
        Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 02/11] leds: Move led_init_default_state_get() to the global header
Date:   Fri,  5 Aug 2022 18:48:58 +0300
Message-Id: <20220805154907.32263-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220805154907.32263-1-andriy.shevchenko@linux.intel.com>
References: <20220805154907.32263-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

There are users inside and outside LED framework that have implemented
a local copy of led_init_default_state_get(). In order to deduplicate
that, as the first step move the declaration from LED header to the
global one.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/leds.h  | 1 -
 include/linux/leds.h | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index aa64757a4d89..345062ccabda 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -27,7 +27,6 @@ ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
 ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
 			struct bin_attribute *bin_attr, char *buf,
 			loff_t pos, size_t count);
-enum led_default_state led_init_default_state_get(struct fwnode_handle *fwnode);
 
 extern struct rw_semaphore leds_list_lock;
 extern struct list_head leds_list;
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 499aea1e59b9..b96feacc73f8 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -67,6 +67,8 @@ struct led_init_data {
 	bool devname_mandatory;
 };
 
+enum led_default_state led_init_default_state_get(struct fwnode_handle *fwnode);
+
 struct led_hw_trigger_type {
 	int dummy;
 };
-- 
2.35.1

