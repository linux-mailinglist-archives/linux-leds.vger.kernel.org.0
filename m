Return-Path: <linux-leds+bounces-8932-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Rp4XOvJbS2ovQAEAu9opvQ
	(envelope-from <linux-leds+bounces-8932-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 06 Jul 2026 09:40:34 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4BE70DABB
	for <lists+linux-leds@lfdr.de>; Mon, 06 Jul 2026 09:40:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b="qedg4/Yn";
	dmarc=pass (policy=none) header.from=linux.dev;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8932-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8932-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F087F3040C8E
	for <lists+linux-leds@lfdr.de>; Mon,  6 Jul 2026 07:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A48C83F1AB8;
	Mon,  6 Jul 2026 07:33:49 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC85D3B52E7
	for <linux-leds@vger.kernel.org>; Mon,  6 Jul 2026 07:33:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783323227; cv=none; b=Dihz0GEB65tPKAZIbRWdHeV6fYAhdYp8716MyT8+NDm0Wnol8UE3KDq1oG4SqWwtxmLRw9ytheoA5G5Ld2yaoG9xAWmAQ0sr7kqnY4j/5bCwp3QWQO/ijJZMNW9tG6U3AkqLgfokAhl3F+tmvqkaG4HLgAxsJPMbc6PT9LHFqPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783323227; c=relaxed/simple;
	bh=IXOdl84cTugwPj55zjdyTLLGe46XdXULoxKrjlpPzPI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ed5Swmirr/ReyzxnP+XXxcE72Zs+9OkVK7wbdcVCI5HuoNdQhtP8TtFgRvuVTuHYN83mQJiHA6PZM0my+MDYembC23Hl7ASSD7wdV0VkxCrlXuo/QzTnm25H+68X8IZ7v8dtKcxL3HVZBtZdTc3WP4Zs6JcYBcsCi0XA8t6Pveg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qedg4/Yn; arc=none smtp.client-ip=91.218.175.185
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783323203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gB6sYSLbvHVUh7F5r4zsG9au/6lTVdK57G8fJgTB8VE=;
	b=qedg4/YnW//2bnk6PtAIsEFlNcA0wmSYaahp8ZsYWmAc3dJpdPKRMmIjKvC7orEbsHKf3+
	oVBHhVU5c7u03tgt82KbzN1QrtGVzIi4MIpCu3Wvs9bNfaZjezWB65Kr/Z+fPwnHeBEXuO
	kCt1PsQXejU/AnuxxFlxRu8Gi5SfOfI=
From: Junjie Cao <junjie.cao@linux.dev>
To: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	junjie.cao@linux.dev
Subject: [PATCH v2] MAINTAINERS: update my email address for the AW99706 backlight driver
Date: Mon,  6 Jul 2026 15:33:07 +0800
Message-ID: <20260706073307.1038430-1-junjie.cao@linux.dev>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8932-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:junjie.cao@linux.dev,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[junjie.cao@linux.dev,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[junjie.cao@linux.dev,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:from_mime,linux.dev:email,linux.dev:mid,linux.dev:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A4BE70DABB

Switch my maintainer entry for the Awinic AW99706 WLED backlight
driver from my personal Gmail address to junjie.cao@linux.dev.

Update both MAINTAINERS and the device-tree binding maintainers field.

Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v2:
 - Rebase onto the current for-leds-next / linux-next (Lee Jones).
 - Pick up Krzysztof's Ack.

v1: https://lore.kernel.org/all/20260701133533.32585-1-junjie.cao@linux.dev/

 .../devicetree/bindings/leds/backlight/awinic,aw99706.yaml      | 2 +-
 MAINTAINERS                                                     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml b/Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml
index f48ce7a3434d..60eae50ff742 100644
--- a/Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Awinic AW99706 6-channel WLED Backlight Driver
 
 maintainers:
-  - Junjie Cao <caojunjie650@gmail.com>
+  - Junjie Cao <junjie.cao@linux.dev>
 
 allOf:
   - $ref: common.yaml#
diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a9..780f80766780 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4388,7 +4388,7 @@ S:	Maintained
 F:	drivers/media/pci/hws/
 
 AWINIC AW99706 WLED BACKLIGHT DRIVER
-M:	Junjie Cao <caojunjie650@gmail.com>
+M:	Junjie Cao <junjie.cao@linux.dev>
 S:	Maintained
 F:	Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml
 F:	drivers/video/backlight/aw99706.c

base-commit: 7ddc04d1bd08f80ffc1e2fb97f3fc6cacab0ffc0
-- 
2.43.0


