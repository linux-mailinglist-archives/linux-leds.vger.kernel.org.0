Return-Path: <linux-leds+bounces-2988-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A625993891
	for <lists+linux-leds@lfdr.de>; Mon,  7 Oct 2024 22:53:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA8B5B22E22
	for <lists+linux-leds@lfdr.de>; Mon,  7 Oct 2024 20:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33BA51D31A0;
	Mon,  7 Oct 2024 20:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="0qh7x6jb"
X-Original-To: linux-leds@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA9D18B491;
	Mon,  7 Oct 2024 20:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728334414; cv=none; b=hNlwWW+r/XLdX4jNq2H8fjjkyw4tGlbXdFr4sAo9ANRy8/mm96/ZJVwXHLwZNVDx31ccxzJhljO3bnAtB4z6rcBnFxEVKQOk4m5ZiR4n6y0giwrK0qk+nSIT9KWLjd3NBpkJLi0EquSEwn1R/4HDRdnWlcx+l2MyEUgdySxZ7FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728334414; c=relaxed/simple;
	bh=i4wYdm9Zi7Gk1796ITyVTFMwt/RqB84RvbVyWiJpmeM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cBHk8OrKLpOG3N32hzBVsq2c+eiH3SE5RPo/Xaamtc4balXUSdbHZxBrNfn5e8kvp/VRDq6q3u+c8Du7Kfd2f3h0J5UKNFIroQen5DurCep4ChIckTa03jYQZk/MTfirbnHFhsDdclM+DBXlVxjMEDngCQnpIuTaX2RRjJ1gkZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=0qh7x6jb; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iqD4+nSJAWyo1MbGZ8hyUXBIlH/RF1VwEjcfbhNwmqU=; b=0qh7x6jbAmci82wqAVowcCJFMq
	Ty4+1qsdbQJSC6LgEeLrEUGiV2I0milxavpK3pEo4EC+d+SKRTIuFha8cksUMeX/n4kUguJWcHBGU
	LxNFSXAn1VDN2i50GOBkF063sMLdVio8LUnhFMPbhDyoKfBQpcX09zJxpP0GSLKcdQFdpW7AYe9nC
	RUB4wUPOFQevcM4r/oF+Iu32L8zxDBDkjJxahKhcARvI7ejsDkG81Gyw4kXrzARDN4pjIqErbOWzX
	TBhxjCJcRXgfBd9YCR8YSSynma/7BXriPhmlvFYOkof75qhR4y17QXWwWsuNxycOevAFJ0YUVJDDQ
	ILjTECRA==;
Received: from i5e860d18.versanet.de ([94.134.13.24] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sxujR-0006De-8J; Mon, 07 Oct 2024 22:53:29 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: lee@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	heiko@sntech.de
Subject: [PATCH v2] dt-bindings: leds: Document "rc-feedback" trigger
Date: Mon,  7 Oct 2024 22:53:15 +0200
Message-ID: <20241007205315.2477060-1-heiko@sntech.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the "rc-feedback" trigger which is used to control LEDs by
remote control device activity. This is an existing trigger used in
existing DTs, document it so validation of those DTs would pass.

It was originally introduced into the Linux kernel in 2013 with
commit 153a60bb0fac ("[media] rc: add feedback led trigger for rc keypresses")

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
changes in v2:
- put the entry in the correct position and comment above it (Pavel)

 Documentation/devicetree/bindings/leds/common.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index bf9a101e4d42..9cd89f30fa7c 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -118,6 +118,8 @@ properties:
             # No trigger assigned to the LED. This is the default mode
             # if trigger is absent
           - none
+            # LED indicates remote control feedback
+          - rc-feedback
             # LED indicates camera torch state
           - torch
             # LED indicates USB gadget activity
-- 
2.43.0


