Return-Path: <linux-leds+bounces-8287-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJgbFfFMD2ptIgYAu9opvQ
	(envelope-from <linux-leds+bounces-8287-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 20:20:33 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A315AAF81
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 20:20:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DF6E300696B
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 18:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF4EB383C6B;
	Thu, 21 May 2026 18:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PR7vDw4d"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C13E2E974D
	for <linux-leds@vger.kernel.org>; Thu, 21 May 2026 18:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779387294; cv=none; b=d5lW57UEE34JXLLhup4PODyIhb0mAwsjQS+q0/OYK4G4sfIkxGxEbC2nDg5v0GdzWo3WDRQvUcV2df7VEakK/CpTKPE2LMORUmuGin2ZpENHByytKseWaN9OUmtzSdpJOV8eyBmxfAJsqW79V5TAX1v7QZtibUavSrqVrhlGiHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779387294; c=relaxed/simple;
	bh=PLwW4cE3Yxr+x/17vJ6hzy5kxS8G189MESZhzu3rekI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WmD62NGLLvBgf6RUTuPlXdsBnx1ehAFNpT6aGxAXc5l9Cvc5lOMtTsmR4gvbli/FlGdHC3h8jHeiZHoChm0duvz6xCJIWiCFJX+mQ7+MteLwQ/8/A5z9LCQVKd/9yTiztt+X58cgt09fqGRhJ/ketcC48jeSfbpCOgO9MUHxMVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PR7vDw4d; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so74958525e9.2
        for <linux-leds@vger.kernel.org>; Thu, 21 May 2026 11:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779387291; x=1779992091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jfWQexw5scxX47S59WLcWz668eezvBPIhS9gpOdPMlM=;
        b=PR7vDw4duY+RAcVS460TxTNPaNnI6xqQIDbFsAkQEcN06Fh/SY1sCIwrwdXi8aDtJK
         54NzZyGXmLz91M6bXV25nNZc/YKfDET6InYyZWRsbcX0BNFbehpj8xuWQkhMTih1ILyg
         psMC5Z23DWIEx866CryZpBSn7qufljbl8xod4MYg8lfdWGhw8NhpOP9lHnhxsUHHNHcn
         0ArD3q06RxcLZGiIkMpdPYdlmQfP3SIN/cVSOGC63ArYL4bzIKQuyDXSX02zt7AnCel5
         gtS78pTfUy4sTppbLbLfzKD3JVdqFb98DFoopq0jQMde7VwiMQtf7kTnuTywB95ghDSL
         vxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779387291; x=1779992091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jfWQexw5scxX47S59WLcWz668eezvBPIhS9gpOdPMlM=;
        b=JRQejkQamTcQ/M9yxvlp3VqJxL4yM1OA93UMkHRqYSccOyDXBh4eux/4eFSrx2Ctlj
         Rkc1YAG6vxLJ3WwIsYAWa3gpSQ8epqwB4/d3Gez/HEFvgLwaBM1GGfnv/CDYE5ZPQbqx
         BsuWBu1dxkNymzTJTISBFpLdy0GwquIe2O4E4BYrqO+SH5WFoAS/n9FdRPtxAY8QkJkh
         dCh6yDyfQv6AF0YLMUVJ87jUJ3TS/56C+kmqQSwnN2gBShB0Ly1b+VgSBpwZ2+npgroW
         7czrwPuKWTd/TTOmFISD47FPJIqpX7abguFfzyB6yN5OYFvNEfYE+gFUB5NVb6FZSnWp
         SWyQ==
X-Gm-Message-State: AOJu0Yxh++37bm2osCE2/wSuOTo39PxkqLp74GZ/PhhZ+CmeKh1/5CL/
	VZoW4AsnMFZ1iFJ3PYotNjDkpEajWDY8MNBqOWVn4JoaJdwj7HHh13yJ
X-Gm-Gg: Acq92OHvy8rAUsz2UvKhrwa+AnIUJrgNLZ95jYNorLdb0h7PQmDLeHb7Dk1vL8JHOVU
	JVSiFJcZWruk4jdCTw2D9Gf9zRWps9uXUuCAMyZysgW8ddF90M3AU4b/GOM64Q2t6dH6mUIel1j
	rigGjI5nUgMOxpy3Iw/OFKizi2ks/Y2Ok6YhxhPjUZqKArJBerO15Z+SCnn9r9hdKtvDKwUcNdD
	/N5KhNmn2J2evWA5V7+rTqo3zquTMN4J5vtLUqL9f6nz+Z2moo/DXPZT3HVaqj5cLL6q/rulODf
	TADywplctYpI/rrgGmxoNv8j7FQT+qgMudoeYFJZVl/BVzBoM8fLCS9QSmNoVXbIv7Sod7BAYIb
	89TiW8SsjwQGmH7w5CzlD2063DX5Q+MbhHhqR2bB0yqPeLXS1WwiRxWhG2XM5vsOS0T/PKK7W7s
	2BGATFzCxnjCi3GVbYSW+XOW9LYbKpJdJgLq+XUkNt9Egy2kg=
X-Received: by 2002:a05:600c:4452:b0:490:3bad:3784 with SMTP id 5b1f17b1804b1-4903bad3835mr45203955e9.18.1779387291255;
        Thu, 21 May 2026 11:14:51 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa944995sm4730986f8f.34.2026.05.21.11.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 11:14:50 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] leds: uleds: return -EFAULT on copy_to_user() failure
Date: Thu, 21 May 2026 20:12:05 +0200
Message-ID: <20260521181205.15130-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-8287-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alhouseenyousef@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A6A315AAF81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

uleds_read() copies the current brightness value to userspace but
ignores copy_to_user() failures. It then clears the pending update and
reports a successful full read even when no data was copied.

Return -EFAULT when the copy fails and leave the update pending so a
later read can retry.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/leds/uleds.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/uleds.c b/drivers/leds/uleds.c
index ace71ffc0591..470015e3f802 100644
--- a/drivers/leds/uleds.c
+++ b/drivers/leds/uleds.c
@@ -147,10 +147,13 @@ static ssize_t uleds_read(struct file *file, char __user *buffer, size_t count,
 		} else if (!udev->new_data && (file->f_flags & O_NONBLOCK)) {
 			retval = -EAGAIN;
 		} else if (udev->new_data) {
-			retval = copy_to_user(buffer, &udev->brightness,
-					      sizeof(udev->brightness));
-			udev->new_data = false;
-			retval = sizeof(udev->brightness);
+			if (copy_to_user(buffer, &udev->brightness,
+					 sizeof(udev->brightness))) {
+				retval = -EFAULT;
+			} else {
+				udev->new_data = false;
+				retval = sizeof(udev->brightness);
+			}
 		}
 
 		mutex_unlock(&udev->mutex);
-- 
2.54.0


