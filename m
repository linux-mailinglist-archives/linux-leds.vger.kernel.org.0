Return-Path: <linux-leds+bounces-4223-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DB0A5B7FD
	for <lists+linux-leds@lfdr.de>; Tue, 11 Mar 2025 05:27:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C7E21891220
	for <lists+linux-leds@lfdr.de>; Tue, 11 Mar 2025 04:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27BAC1E1A17;
	Tue, 11 Mar 2025 04:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b="WiQb/5v9"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23FF38DDB
	for <linux-leds@vger.kernel.org>; Tue, 11 Mar 2025 04:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741667224; cv=pass; b=mGQZ06vAOg7HzHLNvHuTZNM/gjXhofJyVX5TpF3N8uK+Hmdff7dRdY+gUCbXxHiN8HHy1kY1iXcH6b1Np4H4Ec7KqkxQGQXU2OlKrEgywMgYHA3YJ8oIzdLyuB4hpOwwhtN+ZlXfsuSO7VAnncn67E9CPWkLAo3ahpH8HnWDAww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741667224; c=relaxed/simple;
	bh=vltXe59dDy4JI/q89GGUatHVCqZGTRhMY1bSUlnds38=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RXINVZp+RWjdV22qZBe9ofzgqcAqjtjmR7JcdO5JPlKSFR0OBFMh5/Heodirh16SQ4Y8/UWtr0CCBEafmIaBxlZD+xyvRXJkZTloHPCFxufbse2UXS++pOf61WW7H7esXJUQQkhDKVX4itngOcRwTg80bXT86NoSsFpdzD7UXjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au; spf=pass smtp.mailfrom=mcqueen.au; dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b=WiQb/5v9; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mcqueen.au
ARC-Seal: i=1; a=rsa-sha256; t=1741667216; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aLsjv9WsaoadSmb2TU89Bg1wbt8hTzSOoMwlkS/YFQ5JklluIoHRymA1n0r10LvlwIgzi+lH55u1yG6Q88nJ4N9oGoXviesFxU61WnRe4Nv7OiffDsYzk9VtpCn//8zidfNPuYCPMmZxTKADKhQKhvHiXqRffE5qtUYDj5H3ACU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741667216; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2ld/48Aslb7xdmsqFt8Gz002bzZg2IsyurlGHOPrnCY=; 
	b=T83icebPqUmCcsD5DPulTcYW72oNjQSC4yfe1Snw768bqEDNpYymtQFExBHU9SEuTunn1bgRyui7y0nQDeatMEFo8HaUbJ0VNGoodkFiDvmEwXbRXQopnU5Oj9ouCEsr+0/aAiJ1ReYRPL2HV4WG4DvNdfvXpQUUE7+avrr5THE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=mcqueen.au;
	spf=pass  smtp.mailfrom=craig@mcqueen.au;
	dmarc=pass header.from=<craig@mcqueen.au>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741667216;
	s=zmail; d=mcqueen.au; i=craig@mcqueen.au;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=2ld/48Aslb7xdmsqFt8Gz002bzZg2IsyurlGHOPrnCY=;
	b=WiQb/5v9PYItriu9HS1h4oFYlLL7zMqcMPftTz2Eebc72eUqeyQhqPeZswO65Fxh
	1oQ713JasQRse6N8AuXhxGW4kF4tu0vP6lziS89WYp6AYlsTHF4et3ghbHQ6y48+3A9
	my8A1VDM3LVSAxbIBSVc2WoU3nUZ1olRcOABTw5I=
Received: by mx.zohomail.com with SMTPS id 1741667212959934.2732365049861;
	Mon, 10 Mar 2025 21:26:52 -0700 (PDT)
From: Craig McQueen <craig@mcqueen.au>
To: linux-leds@vger.kernel.org
Cc: Craig McQueen <craig@mcqueen.au>
Subject: [PATCH] leds: uleds documentation fixes
Date: Tue, 11 Mar 2025 15:26:41 +1100
Message-ID: <20250311042642.373782-1-craig@mcqueen.au>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

* Add max_brightness field to struct for setup.
* Reads are a signed int value, not a single unsigned byte value.
---
 Documentation/leds/uleds.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/leds/uleds.rst b/Documentation/leds/uleds.rst
index 83221098009c..4077745dae00 100644
--- a/Documentation/leds/uleds.rst
+++ b/Documentation/leds/uleds.rst
@@ -17,16 +17,16 @@ structure to it (found in kernel public header file linux/uleds.h)::
 
     struct uleds_user_dev {
 	char name[LED_MAX_NAME_SIZE];
+	int max_brightness;
     };
 
 A new LED class device will be created with the name given. The name can be
 any valid sysfs device node name, but consider using the LED class naming
 convention of "devicename:color:function".
 
-The current brightness is found by reading a single byte from the character
-device. Values are unsigned: 0 to 255. Reading will block until the brightness
-changes. The device node can also be polled to notify when the brightness value
-changes.
+The current brightness is found by reading an int value from the character
+device. Reading will block until the brightness changes. The device node can
+also be polled to notify when the brightness value changes.
 
 The LED class device will be removed when the open file handle to /dev/uleds
 is closed.
-- 
2.48.1


