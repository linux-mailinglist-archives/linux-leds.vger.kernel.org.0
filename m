Return-Path: <linux-leds+bounces-4293-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06080A642C8
	for <lists+linux-leds@lfdr.de>; Mon, 17 Mar 2025 08:08:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A84A165465
	for <lists+linux-leds@lfdr.de>; Mon, 17 Mar 2025 07:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D80B21ABA6;
	Mon, 17 Mar 2025 07:05:55 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E47219A93;
	Mon, 17 Mar 2025 07:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742195155; cv=none; b=Xu6Wzu00/uEY9QdpsB8iIQTh+U0Q3jscN1jVdW2FJS1/NOchHC7dGjLfq1+oqOqlvxHOYR6d0c6KNGsKtLX305145HLjjUJ+kPk0hNw6QgfiP66w6zC+c7TzuTEM0P0x2x1MpBQAGJnwNaQtgp/oF01vYRuqj9vg1kk15QWK5+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742195155; c=relaxed/simple;
	bh=ka+rddMCkIu1nHfVFiTxDLklpHTjVJuyW6KGrRS7mFM=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=twNeONp7H4v8n2Wit7Rinxux1wKjeuBOT4lR9A30hjPw26lWm2XW2s1CuA9UVDLzEb4K60366SHZc0LGIhJWCbNQSE4q0o3xw0UdOAsvU/v3GT1upiRj+VKTMYmOZK7PwhuGjfpjWGxG91Qfpru6eTjo9k0bGLrkb9LO4UvaHQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZGQwp6fP5z8RSdR;
	Mon, 17 Mar 2025 15:05:46 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl2.zte.com.cn with SMTP id 52H74krl089913;
	Mon, 17 Mar 2025 15:04:46 +0800 (+08)
	(envelope-from tang.dongxing@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 17 Mar 2025 15:04:48 +0800 (CST)
Date: Mon, 17 Mar 2025 15:04:48 +0800 (CST)
X-Zmail-TransId: 2afb67d7c990319-c47b9
X-Mailer: Zmail v1.0
Message-ID: <20250317150448777DwuLrfzwC0KXdv5RYpZFq@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <tang.dongxing@zte.com.cn>
To: <lee@kernel.org>
Cc: <pavel@kernel.org>, <zack.rusin@broadcom.com>, <namcao@linutronix.de>,
        <tang.dongxing@zte.com.cn>, <tglx@linutronix.de>,
        <mmkurbanov@salutedevices.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <ye.xingchen@zte.com.cn>,
        <yang.guang5@zte.com.cn>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBsZWRzOiB0cmlnZ2VyOiBwYXR0ZXJuOiB1c2Ugc3lzZnNfZW1pdF9hdCgpIGluc3RlYWQgb2YKCiBzY25wcmludGYoKQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 52H74krl089913
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67D7C9C8.001/4ZGQwp6fP5z8RSdR

From: TangDongxing <tang.dongxing@zte.com.cn>

Follow the advice in Documentation/filesystems/sysfs.rst:
show() should only use sysfs_emit() or sysfs_emit_at() when formatting
the value to be returned to user space.

Signed-off-by: TangDongxing <tang.dongxing@zte.com.cn>
---
 drivers/leds/trigger/ledtrig-pattern.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/ledtrig-pattern.c b/drivers/leds/trigger/ledtrig-pattern.c
index a594bd5e2233..861122c3e97b 100644
--- a/drivers/leds/trigger/ledtrig-pattern.c
+++ b/drivers/leds/trigger/ledtrig-pattern.c
@@ -256,7 +256,7 @@ static ssize_t pattern_trig_show_patterns(struct pattern_trig_data *data,
 		goto out;

 	for (i = 0; i < data->npatterns; i++) {
-		count += scnprintf(buf + count, PAGE_SIZE - count,
+		count += sysfs_emit_at(buf, count,
 				   "%d %u ",
 				   data->patterns[i].brightness,
 				   data->patterns[i].delta_t);
-- 
2.25.1

