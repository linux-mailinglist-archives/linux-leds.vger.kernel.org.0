Return-Path: <linux-leds+bounces-4315-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF402A67875
	for <lists+linux-leds@lfdr.de>; Tue, 18 Mar 2025 16:55:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 128913B368D
	for <lists+linux-leds@lfdr.de>; Tue, 18 Mar 2025 15:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1B920FA91;
	Tue, 18 Mar 2025 15:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h79dQqYw"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90A420F075;
	Tue, 18 Mar 2025 15:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742313135; cv=none; b=Hpm68C25CnR3McicNPIkPfXujHRp3TLsNMjRvxjVPe7CKYVolexQJ5W7HN5ZtBcRXbLL3CrRDWah4UPfHlnmZfgepZFybxk82dx+DRuXuL+339HS7dkmF8+bSMCX+CyqKMXLsL1SnG7rxQmliwNxGsJssjcm7fUQF+6SfqweB7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742313135; c=relaxed/simple;
	bh=ahM6Pswqga/PvNT1jwi6X90X517zBLJ9yV9xfbdvdkA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y7ECwe95Mf6nIpIYdB38cGjCe+1mmTdogQGAGzk7AKhtd52ZAanHVywds98zXeQ4HyRQ5cyU+5LAbquHISdqTA4darXdyp54x1sgd/w3cTdrCFPDuwbNQMiw8OUqett3Vifa1an6Ra+EDUPCK2nxN4nmHhURtaRTX84md2zy5V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h79dQqYw; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742313134; x=1773849134;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ahM6Pswqga/PvNT1jwi6X90X517zBLJ9yV9xfbdvdkA=;
  b=h79dQqYwwhj0l2fuNxX8jWyN+K/XPW9NNnOtUGqISxMt7Z5h1chCeiDw
   IG27m+GAJO+7+f3HLSl2+8OXdM3R4uN98VCseXiqoOrIWURtUE4ZWJJXb
   waTozHBTJ1BCl8pQO8oU/JwkdqsgjlxMvriuDhFWcomgaZET3L6+RRbGT
   /ZvZoSws53RheYvDOn7abaiAsD6KpoOO9igQf1iPNBmw8HroyPxoSJUKx
   e7O2Y0FyuImEC3pwZ8proKE039I2CnVd/wXl+X3OXrjgq8XBQuuzb8nko
   LIMRgG/ef758NdNMJrw/eDuAbSRSuOrwXY7dhjd21+Dcbuy6/IX9DbzUc
   w==;
X-CSE-ConnectionGUID: Cz/TEJtnRQWR7lHosSS0LA==
X-CSE-MsgGUID: nJAN+aQ9SjGO4aOg7B1Zbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="53675315"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="53675315"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 08:51:29 -0700
X-CSE-ConnectionGUID: sQGXQl98T627HwtSDI9gkQ==
X-CSE-MsgGUID: +dz2gRIARCig5lexBMS7Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="122784884"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 18 Mar 2025 08:51:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E6C081D7; Tue, 18 Mar 2025 17:51:26 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pavel Machek <pavel@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] leds: core: Bail out when composed name can't fit the buffer
Date: Tue, 18 Mar 2025 17:51:25 +0200
Message-ID: <20250318155126.2974905-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GCC compiler complains about snprintf() calls that may potentially cut
the output:

 drivers/leds/led-core.c:551:78: error: ‘snprintf’ output may be truncated before the last format character [-Werror=format-truncation=]
 drivers/leds/led-core.c:554:78: error: ‘snprintf’ output may be truncated before the last format character [-Werror=format-truncation=]
 ...

Fix these by checking for the potential overflow. This requires
to align all the branches to use the same callee, i.e. snprintf(),
otherwise the code will be blown up and return different error codes
for the different branches.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/led-core.c | 44 ++++++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index f6c46d2e5276..0eaa19edd6a2 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -515,6 +515,7 @@ int led_compose_name(struct device *dev, struct led_init_data *init_data,
 	struct led_properties props = {};
 	struct fwnode_handle *fwnode = init_data->fwnode;
 	const char *devicename = init_data->devicename;
+	int n;
 
 	if (!led_classdev_name)
 		return -EINVAL;
@@ -528,45 +529,48 @@ int led_compose_name(struct device *dev, struct led_init_data *init_data,
 		 * Otherwise the label is prepended with devicename to compose
 		 * the final LED class device name.
 		 */
-		if (!devicename) {
-			strscpy(led_classdev_name, props.label,
-				LED_MAX_NAME_SIZE);
+		if (devicename) {
+			n = snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s",
+				     devicename, props.label);
 		} else {
-			snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s",
-				 devicename, props.label);
+			n = snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s", props.label);
 		}
 	} else if (props.function || props.color_present) {
 		char tmp_buf[LED_MAX_NAME_SIZE];
 
 		if (props.func_enum_present) {
-			snprintf(tmp_buf, LED_MAX_NAME_SIZE, "%s:%s-%d",
-				 props.color_present ? led_colors[props.color] : "",
-				 props.function ?: "", props.func_enum);
+			n = snprintf(tmp_buf, LED_MAX_NAME_SIZE, "%s:%s-%d",
+				     props.color_present ? led_colors[props.color] : "",
+				     props.function ?: "", props.func_enum);
 		} else {
-			snprintf(tmp_buf, LED_MAX_NAME_SIZE, "%s:%s",
-				 props.color_present ? led_colors[props.color] : "",
-				 props.function ?: "");
+			n = snprintf(tmp_buf, LED_MAX_NAME_SIZE, "%s:%s",
+				     props.color_present ? led_colors[props.color] : "",
+				     props.function ?: "");
 		}
-		if (init_data->devname_mandatory) {
-			snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s",
-				 devicename, tmp_buf);
-		} else {
-			strscpy(led_classdev_name, tmp_buf, LED_MAX_NAME_SIZE);
+		if (n >= LED_MAX_NAME_SIZE)
+			return -E2BIG;
 
+		if (init_data->devname_mandatory) {
+			n = snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s",
+				     devicename, tmp_buf);
+		} else {
+			n = snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s", tmp_buf);
 		}
 	} else if (init_data->default_label) {
 		if (!devicename) {
 			dev_err(dev, "Legacy LED naming requires devicename segment");
 			return -EINVAL;
 		}
-		snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s",
-			 devicename, init_data->default_label);
+		n = snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s",
+			     devicename, init_data->default_label);
 	} else if (is_of_node(fwnode)) {
-		strscpy(led_classdev_name, to_of_node(fwnode)->name,
-			LED_MAX_NAME_SIZE);
+		n = snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%pfw", fwnode);
 	} else
 		return -EINVAL;
 
+	if (n >= LED_MAX_NAME_SIZE)
+		return -E2BIG;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(led_compose_name);
-- 
2.47.2


