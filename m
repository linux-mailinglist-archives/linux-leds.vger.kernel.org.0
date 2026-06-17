Return-Path: <linux-leds+bounces-8647-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ojmAL3vQMmop5wUAu9opvQ
	(envelope-from <linux-leds+bounces-8647-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 18:51:07 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91ED169B7FB
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 18:51:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=rong.moe header.s=zmail2048 header.b=MqkaYaNU;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8647-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8647-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=rong.moe;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 600A93043F38
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 16:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725FD4C041D;
	Wed, 17 Jun 2026 16:49:47 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652E54C041B;
	Wed, 17 Jun 2026 16:49:44 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781714986; cv=pass; b=NB3fOtajAXdndzd0JIRrzplMROm6l7EW57khdcrx8QAIHKMWXRo1Xb4yfJd36jrJtAb8CQ+F0u9yjF0xnytXabI1aTvJqySsxvsHm+OXK/SHlSkwOEGzVbD9SiDAjUeWSQn8Eg5cuhjWLoFqL6+zMhzDILgO6mvswdsAH7GrK/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781714986; c=relaxed/simple;
	bh=ZP9P6SXV+zuHMP+JVdjWfHpIisx1DMrRt704wkQ2p4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SAWouQQtA425CAz7UjMIOala0yep8e+UJHGzlSQB/QK+MVpKlAthzwAatMcWpKnaaHfLrPOavP1lTrESJa0IxPDIK/wVOSNwfrCP4RpaZkiyE2p13jW+cMQm6VOAoIKNY5xNPbRt+z04UU82atUIRhu6e+BzENlL/dnrDFGNepM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=MqkaYaNU; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal: i=1; a=rsa-sha256; t=1781714961; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VDpK0XWPJftD/uTtoliDGJ2O9N+kLIXXVgSq0iDQ2Va+U2O9uTRmUC/EPG+EcuPpTLqB89e2dx45NQGchIaAd26C/ETXQxm64lf06WF+lSbqLUeid02AeUz4u5YauKlC446yHhkdN7Zak2+5k1pmqNUWTPgA2Uuh0znt90z36U8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781714961; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PhoVugwDNU/FeKe8y0ZmQX29g90NFaUwNkY8ZRMfKtI=; 
	b=eSzm2tHdr34WVjkwmR0lJgUi9RaYIRgDAz9CaPoE9fl6AjTZguKQ5YbNAE49reWFCjjatGnV4AekGQWh72kpzACSHPiovZeNqrptko3lhKIvTNLjvKIuiHnqOPTsB18AN2HM7/rxa/0JY9aGiwMWoH//40eUAHh6IEkLyBslgKM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781714961;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=PhoVugwDNU/FeKe8y0ZmQX29g90NFaUwNkY8ZRMfKtI=;
	b=MqkaYaNUVUHQxeTG3Djp0Pr+MmdOY8ufILLF7kyUWCIrZiTD9dAiEaoiBb5XA/qD
	sQHc6VHUFtPMvo1SVebbvsCuSKcrHat7nhnUXxM7Fr0U4YzX6URT25QabOTl1+RwykG
	OpBsfY0xYPgZLP055NTrK2viNh8SwKg3LskZQCpSgoeV+kaM97nf0A4Rx9NkhvBgDmQ
	osQwTIBzmlWJ6E++Ovh/eyiIEfFG4mfZWB3oAuKAbaBoDk6FtUtZJ15l3Imd81MT06K
	fTX0MzrGm1keXNYSlGGAjUtfaV0NMbca7vWU16blF/0jHvsY9PFd5wYdeGz32b47Suh
	6SYGzmvkKg==
Received: by mx.zohomail.com with SMTPS id 1781714959308119.96136874819672;
	Wed, 17 Jun 2026 09:49:19 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Thu, 18 Jun 2026 00:47:57 +0800
Subject: [PATCH RFC v2 3/9] leds: turris-omnia: Implement offloaded()
 callback for trigger
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-leds-trigger-hw-changed-v2-3-c28c44053cf3@rong.moe>
References: <20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3@rong.moe>
In-Reply-To: <20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3@rong.moe>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Ike Panhc <ikepanhc@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, 
 Vishnu Sankar <vishnuocv@gmail.com>, Vishnu Sankar <vsankar@lenovo.com>, 
 linux-leds@vger.kernel.org, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-d5d98
X-ZohoMailClient: External
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[rong.moe,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[rong.moe:s=zmail2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@weissschuh.net,m:bleung@chromium.org,m:groeck@chromium.org,m:kabel@kernel.org,m:mpearson-lenovo@squebb.ca,m:derekjohn.clark@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:ikepanhc@gmail.com,m:andrew+netdev@lunn.ch,m:kuba@kernel.org,m:vishnuocv@gmail.com,m:vsankar@lenovo.com,m:linux-leds@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:chrome-platform@lists.linux.dev,m:platform-driver-x86@vger.kernel.org,m:i@rong.moe,m:derekjohnclark@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,weissschuh.net,chromium.org,squebb.ca,gmail.com,linux.intel.com];
	FORGED_SENDER(0.00)[i@rong.moe,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_FROM(0.00)[bounces-8647-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[rong.moe:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[i@rong.moe,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[lunn.ch,kernel.org,gmail.com,lenovo.com,vger.kernel.org,lists.linux.dev,rong.moe];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,rong.moe:dkim,rong.moe:email,rong.moe:mid,rong.moe:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 91ED169B7FB

"omnia-mcu" is a private hardware control trigger which always stays in
hardware control mode. Implement offloaded() callback with its return
value to be always true to reflect this.

Meanwhile, declare it as a hardware control trigger as it's forgotten
before.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/leds/leds-turris-omnia.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 25ee5c1eb820..8e016ca86403 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -195,10 +195,16 @@ static void omnia_hwtrig_deactivate(struct led_classdev *cdev)
 			err);
 }
 
+static bool omnia_hwtrig_offloaded(struct led_classdev *cdev)
+{
+	return true;
+}
+
 static struct led_trigger omnia_hw_trigger = {
 	.name		= "omnia-mcu",
 	.activate	= omnia_hwtrig_activate,
 	.deactivate	= omnia_hwtrig_deactivate,
+	.offloaded	= omnia_hwtrig_offloaded,
 	.trigger_type	= &omnia_hw_trigger_type,
 };
 
@@ -251,6 +257,7 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
 	 * by LED class from the linux,default-trigger property.
 	 */
 	cdev->default_trigger = omnia_hw_trigger.name;
+	cdev->hw_control_trigger = omnia_hw_trigger.name;
 
 	/* Put the LED into software mode */
 	ret = omnia_cmd_write_u8(client, OMNIA_CMD_LED_MODE, OMNIA_CMD_LED_MODE_LED(led->reg) |

-- 
2.53.0


