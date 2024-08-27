Return-Path: <linux-leds+bounces-2536-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEF3960A81
	for <lists+linux-leds@lfdr.de>; Tue, 27 Aug 2024 14:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 616821C22C87
	for <lists+linux-leds@lfdr.de>; Tue, 27 Aug 2024 12:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFADF1BC090;
	Tue, 27 Aug 2024 12:32:49 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E17C1BCA16;
	Tue, 27 Aug 2024 12:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724761969; cv=none; b=ihwoRaoU3v1n4x/kWHMwJivtTT/096DROXcxVXoOPXf0lQ1gQ9G5n2U15ezUFygfKFbGvmOkfAT5kLFVuIdVerRC1t3rHKOC6hZSwU0iJNTHvr6i55xtM4sWA3qZdysz3YQHeuo1j9oGL+q1cqEd2OAEORlelCoYpFYIrrYAMHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724761969; c=relaxed/simple;
	bh=QEkuhXOW25Oziqqk8V6qfXPak6Rbnwp1SVwQ/V8uK3k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LeWwW35Uytk/eBcp/4bS0boWh7ev3iZgz4HH2ZFVK9fGtRIwhVt+o99llaG+68kcDVzPmbWCVLSby1LBjlDJgg0qxs/cEx2IYj5KkCiNo6jek9U3cgDUtCr8Nmt5zMNZJJugl6gF1TbjSQ+01skBmcBLjaODteByPHQQZhyMuok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WtRl61QbLz1j7FR;
	Tue, 27 Aug 2024 20:32:34 +0800 (CST)
Received: from dggpemm500020.china.huawei.com (unknown [7.185.36.49])
	by mail.maildlp.com (Postfix) with ESMTPS id 260261A0188;
	Tue, 27 Aug 2024 20:32:44 +0800 (CST)
Received: from huawei.com (10.67.174.77) by dggpemm500020.china.huawei.com
 (7.185.36.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 27 Aug
 2024 20:32:43 +0800
From: Liao Chen <liaochen4@huawei.com>
To: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kabel@kernel.org>, <pavel@ucw.cz>, <lee@kernel.org>
Subject: [PATCH -next] leds: turris-omnia: fix module autoloading
Date: Tue, 27 Aug 2024 12:24:31 +0000
Message-ID: <20240827122431.430818-1-liaochen4@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500020.china.huawei.com (7.185.36.49)

Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
based on the alias from of_device_id table.

Signed-off-by: Liao Chen <liaochen4@huawei.com>
---
 drivers/leds/leds-turris-omnia.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 39f740be058f..dd547f5fc800 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -532,6 +532,7 @@ static const struct of_device_id of_omnia_leds_match[] = {
 	{ .compatible = "cznic,turris-omnia-leds", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, of_omnia_leds_match);
 
 static const struct i2c_device_id omnia_id[] = {
 	{ "omnia" },
-- 
2.34.1


