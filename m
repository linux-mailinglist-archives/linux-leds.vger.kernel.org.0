Return-Path: <linux-leds+bounces-7043-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIS0FZHroWlDxQQAu9opvQ
	(envelope-from <linux-leds+bounces-7043-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 20:08:01 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0D01BC73C
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 20:08:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C270B30B477F
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 19:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 593643859FE;
	Fri, 27 Feb 2026 19:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="lE+yJ9kB"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AA33859D5;
	Fri, 27 Feb 2026 19:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772219229; cv=pass; b=ZuO9fcf0lMCAPG/jWhzlOue//WZmUKHbhHVPPLVu0r02mubILLQ/nkW7ubhyCD6lAxJ0+6unoN9UteristCsqrfpADnxbplktRcpTczSh6t4VQJTOht2M/4KQkpVa4EwqTtSZqPvDREDA0DqhDkWuClQdNhRBgQqVN5zBRG3WeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772219229; c=relaxed/simple;
	bh=PdOtx5vwFQKhHRytYzJ8DJbXPF7wk/uFhWbuT+OCtcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GQ64xeyD6tiWuqqcrxYu2O0EXdrZZpaDDMVTME1PKg0rLX3HhfYwdqb3q4BNKLxtzNrFjWGOYVm5HeEqJUIdebJuN0IgCm4qhbPO9Ukqw5b45z2SRIpnGkfTedkVvIaGjM/hLgiPy+1VAm8SQSLRv/z3v40bv/8SmcuP67VWY6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=lE+yJ9kB; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1772219209; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ma8HUPGS+WtqDIi31SVcRzMciLpPjdT2P3L6oHRYXp809Oyl/HL2fzewLfxZl1QU49UG4E9CQyQl5WtmKH7lxkCLfbA6Z+qk24TNsoWYAHA6jZuZG/bz/SITS8dCISA5mXvfNYIIZQ8GD7rbVcDccMIMOCxsNxn7lOgRhH5DiD8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772219209; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KTmVnBecFELsZ8QmsLB9wUAB9VOz3rEcL65GpIWR/Cw=; 
	b=VTCOnsAjIO2qCWVWJUMWtBGjsutsw/FtG9HZClpPRfY7P8RMwXu1FGi9OS05yL14I8oPG+J/K1ZY6RfIUtTo4pwdlxC2zgUbtWnfoOmW6tr5TQvbs1VpsYq26k3zZG1MVWj6M0oWTgx1TOPGOytG931Y1hkVZsmczMxfO1iPB8s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772219209;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=KTmVnBecFELsZ8QmsLB9wUAB9VOz3rEcL65GpIWR/Cw=;
	b=lE+yJ9kBHBVdWdRMs0zryMQPxBImcWW/D4Vxiq6gNgxnERUEC3MyG/BvvD7Rbigu
	cYISrQKeIIhpiuCgIaEOFHXN/jshZ/UPjfrtV+c0vQuhMi3fp1wN1Yabhu0OgyW6Say
	RJiJGtoz3OdlA2CuA/i+tni+D9XgXq5gygi96cFBC4CtpkOOv4QKjOkHmpcqsvfNGQN
	y9W3dnb7Eb625g/RDx7DWbZsnXCVe9PlBxTMpLL7RjXOikq1B8Y5XiZHK8iPx/q9FfF
	fEtIaZM+IB8XZBuD1zrCNWGyjyRma34/ukz7ckbfx+zB7koKazK78fys7Y8Rrogpnjb
	9+9yM/rqIQ==
Received: by mx.zohomail.com with SMTPS id 1772219206878348.8161742144895;
	Fri, 27 Feb 2026 11:06:46 -0800 (PST)
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
Subject: [RFC PATCH 5/9] leds: trigger: netdev: Implement offloaded() callback
Date: Sat, 28 Feb 2026 03:06:02 +0800
Message-ID: <20260227190617.271388-6-i@rong.moe>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[rong.moe:s=zmail2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7043-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,rong.moe:mid,rong.moe:dkim,rong.moe:email]
X-Rspamd-Queue-Id: CA0D01BC73C
X-Rspamd-Action: no action

"netdev" can run in hw control mode according to hw capabilities and
trigger options. Implement offloaded() callback to provide its hw
control state.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/leds/trigger/ledtrig-netdev.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 12cb3311ea220..edde167b60a54 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -749,10 +749,18 @@ static void netdev_trig_deactivate(struct led_classdev *led_cdev)
 	kfree(trigger_data);
 }
 
+static bool netdev_trig_offloaded(struct led_classdev *led_cdev)
+{
+	struct led_netdev_data *trigger_data = led_get_trigger_data(led_cdev);
+
+	return trigger_data->hw_control;
+}
+
 static struct led_trigger netdev_led_trigger = {
 	.name = "netdev",
 	.activate = netdev_trig_activate,
 	.deactivate = netdev_trig_deactivate,
+	.offloaded = netdev_trig_offloaded,
 	.groups = netdev_trig_groups,
 };
 
-- 
2.51.0


