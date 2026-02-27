Return-Path: <linux-leds+bounces-7040-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFYvDH/soWlDxQQAu9opvQ
	(envelope-from <linux-leds+bounces-7040-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 20:11:59 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 855DB1BC80C
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 20:11:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 404F631BD0F8
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 19:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A66A3859C3;
	Fri, 27 Feb 2026 19:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="K8vWew11"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D772A35A3B2;
	Fri, 27 Feb 2026 19:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772219216; cv=pass; b=hPgFDSdx13xHEIVzASuInKaPOWHBkcAdJ7XE8NnfXM4KnsskWagiQhQEgzPyYih4XhyqJs7C4j0bK6E1PbhDoL03r6XxxEKrFpRuUjnNhDHHXeoKJlybiTqYUnUErHP0qfsKaD7YsCnI8jX+/ZNBnT4pyetzyM8p0dxUL/35vZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772219216; c=relaxed/simple;
	bh=YlEq2gwnQExHgAJN223Fj4oRWgQXFbjuRJlvwVDO+sE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X+rdF4xprKvno2Kt9K8zO5gc80qAeFq0fU5SmLV9559/yXoXHa8pLM5cwGiMMlLzwZl/V1rod3GPYFzuo5u0fSju8KaX0avgCynL8jxd4B22Yv4r4kxpc7fnhHj8aqKJU6U7+pWOz3iZUbIn8Li6q/AXlaa15U/cQQuL1o2JCwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=K8vWew11; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1772219195; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DBQFXqgoqmH0Hjf+7cV+4COaPLJgcm0FEM+KFPO1l0eG6l2fkc+VjAAM5Rk3hkmbvlxnqdTOslDThyEYjfI2BXpGNvyBgqAEG9pVIJY+afMeLP7+lIx5vXk2R/XqZxVqTMzj59b9Afs8N/4jqiNrvRL7QT/CECfuCLpJZBqemcw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772219195; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6HEv3x4ZyKN5PaiaRJ/PoMhUs2rC1x9QoWDYooM08oo=; 
	b=D3UW4hrbEN8Z93q8Zx7d4dzqNbf+APPhqW4bgDwB9YcD1z940wFQ0luN1+RFTd3rfmDjQYgXk89moDcQUQUioBkZg4+aXjEMPSr4njNVXw2i21HZmUWwYcHX8eScB1GVDJSFQZlTjQfTyfuUrMLFXWImmoZTrL7vupcQfNS6znw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772219195;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=6HEv3x4ZyKN5PaiaRJ/PoMhUs2rC1x9QoWDYooM08oo=;
	b=K8vWew11Ta1NHc3j/HfZ1KgfmdNPB21BX6TwjuXHb6KQ20t5mEywHvc3eLvWzTai
	SiyOZSw1iMJGcJCASGxwkUWizNmQ/K/vaFaPHTOCIUGhSgdlU7UxdFXY/Eth3AJKIwj
	HXGtD2TWTkxjHe89B+4TcXholtmItBv6lmGyZeo5mDFZk6Y5lApQtBM7HNkh/pCAscW
	2KozBy+Eu9dspTuBneGyL/AAKlWRhCZfX/kbjx0lhxDeQvf6HAV9PwO3/6fTlohgwj5
	i0zEnNMlzY5C9ML37eBMRuWny66V16l3ezDaPcmk/EeVUzjROteu1H++rnUCBwdtJ4E
	5PtRPsNitQ==
Received: by mx.zohomail.com with SMTPS id 1772219193143580.9193529328054;
	Fri, 27 Feb 2026 11:06:33 -0800 (PST)
From: Rong Zhang <i@rong.moe>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ike Panhc <ikepanhc@gmail.com>
Cc: Rong Zhang <i@rong.moe>,
	Vishnu Sankar <vishnuocv@gmail.com>,
	vsankar@lenovo.com,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	platform-driver-x86@vger.kernel.org
Subject: [RFC PATCH 2/9] leds: Add callback offloaded() to query the state of hw control trigger
Date: Sat, 28 Feb 2026 03:05:59 +0800
Message-ID: <20260227190617.271388-3-i@rong.moe>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260227190617.271388-1-i@rong.moe>
References: <20260227190617.271388-1-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[rong.moe,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[rong.moe:s=zmail2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7040-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,weissschuh.net,chromium.org,squebb.ca,gmail.com,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[rong.moe:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[i@rong.moe,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[rong.moe,gmail.com,lenovo.com,vger.kernel.org,lists.linux.dev];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rong.moe:mid,rong.moe:dkim,rong.moe:email]
X-Rspamd-Queue-Id: 855DB1BC80C
X-Rspamd-Action: no action

Currently, we have multiple triggers implementing hw control. However,
the LED core doesn't really know the hw control state since the
coordination is done directly between the hw control trigger and the LED
device.

In the following patches, we are about to support hardware initiated
trigger transitions to/from hw control trigger. The hw control state is
a fundamental factor of determining if a transition should be permitted.

Add a callback offloaded() so that the LED core can query the hw control
state and use it to make decisions in hw initiated trigger transitions.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 Documentation/leds/leds-class.rst | 5 +++++
 include/linux/leds.h              | 1 +
 2 files changed, 6 insertions(+)

diff --git a/Documentation/leds/leds-class.rst b/Documentation/leds/leds-class.rst
index 5db620ed27aa2..84665200a88dc 100644
--- a/Documentation/leds/leds-class.rst
+++ b/Documentation/leds/leds-class.rst
@@ -235,6 +235,11 @@ LED driver must implement the following API to support hw control:
                 Returns a pointer to a struct device or NULL if nothing
                 is currently attached.
 
+LED trigger must implement the following API to support hw control:
+    - offloaded:
+                return a boolean indicating if the trigger is offloaded to
+                hardware.
+
 LED driver can activate additional modes by default to workaround the
 impossibility of supporting each different mode on the supported trigger.
 Examples are hardcoding the blink speed to a set interval, enable special
diff --git a/include/linux/leds.h b/include/linux/leds.h
index b16b803cc1ac5..7332034a43c85 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -485,6 +485,7 @@ struct led_trigger {
 	const char	 *name;
 	int		(*activate)(struct led_classdev *led_cdev);
 	void		(*deactivate)(struct led_classdev *led_cdev);
+	bool		(*offloaded)(struct led_classdev *led_cdev);
 
 	/* Brightness set by led_trigger_event */
 	enum led_brightness brightness;
-- 
2.51.0


