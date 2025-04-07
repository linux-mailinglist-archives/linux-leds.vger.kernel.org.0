Return-Path: <linux-leds+bounces-4431-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A58A7DB83
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 12:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 252E0188D987
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 10:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8174123816E;
	Mon,  7 Apr 2025 10:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="llvNHHMo"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF5023815A;
	Mon,  7 Apr 2025 10:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744023040; cv=none; b=fDLOioB+IiW3PNhSdo6+JamFQcRnMEKrKlWrNQAWzHbvxyy12m1lzeeTH08mK66qL5ZQt75ysUyd7JxeW89DBuS1An9hthsRoP9mCmhFkWkQGaDnLwgJDIF0wHx/bBDXMQ8JGtkkbump4X2cHjL4wm3DnaqSNyzeehzO3GaEceU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744023040; c=relaxed/simple;
	bh=h09H0mVo+a/xhXkOSI8OnmS+1oWns5vRt4sP272clcs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DSO9jDtUzqvo0ocyk7djW9f4YxsZSidicJ/g6R7EvysHyV9y50+qRSskpAP4aye56hWDIFrozfhH5hha9RFCMu/UpuwTFzL0lxv8p699gUhD1mNudkkiASQOHd2j410pED/OOy0xfuU2+uX7OHRuMdFh0Zu5Q0OyYXUG6zEyHwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=llvNHHMo; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744023039; x=1775559039;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=h09H0mVo+a/xhXkOSI8OnmS+1oWns5vRt4sP272clcs=;
  b=llvNHHMo84LWJWTBkyHJc33vuakuL8dXX2C6qyit/pu4T6ggq53+w49q
   Gi9RRtVir/pWViaU0uBCSgnmaP2GPqt8sZMUVPxUfq1fVarOR3FAOL+Jw
   FheX5t/3lipmpZhTYmzHRDGtjFJsUtKyNnqsoi60B4eioAy6VlVn7Fcbr
   Qka0tx1eYhGDZOt4wMB0MyActvtxePd/Xx0OE4RFXuNxfaf9Vnz22bdCL
   g7eu73s6Jg/0W40ibTaYBCYk5xggFbLgD0uYkZxXUp0PhZwekbkr73ROq
   9ORHPM1RzMEUUOjY2n1o2oJpSid+/cJ6kLZjl2Qlf05LIlSH7OJh3MVyQ
   w==;
X-CSE-ConnectionGUID: 06WyhrNrTN2V3lLhgG1KHw==
X-CSE-MsgGUID: kMbKFKHmRT6JvNOdo0PAag==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="62947720"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="62947720"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 03:50:38 -0700
X-CSE-ConnectionGUID: joj3L2zQSP6xc7/XnLV2Qg==
X-CSE-MsgGUID: H+IhcpiRRhWwWK0XPvYUyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128793016"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2025 03:50:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3AB7C26A; Mon, 07 Apr 2025 13:50:34 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Eddie James <eajames@linux.ibm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pavel Machek <pavel@kernel.org>
Subject: [PATCH v2 1/1] leds: pca955x: Avoid potential overflow when filling default_label
Date: Mon,  7 Apr 2025 13:49:58 +0300
Message-ID: <20250407105033.324789-1-andriy.shevchenko@linux.intel.com>
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
accordingly. Note, the choice of the format specifier is made deliberately
like that because some of (old) GCC versions (powerpc-linux-gcc (GCC) 8.5.0)
are not happy otherwise.

In one case join back string literal as it improves the grepping over the code
based on the message and remove duplicating information (the driver name is
printed as pert of the dev_*() output [1]) as we touch the same line anyway.

Link: https://lore.kernel.org/r/4ac527f2-c59e-70a2-efd4-da52370ea557@dave.eu/ [1]
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v2: updated format specifier once again (LKP)

 drivers/leds/leds-pca955x.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index e9cfde9fe4b1..b71c1580f4bb 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -73,7 +73,7 @@ enum pca955x_type {
 };
 
 struct pca955x_chipdef {
-	int			bits;
+	u8			bits;
 	u8			slv_addr;	/* 7-bit slave address mask */
 	int			slv_addr_shift;	/* Number of bits to ignore */
 	int			blink_div;	/* PSC divider */
@@ -581,7 +581,6 @@ static int pca955x_probe(struct i2c_client *client)
 	struct led_classdev *led;
 	struct led_init_data init_data;
 	struct i2c_adapter *adapter;
-	int i, bit, err, nls, reg;
 	u8 ls1[4];
 	u8 ls2[4];
 	struct pca955x_platform_data *pdata;
@@ -589,6 +588,9 @@ static int pca955x_probe(struct i2c_client *client)
 	bool keep_psc0 = false;
 	bool set_default_label = false;
 	char default_label[8];
+	int bit, nls, reg;
+	unsigned int i;
+	int err;
 
 	chip = i2c_get_match_data(client);
 	if (!chip)
@@ -610,16 +612,15 @@ static int pca955x_probe(struct i2c_client *client)
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
@@ -694,8 +695,7 @@ static int pca955x_probe(struct i2c_client *client)
 			}
 
 			if (set_default_label) {
-				snprintf(default_label, sizeof(default_label),
-					 "%d", i);
+				snprintf(default_label, sizeof(default_label), "%hhu", i);
 				init_data.default_label = default_label;
 			} else {
 				init_data.default_label = NULL;
-- 
2.47.2


