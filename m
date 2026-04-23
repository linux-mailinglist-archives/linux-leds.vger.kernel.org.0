Return-Path: <linux-leds+bounces-7808-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNnEBob46WnkpwIAu9opvQ
	(envelope-from <linux-leds+bounces-7808-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2026 12:46:30 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 05891450DD6
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2026 12:46:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2662302C912
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2026 10:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778443C198A;
	Thu, 23 Apr 2026 10:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="le6NXFyj"
X-Original-To: linux-leds@vger.kernel.org
Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com [203.205.221.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993EB28C84A;
	Thu, 23 Apr 2026 10:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776940883; cv=none; b=LBDiIyVySyZoQIGMGMb5pvKg7HGNliEMJOQR/S4eFGJMxx2MIFuxvnc7z5LKXjZ8mxXpFc2VtV3hWOVNvbhuEvGabuuZsDCQgGtlmMU/IoNPHW9xLZ/a8oALWnX7r4C8g6oiIUYva5pAX33yLJrUT4a4dtwTMeOhNpx0sGQ3Au0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776940883; c=relaxed/simple;
	bh=po071TqikIKm9CQCeD171LLg0dCz9/Use+Rf28f8az8=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=Jeum8UTcLXWJZsPvHgt8r231aaMFJCMR7ueku0AYLBwhdkGm61Sw4aK8x2800Cskk9dTPhCLt1vnfHC2ZbluBLXFUuEm8XtAiyEeHDzY/uS1mY4Qmpbn/ZCP2DCDYhLTWMrEA7rSGH4BGHZcpoAdwM1x2vzD/UHcWfJF0vIAfkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=le6NXFyj; arc=none smtp.client-ip=203.205.221.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1776940870;
	bh=2IMbY+i3cO6RwlIy78bRdWYWlk0o/dAReqPEJEy+b4U=;
	h=From:To:Cc:Subject:Date;
	b=le6NXFyj09Wp8sY5L3GbrbCKvckhQiJitCvnCz9fISLTNbFIQOV/Z2Ze7yaEp7bv5
	 qxTdfIcVCNORovLR4VJsxqfIipuoXLoHdoJSLK7fGPKLXx5eKcA7IhKrgxIzHVYfad
	 9d7B966FGWTty6VzEObT6c9/tOaBxQDPSspLlnFk=
Received: from DESKTOP-M81V2AK.localdomain ([221.214.70.47])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id A1607EC9; Thu, 23 Apr 2026 18:40:22 +0800
X-QQ-mid: xmsmtpt1776940822tevugamih
Message-ID: <tencent_26F6155ED10CA20CC65F62FD659218853809@qq.com>
X-QQ-XMAILINFO: Nte9/BsRzcszwS17R4aXJSidY3qjVdh6enLVdMpRwZd8xMuWrh0B5HGVDY6ovE
	 HTj6poOZQFZXCPV1+5H51u4zboepHfnTfoi/lcuBZDNrhl1hl9hldNeFiyeqfWFeBV2VBlKvrDVR
	 kAciS3aWJ8K3YJngf+kpxvvqqSIzFkPLHD6DdUwJ1pJ+KYRr1hg8X9FvLqMEVNhlKtv7Va7oQI0F
	 qH7po68GlajoXIclmk3Jy7pNI0UcBAWoq7fc1P1knwXjjTrBxeYLDxQrV/LegQ6YO8sGdFTGbKu8
	 CY8gDvHw4C6NmSfErncv9va9FNwVEbxD8idfpgNA9KXYIj45lRv5mM4hw0eJ5CLHy/UuNWgzdRMT
	 HA3KwKeRROqDxJrPtiUNRpp8GRrQR9CjkSqmjJgx+apcN7TKrw2QEzs4dtWx/aW6b4PDyv4MvEe3
	 YOqKRTQxYHbuLpuSx/bG72xKoL7aIWvW8voPaYBdYuGGv7D3dpaWtprGYG6d9ywX9UZHLDhW7OeY
	 y04dXnDvjUEF9dK2b0o2GlCCzdN4fpO9yR5OLfz5b04UiK0817PyQPv8xNU19QPTj35/O6MrmLgH
	 HOA/LBncumHjMQXI+2huUZZQAlTCE3IcokGT7K7q9ZzFlWepCdWcmMQb3Fno2Wo6m/ZLF9T7k6Ls
	 ZksDY7OkNnfZVZTNPOahELOjBgSS36uVWKb8pGgj3xXUgmWeQjZgDWHkcdLG0msFI7zQu2hsHm8H
	 vKl8e5g26sE1QuaxW4mFNHxbmvgxO5rKWx1toe8w6ucdPOnVTZKdRAOw7nvtYI3vhueUHTcmZLXq
	 jYtCMLMKF7offMGPP2FFUlEtERqYQGPaVmIRjAAe9frWZ4en8lDjbIV/WhCOKHsAoDMl4IEoMKyA
	 ZiNZqi3vbA4352Rx2NJH6h+4hgGQNBsLkXQ1eF2xN5jL7M2ysdJCEqVuGGfsHixV+b/IUUlICPXq
	 DY7TTr4qfmdsyD1CXK5p/hoFt7V+0NB1AT27IVeo1Hp/RaGdzd5l+21Oc+LBT0/77VuZYAAKoTUn
	 sbh1kbyDtZOXELIYBvvnG5pqE4l+U4zFmBKBuYR0tMagU6IWIc
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Xinhong Hu <tp5092@foxmail.com>
To: linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	jkoolstra@xs4all.nl,
	me@brighamcampbell.com,
	Xinhong Hu <tp5092@foxmail.com>
Subject: [PATCH] docs: leds: fix sysfs ABI reference in lp5812.rst
Date: Thu, 23 Apr 2026 18:39:10 +0800
X-OQ-MSGID: <20260423103910.10468-1-tp5092@foxmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[foxmail.com,none];
	R_DKIM_ALLOW(-0.20)[foxmail.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-7808-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linuxfoundation.org,lists.linux.dev,xs4all.nl,brighamcampbell.com,foxmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tp5092@foxmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foxmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[foxmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 05891450DD6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Documentation/ABI/testing/sysfs-class-led-multicolor is a plain ABI
description without a .rst suffix. The lp5812 documentation incorrectly
referred to sysfs-class-led-multicolor.rst, which does not exist.

This was reported by documentation-file-ref-check (make refcheckdocs).

Signed-off-by: Xinhong Hu <tp5092@foxmail.com>
---
 Documentation/leds/leds-lp5812.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/leds/leds-lp5812.rst b/Documentation/leds/leds-lp5812.rst
index c2a6368d5149..12e757d45c3a 100644
--- a/Documentation/leds/leds-lp5812.rst
+++ b/Documentation/leds/leds-lp5812.rst
@@ -20,7 +20,7 @@ Sysfs Interface
 ===============
 
 This driver uses the standard multicolor LED class interfaces defined
-in Documentation/ABI/testing/sysfs-class-led-multicolor.rst.
+in Documentation/ABI/testing/sysfs-class-led-multicolor.
 
 Each LP5812 LED output appears under ``/sys/class/leds/`` with its
 assigned label (for example ``LED_A``).
-- 
2.43.0


