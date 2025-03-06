Return-Path: <linux-leds+bounces-4181-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2678EA55A3A
	for <lists+linux-leds@lfdr.de>; Thu,  6 Mar 2025 23:55:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 284693AFCAB
	for <lists+linux-leds@lfdr.de>; Thu,  6 Mar 2025 22:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8A5427C86B;
	Thu,  6 Mar 2025 22:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b="OpprRC3w"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E9CA2D
	for <linux-leds@vger.kernel.org>; Thu,  6 Mar 2025 22:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741301751; cv=pass; b=a5naxoWlGRXwOX6WlAQnYz3RSDH5GTPO5gwpVKgQJWOJJ+nN/kZGPbcmAHYOriaox/TJlnxDwBAXfRwWMm4vGcki4bR9srp/zIeoYFWOFU5CQRFutuoXpUI2JMofTC1VC3UbczZDxvJ849+snj0aeSon8RMIqJpPBcJhFewHcF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741301751; c=relaxed/simple;
	bh=/TYPyW77awcK7TCcuUAbkOwueTXoVYgiFyASeXOAnGw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PdYxYaE6MgWUyMG+VJwBKnFc/UtmmF9nYBZ0gsSnBrpDIGoCmQVxKYX1AkruE1We474IhLX/fobR87dyAnV78rlP28q831TCjqjt0oFTShJjdpj2ajSw/nxByADurVrmz2Y+5IOgvdzXYfSUnHCNj31gntkNQHOyNA6Hg/zQuTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au; spf=pass smtp.mailfrom=mcqueen.au; dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b=OpprRC3w; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mcqueen.au
ARC-Seal: i=1; a=rsa-sha256; t=1741301745; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lLVPBkffol18pnvq8KE8MAJ5Rs10QopPzu9m/PXu1fGFcEuFgtezGC/NN+XB31iECiK9plR9JBiV6YUHVgJSCrEC+xW9i9huFO/m573zkDIZXhbMvibNp0u33Cjpe7WIDUuLBgtaNk9yFvS0da1PZoNi5tqse6iZy5o0aeFqg7E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741301745; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+oiX73kFsl/BvL/KbrcYE6UPwQgDvkc1oPTT042M7Gc=; 
	b=g82VXNYwGrfQyehqqZexUkchZDiWQxwWXJJky7b/qFcqgR+h4Bj3iMgETuNrsUXO6C/oACUiIEz0yz/zbVhSehKs8Mil/uJDi8nKHclpWn9dj9LFsD7j5T0GB6FrOXrb+eS3Dn5X5tlY58gFXl4aBwUmZRZNaB4QmTI4q1WdnNQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=mcqueen.au;
	spf=pass  smtp.mailfrom=craig@mcqueen.au;
	dmarc=pass header.from=<craig@mcqueen.au>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741301745;
	s=zmail; d=mcqueen.au; i=craig@mcqueen.au;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=+oiX73kFsl/BvL/KbrcYE6UPwQgDvkc1oPTT042M7Gc=;
	b=OpprRC3wwqOPBIq9QpjOmW0LL66MJVduC5zQZihcO+GzWvoy2OBq8syhxpcB3tpW
	4Dvpx2F3/m7hah1GfYGNvjouYvqdrH3I1a+HeBOJjtBi5HGnZOKgvk7Y4UNrpLi5BDu
	0u3BtNDqfMe24T+1ZjvYfiKtt92lnJzIrAlomsvA=
Received: by mx.zohomail.com with SMTPS id 1741301744081992.4832449095018;
	Thu, 6 Mar 2025 14:55:44 -0800 (PST)
From: Craig McQueen <craig@mcqueen.au>
To: linux-leds@vger.kernel.org
Cc: Craig McQueen <craig@mcqueen.au>
Subject: [PATCH] led-triggers: accept "default" written to sysfs trigger attr
Date: Fri,  7 Mar 2025 09:55:24 +1100
Message-ID: <20250306225524.318562-1-craig@mcqueen.au>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

If the text "default" is written to the LED's sysfs 'trigger' attr, then
call led_trigger_set_default() to set the LED to its default trigger.
---
 drivers/leds/led-triggers.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index b2d40f87a5ff..f2bc3bb5062d 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -54,6 +54,11 @@ ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
 		goto unlock;
 	}
 
+	if (sysfs_streq(buf, "default")) {
+		led_trigger_set_default(led_cdev);
+		goto unlock;
+	}
+
 	down_read(&triggers_list_lock);
 	list_for_each_entry(trig, &trigger_list, next_trig) {
 		if (sysfs_streq(buf, trig->name) && trigger_relevant(led_cdev, trig)) {
-- 
2.48.1


