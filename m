Return-Path: <linux-leds+bounces-2982-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DB1993286
	for <lists+linux-leds@lfdr.de>; Mon,  7 Oct 2024 18:08:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99D791C20981
	for <lists+linux-leds@lfdr.de>; Mon,  7 Oct 2024 16:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0AC1DA0E9;
	Mon,  7 Oct 2024 16:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ocSfg4kR"
X-Original-To: linux-leds@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F4A1D61B9;
	Mon,  7 Oct 2024 16:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728317290; cv=none; b=GdnIix/kTm4S1Dyz/p7Z6dPbOcuK6J7AepzPIZ3Q4u/BwE2+YFK+snOPiQETCHb9YFAamEgQWEqxYvGsf+Ds3NtljPmVBS4CxfxEb6JKVOzf9RESRkuaLXMuIKfAoKWRJetvxBmRByqZRunOBKp7LdETz+58bbC0cucupeH6c9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728317290; c=relaxed/simple;
	bh=uqkRqVlfW6WWbHVuSuWc5OtFYX+n1sshI00wPz1tgmY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YfPZASXcenTGFjRWNvx2SltPrg3Hfvubs5GVMcdr+QcgVPHFESDBCcyjExS/sT/lLLq+GrKCCpBLNfLuyJhoSrY0ESIKji7tJNPjiiUpwivlsAKGb3rmK/e5zSfDLa/QrZ0jF6lAyYtI7S7Z7EZ8Q172c2UcClUnKP7vWX1QzM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ocSfg4kR; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TcfkwV3f9baV8MY6zp7V4iWPZ2iF38+wYPeAUgAVClw=; b=ocSfg4kRHsOgJaXyKMewNo8FXX
	5v0oto4RYzXvY5jykwI+viOFUVrF87yOBFHEqV+zHKZc+ieUIPE/F1nv+BZG8aUl1gc2JXRaZWPro
	mssbta0k4hspSkGEGbNH1lyawZuie6EjCvbsZW2O/yc7o0rFIttYT8aL7sWfGOqiQlpPlqTl0q53I
	AmjH1F9svmbc+uOu5kKv92hSjsfjHJ/YgRTapdUv4Rs4+TDrD6lXSIeVnliG9xxck0wMVruPZrkR8
	YOBQVrPtgUOorkcq09OsCk0uUvQl6iMJZj/KoMRASvRx7/L3zWLE8luIkiwIydEGQOU3aSa2kSZUe
	hGNE9BFQ==;
Received: from i5e860d18.versanet.de ([94.134.13.24] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sxqHG-0002af-Ba; Mon, 07 Oct 2024 18:08:06 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: lee@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	heiko@sntech.de
Subject: [PATCH] dt-bindings: leds: Document "rc-feedback" trigger
Date: Mon,  7 Oct 2024 18:08:04 +0200
Message-ID: <20241007160804.2447947-1-heiko@sntech.de>
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
 Documentation/devicetree/bindings/leds/common.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index bf9a101e4d42..32f9116e03a2 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -119,6 +119,8 @@ properties:
             # if trigger is absent
           - none
             # LED indicates camera torch state
+          - rc-feedback
+            # LED indicates remote control feedback
           - torch
             # LED indicates USB gadget activity
           - usb-gadget
-- 
2.43.0


