Return-Path: <linux-leds+bounces-4317-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 075FDA678B8
	for <lists+linux-leds@lfdr.de>; Tue, 18 Mar 2025 17:07:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E63818878F9
	for <lists+linux-leds@lfdr.de>; Tue, 18 Mar 2025 16:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFE7B20F075;
	Tue, 18 Mar 2025 16:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N+JC3czt"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF0E17A2F5;
	Tue, 18 Mar 2025 16:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742313942; cv=none; b=DHmUsGfqWZ0RgOH6ugc5JIVtGxYGSzv+q+3VFiq6MImuoUXC4yj88v9qQjrOMA1vyvAKqpjAaC+QM1x3bV8drs7M+uvl6Q/fg7W5Rv7N5jC4hMKGsWbz++wvczqWrj5prKEZsZwKcRh4tLY23h7PCq7/fV9eoU8Y8F81hRK5TBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742313942; c=relaxed/simple;
	bh=xCYCkWIy1bqtJ2g5wymm+wgMQTxLqmccTV+KFBA5kY4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YdCxf6rh9CDfCVW2/miilDZzUZvQsT3805mV6AxOZaFwU+93zDu3ItIY74OzvFY0r8FpjpdgSI3cyuOHevS5MnP48wnhnIhnCaJ6tWjuIB72GCPJF+dfFBAoVkEWIbV1nfnn8lFZ1V7hQmSIkOBDo3YNoD4Apbf0wl3ud8fWvuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N+JC3czt; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742313941; x=1773849941;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xCYCkWIy1bqtJ2g5wymm+wgMQTxLqmccTV+KFBA5kY4=;
  b=N+JC3cztruChaRY5/QX8JJ0eg8wifyAXs17gWkvWd9ThMy3kPyh6ZBH7
   M2WDSnMZp1Cc9piuv33NvqoeuPWDl5e84qqeYnog6e8SoIoUxbp5Pi9hD
   ebOms2VT3wWdw+rW8taEF7oBB2a3aPHUukvU3HiBQ7jQKcH1WDVhuHUIX
   bn0uTmkneP8T7Fsji4ILlwlLsKBBCKLIOgdj8chbVlBeE0HWsA3mPHtMX
   tHymjtUwOtMmf3sMPMnRciRRyjp35LqNaqCsyYI5gBx3f0NKYBJUnvtvp
   bAwib4OGOSi38viZJZhJDq9mipUYhXxjItcWVGCkpGk/5ccjD4WSHzZC8
   A==;
X-CSE-ConnectionGUID: njjt/k+SSFCjkE2jKBEFWA==
X-CSE-MsgGUID: shaetvUGSESsm3xD95kTmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="53679386"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="53679386"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 09:05:37 -0700
X-CSE-ConnectionGUID: 7Oso3uq0Q6qDn9duezwTbQ==
X-CSE-MsgGUID: jddoNA1jRjuyOI1Mr7hdLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="122481526"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 18 Mar 2025 09:05:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 8FAB31D7; Tue, 18 Mar 2025 18:05:25 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pavel Machek <pavel@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/1] leds: core: Bail out when composed name can't fit the buffer
Date: Tue, 18 Mar 2025 18:04:29 +0200
Message-ID: <20250318160524.2979982-1-andriy.shevchenko@linux.intel.com>
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

v2: avoided changing specifier for the case of the OF node name

 drivers/leds/led-core.c | 45 +++++++++++++++++++++++------------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index f6c46d2e5276..bbb03024665f 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -515,6 +515,7 @@ int led_compose_name(struct device *dev, struct led_init_data *init_data,
 	struct led_properties props = {};
 	struct fwnode_handle *fwnode = init_data->fwnode;
 	const char *devicename = init_data->devicename;
+	int n;
 
 	if (!led_classdev_name)
 		return -EINVAL;
@@ -528,45 +529,49 @@ int led_compose_name(struct device *dev, struct led_init_data *init_data,
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
+		n = snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s",
+			     to_of_node(fwnode)->name);
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


