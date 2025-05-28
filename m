Return-Path: <linux-leds+bounces-4727-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E19AC71A6
	for <lists+linux-leds@lfdr.de>; Wed, 28 May 2025 21:46:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DD87A27E2B
	for <lists+linux-leds@lfdr.de>; Wed, 28 May 2025 19:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2816B220F28;
	Wed, 28 May 2025 19:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S/9e29Q/"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9F4220F27
	for <linux-leds@vger.kernel.org>; Wed, 28 May 2025 19:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748461477; cv=none; b=I4g1yePNGNHbqskY4iibhZEtRD6P2W304GIyfav3kBZTrY5JU5idwYKpcAUB36majn4VWrh2CtQ4p7ob/D9jpW9Ohv0VG2LzDKEf1r2NiySJyCns/Tf1R5/n5wuCrS+6lui62QXkTd1rAMo6BhDCHPcTPC7DgwZV4zfuMuJbVLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748461477; c=relaxed/simple;
	bh=xZUOsMsyjcZ1qewKlqP/KKWUHO3l+hPWlf0MlhF4mH8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HZw/jwdsirPduKwEp97cDa3ZlqmCUonH4uEL6MHhop4BFszYv6TQ/mX8uazYWmTGd3bI1NcEGtR/7SZ+L3ymHFpezlMhV0SXeuo5HK1kdsNfWs9IZpgostwMtcB4rGHouXHbtLqqeyIuN9BUS/WiH91pApZiXDZEsaucuXCOYs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S/9e29Q/; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4e62619afso25158f8f.1
        for <linux-leds@vger.kernel.org>; Wed, 28 May 2025 12:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748461473; x=1749066273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MrefH7AMNRY3M6Eds2DAfAOBM+dHe6KTACIdZZtLeZg=;
        b=S/9e29Q/6fSKBwMw+alBjJOdyaCc0ai0p8HtGAit3//Wo1jKlSQIcBAKAzy5hctG9X
         qBTvrKXiaKi0qL5i64S+S/MtU9S4tY4NUeEGcwTd9guDODUMmqFktDevv3ZOktj5vjPo
         pRATjDgDHcnXFZ1XxnvDamqePrQg6gvCtGoR4UfRz57ZmJY9uworDyXoswZjtkKxlv2G
         4TdhMDbYdG/gdRDhTATlhuVyG5icMTNr/tzJDJguGJvQqt2a7iPMyt+QRvq/FxnxaLa9
         OsSgkiLz1Jg24dvYFoxLOdxIxs63oura9AcKo1lN+xOcyMmcV1fg1p3ZofyNEGLZeJeD
         2bsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748461473; x=1749066273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MrefH7AMNRY3M6Eds2DAfAOBM+dHe6KTACIdZZtLeZg=;
        b=vUkE8niHUeRwbYgzkJSfXWWJfaW+6uQZrSR3R6T9NjCkRMbS9I4PNQGUmgKtl3ENxw
         jNgDBSdEg+teQVPqkJE8Dutt0vZXSziTLa6jhNU7x1ggtm1vh4o5GP7lm2dSLUI2gfgy
         m3/QlpCYUuuiaWbLMfjbchOpe09a5HAa4hpnNbL4d2bW2kLK10dhT446PtpKNIVWSTLX
         e6KOsKDr+GIZPAmu47Ibap+hOksbkWOX79Ic7Kbuov+AGGSb2guf7c7UuH99VXnAGcFP
         zuICarY2bh2gnslmTx80DNuUIxv/f/ewhi2AfbKUQAtbqLVLl6nnaIEQdLFu+K7gMcIQ
         MHJg==
X-Forwarded-Encrypted: i=1; AJvYcCVXAze39N3vfTGNPMPlZXECSbsQb1j6PqujTVfgEkJFZA7NfNAE8AA4zlSIN2g4UIAbBD88quMDa6JE@vger.kernel.org
X-Gm-Message-State: AOJu0YyqrRcFIvdhlHhLNu2BOEPU6ywvFYw070m5uzO8fMX1BqH09+6m
	TU0Y9H/s7glYV7jya9RudLzKnoiK9DY2w3+K+nj1tRI0Gr9cVg+tLl1gejopvwLFMn8=
X-Gm-Gg: ASbGncubZHh1xD5SHZwlNAk2WxxskTX14LJKqq7NP2mwloMqwqmAVDkVmaMZgp1NK5d
	USR4NfklvvHqB6s0Evon8uEuvR7ehWLk/snrDfl+dUtg2XSUOR3VQTJj6aOU7igsHqeLW5Msx86
	VfEwheg6Ir9jqGYL2D81ZhBrckoLYVdFJlfCG4atT4PxmQehNI15JbGg1+QqGFX7fG7ba0MguxL
	VU6Jpq+tHIa2fXZH5CmEZpGrIiIHS2V30ZE6uKRDi0vTirifySUisXkiVHTiJQMrHE8XBM7z1EF
	NwWckAGNGpkSp5r4agQlKmidm74No/lJrDGOLQSIzJkLmQL2evmzMXy3uOWr+g==
X-Google-Smtp-Source: AGHT+IGvxvb7++yzRa5veyRGs3Zx8MyIdj7JiaUbu6/iQeE+/SATCIw2rNK1UiqXpTlixKSR25x1LQ==
X-Received: by 2002:a05:6000:420f:b0:3a3:6ab0:8863 with SMTP id ffacd0b85a97d-3a4e889eb28mr1188805f8f.16.1748461473317;
        Wed, 28 May 2025 12:44:33 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfbf498bsm456825e9.1.2025.05.28.12.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:44:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Fenglin Wu <quic_fenglinw@quicinc.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] leds: flash: leds-qcom-flash: Fix registry access after re-bind
Date: Wed, 28 May 2025 21:44:26 +0200
Message-ID: <20250528194425.567172-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2830; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=xZUOsMsyjcZ1qewKlqP/KKWUHO3l+hPWlf0MlhF4mH8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoN2eaz7n8pPjPnbi145qnYfYgaQHvOCqX2u977
 76YTVyTGoKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDdnmgAKCRDBN2bmhouD
 1/MTD/4v9AfAXDInQwz5wRgjEGH1dJLIxSqTY/BFyhTxRZ8A9tu/zhi5vjHtGelpAM3NLeWt5t/
 vMq5UiUIfLBHQnl8/PBDCSiTijAkVetgZ/aCAG+fGBp/IKzFH5jvoDJdJzDye0Pm/3Pz1rl+xOb
 cgGISxdSSkZh7cIBW2U+YDqziYH+lAonOWY0lYDyTUJgnpqEidnGpHtFJeA7OjxsuiQm/oW50Us
 2cz73IsdmpfkRgw7qzKQGuDGHuWXTiDEwHS/hxbgpPBx/yi9WFV5TVaXLPe4JF9iZFdrCnnzmlt
 7zoEojhXgciN9jQd4WoPTGymAgoVZFZNmG5rH+7dO3gUBdgv0f+ejNKidALCZd4zpwlkNn1Eg54
 jjPnues6VZx3d8JESDR/qZFSejWaa+Bj/mv7cF6W32J1NsJzA1oyzB1POjS+sFkztfEsbYVvrvk
 vM4rLrcezJZ3fyWgfDOELRj7urSMSTuWwt8cCy5abaA/JRIgEzr5dws/0zJdo3810WlQ/PJj7Ab
 AWwrPL/hMc6hlUxg5kJXoIarXEyx8dmpr3BU5+Xg7ztAnajdSO1kQ0xoz8s6iCUv24fjvWnd1Gn
 E1TS9Ax4vfI8nlV1iF6LxhcPaNfp8jagm5kpT8F7VfOkxGl9VmN1infFYcP+/1L6dnpygYtmRu2 MHcVDn/sNj3FEDw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Driver in probe() updates each of 'reg_field' with 'reg_base':

	for (i = 0; i < REG_MAX_COUNT; i++)
		regs[i].reg += reg_base;

'reg_field' array (under variable 'regs' above) is statically allocated,
this each re-bind would add another 'reg_base' leading to bogus
register addresses.  Constify the local 'reg_field' array and duplicate
it in probe to solve this.

Fixes: 96a2e242a5dc ("leds: flash: Add driver to support flash LED module in QCOM PMICs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This is a nice example why constifying static memory is useful.
---
 drivers/leds/flash/leds-qcom-flash.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/flash/leds-qcom-flash.c b/drivers/leds/flash/leds-qcom-flash.c
index b4c19be51c4d..b8a48c15d797 100644
--- a/drivers/leds/flash/leds-qcom-flash.c
+++ b/drivers/leds/flash/leds-qcom-flash.c
@@ -117,7 +117,7 @@ enum {
 	REG_MAX_COUNT,
 };
 
-static struct reg_field mvflash_3ch_regs[REG_MAX_COUNT] = {
+static const struct reg_field mvflash_3ch_regs[REG_MAX_COUNT] = {
 	REG_FIELD(0x08, 0, 7),			/* status1	*/
 	REG_FIELD(0x09, 0, 7),                  /* status2	*/
 	REG_FIELD(0x0a, 0, 7),                  /* status3	*/
@@ -132,7 +132,7 @@ static struct reg_field mvflash_3ch_regs[REG_MAX_COUNT] = {
 	REG_FIELD(0x58, 0, 2),			/* therm_thrsh3 */
 };
 
-static struct reg_field mvflash_4ch_regs[REG_MAX_COUNT] = {
+static const struct reg_field mvflash_4ch_regs[REG_MAX_COUNT] = {
 	REG_FIELD(0x06, 0, 7),			/* status1	*/
 	REG_FIELD(0x07, 0, 6),			/* status2	*/
 	REG_FIELD(0x09, 0, 7),			/* status3	*/
@@ -854,11 +854,17 @@ static int qcom_flash_led_probe(struct platform_device *pdev)
 	if (val == FLASH_SUBTYPE_3CH_PM8150_VAL || val == FLASH_SUBTYPE_3CH_PMI8998_VAL) {
 		flash_data->hw_type = QCOM_MVFLASH_3CH;
 		flash_data->max_channels = 3;
-		regs = mvflash_3ch_regs;
+		regs = devm_kmemdup(dev, mvflash_3ch_regs, sizeof(mvflash_3ch_regs),
+				    GFP_KERNEL);
+		if (!regs)
+			return -ENOMEM;
 	} else if (val == FLASH_SUBTYPE_4CH_VAL) {
 		flash_data->hw_type = QCOM_MVFLASH_4CH;
 		flash_data->max_channels = 4;
-		regs = mvflash_4ch_regs;
+		regs = devm_kmemdup(dev, mvflash_4ch_regs, sizeof(mvflash_3ch_regs),
+				    GFP_KERNEL);
+		if (!regs)
+			return -ENOMEM;
 
 		rc = regmap_read(regmap, reg_base + FLASH_REVISION_REG, &val);
 		if (rc < 0) {
@@ -880,6 +886,7 @@ static int qcom_flash_led_probe(struct platform_device *pdev)
 		dev_err(dev, "Failed to allocate regmap field, rc=%d\n", rc);
 		return rc;
 	}
+	devm_kfree(dev, regs); /* devm_regmap_field_bulk_alloc() makes copies */
 
 	platform_set_drvdata(pdev, flash_data);
 	mutex_init(&flash_data->lock);
-- 
2.45.2


