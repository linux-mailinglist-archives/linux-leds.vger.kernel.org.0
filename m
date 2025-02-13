Return-Path: <linux-leds+bounces-3961-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B9BA33453
	for <lists+linux-leds@lfdr.de>; Thu, 13 Feb 2025 01:58:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37CA21888BB5
	for <lists+linux-leds@lfdr.de>; Thu, 13 Feb 2025 00:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD9E378F32;
	Thu, 13 Feb 2025 00:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="Yx/BxV+g"
X-Original-To: linux-leds@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6007D2B9A6
	for <linux-leds@vger.kernel.org>; Thu, 13 Feb 2025 00:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739408332; cv=none; b=h1Q0LFr3CjEWPIrv+PeJCplHkVpRzhxo0einw3JPlfCyvVZUfXgjWmCWVzpMT0DOTCinTU+OPrAASzUfpOA1+pGODsCL8xSZ2vPMI0jvpocIlvRJmdpDMY6Xk37bQieit0885OwDTvZxT/YDFHJ71PjpWLiyJwF4e059D5boorg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739408332; c=relaxed/simple;
	bh=F8zv4LMXdcQEzaUu9AFN5GpEs/7t8PH+2uygr9RyVzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I/7XzE+un8TM0c+6v/eV9lDia0DTSct6uCZ0LB43pepA4CZJx6x4OHrXLZRRRH4+qXMYKRxt3rmi/C7JKN8zcE49RW6hKDLU64p4nxsi+8Gk9ykfO95eFSoylPsbA4GUTfqNCJxctMDl+nlMdkPgiwasfNpiUGu9vsA1mIMykOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=Yx/BxV+g; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 842582C03E8;
	Thu, 13 Feb 2025 13:58:41 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1739408321;
	bh=F8zv4LMXdcQEzaUu9AFN5GpEs/7t8PH+2uygr9RyVzs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yx/BxV+gb1EJxvxGZN3iWlsmLCe59gA87WIEj6lezLKIwnx138qOMCf47ofjMu47Q
	 XSMNaNobpunRhOqwz2qj9Cn9LJgGaWZGGixsMsSoWAzpr+Jzo9Q8vZrzJiLyB4yHXL
	 DYXpJ2zlnJcVglDTXlhtrZzJgw8osb9o9S/gUr4uurrou1USQMy5xlNQH2itv7yPqg
	 wkmWhcLy/t6GpgDriIn5EGMMPOH62Gs5o7gbR7Eig6qQyJnfl1xTO594WiO9YUZchC
	 QBO3kAegUwGHDX/WBhw0Ika8bDxVdqMG1bodN5jsAd6FXOcKoRYdnZj4HozCYc/yVE
	 WeAzyrzNj2WKA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67ad43c10001>; Thu, 13 Feb 2025 13:58:41 +1300
Received: from tonyo-dl.ws.atlnz.lc (tonyo-dl.ws.atlnz.lc [10.33.12.25])
	by pat.atlnz.lc (Postfix) with ESMTP id 5113D13EE4F;
	Thu, 13 Feb 2025 13:58:41 +1300 (NZDT)
Received: by tonyo-dl.ws.atlnz.lc (Postfix, from userid 1161)
	id 4BEAE5A00A4; Thu, 13 Feb 2025 13:58:41 +1300 (NZDT)
From: Tony O'Brien <tony.obrien@alliedtelesis.co.nz>
To: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ben Hoelker <ben.hoelker@alliedtelesis.co.nz>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] dt-bindings:leds: Add function define for POE
Date: Thu, 13 Feb 2025 13:58:41 +1300
Message-ID: <20250213005841.4143929-2-tony.obrien@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213005841.4143929-1-tony.obrien@alliedtelesis.co.nz>
References: <20250213005841.4143929-1-tony.obrien@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ccpxrWDM c=1 sm=1 tr=0 ts=67ad43c1 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T2h4t0Lz3GQA:10 a=q2d_3YwXzPll6jce6DgA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add a define so network devices with a PoE PSE feature can provide
status indications of connected PoE PDs.

Reviewed-by: Ben Hoelker <ben.hoelker@alliedtelesis.co.nz>
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Signed-off-by: Tony O'Brien <tony.obrien@alliedtelesis.co.nz>
---
 include/dt-bindings/leds/common.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds=
/common.h
index 4f017bea0123..3a8958b81c87 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -94,6 +94,7 @@
 #define LED_FUNCTION_MOBILE "mobile"
 #define LED_FUNCTION_MTD "mtd"
 #define LED_FUNCTION_PANIC "panic"
+#define LED_FUNCTION_POE "poe"
 #define LED_FUNCTION_PROGRAMMING "programming"
 #define LED_FUNCTION_RX "rx"
 #define LED_FUNCTION_SD "sd"
--=20
2.48.1


