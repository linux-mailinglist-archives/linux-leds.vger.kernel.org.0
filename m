Return-Path: <linux-leds+bounces-5224-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCBCB27EA9
	for <lists+linux-leds@lfdr.de>; Fri, 15 Aug 2025 12:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A12131BC2B36
	for <lists+linux-leds@lfdr.de>; Fri, 15 Aug 2025 10:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9EA2FF66E;
	Fri, 15 Aug 2025 10:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="GRcUo7e8"
X-Original-To: linux-leds@vger.kernel.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DA31DF24F
	for <linux-leds@vger.kernel.org>; Fri, 15 Aug 2025 10:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755254903; cv=none; b=grne6m9VNvMtNABQlazYXB6Y1HAsASLVMW5+/CnLs1UsMfm6H4+t5bizxLKLqFz1/p9aNlHmYr2pNx5L2POZqvyfn7BmYpQ589TLOWge8/sHTofBDyP97cVB1W4fG7WGP2tx0H+dRYRcVTsQmbvjfHGG6NCh2T4XvqtjxM3j0s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755254903; c=relaxed/simple;
	bh=42OCUCCiMqcxTgQxr3TgBWmcEl7+262s4gsEOcebIbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pQnt1eHtAblWvnQ1NlG/Ciz63IsAZFiqTwRNmqjbeY2KBB/iTUeFuMvHdV9XZjKjQzQmVOlm/LWCwg2+jguQflnYeiza2N9k6zZ40wYiuZhmE10bGnu5a4/Q5af3ok4I1S56E5gQ/g6ZtJtoRPvjDkRCaybdb0VMNDiItkPHRIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=GRcUo7e8; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1755254898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PJd4mKAX6RdUpjrrwmUXazuqsCN2PZfrowEzcn0Hg5M=;
	b=GRcUo7e8ncadhrPZPmqSKbQBPcnbagqMUaNukDVPLohMx/EgcWoP+S1SAmrw3ZH7wJlwxq
	/x7+9s/aIOlalGm/ZFhCDNbV/I4dHZzxxE4uz0NKFjotzvv/6iGtkSA3wuav+M5Ssf6z5G
	rcJY7MdOL6jbSRN5BW9CwquNsFPaZwc1mFLsumV/xOLzglLjTa5RGJyo/jKy3e6ptyinG5
	eDJe31rFJ2ev/mjNnNs46LBrjXH+/s6uw1yRaztJZUG4ukNK9LzNJN9FV+qe8FrvAPorRC
	tV71LF7msadNyAmRpiXbdDN/l0tsS/KQVzhSwQ9ktUjimUir8J+Ki/Ykm3DCCw==
From: Diederik de Haas <didi.debian@cknow.org>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH] dt-bindings: leds: Clearly mark label property as deprecated
Date: Fri, 15 Aug 2025 12:47:46 +0200
Message-ID: <20250815104805.405009-1-didi.debian@cknow.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The text description already mentioned the label property was
deprecated, but using the 'deprecated' property makes is clearer and
more explicit.

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 Documentation/devicetree/bindings/leds/common.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index 3e8319e44339..45ce9e13c7ff 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -58,6 +58,7 @@ properties:
       no other LED class device can be assigned the same label. This property is
       deprecated - use 'function' and 'color' properties instead.
       function-enumerator has no effect when this property is present.
+    deprecated: true
 
   default-state:
     description:
-- 
2.50.1


