Return-Path: <linux-leds+bounces-7041-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6E+wJmLroWkjxQQAu9opvQ
	(envelope-from <linux-leds+bounces-7041-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 20:07:14 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6121BC6ED
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 20:07:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D1FE304247E
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 19:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 632923A6412;
	Fri, 27 Feb 2026 19:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Ps2O1zd0"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB9A3859D5;
	Fri, 27 Feb 2026 19:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772219217; cv=pass; b=m7nodvEaIKHRM5SO1ssser7S9vVQ3XHfHJEU3smKbpA7xT0gXnq0bfPIua2IZHWIgQoBe+L4Sg42mF1aYccL6KUnGIE1i1aqgJPaoRPNubqVOdD7frrroL+gU2VJhjROV3bY4v1mGpU8EOjFVnoB/F87VX1lPn9RC6y/1pNDa7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772219217; c=relaxed/simple;
	bh=T5OAaNmXzloJNopVsTbfdx+Ep2VacjxPhw8ZgNFSOs8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VoLz29E+erecIEFqmPGTCb0LcbZBOX+thNamZAsgd+vL5CJmNsDauYYoLeXxVinz0/P5zLX+BY/aEH5qtRakz5trOSspVCuhsnD7Il8JycBtp4AdG9T4uo59c6Kay25X/hPkYprElGYKZawvqjtDR/PtJwRST6GN9NQ85DIJ6y8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Ps2O1zd0; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1772219199; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UxTZkdwztUkzj50bvT/+ffkqthW9DnGhso/nRWKwlDdMWou9FLwK8ij9lTt2vl2xu058wCtVscpZqFpGqvUtJKGL2lTTbhUZsVelX37AuVKjB6z6CZlpygJNBBfKPk92xdwCToTYPvebOi0t7Tt/X1mrd9x3QGrL3E35TdmrCSQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772219199; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HdicsRgarBX2PfmY3asMS9OdeY/On83EX0uOcpVMG4o=; 
	b=K7jBJ8Kbb6ilHDA4sKJyNS8MV3Xe42eXiFZzrUAIRSjPtQzWKETQTRrWmkSq6iuU7rN016i4f9q7vxdlJDW4x9WxizyP1U6RXX1ccrVJgk84CXAyyFZf0AZL4vfWyaphOnUlGQfkpCqg7DBLuyTYVhBLuBQtBVlGMjyTfCV/+YY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772219199;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=HdicsRgarBX2PfmY3asMS9OdeY/On83EX0uOcpVMG4o=;
	b=Ps2O1zd0Z50EgYZf7nIJ+98l1g4O5lWAI5iGy8ZANPh69YU2n4vWDMpCXqDDaLcS
	yKrLNnvNLu2Nhv5CMslRJg7o/D650s75DgslS0jsK/mm6qSedHYYVKx/gckuLSaG8ML
	fwB+0CILAj5a9M8Pjd/voQFJ/vehlj+VRWW4NcN+VihU86JPFMmwfpITgxbCq/KhdQO
	/wDkl0qQh+u0Npi7NgsUXnlKxpkgG2tZoo9hcKC8FbuaDXwusuqeQD5HLMXZj5kON7L
	ZtC34wDNuXYv97TLgDaPlJ8o/mDpB/8Ozwkk7F+SqCjSoHUSoKtzl3Vhy6lo63b+sOA
	7ZD8iwCWvA==
Received: by mx.zohomail.com with SMTPS id 177221919767957.845525955720746;
	Fri, 27 Feb 2026 11:06:37 -0800 (PST)
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
Subject: [RFC PATCH 3/9] leds: cros_ec: Implement offloaded() callback for trigger
Date: Sat, 28 Feb 2026 03:06:00 +0800
Message-ID: <20260227190617.271388-4-i@rong.moe>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[rong.moe:s=zmail2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7041-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rong.moe:mid,rong.moe:dkim,rong.moe:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5C6121BC6ED
X-Rspamd-Action: no action

"chromeos-auto" is a private hw control trigger which always stays in hw
control mode. Implement offloaded() callback with its return value to be
always true to reflect this.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/leds/leds-cros_ec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/leds/leds-cros_ec.c b/drivers/leds/leds-cros_ec.c
index bea3cc3fbfd2d..f48e3cf6ccf68 100644
--- a/drivers/leds/leds-cros_ec.c
+++ b/drivers/leds/leds-cros_ec.c
@@ -86,12 +86,18 @@ static int cros_ec_led_trigger_activate(struct led_classdev *led_cdev)
 	return cros_ec_led_send_cmd(priv->cros_ec, &arg);
 }
 
+static bool cros_ec_led_trigger_offloaded(struct led_classdev *led_cdev)
+{
+	return true;
+}
+
 static struct led_hw_trigger_type cros_ec_led_trigger_type;
 
 static struct led_trigger cros_ec_led_trigger = {
 	.name = "chromeos-auto",
 	.trigger_type = &cros_ec_led_trigger_type,
 	.activate = cros_ec_led_trigger_activate,
+	.offloaded = cros_ec_led_trigger_offloaded,
 };
 
 static int cros_ec_led_brightness_set_blocking(struct led_classdev *led_cdev,
-- 
2.51.0


