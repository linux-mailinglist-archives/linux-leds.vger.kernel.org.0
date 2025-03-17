Return-Path: <linux-leds+bounces-4289-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11332A63B6C
	for <lists+linux-leds@lfdr.de>; Mon, 17 Mar 2025 03:22:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0312B188DB07
	for <lists+linux-leds@lfdr.de>; Mon, 17 Mar 2025 02:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA9053E23;
	Mon, 17 Mar 2025 02:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b="gfqcsxAh"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3255F41C71;
	Mon, 17 Mar 2025 02:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742178167; cv=pass; b=GwNmpFiFhaLYkx8IG7wQqb83MRnkeOsjyqys6oaYXxMde4U2pydNAJXA0A1oI8h/qRt9x6X9WNTaat+Ozy7Ww7XesgeCvp4PsV9rvlrI3ePFvLquewXy9kgN7zATLPtS3EsxXW0dIgiillj82M61M2gWyxlemNaRrgKaB66UFlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742178167; c=relaxed/simple;
	bh=aBfLkQWIwSuIWYfhmzIDTIbcoGkKK6yDe0udX6G2ZA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FFmcx+bOBYHxcEYwO+5dfdGkXULAFkpWQoSg/THg+f+8nyTCAfVtRd7vaK9kiodKsWd2ItXm0W9csSuZsSczkfhOb/LlQC+CyuAUg1U193Rnc0uRegcra2p2k5i1OwKFQOC/Rlqgc+DZfoGYD1C43IXgwdXlzsV/yl8/LHM58dE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au; spf=pass smtp.mailfrom=mcqueen.au; dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b=gfqcsxAh; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mcqueen.au
ARC-Seal: i=1; a=rsa-sha256; t=1742178161; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NQNxU8yhK/DmkLDGMy3Uk5p4xKyHTejcpIFvrJLexcCSKmcrhwT+DWQFfxFO3NkxeNohy21dlY8mcZgFDeVUhHwREbuVm+uo5Mc35KoFyKjQNEzZ/PA30mpFtEXytAaI9cET2XCLBFedgWeS/DJ2NXvEykBqtZthRSmZ7H+ClCw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1742178161; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7vKlPXhw27JYjmqjWNXuz7ItPZuCC9iS4GLpaLAzwCs=; 
	b=GinTY8JOXZPf77g/ubYpWfokawzU8gBOfzxiPurFMckq52TIvHCS+uKCHJgDS81eOYtxlenJOn9tvAc1wvm5ZFGe62YN7Vs0pRgVXgRd/eRf8DWIRDa/THi2LNkp0deikIPb5GMGsS6CsuaFqtj+7Q4JcZEn2MFzRC3+gAwLeqI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=mcqueen.au;
	spf=pass  smtp.mailfrom=craig@mcqueen.au;
	dmarc=pass header.from=<craig@mcqueen.au>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742178161;
	s=zmail; d=mcqueen.au; i=craig@mcqueen.au;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=7vKlPXhw27JYjmqjWNXuz7ItPZuCC9iS4GLpaLAzwCs=;
	b=gfqcsxAh1Ign1RsOz59oPfr0QO42cqo1sS9/l/vtplh+vnWXX+k8ZTFcNR9kVFda
	ZWQNq2JuNeRc0av+PSEJJkOxcmIPly1AJ3k9BLAEEt49camwpFvRfyxpuSlEqqVTmCg
	n8W+M0l/UCTHbeo6gLysVQ1Rk3wz7TT2dYXoo5rA=
Received: by mx.zohomail.com with SMTPS id 1742178158336158.59315349470774;
	Sun, 16 Mar 2025 19:22:38 -0700 (PDT)
From: Craig McQueen <craig@mcqueen.au>
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Craig McQueen <craig@mcqueen.au>
Subject: [PATCH v3 1/2] leds: uleds documentation fixes
Date: Mon, 17 Mar 2025 13:22:19 +1100
Message-ID: <20250317022220.423966-1-craig@mcqueen.au>
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

Signed-off-by: Craig McQueen <craig@mcqueen.au>
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


