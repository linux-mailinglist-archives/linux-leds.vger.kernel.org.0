Return-Path: <linux-leds+bounces-4405-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A650A7C18A
	for <lists+linux-leds@lfdr.de>; Fri,  4 Apr 2025 18:29:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F798189AD84
	for <lists+linux-leds@lfdr.de>; Fri,  4 Apr 2025 16:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04ECC2036E8;
	Fri,  4 Apr 2025 16:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dghAfrN8"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1756D20ADD1;
	Fri,  4 Apr 2025 16:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743784151; cv=none; b=XaC3nTEEpJKLzb333xzZX8PGMlsJ8Wc0g397DaJevyY9gLtI5ICWeygHi9JIe5MGvmNgbCvkhLnBUrqAsxzHKg5tj25BuN7zLKnrb0TUlDDVKpP6xBoFYOAhkEQHYHslbIF1zgRafaHp/VFS9oweuSMMQTfbQvJ1Q47SYnaR5a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743784151; c=relaxed/simple;
	bh=P7B4m8xRNfHe2TrcVljVpAHOhdd4saqUFq2rhYKbTAc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Lc/1Q931nvuJmC7OtVXWiE6myUZPc75hh+esr3LUZYsf2fPIoUx15IuCHXQa2b+soehsDuzRVMFyg3CHwItQ+wDRZBl0GBI6vxgJvOBdpEYlMz6gpT7EyXIDWZu9CzRqKOYWNM7R5VfMsQshn7nx7NHGXL7S+6adJmaWXI60/tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dghAfrN8; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743784150; x=1775320150;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=P7B4m8xRNfHe2TrcVljVpAHOhdd4saqUFq2rhYKbTAc=;
  b=dghAfrN8qSHAOCwHOgFIHBpC/y7nzShW5q9UL10MDReObCLEzv5k1s1c
   dt07dMCNynrkKWuZQvgd7qT/Yt9Y+7jmkBLMqb6rDSmuM8uxjdInpfr0N
   AyRaolbXwp6ZjufYjOY7/X/0VPJOZQyVCg38n4/JJQC3Z8/0TL2UWBtzA
   bRh+VL/DXCdfvFeQXj/FLCUBHHWxDU43LdEsuyygO0HdItaQO2i61SE3i
   PYWWPal0B4rXbjorJSERHAOLFKGqpsP71IfpYwh0hDi/o7gSrNt/lNzuw
   U6KptabkWdpTTtFCsAEs0HXT2llJWs0d4tJkEWP4mDjNoMY/lUj9nwr6v
   w==;
X-CSE-ConnectionGUID: RnMHFyjDS9i5ZpoRho0rhg==
X-CSE-MsgGUID: i4UECrxXTAOH1yWKkr05dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="45116211"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="45116211"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 09:29:09 -0700
X-CSE-ConnectionGUID: FOC83tyPQ3eWWVFgYFODoA==
X-CSE-MsgGUID: SX3NZ5lST46VnmsA/7t35g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="127842509"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 04 Apr 2025 09:29:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C5EB9129; Fri, 04 Apr 2025 19:29:06 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Subject: [PATCH v1 1/1] leds: pca955x: Avoid potential overflow when filling default_label
Date: Fri,  4 Apr 2025 19:28:49 +0300
Message-ID: <20250404162849.3650361-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GCC compiler (Debian 14.2.0-17) is not happy about printing
into a too short buffer (when build with `make W=1`):

  drivers/leds/leds-pca955x.c:554:33: note: ‘snprintf’ output between 2 and 12 bytes into a destination of size 8

Indeed, the buffer size is chosen based on some assumptions,
while in general the assigned value might not fit (GCC can't
prove it does).

Fix this by changing the bits field in the struct pca955x_chipdef to u8,
with a positive side effect of the better memory footprint, and convert
loop iterator to be unsigned. With that done, update format specifiers
accordingly. In one case join back string literal as it improves
the grepping over the code based on the message and remove duplicating
information (the driver name is printed as pert of the dev_*() output [1])
as we touch the same line anyway.

Link: https://lore.kernel.org/r/4ac527f2-c59e-70a2-efd4-da52370ea557@dave.eu/ [1]
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/leds-pca955x.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 94a9f8a54b35..1a2e6996d748 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -71,7 +71,7 @@ enum pca955x_type {
 };
 
 struct pca955x_chipdef {
-	int			bits;
+	u8			bits;
 	u8			slv_addr;	/* 7-bit slave address mask */
 	int			slv_addr_shift;	/* Number of bits to ignore */
 };
@@ -455,11 +455,12 @@ static int pca955x_probe(struct i2c_client *client)
 	struct led_classdev *led;
 	struct led_init_data init_data;
 	struct i2c_adapter *adapter;
-	int i, err;
 	struct pca955x_platform_data *pdata;
 	bool set_default_label = false;
 	bool keep_pwm = false;
 	char default_label[8];
+	unsigned int i;
+	int err;
 
 	chip = i2c_get_match_data(client);
 	if (!chip)
@@ -481,16 +482,15 @@ static int pca955x_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
-	dev_info(&client->dev, "leds-pca955x: Using %s %d-bit LED driver at "
-		 "slave address 0x%02x\n", client->name, chip->bits,
-		 client->addr);
+	dev_info(&client->dev, "Using %s %u-bit LED driver at slave address 0x%02x\n",
+		 client->name, chip->bits, client->addr);
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
 		return -EIO;
 
 	if (pdata->num_leds != chip->bits) {
 		dev_err(&client->dev,
-			"board info claims %d LEDs on a %d-bit chip\n",
+			"board info claims %d LEDs on a %u-bit chip\n",
 			pdata->num_leds, chip->bits);
 		return -ENODEV;
 	}
@@ -551,8 +551,7 @@ static int pca955x_probe(struct i2c_client *client)
 			}
 
 			if (set_default_label) {
-				snprintf(default_label, sizeof(default_label),
-					 "%d", i);
+				snprintf(default_label, sizeof(default_label), "%u", i);
 				init_data.default_label = default_label;
 			} else {
 				init_data.default_label = NULL;
-- 
2.47.2


