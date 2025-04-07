Return-Path: <linux-leds+bounces-4434-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B585DA7E486
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 17:33:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F35C4250FD
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 15:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D837E1FAC37;
	Mon,  7 Apr 2025 15:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kKCzY6Il"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EAF1F582C;
	Mon,  7 Apr 2025 15:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744038887; cv=none; b=TrNxjOyyoWiKv1z2e9NKWOv+HRA3k2mo4zaU33L61rgCxvzMMk8NVdp1DNeImXc+R0LYtzRNa2gvKteM3gNSzhonpoh4piwtUCZh7xqywVHdU8wHjozxRpG6LtsyhZzJniX3nSw+WktHp6HdCTXbCLMlUNj7bdBk1J5SUKqFFhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744038887; c=relaxed/simple;
	bh=R7dIKDlAXXIkueZ+e/t+5gOmT9XoywQLk9xPz/ZXP6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pf7g/+9FzDmgnujeSMRrL8ZuwJ92vYVQCkjNVV+O2/8kCYH+CDHQzItiGzwww90lte1TmZAPNUCCie9G0uR9HDswIRnatBhLfbl5Uf0rf2+drhVOqL4GhrDV61t7IsdUF/TXFM5g19DQKM6v4bNiHVLPFH4/4Mlt962fCeFXByg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kKCzY6Il; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744038886; x=1775574886;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=R7dIKDlAXXIkueZ+e/t+5gOmT9XoywQLk9xPz/ZXP6U=;
  b=kKCzY6Ilrf2zX3j6l3pfSX8QGxcU/4F3GcNFcUOf6ilKgN8JFAxkfyGV
   +xjNpZq1CAr7DBqVeD3MGzNG82tMaA5bxgyaTdj/fXxS4HB90aIcmlkz9
   LdDK5ZKF4Tnoxuum/PNaOUQ7Cv30xxe4EP6KZa3xjPEnx+2c/5XRUt5CZ
   81cTez2ZIKTLa/Y4uznfX555Z93P4/LZkpqxrABhSS6EGMgBhZUk4ld6n
   7Brpj3tGNIzGtvj7hhniBQttm/wAIXtIeagkvLxPKYi2eNb02mkNcqGNV
   CeruCM9ki0CZPAQHAkkre83hhXTVa4gu1Ah62UqzlMXY9eEhP3BK2DdPH
   w==;
X-CSE-ConnectionGUID: D1HYJKfnRL+ymfpl/YkfDA==
X-CSE-MsgGUID: lsrZiq97T0Gq6+eXlLOVYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45567954"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45567954"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:14:45 -0700
X-CSE-ConnectionGUID: rBrQmG8kSRaDo1uLnTNRHw==
X-CSE-MsgGUID: eKpg1ryjRj6ASOkWW/BRqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127962510"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 07 Apr 2025 08:14:44 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 194EEF0; Mon, 07 Apr 2025 18:14:42 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Eddie James <eajames@linux.ibm.com>,
	Lee Jones <lee@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pavel Machek <pavel@kernel.org>
Subject: [PATCH v3 1/1] leds: pca955x: Avoid potential overflow when filling default_label
Date: Mon,  7 Apr 2025 18:13:26 +0300
Message-ID: <20250407151441.706378-1-andriy.shevchenko@linux.intel.com>
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
accordingly.

In one case join back string literal as it improves the grepping over the code
based on the message and remove duplicating information (the driver name is
printed as pert of the dev_*() output [1]) as we touch the same line anyway.

Link: https://lore.kernel.org/r/4ac527f2-c59e-70a2-efd4-da52370ea557@dave.eu/ [1]
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v3: reworked again to satisfy both compilers (LKP)
v2: updated format specifier once again (LKP)

 drivers/leds/leds-pca955x.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index e9cfde9fe4b1..24a40a1cdb15 100644
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
@@ -142,13 +142,13 @@ struct pca955x_platform_data {
 };
 
 /* 8 bits per input register */
-static inline int pca955x_num_input_regs(int bits)
+static inline u8 pca955x_num_input_regs(u8 bits)
 {
 	return (bits + 7) / 8;
 }
 
 /* 4 bits per LED selector register */
-static inline int pca955x_num_led_regs(int bits)
+static inline u8 pca955x_num_led_regs(u8 bits)
 {
 	return (bits + 3)  / 4;
 }
@@ -581,14 +581,14 @@ static int pca955x_probe(struct i2c_client *client)
 	struct led_classdev *led;
 	struct led_init_data init_data;
 	struct i2c_adapter *adapter;
-	int i, bit, err, nls, reg;
+	u8 i, nls, psc0;
 	u8 ls1[4];
 	u8 ls2[4];
 	struct pca955x_platform_data *pdata;
-	u8 psc0;
 	bool keep_psc0 = false;
 	bool set_default_label = false;
 	char default_label[8];
+	int bit, err, reg;
 
 	chip = i2c_get_match_data(client);
 	if (!chip)
@@ -610,16 +610,15 @@ static int pca955x_probe(struct i2c_client *client)
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
@@ -694,8 +693,7 @@ static int pca955x_probe(struct i2c_client *client)
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


