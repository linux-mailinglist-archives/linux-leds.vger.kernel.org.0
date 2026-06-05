Return-Path: <linux-leds+bounces-8488-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WQe3K7J6ImqoYAEAu9opvQ
	(envelope-from <linux-leds+bounces-8488-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 09:28:50 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 38127645F99
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 09:28:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8488-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8488-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 40014302BCEE
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jun 2026 07:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 433B1478841;
	Fri,  5 Jun 2026 07:28:01 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98C847DF87
	for <linux-leds@vger.kernel.org>; Fri,  5 Jun 2026 07:27:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780644481; cv=none; b=u5zSwLf44ou1LnBiMZ+Qa7EILqJZIfHPxdC/q0rXtCQxVNAii0nuY5xbfXU6XonglBCbJJiDelOWSrNzLdSWbwOj+jbpjETw2ob9DvM6Sp+pKHS2epJ3ONLreDqvRyEPGKIcM0s6KHnmNYdJgCvukXOrfJy4Tii8lYOd2sVomw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780644481; c=relaxed/simple;
	bh=m3EVhKuHhihMKDIb4q7QUoYR/Lso17Rn5p1IoK+IwW4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HSyPldK1ns0ykefjMWNVSvkhBv7bwFvv/y3POdfaaDmyDpj28mHZ8kTY7lsKsLVz0j52Ss4a5Pk/MT1NqB213VmF25uLvmRDG9BCV56HF+mab1jmxhMrs9zUn3JAhHURWAxzlSI1ILRGm8vD5PAf8llVWvDhr01qgFwHBtGRn1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1wVOy9-0007Tn-4t; Fri, 05 Jun 2026 09:27:53 +0200
From: Jonas Rebmann <jre@pengutronix.de>
Date: Fri, 05 Jun 2026 09:27:48 +0200
Subject: [PATCH v2 2/2] leds: pwm-multicolor: Introduce default-intensity
 property
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-multicolor-default-v2-2-ed07271df6b0@pengutronix.de>
References: <20260605-multicolor-default-v2-0-ed07271df6b0@pengutronix.de>
In-Reply-To: <20260605-multicolor-default-v2-0-ed07271df6b0@pengutronix.de>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Sven Schwermer <sven.schwermer@disruptive-technologies.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=m3EVhKuHhihMKDIb4q7QUoYR/Lso17Rn5p1IoK+IwW4=;
 b=owGbwMvMwCV2ZcYT3onnbjcwnlZLYshSqqow7nhjtO+G7vqC13FTZrN12eeVGyfq1D+5/YLj0
 A2nl+ukOkpZGMS4GGTFFFli1eQUhIz9r5tV2sXCzGFlAhnCwMUpABM5FsPwv9ZufpjwJ0FDzuO7
 Jkgsvy9+p+NchWPEodDor61v+o1dcxn+WbcsZ2acu2TpfK8PqWF251/dzM3/XpV616frS7NgXMk
 fTgA=
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jacek.anaszewski@gmail.com,m:sven.schwermer@disruptive-technologies.com,m:pavel@ucw.cz,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:jre@pengutronix.de,m:krzk@kernel.org,m:conor@kernel.org,m:jacekanaszewski@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,disruptive-technologies.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[jre@pengutronix.de,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-8488-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jre@pengutronix.de,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38127645F99

Like all LED drivers, pwm-multicolor supports turning on an LED on boot
by setting linux,default-trigger, e.g. to "default-on". pwm-multicolor
however scales the brightness of the color-component sub-LEDs with their
individual intensity value. Since these intensities are
zero-initialized, on boot a trigger is invisible until colors are set
from userspace.

Fix linux,default-trigger for pwm-multicolor by allowing for nonzero
default-intensities but default to 0 for backwards-compatibility.

Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
 drivers/leds/rgb/leds-pwm-multicolor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/rgb/leds-pwm-multicolor.c b/drivers/leds/rgb/leds-pwm-multicolor.c
index e0d7d3c9215c..3e515df40583 100644
--- a/drivers/leds/rgb/leds-pwm-multicolor.c
+++ b/drivers/leds/rgb/leds-pwm-multicolor.c
@@ -95,6 +95,8 @@ static int iterate_subleds(struct device *dev, struct pwm_mc_led *priv,
 		}
 
 		subled[priv->mc_cdev.num_colors].color_index = color;
+		fwnode_property_read_u32(fwnode, "default-intensity",
+					 &subled[priv->mc_cdev.num_colors].intensity);
 		priv->mc_cdev.num_colors++;
 	}
 

-- 
2.54.0.129.g3edf2eeba9


